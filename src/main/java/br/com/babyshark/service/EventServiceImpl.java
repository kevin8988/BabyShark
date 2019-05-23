package br.com.babyshark.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.dao.EventDAO;
import br.com.babyshark.entity.Event;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDAO;

	@Override
	@Transactional
	public List<Event> getAllEvents() {
		return eventDAO.getAllEvents();
	}

	@Override
	@Transactional
	public List<Event> getEventsByFilter(String city, String state, String text) {
		return eventDAO.getEventsByFilter(city, state, text);
	}

	@Override
	@Transactional
	public void insertOrUpdate(Event event) {
		event.setInitialHour(new Date());
		event.setEndHour(new Date());
		event.getEventAddress().setCountry("Brasil");
		eventDAO.insertOrUpdate(event);
	}

}
