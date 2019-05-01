package br.com.babyshark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/collaborate")
public class CollaborateController {

	@GetMapping
	public String colabore() {
		return "colabore/collaborate";
	}

}
