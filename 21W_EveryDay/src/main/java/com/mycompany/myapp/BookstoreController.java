package com.mycompany.myapp;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
	public String addBookOK(BookstoreVO vo, MultipartHttpServletRequest mtf, ModelAndView mav, HttpServletRequest request) throws Exception {
		
		String fileName=null;
		MultipartFile uploadFile = vo.getUploadFile();

		String context = request.getSession().getServletContext().getRealPath("/"); //사용자의 웹 어플리케이션 경로 구하기
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName = uuid+"."+ext;
			System.out.println(context + "/resources/img/" + fileName);
			uploadFile.transferTo(new File(context + "/resources/img/" + fileName));
		}
		vo.setPhoto(fileName);
		//bookstoreService.insertBookstore(vo);  //db에 저장
		
		/*
		
		// 파일 태그 name
		  String fileTag = "file";

		// 업로드 파일이 저장될 경로
		  String filePath = "/Users/mac/git/EveryDay/21W_EveryDay/src/main/webapp/resources/img";
		  
		// 파일 얻기
		  MultipartFile file = mtf.getFile(fileTag);
		  System.out.println(file);
		  
		  if(file.isEmpty()) {
			  	// 파일 업로드 하지 않은 경우 처리
		  }else {
			  
			  	String fileName = file.getOriginalFilename();
			  	File target = new File(filePath, fileName);
			  	FileCopyUtils.copy(file.getBytes(), target);
			  	
			  	//mav.setViewName
			  	System.out.println(fileName);

			  	try {
			    	// 파일 업로드 처리
			    } catch(Exception e) {
			    	// 오류 발생 
			    }
		}*/

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