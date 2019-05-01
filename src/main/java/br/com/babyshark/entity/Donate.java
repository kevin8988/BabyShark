package br.com.babyshark.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "donate")
public class Donate implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(nullable = false)
	@NotNull(message = "Por favor, informe um título.")
	private String title;

	@Column(nullable = false)
	@NotNull(message = "Por favor, faça uma pequena descrição.")
	private String description;

	@Column(nullable = false)
	@NotNull(message = "Por favor, dê informações.")
	private String informations;

	@Column(nullable = false, columnDefinition = "boolean default false")
	private boolean isDonated;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH })
	@JoinColumn(name = "color_id")
	private Color color;

	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH })
	@JoinColumn(name = "gender_id")
	private Gender gender;

	@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "photos")
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "donate", fetch = FetchType.EAGER)
	private Set<Photo> photos = new HashSet<Photo>();

	@OneToMany(mappedBy = "donate", fetch = FetchType.LAZY)
	private Set<Interest> interests = new HashSet<Interest>();

	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH })
	@JoinTable(name = "donate_category", joinColumns = @JoinColumn(name = "donate_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
	private List<Category> categories = new ArrayList<Category>();

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

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public void add(Category category) {
		this.categories.add(category);
	}

	public void add(Photo photo) {
		this.photos.add(photo);
	}

	@Override
	public String toString() {
		return "Donate [id=" + id + ", title=" + title + ", description=" + description + ", informations="
				+ informations + ", isDonated=" + isDonated + "]";
	}

}
