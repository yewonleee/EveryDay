package com.mycompany.myapp;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.mycompany.myapp.member.GoogleOAuthRequest;
import com.mycompany.myapp.member.GoogleOAuthResponse;
import com.mycompany.myapp.member.MemberServiceImpl;
import com.mycompany.myapp.member.MemberVO;

import org.springframework.beans.factory.annotation.Value;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

	@Autowired
	MemberServiceImpl service;
	final static String GOOGLE_AUTH_BASE_URL = "https://accounts.google.com/o/oauth2/v2/auth";
	final static String GOOGLE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/token";
	final static String GOOGLE_REVOKE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/revoke";

	@Value("${api.client_id}")
	String clientId;
	@Value("${api.client_secret}")
	String clientSecret;

	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String intro(String t, Model model) {
		return "intro";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(String t, Model model, HttpServletResponse response) {
		return "login";
	}
	
	@RequestMapping(value = "/google", method = RequestMethod.GET)
	public String google(RedirectAttributes rttr, Model model) {
		String url = "redirect:https://accounts.google.com/o/oauth2/v2/auth?client_id=614414049636-vmoicaro2j8pqts15mto327u6cm9p5u0.apps.googleusercontent.com&redirect_uri=http://localhost:8080/myapp/login/oauth2callback&response_type=code&scope=email%20profile%20openid&access_type=offline";
		return url;
	}

	@RequestMapping(value = "/oauth2callback", method = RequestMethod.GET)
	public String googleAuth(Model model, @RequestParam(value = "code") String authCode, HttpServletRequest request,
			HttpSession session, MemberVO vo) throws Exception {

		// HTTP Request를 위한 RestTemplate
		RestTemplate restTemplate = new RestTemplate();

		// Google OAuth Access Token 요청을 위한 파라미터 세팅
		GoogleOAuthRequest googleOAuthRequestParam = new GoogleOAuthRequest();
		googleOAuthRequestParam.setClientId("614414049636-vmoicaro2j8pqts15mto327u6cm9p5u0.apps.googleusercontent.com");
		googleOAuthRequestParam.setClientSecret("tcD5KS3cmZojZRHPwvoiS5Gy");
		googleOAuthRequestParam.setCode(authCode);
		googleOAuthRequestParam.setRedirectUri("http://localhost:8080/myapp/login/oauth2callback"); // http://localhost:8080/myapp/login/oauth2callback // https://yewonproj.herokuapp.com/login/oauth2callback
		googleOAuthRequestParam.setGrantType("authorization_code");

		// JSON 파싱을 위한 기본값 세팅
		// 요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
		ObjectMapper mapper = new ObjectMapper();
		mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
		mapper.setSerializationInclusion(Include.NON_NULL);

		// AccessToken 발급 요청
		ResponseEntity<String> resultEntity = restTemplate.postForEntity(GOOGLE_TOKEN_BASE_URL, googleOAuthRequestParam,
				String.class);

		// Token Request
		GoogleOAuthResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOAuthResponse>() {
		});

		// ID Token만 추출 (사용자의 정보는 jwt로 인코딩 되어있다)
		String jwtToken = result.getIdToken();
		String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
				.queryParam("id_token", jwtToken).toUriString();

		String resultJson = restTemplate.getForObject(requestUrl, String.class);

		Map<String, String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>() {
		});
		model.addAllAttributes(userInfo);
		model.addAttribute("token", result.getAccessToken()); //토큰 token에 저장!!

		MemberVO checkvo = new MemberVO();
		checkvo.setEmail(userInfo.get("email"));
		checkvo.setUserid(userInfo.get("email"));
		checkvo.setUsername(userInfo.get("family_name"));
		
		String returnURL = "";
		MemberVO loginvo = service.getMember(checkvo); //로그인 체크하기 위해
		
		if (session.getAttribute("login") != null) { // 이미 로그인 되어있는지
			session.removeAttribute("login");
		}
		
		if (loginvo != null) { // 로그인 성공. 이미 구글 id로 db에 저장됨
			System.out.println("구글 ID로 로그인 성공!");
			session.setAttribute("login", loginvo);
			returnURL = "redirect:/main/csee";
		} else { // 로그인 실패
			System.out.println("구글 정보가 DB에 저장 안되어있음!");
			if (service.insertMember(checkvo) == 0) {
				System.out.println("구글 정보로 회원가입 실패! 왜일까?? ");
				returnURL = "redirect:/login/login";
			}
			else {
				System.out.println("회원가입 성공!!!");
				session.setAttribute("login", checkvo);
				returnURL = "redirect:/main/csee";
			}
		}
		return returnURL;
	}
	
	@RequestMapping(value = "/revoketoken") //토큰 무효화
	public Map<String, String> revokeToken(@RequestParam(value = "token") String token) throws JsonProcessingException {

		Map<String, String> result = new HashMap<>();
		RestTemplate restTemplate = new RestTemplate();
		final String requestUrl = UriComponentsBuilder.fromHttpUrl(GOOGLE_REVOKE_TOKEN_BASE_URL)
				.queryParam("token", token).encode().toUriString();
		
		String resultJson = restTemplate.postForObject(requestUrl, null, String.class);
		result.put("result", "success");
		result.put("resultJson", resultJson);
		return result;
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