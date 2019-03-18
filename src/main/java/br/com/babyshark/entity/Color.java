package br.com.babyshark.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Color implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private ColorName name;

	@Column(nullable = false)
	private String nameHexa;

	@ManyToMany
	@JoinTable(name = "donate_color", joinColumns = @JoinColumn(name = "color_id"), inverseJoinColumns = @JoinColumn(name = "donate_id"))
	private Set<Donate> donates = new HashSet<Donate>();

	public Color() {
	}

	public Color(ColorName name, String nameHexa) {
		this.name = name;
		this.nameHexa = nameHexa;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ColorName getName() {
		return name;
	}

	public void setName(ColorName name) {
		this.name = name;
	}

	public String getNameHexa() {
		return nameHexa;
	}

	public void setNameHexa(String nameHexa) {
		this.nameHexa = nameHexa;
	}

	public Set<Donate> getDonates() {
		return donates;
	}

	public void setDonates(Set<Donate> donates) {
		this.donates = donates;
	}

}
