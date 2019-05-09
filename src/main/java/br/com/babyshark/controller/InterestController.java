package br.com.babyshark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Interest;
import br.com.babyshark.service.DonateService;

@Controller
public class InterestController {

	@Autowired
	private DonateService donateService;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor trimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, trimmerEditor);
	}

	@GetMapping("donate/detail/{id}")
	public String donateDetail(@PathVariable("id") Integer id, Model model) {
		Donate donateDetail = donateService.getDonateDetail(id);
		model.addAttribute("donateDetail", donateDetail);
		model.addAttribute("interest", new Interest());
		return "donate/detail";
	}

	@PostMapping("donate/interest")
	public String donateInterest(@ModelAttribute("interest") Interest interest) {
		donateService.add(interest, interest.getUser(), interest.getDonate());
		return "donate/donate";
	}

}
