package br.com.babyshark.service;

import java.util.Calendar;
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
	public void insertOrUpdate(Event event, String initialHour, String endHour) {

		event.getEventAddress().setCountry("Brasil");
		event.setInitialHour(hour(event.getDayOfEvent(), initialHour));
		event.setEndHour(hour(event.getDayOfEvent(), endHour));

		eventDAO.insertOrUpdate(event);
	}

	@Override
	@Transactional
	public Event getEventById(Integer id) {
		return eventDAO.getEventById(id);
	}

	private String[] replaceAndSplit(String split) {
		String var = split.replace(",", "");
		return var.split(":");
	}

	private Date hour(Date date, String hour) {
		Calendar calendar = Calendar.getInstance();

		calendar.setTime(date);

		String[] split = replaceAndSplit(hour);

		calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH),
				Integer.valueOf(split[0]), Integer.valueOf(split[1]));

		return calendar.getTime();
	}

}
