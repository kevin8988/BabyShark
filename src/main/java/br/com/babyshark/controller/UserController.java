package br.com.babyshark.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.User;
import br.com.babyshark.service.DonateService;
import br.com.babyshark.service.UserService;
import br.com.babyshark.validation.UserValidation;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private DonateService donateService;

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
	public String registerProcess(@Valid @ModelAttribute("user") User user, BindingResult result,
			RedirectAttributes redirectAttrs) {
		if (result.hasErrors()) {
			return "user/register";
		}
		redirectAttrs.addFlashAttribute("message", "Cadastro realizado com sucesso.");
		userService.insertOrUpdate(user);
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
		model.addAttribute("message", model.asMap().get("message"));
		return "profile/profile";
	}

	@PostMapping("/updateProcess")
	public String updateProcess(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		if (result.hasErrors()) {
			model.addAttribute("error", "Erro.");
			return "profile/profile";
		}
		userService.updateEmailAndPassword(user, user.getEmail(), user.getPassword());
		redirectAttrs.addFlashAttribute("success", "Dado Atualizado com Sucesso.");
		return "redirect:profile";
	}

	@PostMapping("/updateUserAddress")
	public String updateUserAddress(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		if (result.hasErrors()) {
			model.addAttribute("error", "Erro.");
			return "profile/profile";
		}
		userService.insertOrUpdate(user.getUserAddress());
		redirectAttrs.addFlashAttribute("success", "Dado Atualizado com Sucesso.");
		return "redirect:profile";
	}

	@PostMapping("/updateUserDetail")
	public String updateUserDetail(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		if (result.hasErrors()) {
			model.addAttribute("error", "Erro.");
			return "profile/profile";
		}

		userService.insertOrUpdate(user.getUserDetail());
		redirectAttrs.addFlashAttribute("success", "Dado Atualizado com Sucesso.");
		return "redirect:profile";
	}

	@RequestMapping("/loginProcess")
	public String loginProcess() {
		System.out.println("aqui");
		return "redirect:profile";
	}

	@GetMapping("/profile/donates")
	public String profileDonates(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		List<Donate> donatesByUser = donateService.getDonatesByUser(user);
		System.out.println(donatesByUser);
		model.addAttribute("donates", donatesByUser);
		return "profile/donates";
	}

	@GetMapping("/profile/interests")
	public String profileInterests(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		model.addAttribute("interests", donateService.getMyInterests(user));
		return "profile/interests";
	}

	@PostMapping("/profile/donates/delete/{id}")
	public String profileDonatesDelete(@PathVariable("id") Integer id, Model model, RedirectAttributes redirectAttrs) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		donateService.deleteDonate(user, id);
		redirectAttrs.addFlashAttribute("success", "Doação removida com Sucesso.");
		return "redirect:/user/profile";
	}

	@GetMapping("/profile/donate-interests")
	public String profileDonateInterests(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		model.addAttribute("interests", donateService.getInterestInMyDonates(user));
		return "profile/donate-interests";
	}

}
