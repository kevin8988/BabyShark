package br.com.babyshark.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.Event;
import br.com.babyshark.entity.User;

@Repository
public class EventDAOImpl implements EventDAO {

	@PersistenceContext
	private EntityManager em;

	public List<Event> getAllEvents() {
		return null;
	}

	public List<Event> getEventsByTitle(String title) {
		return null;
	}

	public List<Event> getEventsByUser(User user) {
		return null;
	}

	public List<Event> getThreeNearbyEvents() {
		return em.createQuery("from Event e order by e.id desc", Event.class).setMaxResults(3).getResultList();
	}

}
