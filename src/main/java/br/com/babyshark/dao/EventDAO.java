package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.models.Event;

public interface EventDAO {
	
	public List<Event> getAllEvents();
	
	public List<Event> getEventsByTitle(String title);
	
	

}
