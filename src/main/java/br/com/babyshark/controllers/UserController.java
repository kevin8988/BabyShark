package br.com.babyshark.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.babyshark.dao.UserDAO;
import br.com.babyshark.models.User;
import br.com.babyshark.validations.UserValidation;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserDAO dao;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor trimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, trimmerEditor);
		dataBinder.addValidators(new UserValidation(dao));
	}

	@RequestMapping("/register")
	public String register(Model model) {
		model.addAttribute("user", new User());
		return "user/register";
	}

	@RequestMapping("/registerProcess")
	public String registerProcess(@Valid @ModelAttribute("user") User user, BindingResult result) {
		if (result.hasErrors()) {
			return "user/register";
		}
		dao.insert(user);
		return "redirect:user/login";
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
