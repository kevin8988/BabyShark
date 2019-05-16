package br.com.babyshark.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.Interest;

@Repository
public class InterestDAOImpl implements InterestDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void add(Interest interest) {
		em.persist(interest);
	}

	@Override
	public void delete(Integer id) {
		em.createQuery("delete from Interest i where i.id = :pId").setParameter("pId", id).executeUpdate();
	}

	@Override
	public void accept(Interest interest) {
		em.merge(interest);
	}

}
