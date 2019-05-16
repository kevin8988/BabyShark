package br.com.babyshark.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.Color;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Gender;
import br.com.babyshark.entity.Interest;
import br.com.babyshark.entity.User;
import br.com.babyshark.entity.UserAddress;

@Repository
public class DonateDAOImpl implements DonateDAO {

	@PersistenceContext
	private EntityManager em;

	public List<Donate> getAllDonates() {
		return em.createQuery("from Donate d join fetch d.photos where d.isDonated = false", Donate.class)
				.getResultList();
	}

	public List<Donate> getDonatesByUser(User user) {
		return em.createQuery("from Donate d join fetch d.photos where d.user = :pUser and d.isDonated = false",
				Donate.class).setParameter("pUser", user).getResultList();
	}

	public List<Donate> getDonatesDonated() {
		return null;
	}

	public List<Donate> getLastThreeDonates() {
		return em.createQuery("from Donate d join fetch d.photos order by d.id desc", Donate.class).getResultList();
	}

	public List<Donate> getDonatesByFilter(List<Integer> categories, List<Integer> genders, List<Integer> colors,
			List<String> states, String search) {

		CriteriaBuilder builder = em.getCriteriaBuilder();

		CriteriaQuery<Donate> query = builder.createQuery(Donate.class);

		query.distinct(true);

		Root<Donate> root = query.from(Donate.class);

		Path<String> pathTitle = root.<String>get("title");
		Path<Integer> pathCategory = root.join("categories").<Integer>get("id");
		Path<Integer> pathColor = root.<Color>get("color").<Integer>get("id");
		Path<Integer> pathGender = root.<Gender>get("gender").<Integer>get("id");
		Path<String> pathState = root.<User>get("user").<UserAddress>get("userAddress").<String>get("state");
		Path<Boolean> pathIsDonated = root.<Boolean>get("isDonated");
		root.fetch("photos", JoinType.INNER);

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

	@Override
	public void add(Donate donate) {
		Color color = em.find(Color.class, donate.getColor().getId());
		donate.setColor(color);

		Gender gender = em.find(Gender.class, donate.getGender().getId());
		donate.setGender(gender);

		List<Category> categories = donate.getCategories();
		List<Category> newList = new ArrayList<>();
		for (Category category : categories) {
			if (category.getId() != null) {
				Category merge = em.find(Category.class, category.getId());
				newList.add(merge);
			}
		}

		donate.setCategories(newList);

		if (donate.getId() == null) {
			em.persist(donate);
		} else {
			em.merge(donate);
		}
	}

	@Override
	public List<Donate> find() {
		return em.createQuery("from Donate d", Donate.class).getResultList();
	}

	@Override
	public void delete(User user, Integer id) {
		em.createQuery("delete from Interest i where i.donate.id = :pId").setParameter("pId", id).executeUpdate();
		em.createQuery("delete from Photo p where p.donate.id = :pId").setParameter("pId", id).executeUpdate();
		em.createQuery("delete from Donate d where d.id = :pId and d.user = :pUser").setParameter("pId", id)
				.setParameter("pUser", user).executeUpdate();
	}

	@Override
	public Donate getDonateById(User user, Integer id) {
		return em.createQuery(
				"from Donate d join fetch d.photos join fetch d.color join fetch d.gender join fetch d.categories where d.isDonated = false and d.id = :pId and d.user = :pUser",
				Donate.class).setParameter("pUser", user).setParameter("pId", id).getSingleResult();
	}

	@Override
	public List<Interest> getDonatesInterest(User user) {
		return em.createQuery(
				"from Interest i join fetch i.donate d join fetch d.photos p join fetch d.user du join fetch i.user u where i.user = :pUser",
				Interest.class).setParameter("pUser", user).getResultList();
	}
	
	@Override
	public List<Interest> getInterest(User user) {
		return em.createQuery(
				"from Interest i join fetch i.donate d join fetch i.user iu join fetch d.user u where u = :pUser",
				Interest.class).setParameter("pUser", user).getResultList();
	}

	@Override
	public Donate getDonateDetail(Integer id) {
		return em.createQuery(
				"from Donate d join fetch d.photos p join fetch d.categories c join fetch d.color o join fetch d.gender g join fetch d.user u join fetch u.userAddress ua where d.id = :pId",
				Donate.class).setParameter("pId", id).getSingleResult();
	}

	@Override
	public Donate getDonateById(Integer id) {
		return em.createQuery("from Donate d where d.id = :pId", Donate.class).setParameter("pId", id)
				.getSingleResult();
	}

}
