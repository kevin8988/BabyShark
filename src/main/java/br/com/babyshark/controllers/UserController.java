package br.com.babyshark.controllers;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.babyshark.models.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor trimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, trimmerEditor);
	}

	@RequestMapping("/register")
	public String register(Model model) {
		model.addAttribute("user", new User());
		return "user/register";
	}

	@RequestMapping("/registerProcess")
	public String registerProcess(@ModelAttribute("user") User user) {
		System.out.println(user);
		return "redirect:/";
	}

	@RequestMapping("/loginProcess")
	public String registerProcess(String email, String password) {
		System.out.println(email + " " + password);
		return "home";
	}

	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}

}
