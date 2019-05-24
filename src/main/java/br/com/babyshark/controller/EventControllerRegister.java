package br.com.babyshark.controller;

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

import br.com.babyshark.entity.Event;
import br.com.babyshark.entity.User;
import br.com.babyshark.service.EventService;
import br.com.babyshark.validation.EventValidation;

@Controller
@RequestMapping("/user/event")
public class EventControllerRegister {

	@Autowired
	private EventService eventService;

	@Autowired
	private HttpSession session;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor trimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, trimmerEditor);
		dataBinder.addValidators(new EventValidation());
	}

	@GetMapping("/registerEvent")
	public String register(Model model) {
		model.addAttribute("event", new Event());
		return "event/register-event";
	}

	@PostMapping("/registerProcessEvent")
	public String registerProcess(@Valid @ModelAttribute("event") Event event, BindingResult result,
			@RequestParam(value = "initial", defaultValue = "") String initial,
			@RequestParam(value = "end", defaultValue = "") String end, Model model) {

		if (result.hasErrors()) {
			return "event/register-event";
		} else if (initial == null) {
			model.addAttribute("erro", "Por favor, informe uma hora de início.");
			return "event/register-event";
		} else if (end == null) {
			model.addAttribute("erro", "Por favor, informe uma hora final.");
			return "event/register-event";
		}

		event.setUser((User) session.getAttribute("user"));
		eventService.insertOrUpdate(event, initial, end);
		return "redirect:/";
	}

}
