package br.com.babyshark.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.UserDetail;

@Repository
public class UserDetailDAOImpl implements UserDetailDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void insert(UserDetail userDetail) {
		if (userDetail.getId() != null) {
			em.merge(userDetail);
		} else {
			em.persist(userDetail);
		}
	}

}
