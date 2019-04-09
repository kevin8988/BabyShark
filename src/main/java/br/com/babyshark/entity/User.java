package br.com.babyshark.entity;

import java.io.Serializable;
import java.util.HashSet;
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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "users")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "users")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotNull(message = "Por favor, informe um nome.")
	@Pattern(regexp = "^[[ ]|\\p{L}*]+$", message = "Por favor, informe um nome válido com mais de 2 caracteres.")
	@Column(nullable = false, name = "first_name")
	private String firstName;

	@NotNull(message = "Por favor, informe um sobrenome.")
	@Pattern(regexp = "^[[ ]|\\p{L}*]+$", message = "Por favor, informe um sobrenome.")
	@Column(nullable = false, name = "last_name")
	private String lastName;

	@NotNull(message = "Por favor, informe um e-mail.")
	@Pattern(regexp = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])", message = "Por favor, informe um e-mail v�lido.")
	@Column(nullable = false, unique = true)
	private String email;

	@Column
	private String username;

	@Column(nullable = false)
	private String password;

	@Column(nullable = false, name = "confirm_password")
	private String confirmPassword;

	@Column(nullable = false, columnDefinition = "boolean default true")
	private boolean enabled;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "user_address_id")
	private UserAddress userAddress;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "user_detail_id")
	private UserDetail userDetail;

	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Authority> authorities = new HashSet<Authority>();

	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private Set<Interest> interests = new HashSet<Interest>();

	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private Set<Donate> donates = new HashSet<Donate>();

	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private Set<Event> events = new HashSet<Event>();

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "user_event", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "event_id"))
	private Set<Event> eventInterests = new HashSet<Event>();

	public User() {
	}

	public User(String firstName, String lastName, String email, String password, String confirmPassword) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.confirmPassword = confirmPassword;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Set<Interest> getInterests() {
		return interests;
	}

	public void setInterests(Set<Interest> interests) {
		this.interests = interests;
	}

	public Set<Donate> getDonates() {
		return donates;
	}

	public void setDonates(Set<Donate> donates) {
		this.donates = donates;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public UserAddress getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(UserAddress userAddress) {
		this.userAddress = userAddress;
	}

	public Set<Event> getEvents() {
		return events;
	}

	public void setEvents(Set<Event> events) {
		this.events = events;
	}

	public UserDetail getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}

	public Set<Event> getEventInterests() {
		return eventInterests;
	}

	public void setEventInterests(Set<Event> eventInterests) {
		this.eventInterests = eventInterests;
	}

	public Set<Authority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Set<Authority> authorities) {
		this.authorities = authorities;
	}
	
	public void add(Event event) {
		this.events.add(event);
		event.setUser(this);
	}

	public void add(Donate donate) {
		this.donates.add(donate);
		donate.setUser(this);
	}
	
	public void add(Authority role) {
		this.authorities.add(role);
	}

	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", password=" + password
				+ ", confirmPassword=" + confirmPassword + "]";
	}

}
