package br.com.babyshark.entity;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "event")
public class Event implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(nullable = false)
	@NotNull(message = "Título não pode ser nulo.")
	private String title;

	@Column(nullable = false)
	@NotNull(message = "Descrição não pode ser nula.")
	private String description;

	@Column(nullable = false, name = "initial_hour")
	@Temporal(TemporalType.TIME)
	private Date initialHour;

	@Column(nullable = false, name = "end_hour")
	@Temporal(TemporalType.TIME)
	private Date endHour;

	@Column(nullable = false, name = "day_of_event")
	@DateTimeFormat
	@Temporal(TemporalType.DATE)
	@NotNull(message = "Dia não pode ser nulo.")
	private Date dayOfEvent;

	@Column(nullable = false)
	private boolean isAvailable;

	@OneToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinColumn(name = "event_address_id")
	private EventAddress eventAddress;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "user_event", joinColumns = @JoinColumn(name = "event_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private Set<User> participants = new HashSet<User>();

	public Event() {
	}

	public Event(String title, String description, Date initialHour, Date endHour, Date dayOfEvent) {
		this.title = title;
		this.description = description;
		this.initialHour = initialHour;
		this.endHour = endHour;
		this.dayOfEvent = dayOfEvent;
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

	public Date getInitialHour() {
		return initialHour;
	}

	public void setInitialHour(Date initialHour) {
		this.initialHour = initialHour;
	}

	public Date getEndHour() {
		return endHour;
	}

	public void setEndHour(Date endHour) {
		this.endHour = endHour;
	}

	public Date getDayOfEvent() {
		return dayOfEvent;
	}

	public void setDayOfEvent(Date dayOfEvent) {
		this.dayOfEvent = dayOfEvent;
	}

	public boolean isAvailable() {
		return isAvailable;
	}

	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<User> getParticipants() {
		return participants;
	}

	public void setParticipants(Set<User> participants) {
		this.participants = participants;
	}

	public EventAddress getEventAddress() {
		return eventAddress;
	}

	public void setEventAddress(EventAddress eventAddress) {
		this.eventAddress = eventAddress;
	}

	public void add(User user) {
		this.participants.add(user);
	}

	@Override
	public String toString() {
		return "Event [id=" + id + ", title=" + title + ", description=" + description + ", initialHour=" + initialHour
				+ ", endHour=" + endHour + ", dayOfEvent=" + dayOfEvent + ", isAvailable=" + isAvailable + "]";
	}

}
