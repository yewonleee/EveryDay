package com.mycompany.myapp;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.myapp.providers.GoogleProvider;
import com.mycompany.myapp.member.MemberServiceImpl;
import com.mycompany.myapp.member.MemberVO;


@Controller
@RequestMapping(value = "/login")
public class LoginController {

	@Autowired
	MemberServiceImpl service;
	//@Autowired
	//private GoogleConnectionFactory googleConnectionFactory;
	//@Autowired
	//private OAuth2Parameters googleOAuth2Parameters;
	@Autowired
	GoogleProvider googleProvider;

	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String intro(String t, Model model) {
		return "intro";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(String t, Model model) {
		return "login";
	}


	@RequestMapping(value = "/google", method = RequestMethod.GET)
	public String loginToGoogle(Model model) {
		return googleProvider.getGoogleUserData(model, new MemberVO());
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(String t, Model model) {
		return "signup";
	}

	@RequestMapping(value = "/signupok", method = RequestMethod.POST)
	public String signupOK(MemberVO vo) {
		if (service.insertMember(vo) == 0)
			System.out.println("회원가입 실패 ");
		else
			System.out.println("회원가입 성공!!!");
		return "redirect:login";
	}

	@RequestMapping(value = "/loginOk", method = RequestMethod.POST)
	public String loginCheck(HttpSession session, MemberVO vo, Model model) {
		String returnURL = "";
		if (session.getAttribute("login") != null) { // 이미 로그인 되어있는지
			session.removeAttribute("login");
		}
		MemberVO loginvo = service.getMember(vo); // form에서 입력한 id/pw가 담긴 vo를 가지고 db속 일치하는 정보가 있는지 확인 후 loginvo에 담김
		if (loginvo != null) { // 로그인 성공. 일치하는 정보가 있음.
			System.out.println("로그인 성공!");
			session.setAttribute("login", loginvo);
			returnURL = "redirect:/main/csee";
		} else { // 로그인 실패
			System.out.println("로그인 실패!");
			returnURL = "redirect:/login/login";
		}
		return returnURL;
	}

	// 로그아웃 하는 부분
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login/intro";
	}

}