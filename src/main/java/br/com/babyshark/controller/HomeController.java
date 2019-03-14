package br.com.babyshark.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Event;
import br.com.babyshark.service.HomeService;

@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@RequestMapping("/")
	public String home(Model model) {
		List<Donate> lastThreeDonates = homeService.getLastThreeDonates();
		List<Event> threeNearbyEvents = homeService.getThreeNearbyEvents();
		model.addAttribute("lastDonates", lastThreeDonates);
		model.addAttribute("events", threeNearbyEvents);
		return "home";
	}

}
