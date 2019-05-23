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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

		return "donate/register-donate";
	}

	@PostMapping("/registerProcessDonate")
	public String registerProcessDonate(MultipartFile foto, @Valid @ModelAttribute("donate") Donate donate,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		String content = foto.getContentType();

		if (result.hasErrors() || foto.getOriginalFilename().length() == 0
				&& (!content.equals("image/jpeg") || !content.equals("image/png"))) {
			model.addAttribute("colors", userService.getAllColors());
			model.addAttribute("genders", userService.getAllGenders());
			model.addAttribute("categories", userService.getAllCategories());
			model.addAttribute("erroPhoto", "Por favor, insira uma imagem.");

			return "donate/register-donate";
		}

		String path = fileSaver.write(foto);
		donate.setUser((User) session.getAttribute("user"));
		Photo photo = new Photo();
		photo.setPath(path);
		photo.setDonate(donate);
		donate.add(photo);
		donateService.insertOrUpdate(donate);
		redirectAttrs.addFlashAttribute("success", "Doação cadastrado com Sucesso.");
		return "redirect:/user/profile";
	}

	@PostMapping("/registerProcessDonate/update")
	public String updateProcessDonate(MultipartFile foto, @Valid @ModelAttribute("donate") Donate donate,
			BindingResult result, Model model, RedirectAttributes redirectAttrs, String path, String value) {
		if (result.hasErrors()) {
			model.addAttribute("colors", userService.getAllColors());
			model.addAttribute("genders", userService.getAllGenders());
			model.addAttribute("categories", userService.getAllCategories());
			model.addAttribute("path", path);
			return "profile/donates-update";
		}

		String content = foto.getContentType();

		if (value != null && value.equals(",true") && foto.getOriginalFilename().length() > 0
				&& (content.equals("image/jpeg") || content.equals("image/png"))) {
			donateService.deletePhotoByDonate(donate.getId());
			String photoPath = fileSaver.write(foto);
			Photo photo = new Photo();
			photo.setPath(photoPath);
			photo.setDonate(donate);
			donate.add(photo);
		} else if (value == null && foto.getOriginalFilename().length() == 0) {

		}

		else {
			model.addAttribute("colors", userService.getAllColors());
			model.addAttribute("genders", userService.getAllGenders());
			model.addAttribute("categories", userService.getAllCategories());
			model.addAttribute("path", path);
			model.addAttribute("invalida", "Opção inválida");
			return "profile/donates-update";
		}

		donate.setUser((User) session.getAttribute("user"));
		donateService.insertOrUpdate(donate);
		redirectAttrs.addFlashAttribute("success", "Doação atualizada com Sucesso.");
		return "redirect:/user/profile";

	}

	@PostMapping("/update/{id}")
	public String profileDonatesUpdate(@PathVariable("id") Integer id, Model model, RedirectAttributes redirectAttrs) {
		Donate donateById = donateService.getDonateByIdAndUser((User) session.getAttribute("user"), id);
		model.addAttribute("donate", donateById);
		model.addAttribute("colors", userService.getAllColors());
		model.addAttribute("genders", userService.getAllGenders());
		model.addAttribute("categories", userService.getAllCategories());
		model.addAttribute("path", donateService.getPathPhotos(donateById));
		return "profile/donates-update";
	}
}
