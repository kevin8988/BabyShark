package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.models.Event;
import br.com.babyshark.models.User;

public interface EventDAO {
	
	public List<Event> getAllEvents();
	
	public List<Event> getEventsByTitle(String title);
	
	public List<Event> getEventsByUser(User user);

}
