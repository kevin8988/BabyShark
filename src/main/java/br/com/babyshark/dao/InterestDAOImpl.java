package br.com.babyshark.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.Interest;
import br.com.babyshark.entity.Status;
import br.com.babyshark.entity.User;

@Repository
public class InterestDAOImpl implements InterestDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void insertOrUpdate(Interest interest) {
		if (interest.getId() == null) {
			em.persist(interest);
		} else {
			em.merge(interest);
		}
	}

	@Override
	public void delete(Integer id) {
		em.createQuery("delete from Interest i where i.id = :pId").setParameter("pId", id).executeUpdate();
	}

	@Override
	public void declineInterests(Interest interest, Integer id) {
		Status status = Status.RECUSADO;
		em.createQuery("update Interest i set i.status = :pStatus where i.donate.id = :pId and i != :pInterest")
				.setParameter("pId", id).setParameter("pInterest", interest).setParameter("pStatus", status).executeUpdate();
	}

	@Override
	public List<Interest> getMyInterests(User user) {
		return em.createQuery(
				"from Interest i join fetch i.donate d join fetch d.photos p join fetch d.user du join fetch i.user u where i.user = :pUser",
				Interest.class).setParameter("pUser", user).getResultList();
	}

	@Override
	public List<Interest> getInterestInMyDonates(User user) {
		return em.createQuery(
				"from Interest i join fetch i.donate d join fetch i.user iu join fetch d.user u where u = :pUser",
				Interest.class).setParameter("pUser", user).getResultList();

	}

}
