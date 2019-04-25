package br.com.babyshark.validation;

import java.util.List;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.Donate;

public class DonateValidation implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Donate.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Donate donate = (Donate) target;

		if (donate.getColor().getId() == null) {
			errors.rejectValue("color", "field.color");
		}

		if (donate.getGender().getId() == null) {
			errors.rejectValue("gender", "field.gender");
		}

		List<Category> categories = donate.getCategories();
		int i = 0;
		for (Category category : categories) {
			if (category.getId() == null) {
				i++;
			}
		}
		if (i == 3) {
			errors.rejectValue("categories", "field.categories");
		}

	}

}
