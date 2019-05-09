package br.com.babyshark.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Interest;
import br.com.babyshark.entity.User;
import br.com.babyshark.service.DonateService;

@Controller
@RequestMapping("/interest")
public class InterestController {

	@Autowired
	private DonateService donateService;

	@Autowired
	private HttpSession session;

	@PostMapping("/{id}")
	public String donateInterest(@PathVariable("id") Integer id, Model model) {
		Donate donate = donateService.getDonateById(id);
		model.addAttribute("donateId", donate.getId());
		return "donate/interest";
	}

	@PostMapping("/interestProcess/{id}")
	public String donateInterestProcess(@PathVariable("id") Integer id, Model model, String message) {
		Donate donate = donateService.getDonateById(id);
		User user = (User) session.getAttribute("user");

		if (user.getId() == donate.getUser().getId()) {
			model.addAttribute("donateId", donate.getId());
			model.addAttribute("error", "Não pode se interessar pela própria doação!");
			return "donate/interest";
		}

		Interest interest = new Interest();
		interest.setMessage(message.replace(",", ""));
		donateService.add(interest, user, donate);
		return "redirect:/";
	}
}
