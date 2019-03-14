package br.com.babyshark.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.service.DonateService;

@Controller
@RequestMapping("/donate")
public class DonateController {

	@Autowired
	private DonateService donateService;

	@GetMapping("/search")
	public String search(@RequestParam(value = "gender", defaultValue = "") List<String> genders, 
			@RequestParam(value = "item", defaultValue = "") List<String> itens, 
			@RequestParam(value = "color", defaultValue = "") List<String> colors, @RequestParam(value = "search", defaultValue = "") String search) {
		System.out.println(genders);
		System.out.println(search);
		return "donate/donate";
	}
	

	@GetMapping
	public String showAllDonates(Model model) {
		List<Donate> donates = donateService.getAllDonates();
		model.addAttribute("donates", donates);
		model.addAttribute("search", new ArrayList<Category>());
		return "donate/donate";
	}

}
