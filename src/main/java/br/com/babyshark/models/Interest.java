package br.com.babyshark.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Interest implements Serializable {

	private static final long serialVersionUID = 1L;
	@EmbeddedId
	private InterestId id;

	@ManyToOne
	@JoinColumn(name = "pk_user", insertable = false, updatable = false)
	private User user;

	@ManyToOne
	@JoinColumn(name = "pk_product", insertable = false, updatable = false)
	private Product product;
	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	private Status status;

	public Interest() {

	}

	public Interest(User user, Product product, Status status) {
		this.id = new InterestId(user.getId(), product.getId());
		this.user = user;
		this.product = product;
		this.status = status;
		user.getInterests().add(this);
		product.getInterests().add(this);
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

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}
