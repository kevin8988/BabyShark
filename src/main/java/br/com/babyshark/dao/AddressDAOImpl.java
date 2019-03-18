package br.com.babyshark.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class AddressDAOImpl implements AddressDAO {
	
	@PersistenceContext
	private EntityManager em;

	public List<String> getAllStates() {
		return em.createQuery("select distinct a.state from Address a").getResultList();
	}

}
