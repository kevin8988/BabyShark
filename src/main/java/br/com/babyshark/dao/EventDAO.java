package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.Event;
import br.com.babyshark.entity.User;

public interface EventDAO {
	
	public List<Event> getAllEvents();
	
	public List<Event> getEventsByTitle(String title);
	
	public List<Event> getEventsByUser(User user);
	
	public List<Event> getThreeNearbyEvents();

}
