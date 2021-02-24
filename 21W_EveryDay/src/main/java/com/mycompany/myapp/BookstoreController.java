package com.mycompany.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
	public String addBookOK(BookstoreVO vo, MultipartFile[] file) {
		for(int i=0; i<file.length; i++) {
			System.out.println("================== file start ==================");
			System.out.println("파일 이름: "+file[i].getName());
			System.out.println("파일 실제 이름: "+file[i].getOriginalFilename());
			System.out.println("파일 크기: "+file[i].getSize());
			System.out.println("content type: "+file[i].getContentType());
			System.out.println("================== file   END ==================");
        }

		if (bookstoreService.insertBookstore(vo) == 0)
			System.out.println("책 정보 추가실패 ");
		else
			System.out.println("책 정보 추가 성공!!!");
		return "redirect:bookstore";
	}
	
	@RequestMapping(value = "/deletebookok/{id}", method = RequestMethod.GET)
	public String deletePostOK(@PathVariable("id") int id) {
		if (bookstoreService.deleteBookstore(id) == 0)
			System.out.println("데이터 삭제 실패 ");
		else
			System.out.println("데이터 삭제 성공!!!");
		return "redirect:../bookstore";
	}
}