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
import org.springframework.web.multipart.MultipartFile;

import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Photo;
import br.com.babyshark.entity.User;
import br.com.babyshark.infra.FileSaver;
import br.com.babyshark.service.DonateService;
import br.com.babyshark.service.UserService;
import br.com.babyshark.validation.DonateValidation;

@Controller
@RequestMapping("/user/donate")
public class DonateControllerRegister {

	@Autowired
	private UserService userService;

	@Autowired
	private HttpSession session;

	@Autowired
	private DonateService donateService;

	@Autowired
	private FileSaver fileSaver;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor trimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, trimmerEditor);
		dataBinder.addValidators(new DonateValidation());
	}

	@GetMapping("/registerDonate")
	public String registerDonate(Model model) {

		model.addAttribute("donate", new Donate());
		model.addAttribute("colors", userService.getAllColors());
		model.addAttribute("genders", userService.getAllGenders());
		model.addAttribute("categories", userService.getAllCategories());

		return "user/registerDonate";
	}

	@PostMapping("/registerProcessDonate")
	public String registerProcessDonate(MultipartFile foto, @Valid @ModelAttribute("donate") Donate donate,
			BindingResult result, Model model) {
		String content = foto.getContentType();

		if (result.hasErrors() || foto.getOriginalFilename().length() == 0 && (!content.equals("image/jpeg") || !content.equals("image/png"))) {
			model.addAttribute("colors", userService.getAllColors());
			model.addAttribute("genders", userService.getAllGenders());
			model.addAttribute("categories", userService.getAllCategories());
			model.addAttribute("erroPhoto", "Por favor, insira uma imagem.");

			return "user/registerDonate";
		}

		String path = fileSaver.write(foto);
		donate.setUser((User) session.getAttribute("user"));
		Photo photo = new Photo();
		photo.setPath(path);
		photo.setDonate(donate);
		donate.add(photo);
		donateService.add(donate);
		return "redirect:/";
	}

	@PostMapping("/registerProcessDonate/update")
	public String updateProcessDonate(@Valid @ModelAttribute("donate") Donate donate,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("colors", userService.getAllColors());
			model.addAttribute("genders", userService.getAllGenders());
			model.addAttribute("categories", userService.getAllCategories());

			return "user/profileDonatesUpdate";
		}

		donate.setUser((User) session.getAttribute("user"));
		donateService.add(donate);
		return "redirect:/";

	}

	@PostMapping("/update/{id}")
	public String profileDonatesUpdate(@PathVariable("id") Integer id, Model model) {
		Donate donateById = donateService.getDonateById(id);
		model.addAttribute("donate", donateById);
		model.addAttribute("colors", userService.getAllColors());
		model.addAttribute("genders", userService.getAllGenders());
		model.addAttribute("categories", userService.getAllCategories());
		return "user/profileDonatesUpdate";
	}

}
