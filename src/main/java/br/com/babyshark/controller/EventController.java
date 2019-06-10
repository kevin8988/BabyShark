package br.com.babyshark.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.babyshark.entity.Event;
import br.com.babyshark.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {

	@Autowired
	private EventService eventService;

	@GetMapping
	public String events(Model model, @RequestParam(value = "city", defaultValue = "") String city,
			@RequestParam(value = "state", defaultValue = "") String state,
			@RequestParam(value = "text", defaultValue = "") String text) {

		if (city.equals("") && state.equals("") && text.equals("")) {
			List<Event> events = eventService.getAllEvents();
			model.addAttribute("events", events);
		} else {
			List<Event> eventsByFilter = eventService.getEventsByFilter(city, state, text);
			System.out.println(eventsByFilter);
			model.addAttribute("events", eventsByFilter);
		}

		return "event/event";
	}

	@PostMapping("/detail/{id}")
	public String detail(@PathVariable("id") Integer id, Model model) {
		Event eventById = eventService.getEventById(id);
		model.addAttribute("event", eventById);
		return "event/detail";
	}

}
