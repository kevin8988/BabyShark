package br.com.babyshark.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Interest implements Serializable {

	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private InterestId id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", insertable = false, updatable = false)
	private User user;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "donate_id", insertable = false, updatable = false)
	private Donate donate;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	private Status status;

	@Column
	private String message;

	public Interest() {

	}

	public Interest(User user, Donate donate, Status status) {
		this.id = new InterestId(user.getId(), donate.getId());
		this.user = user;
		this.donate = donate;
		this.status = status;
		user.getInterests().add(this);
		donate.getInterests().add(this);
	}

	public InterestId getId() {
		return id;
	}

	public void setId(InterestId id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Donate getDonate() {
		return donate;
	}

	public void setDonate(Donate donate) {
		this.donate = donate;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
