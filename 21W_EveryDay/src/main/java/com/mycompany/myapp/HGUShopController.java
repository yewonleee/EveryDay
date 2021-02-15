package com.mycompany.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HGUShopController {

	@RequestMapping(value = "/hgushop", method = RequestMethod.GET)
	public String hgushop(Model model) {
		return "hgushop";
	}
}
