package br.com.babyshark.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.models.User;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	public User getUserById(Integer id) {
		return null;
	}

	public void insert(User user) {
		if (user.getId() != null) {
			em.persist(user);
		} else {
			em.merge(user);
		}
	}

	public User getUserByEmail(String email) {
		String jpql = "select u from User u where u.email = :pEmail";
		TypedQuery<User> query = em.createQuery(jpql, User.class).setParameter("pEmail", email);
		return query.getSingleResult();
	}

}
