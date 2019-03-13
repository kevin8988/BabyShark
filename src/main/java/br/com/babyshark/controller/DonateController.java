package br.com.babyshark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/donate")
public class DonateController {

	@GetMapping("/search")
	public String search(@RequestParam("search") String search) {
		System.out.println(search);
		return "donate/donate";
	}
	
	@GetMapping
	public String showAllDonates() {
		return "donate/donate";
	}
	


}
