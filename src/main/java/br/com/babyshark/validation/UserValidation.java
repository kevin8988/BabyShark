package br.com.babyshark.validation;

import java.util.List;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import br.com.babyshark.entity.User;

public class UserValidation implements Validator {

	private List<String> emails;

	public UserValidation(List<String> emails) {
		this.emails = emails;
	}

	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {

		User user = (User) target;

		if (user.getPassword() != null) {
			if (user.getPassword().length() < 5) {
				errors.rejectValue("password", "field.minSize");
			} else if (user.getConfirmPassword() != null && !user.getPassword().equals(user.getConfirmPassword())) {
				errors.rejectValue("password", "field.notEqual");
			}

		}

		if (user.getEmail() != null) {
			if (emails.contains(user.getEmail())) {
				errors.rejectValue("email", "field.emailNotUnique");
			}
		}

	}

}
