package com.mycompany.myapp.providers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.plus.Person;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mycompany.myapp.member.MemberVO;


@Service
public class GoogleProvider {

	private static final String REDIRECT_CONNECT_GOOGLE = "redirect:/login";
	private static final String GOOGLE = "google";

	@Autowired
	BaseProvider socialLoginBean;

	public String getGoogleUserData(Model model, MemberVO userForm) {

		ConnectionRepository connectionRepository = socialLoginBean.getConnectionRepository();
		if (connectionRepository.findPrimaryConnection(Google.class) == null) {
			return REDIRECT_CONNECT_GOOGLE;
		}

		populateUserDetailsFromGoogle(userForm);
		model.addAttribute("loggedInUser", userForm);
		//model.addAttribute("login", userForm);
		return "user";
	}

	protected void populateUserDetailsFromGoogle(MemberVO userform) {
		Google google = socialLoginBean.getGoogle();
		Person googleUser = google.plusOperations().getGoogleProfile();
		userform.setEmail(googleUser.getAccountEmail());
		userform.setUsername(googleUser.getGivenName());
		userform.setProvider(GOOGLE);
	}

}
