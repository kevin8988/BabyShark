package br.com.babyshark.service;

import java.util.List;

import br.com.babyshark.entity.Event;
import br.com.babyshark.entity.User;

public interface EventService {

	public void insertOrUpdate(Event event, String initialHour, String endHour);

	public void interest(User user, Integer id);

	public Event getEventById(Integer id);

	public Event getEventByIdAndUser(User user, Integer id);

	public List<Event> getAllEvents();

	public List<Event> getEventsByUser(User user);

	public List<Event> getEventsByFilter(String city, String state, String text);

	public void deleteEvent(User user, Integer id);

}
