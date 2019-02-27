package br.com.babyshark.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.babyshark.models.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping("/register")
	public String register(Model model) {
		model.addAttribute("user", new User());
		return "user/register";
	}

	@RequestMapping("/registerProcess")
	public String registerProcess(@ModelAttribute("user") User user) {
		System.out.println(user);
		return "home";
	}

	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}

}
