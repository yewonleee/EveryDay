package com.mycompany.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.myapp.bookstore.BookstoreService;
import com.mycompany.myapp.bookstore.BookstoreVO;
import com.mycompany.myapp.csee.CseeVO;

@Controller
public class BookstoreController {
	
	@Autowired
	BookstoreService bookstoreService;

	@RequestMapping(value = "/bookstore", method = RequestMethod.GET)
	public String bookstore(Model model) {
		model.addAttribute("bookstore", bookstoreService.getBookstoreList());
		return "bookstore";
	}
	
	@RequestMapping(value = "/bookdetail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable("id") int id, Model model) {
		BookstoreVO bookstoreVO = bookstoreService.getBookstore(id);
		model.addAttribute("u", bookstoreVO);
		return "bookdetail"; 
	}
	
	@RequestMapping(value = "/bookaddok", method = RequestMethod.POST)
	public String addBookOK(BookstoreVO vo) {
		if (bookstoreService.insertBookstore(vo) == 0)
			System.out.println("책 정보 추가실패 ");
		else
			System.out.println("책 정보 추가 성공!!!");
		return "redirect:bookstore";
	}
}