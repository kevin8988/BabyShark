package br.com.babyshark.template;

import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Component;

@Component
public class EmailMessageTemplate {

	@NotNull(message = "Por favor, informe um e-mail para contato.")
	private String email;

	@NotNull(message = "Por favor, informe o assunto.")
	private String subject;

	@NotNull(message = "Por favor, informe a mensagem.")
	private String text;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
