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

	@Override
	public User getUserById(Integer id) {
		return em.createQuery(
				"select u from User u join fetch u.userAddress a join fetch u.userDetail d where u.id = :pId",
				User.class).setParameter("pId", id).getSingleResult();
	}

	@Override
	public void insert(User user) {
		if (user.getId() != null) {
			em.merge(user);
		} else {
			em.persist(user);
		}
	}

	@Override
	public List<String> getUserEmails() {
		return em.createQuery("select u.email from User u", String.class).getResultList();
	}

	@Override
	public User getUserByEmail(String email) {
		return em.createQuery(
				"select u from User u join fetch u.userAddress a join fetch u.userDetail d where u.email = :pEmail",
				User.class).setParameter("pEmail", email).getSingleResult();
	}

	@Override
	public User getUserByUsername(String username) {
		return em.createQuery(
				"select u from User u join fetch u.userAddress a join fetch u.userDetail d where u.username = :pUsername",
				User.class).setParameter("pUsername", username).getSingleResult();
	}

	@Override
	public void update(User user, String email) {
		em.createQuery("update User u set u.email = :pEmail, u.username = :pEmail where u.id = :pId")
				.setParameter("pEmail", email).setParameter("pId", user.getId()).executeUpdate();

	}

	@Override
	public void update(User user, String email, String password) {
		em.createQuery(
				"update User u set u.email = :pEmail, u.username = :pEmail, u.password = :pPassword, u.confirmPassword = :pPassword where u.id = :pId")
				.setParameter("pEmail", email).setParameter("pId", user.getId()).setParameter("pPassword", password)
				.executeUpdate();
	}

}
