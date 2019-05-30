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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.babyshark.entity.Event;
import br.com.babyshark.entity.User;
import br.com.babyshark.service.EventService;
import br.com.babyshark.validation.EventValidation;

@Controller
@RequestMapping("/user/profile/events")
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
	public String registerProcess(@Valid @ModelAttribute("event") Event event, BindingResult result, String initial,
			String end, Model model) {

		boolean error = false;

		String data[] = replaceAndSplit(initial);
		String data2[] = replaceAndSplit(end);

		if (result.hasErrors()) {
			error = true;
		}
		if (initial.equals(",")) {
			model.addAttribute("erro", "Por favor, informe uma hora de início.");
			error = true;
		}
		if (end.equals(",")) {
			model.addAttribute("erro2", "Por favor, informe uma hora final.");
			error = true;
		}
		if ((!initial.equals(",") && !end.equals(",")) && (Integer.valueOf(data[0]) > Integer.valueOf(data2[0])
				|| Integer.valueOf(data[0]) == Integer.valueOf(data2[0])
						&& Integer.valueOf(data[1]) > Integer.valueOf(data2[1]))) {
			model.addAttribute("erro", "Por favor, informe uma hora correta");
			error = true;
		}
		if (error) {
			return "event/register-event";
		}

		event.setUser((User) session.getAttribute("user"));
		eventService.insertOrUpdate(event, initial, end);
		return "redirect:/";
	}

	@PostMapping("/updateEvent/{id}")
	public String update(@PathVariable("id") Integer id, Model model) {
		User user = (User) session.getAttribute("user");
		Event eventByIdAndUser = eventService.getEventByIdAndUser(user, id);
		model.addAttribute("event", eventByIdAndUser);
		return "event/register-event";
	}

	private String[] replaceAndSplit(String split) {
		String var = split.replace(",", "");
		return var.split(":");
	}

}
