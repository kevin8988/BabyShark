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

	@GetMapping("/search")
	public String search(@RequestParam(value = "category", defaultValue = "") List<String> categories,
			@RequestParam(value = "search", defaultValue = "") String search, Model model) {
		System.out.println(search);
		System.out.println(categories);
		List<Donate> donatesByFilter = donateService.getDonatesByFilter(categories, search);
		model.addAttribute("donates", donatesByFilter);
		return "donate/donate";
	}

	@GetMapping
	public String showAllDonates(Model model) {
		List<Donate> donates = donateService.getAllDonates();
		model.addAttribute("donates", donates);
		return "donate/donate";
	}

}
