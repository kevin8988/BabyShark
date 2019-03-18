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

import br.com.babyshark.entity.Address;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Gender;
import br.com.babyshark.entity.User;

@Repository
public class DonateDAOImpl implements DonateDAO {

	@PersistenceContext
	private EntityManager em;

	public List<Donate> getAllDonates() {
		return em.createQuery("from Donate d where d.isDonated = false", Donate.class).getResultList();
	}

	public List<Donate> getDonatesByUser(User user) {
		return em.createQuery("from Donate d where d.user = :pUser and d.isDonated = false", Donate.class)
				.setParameter("pUser", user).getResultList();
	}

	public List<Donate> getDonatesDonated() {
		return null;
	}

	public List<Donate> getLastThreeDonates() {
		return em.createQuery("from Donate d where d.isDonated = false order by d.id desc", Donate.class)
				.setMaxResults(3).getResultList();
	}

	public List<Gender> getAllGenders() {
		return em.createQuery("from Gender", Gender.class).getResultList();
	}

	public List<Donate> getDonatesByFilter(List<Integer> categories, List<Integer> genders, List<Integer> colors,
			List<String> states, String search) {

		CriteriaBuilder builder = em.getCriteriaBuilder();

		CriteriaQuery<Donate> query = builder.createQuery(Donate.class);

		query.distinct(true);

		Root<Donate> root = query.from(Donate.class);

		Path<String> pathTitle = root.<String>get("title");
		Path<Integer> pathCategory = root.join("categories").<Integer>get("id");
		Path<Integer> pathColor = root.join("colors").<Integer>get("id");
		Path<Integer> pathGender = root.join("genders").<Integer>get("id");
		Path<String> pathState = root.<User>get("user").<Address>get("address").<String>get("state");
		Path<Boolean> pathIsDonated = root.<Boolean>get("isDonated");

		List<Predicate> final1 = new ArrayList<Predicate>();
		List<Predicate> predicates = new ArrayList<Predicate>();
		List<Predicate> predicates2 = new ArrayList<Predicate>();
		List<Predicate> predicates3 = new ArrayList<Predicate>();
		List<Predicate> predicates4 = new ArrayList<Predicate>();

		final1.add(builder.equal(pathIsDonated, false));

		if (!search.equals("")) {
			Predicate pNome = builder.like(pathTitle, "%" + search + "%");
			final1.add(pNome);
		}

		if (!categories.isEmpty()) {
			for (Integer category : categories) {
				Predicate nomeCategories = builder.equal(pathCategory, category);
				predicates.add(nomeCategories);
			}
			Predicate or1 = builder.or(predicates.toArray(new Predicate[0]));
			final1.add(or1);
		}

		if (!genders.isEmpty()) {
			for (Integer gender : genders) {
				Predicate nomeGenders = builder.equal(pathGender, gender);
				predicates2.add(nomeGenders);
			}
			Predicate or2 = builder.or(predicates2.toArray(new Predicate[0]));
			final1.add(or2);
		}

		if (!colors.isEmpty()) {
			for (Integer color : colors) {
				Predicate nomeColors = builder.equal(pathColor, color);
				predicates3.add(nomeColors);
			}
			Predicate or3 = builder.or(predicates3.toArray(new Predicate[0]));
			final1.add(or3);
		}

		if (!states.isEmpty()) {
			for (String state : states) {
				Predicate nameStates = builder.equal(pathState, state);
				predicates4.add(nameStates);
			}
			Predicate or4 = builder.or(predicates4.toArray(new Predicate[0]));
			final1.add(or4);
		}

		query.where(final1.toArray(new Predicate[0]));

		return em.createQuery(query).getResultList();
	}

}
