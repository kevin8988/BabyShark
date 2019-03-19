package br.com.babyshark.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.EventAddress;

@Repository
public class AddressDAOImpl implements AddressDAO {

	@PersistenceContext
	private EntityManager em;

	public List<EventAddress> getAllAddressDonate() {
		return em.createQuery("select distinct a from Address a join fetch a.user u join fetch u.donates d where d.isDonated = false", EventAddress.class)
				.getResultList();
	}

}
