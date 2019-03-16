package br.com.babyshark.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;

	@ElementCollection(fetch = FetchType.LAZY)
	private Set<Photo> photos = new HashSet<Photo>();

	@OneToMany(mappedBy = "donate", fetch = FetchType.LAZY)
	private Set<Interest> interests = new HashSet<Interest>();

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "donate_category", joinColumns = @JoinColumn(name = "donate_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
	private Set<Category> categories = new HashSet<Category>();

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "donate_category", joinColumns = @JoinColumn(name = "donate_id"), inverseJoinColumns = @JoinColumn(name = "color_id"))
	private Set<Color> colors = new HashSet<Color>();

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "donate_category", joinColumns = @JoinColumn(name = "donate_id"), inverseJoinColumns = @JoinColumn(name = "gender_id"))
	private Set<Gender> genders = new HashSet<Gender>();

	public Donate() {
	}

	public Donate(String title, String description, String informations) {
		this.title = title;
		this.description = description;
		this.informations = informations;
		this.isDonated = false;
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

	public void setCategories(Set<Category> categories) {
		this.categories = categories;
	}

	public Set<Color> getColors() {
		return colors;
	}

	public void setColors(Set<Color> colors) {
		this.colors = colors;
	}

	public Set<Gender> getGenders() {
		return genders;
	}

	public void setGenders(Set<Gender> genders) {
		this.genders = genders;
	}

	public void add(Category category) {
		this.categories.add(category);
	}

	public void add(Photo photo) {
		this.photos.add(photo);
	}

	public void add(Color color) {
		this.colors.add(color);
	}

	public void add(Gender gender) {
		this.genders.add(gender);
	}

}
