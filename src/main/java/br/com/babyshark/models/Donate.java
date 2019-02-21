package br.com.babyshark.models;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Donate implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(nullable = false)
	private String title;

	@Column(nullable = false)
	private String description;

	@Column(nullable = false)
	private String informations;

	@Column(nullable = false, columnDefinition = "boolean default false")
	private boolean isDonated;

	@ManyToOne
	private User user;

	@ElementCollection
	private Set<Photo> photos = new HashSet<Photo>();

	@OneToMany(mappedBy = "product")
	private Set<Interest> interests = new HashSet<Interest>();

	@ManyToMany
	private Set<Category> categories = new HashSet<Category>();

	public Donate() {
	}

	public Donate(String title, User user, Category... categories) {
		this.title = title;
		this.user = user;
		setCategories(categories);
		user.getProducts().add(this);
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public boolean isDonated() {
		return isDonated;
	}

	public void setDonated(boolean isDonated) {
		this.isDonated = isDonated;
	}

	public String getInformations() {
		return informations;
	}

	public void setInformations(String informations) {
		this.informations = informations;
	}

	public Set<Photo> getPhotos() {
		return photos;
	}

	public void setPhotos(Set<Photo> photos) {
		this.photos = photos;
	}

	public Set<Interest> getInterests() {
		return interests;
	}

	public void setInterests(Set<Interest> interests) {
		this.interests = interests;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<Category> getCategories() {
		return categories;
	}

	public void setCategories(Category... categories) {
		for (Category category : categories) {
			this.categories.add(category);
		}
	}

}
