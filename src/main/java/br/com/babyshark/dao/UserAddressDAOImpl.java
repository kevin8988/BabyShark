package br.com.babyshark.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.UserAddress;

@Repository
public class UserAddressDAOImpl implements UserAddressDAO {

	@PersistenceContext
	private EntityManager em;

	public List<UserAddress> getAllAddressDonate() {
		return em.createQuery("select distinct a from UserAddress a join fetch a.user u join fetch u.donates d where d.isDonated = false", UserAddress.class)
				.getResultList();
	}

}
