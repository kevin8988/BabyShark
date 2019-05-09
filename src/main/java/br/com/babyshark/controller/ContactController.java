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

import br.com.babyshark.entity.User;
import br.com.babyshark.infra.MailSender;
import br.com.babyshark.template.EmailMessageTemplate;

@Controller
@RequestMapping("/contact")
public class ContactController {

	@Autowired
	private MailSender mailSender;

	@Autowired
	private HttpSession session;
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor trimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, trimmerEditor);
	}

	@GetMapping
	public String contact(Model model) {
		User user = (User) session.getAttribute("user");
		EmailMessageTemplate template = new EmailMessageTemplate();
		if (user != null)
			template.setEmail(user.getEmail());
		model.addAttribute("emailTemplate", template);
		return "contact/contact";
	}

	@PostMapping
	public String sendEmail(@Valid @ModelAttribute("emailTemplate") EmailMessageTemplate template,
			BindingResult result) {
		if (result.hasErrors()) {
			return "contact/contact";
		}
		mailSender.sendSimpleMessage(template);
		return "redirect:/";
	}

}
