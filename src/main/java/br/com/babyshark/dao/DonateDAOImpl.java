package br.com.babyshark.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.User;

@Repository
public class DonateDAOImpl implements DonateDAO {

	@PersistenceContext
	private EntityManager em;

	public List<Donate> getAllDonates() {
		return em.createQuery("from Donate", Donate.class).getResultList();
	}

	public List<Donate> getDonatesByUser(User user) {
		return null;
	}

	public List<Donate> getDonatesDonated() {
		return null;
	}

	public List<Donate> getLastThreeDonates() {
		return em.createQuery("from Donate d order by d.id desc", Donate.class).setMaxResults(3).getResultList();
	}

	public List<Donate> getDonatesByFilter(List<Integer> categories, String search) {

		CriteriaBuilder builder = em.getCriteriaBuilder();
		CriteriaQuery<Donate> query = builder.createQuery(Donate.class);
		query.distinct(true);
		Root<Donate> root = query.from(Donate.class);

		Path<String> pathTitle = root.<String>get("title");
		Path<Integer> pathCategory = root.join("categories").<Integer>get("id");

		List<Predicate> predicates = new ArrayList<Predicate>();
		
		if (!search.equals("")) {
			Predicate pNome = builder.like(pathTitle, "%" + search + "%");
			predicates.add(pNome);
		}

		if (!categories.isEmpty()) {
			Predicate nomeCategories = pathCategory.in(categories);
			predicates.add(nomeCategories);
		}

		query.where((Predicate[]) predicates.toArray(new Predicate[0]));

		TypedQuery<Donate> tp = em.createQuery(query);

		return tp.getResultList();
	}

}
