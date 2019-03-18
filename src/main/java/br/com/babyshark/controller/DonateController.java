package br.com.babyshark.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.babyshark.entity.Donate;
import br.com.babyshark.service.DonateService;

@Controller
@RequestMapping("/donate")
public class DonateController {

	@Autowired
	private DonateService donateService;
	
	@GetMapping
	public String search(Model model, @RequestParam(value = "category", defaultValue = "") List<Integer> categories,
			@RequestParam(value = "color", defaultValue = "") List<Integer> colors,
			@RequestParam(value = "gender", defaultValue = "") List<Integer> genders,
			@RequestParam(value = "search", defaultValue = "") String search) {

		model.addAttribute("categories", donateService.getAllCategories());
		model.addAttribute("genders", donateService.getAllGenders());
	
		if (categories.isEmpty() && genders.isEmpty() && colors.isEmpty() && search.equals("")) {
			List<Donate> donates = donateService.getAllDonates();
			model.addAttribute("donates", donates);
		} else {
			List<Donate> donatesByFilter = donateService.getDonatesByFilter(categories, genders, colors, search);
			model.addAttribute("donates", donatesByFilter);
		}

		return "donate/donate";
	}

}
