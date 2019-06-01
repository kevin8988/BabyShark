package br.com.babyshark.validation;

import java.util.Calendar;
import java.util.Date;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import br.com.babyshark.entity.Event;

public class EventValidation implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Event.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Event event = (Event) target;

		// Check check = new SafeguardCheck();

		if (event.getTitle() != null) {
			if (event.getTitle().length() > 30) {
				errors.rejectValue("title", "field.title");
			}
		}

		if (event.getDescription() != null) {
			if (event.getDescription().length() > 240) {
				errors.rejectValue("description", "field.description");
			}
		}
		if (event.getDayOfEvent() != null) {
			Date dayOfEvent = event.getDayOfEvent();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dayOfEvent);
			if (calendar.compareTo(Calendar.getInstance()) < 0) {
				errors.rejectValue("dayOfEvent", "field.date");
			}

		}

//		if (event.getEventAddress() != null) {
//		
//			if (event.getEventAddress().getNumber() == null) {
//				errors.rejectValue("eventAddress.number", "field.numberNull");
//			} else if (event.getEventAddress().getNumber().length() > 10) {
//				errors.rejectValue("eventAddress.number", "field.number");
//			}
//			
////			if (event.getEventAddress().getPostalCode() == null) {
////				errors.rejectValue("eventAddress.postalCode", "field.postalCodeNull");
////			} else if (check.elementOf(event.getEventAddress().getPostalCode(), ParametroTipo.CEP).validate()
////					.hasError()) {
////				errors.rejectValue("eventAddress.postalCode", "field.postalCode");
////			}
//			
//
//		}

	}

}
