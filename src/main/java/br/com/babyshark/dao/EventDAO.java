package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.Event;
import br.com.babyshark.entity.User;

public interface EventDAO {

	public void insertOrUpdate(Event event);

	public List<Event> getAllEvents();

	public List<Event> getThreeNearbyEvents();

	public Event getEventById(Integer id);

	public Event getEventByIdAndUser(User user, Integer id);

	public List<Event> getEventsByUser(User user);

	public List<Event> getEventsByFilter(String city, String state, String text);

}
