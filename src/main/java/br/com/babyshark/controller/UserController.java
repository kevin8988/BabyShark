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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		dataBinder.addValidators(new UserValidation(userService.getUserEmails(), session));
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
	public String registerProcess(@Valid @ModelAttribute("user") User user, BindingResult result, RedirectAttributes redirectAttrs) {
		if (result.hasErrors()) {
			return "user/register";
		}
		redirectAttrs.addFlashAttribute("message", "Cadastro realizado com sucesso.");
		userService.insert(user);
		return "redirect:login";
	}

	@GetMapping("/login")
	public String login(Model model) {
		if (session.getAttribute("user") == null) {
			model.addAttribute("message", model.asMap().get("message"));
			return "user/login";
		}
		return profile(model);
	}

	@GetMapping("/profile")
	public String profile(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		return "user/profile";
	}

	@PostMapping("/updateProcess")
	public String updateProcess(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("erro", "Erro - Principal");
			return "user/profile";
		}
		userService.update(user, user.getEmail());
		return "redirect:profile";
	}
	
	@PostMapping("/updateUserAddress")
	public String updateUserAddress(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("erro", "Erro - Endereço");
			return "user/profile";
		}
		userService.insert(user.getUserAddress());
		return "redirect:profile";
	}
	
	@PostMapping("/updateUserDetail")
	public String updateUserDetail(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("erro", "Erro - Meus Dados");
			return "user/profile";
		}
		userService.insert(user.getUserDetail());
		return "redirect:profile";
	}
}
