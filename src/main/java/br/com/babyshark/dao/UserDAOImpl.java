package br.com.babyshark.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	public User getUserById(Integer id) {
		return null;
	}

	public void insert(User user) {
		if (user.getId() != null) {
			em.merge(user);
		} else {
			em.persist(user);
		}
	}

	public List<String> getUserEmails() {
		return em.createQuery("select u.email from User u", String.class).setHint("org.hibernate.cacheable", true)
				.getResultList();
	}

	public User getUserByEmail(String email) {
		return em.createQuery("select u from User u where u.email = :pEmail", User.class).setParameter("pEmail", email)
				.getSingleResult();
	}

}
