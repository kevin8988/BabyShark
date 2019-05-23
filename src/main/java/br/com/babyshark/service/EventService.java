package br.com.babyshark.service;

import java.util.List;

import br.com.babyshark.entity.Event;

public interface EventService {

	public void insertOrUpdate(Event event);

	public Event getEventById(Integer id);

	public List<Event> getAllEvents();

	public List<Event> getEventsByFilter(String city, String state, String text);

}
