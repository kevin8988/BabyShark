package br.com.babyshark.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.User;
import br.com.babyshark.service.DonateService;
import br.com.babyshark.validation.DonateValidation;

@Controller
@RequestMapping("/donate")
public class DonateController {

	@Autowired
	private DonateService donateService;

	@Autowired
	private HttpSession session;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor trimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, trimmerEditor);
		dataBinder.addValidators(new DonateValidation());
	}

	@GetMapping
	public String search(Model model, @RequestParam(value = "category", defaultValue = "") List<Integer> categories,
			@RequestParam(value = "color", defaultValue = "") List<Integer> colors,
			@RequestParam(value = "gender", defaultValue = "") List<Integer> genders,
			@RequestParam(value = "state", defaultValue = "") List<String> states,
			@RequestParam(value = "search", defaultValue = "") String search) {

		model.addAttribute("categories", donateService.getAllCategoriesDonate());
		model.addAttribute("genders", donateService.getAllGendersDonate());
		model.addAttribute("colors", donateService.getAllColorsDonate());
		model.addAttribute("addresses", donateService.getAllAddressesDonate());

		if (categories.isEmpty() && states.isEmpty() && genders.isEmpty() && colors.isEmpty() && search.equals("")) {
			List<Donate> donates = donateService.getAllDonates();
			model.addAttribute("donates", donates);
		} else {
			List<Donate> donatesByFilter = donateService.getDonatesByFilter(categories, genders, colors, states,
					search);
			model.addAttribute("donates", donatesByFilter);
		}

		return "donate/donate";
	}

	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("donate", new Donate());
		List<Category> categories = new ArrayList<>();
		Category c = new Category();
		c.setId(1);
		c.setName("ss");
		categories.add(c);
		model.addAttribute("categories", categories);
		return "donate/registerDonate";
	}

	@PostMapping("/registerProcess")
	public String registerProcess(@Valid @ModelAttribute("donate") Donate donate, BindingResult result) {
		if (result.hasErrors()) {
			return "donate/registerDonate";
		}
		donate.setUser((User) session.getAttribute("user"));
		donateService.add(donate);
		return "donate/donate";
	}

}
