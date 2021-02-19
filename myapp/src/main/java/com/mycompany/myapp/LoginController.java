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

import com.mycompany.myapp.csee.CseeService;
import com.mycompany.myapp.member.MemberServiceImpl;
import com.mycompany.myapp.member.MemberVO;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

	@Autowired
	MemberServiceImpl service;
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String intro(String t, Model model) {
		return "intro";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(String t, Model model) {

		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		System.out.println("구글:" + url);

		model.addAttribute("google_url", url);

		return "login";
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "/oauth2callback", method = RequestMethod.GET)
	public String googleCallback(Model model, @RequestParam(required = false) HttpServletRequest request)
			throws IOException {

		System.out.println("여기는 googleCallback");
		// 구글 login 정보에서 userid, email, nickname 가져오기
		// member db에 저장
		// setAttribute("login", loginvo);

		/*
		 String code = request.getParameter("code");

		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
				null);

		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.printf("accessToken is expired. refresh token = {}", accessToken);
		}
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();

		PlusOperations plusOperations = google.plusOperations();
		Person profile = plusOperations.getGoogleProfile();
		MemberVO loginvo = new MemberVO();
		System.out.println(profile.getDisplayName());

		loginvo.setEmail("email"); // 추가작업 필요
		loginvo.setUsername(profile.getDisplayName());
		loginvo.setUserid("g" + profile.getId());
		HttpSession session = request.getSession();
		//loginvo = service.googleLogin(loginvo);

		session.setAttribute("login", loginvo);
		
		*/
		return "redirect:/main/csee";
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