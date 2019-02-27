package br.com.babyshark.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping("/register")
	public String register() {
		return "user/register";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}

}
