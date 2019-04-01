package br.com.babyshark.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.babyshark.entity.User;
import br.com.babyshark.service.UserService;
import br.com.babyshark.validation.UserValidation;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private HttpSession session;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor trimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, trimmerEditor);
		dataBinder.addValidators(new UserValidation(userService.getUserEmails()));
	}

	@GetMapping("/register")
	public String register(Model model) {
		if (session.getAttribute("user") == null) {
			model.addAttribute("user", new User());
			return "user/register";
		}
		return profile(model);
	}

	@PostMapping("/registerProcess")
	public String registerProcess(@Valid @ModelAttribute("user") User user, BindingResult result) {
		if (result.hasErrors()) {
			return "user/register";
		}
		user.setPassword("{noop}" + user.getPassword());
		user.setConfirmPassword("{noop}" + user.getConfirmPassword());
		userService.insert(user);
		return "redirect:login";
	}

	@GetMapping("/login")
	public String login(Model model) {
		if (session.getAttribute("user") == null) {
			return "user/login";
		}
		return profile(model);
	}

	@GetMapping("/profile")
	public String profile(Model model) {
		model.addAttribute("user", session.getAttribute("user"));
		return "user/profile";
	}
}
