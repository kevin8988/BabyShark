package br.com.babyshark.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.Event;
import br.com.babyshark.entity.EventAddress;
import br.com.babyshark.entity.User;

@Repository
public class EventDAOImpl implements EventDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void insertOrUpdate(Event event) {
		if (event.getId() == null) {
			em.persist(event);
		} else {
			em.merge(event);
		}
	}

	@Override
	public List<Event> getAllEvents() {
		return em.createQuery("from Event e", Event.class).getResultList();
	}

	@Override
	public List<Event> getThreeNearbyEvents() {
		return em.createQuery("from Event e order by e.id desc", Event.class).getResultList();
	}

	@Override
	public Event getEventById(Integer id) {
		return em.createQuery("from Event e join fetch e.eventAddress a join fetch e.user u where e.id = :pId",
				Event.class).setParameter("pId", id).getSingleResult();
	}

	@Override
	public Event getEventByIdAndUser(User user, Integer id) {
		return em.createQuery(
				"from Event e join fetch e.eventAddress a join fetch e.user u where e.id = :pId and e.user = :pUser",
				Event.class).setParameter("pId", id).setParameter("pUser", user).getSingleResult();
	}

	@Override
	public List<Event> getEventsByUser(User user) {
		return em.createQuery("from Event e join fetch e.user u where u = :pUser", Event.class)
				.setParameter("pUser", user).getResultList();
	}

	@Override
	public void deleteEvent(User user, Integer id) {
		EventAddress singleResult = em.createQuery("from EventAddress e where e.event.id = :pId", EventAddress.class)
				.setParameter("pId", id).getSingleResult();
		em.createQuery("delete from Event e where e.id = :pId and e.user = :pUser").setParameter("pId", id)
				.setParameter("pUser", user).executeUpdate();
		em.createQuery("delete from EventAddress e where e = :pEventAddress")
				.setParameter("pEventAddress", singleResult).executeUpdate();

	}

	@Override
	public List<Event> getEventsByFilter(String city, String state, String text) {
		CriteriaBuilder builder = em.getCriteriaBuilder();

		CriteriaQuery<Event> query = builder.createQuery(Event.class);

		query.distinct(true);

		Root<Event> root = query.from(Event.class);

		Path<String> pathCity = root.<EventAddress>get("eventAddress").<String>get("city");
		Path<String> pathState = root.<EventAddress>get("eventAddress").<String>get("state");
		Path<String> pathText = root.<String>get("title");

		List<Predicate> final1 = new ArrayList<Predicate>();

		if (!text.equals("")) {
			Predicate pText = builder.like(pathText, "%" + text + "%");
			final1.add(pText);
		}

		if (!city.equals("")) {
			Predicate pCity = builder.equal(pathCity, city);
			final1.add(pCity);
		}

		if (!state.equals("")) {
			Predicate pState = builder.equal(pathState, state);
			final1.add(pState);
		}

		query.where(final1.toArray(new Predicate[0]));

		return em.createQuery(query).getResultList();
	}

}
