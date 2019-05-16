package br.com.babyshark.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Interest;
import br.com.babyshark.entity.InterestId;
import br.com.babyshark.entity.User;
import br.com.babyshark.service.DonateService;

@Controller
@RequestMapping("/interest")
public class InterestController {

	@Autowired
	private DonateService donateService;

	@Autowired
	private HttpSession session;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor trimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, trimmerEditor);
	}

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
		} else if (message.length() > 300) {
			model.addAttribute("donateId", donate.getId());
			model.addAttribute("error", "Deve apresentar no máximo 300 caractéres!");
			return "donate/interest";
		}

		try {
			Interest interest = new Interest();
			interest.setMessage(message.replace(",", ""));
			donateService.insertOrUpdate(interest, user, donate);
			return "redirect:/";

		} catch (Exception e) {
			return "redirect:/";
		}

	}

	@PostMapping("/profile/donate/accept/{id}/{donateId}")
	public String acceptDonate(@PathVariable("id") Integer id, @PathVariable("donateId") Integer id2) {
		InterestId interestId = new InterestId(id, id2);
		Interest interest = new Interest();
		interest.setId(interestId);
		donateService.accept(interest);
		return "redirect:/";
	}

	@PostMapping("/profile/donate/decline/{id}/{donateId}")
	public String declineDonate(@PathVariable("id") Integer id, @PathVariable("donateId") Integer id2) {
		InterestId interestId = new InterestId(id, id2);
		Interest interest = new Interest();
		interest.setId(interestId);
		donateService.decline(interest);
		return "redirect:/";
	}
}
