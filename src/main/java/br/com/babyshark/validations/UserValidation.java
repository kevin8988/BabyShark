package br.com.babyshark.validations;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import br.com.babyshark.models.User;

public class UserValidation implements Validator {

	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		User user = (User) target;
		if (!user.getPassword().equals(user.getConfirmPassword())) {
			errors.rejectValue("password", "field.notEqual");
		}

	}

}
