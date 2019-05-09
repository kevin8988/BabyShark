package br.com.babyshark.infra;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import br.com.babyshark.template.EmailMessageTemplate;

@Component
public class MailSender {

	@Autowired
	public JavaMailSender emailSender;

	public void sendSimpleMessage(EmailMessageTemplate template) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo("kevin.marcelo11@hotmail.com");
		message.setSubject(template.getSubject());
		message.setText(template.getEmail() + ":" + template.getText());
		emailSender.send(message);
	}

}
