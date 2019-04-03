package br.com.babyshark.entity;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.br.CPF;

@Entity
@Table(name = "user_detail")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class UserDetail implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "day_of_birth")
	@Temporal(TemporalType.DATE)
	private Calendar dayOfBirth;

	@Column
	private String fone;

	@Column
	@CPF(message = "Por favor, informe um CPF v�lido")
	private String cpf;

	@Enumerated(EnumType.STRING)
	@Column
	private GenderName gender;

	@OneToOne(mappedBy = "userDetail")
	private User user;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Calendar getDayOfBirth() {
		return dayOfBirth;
	}

	public void setDayOfBirth(Calendar dayOfBirth) {
		this.dayOfBirth = dayOfBirth;
	}

	public GenderName getGender() {
		return gender;
	}

	public void setGender(GenderName gender) {
		this.gender = gender;
	}

	public String getFone() {
		return fone;
	}

	public void setFone(String fone) {
		this.fone = fone;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
