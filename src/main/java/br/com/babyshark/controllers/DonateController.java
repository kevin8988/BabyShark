package br.com.babyshark.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/donate")
public class DonateController {

	@RequestMapping(method = RequestMethod.GET)
	public String showAllDonates(String search) {
		System.out.println(search);
		return "donate/donate";
	}
	


}
