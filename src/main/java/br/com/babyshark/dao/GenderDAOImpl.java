package br.com.babyshark.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.Gender;

@Repository
public class GenderDAOImpl implements GenderDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Gender> getAllGendersDonate() {
		return em.createQuery("select distinct g from Gender g join fetch g.donates d where d.isDonated = false",
				Gender.class).setHint("org.hibernate.cacheable", true).getResultList();
	}

	@Override
	public List<Gender> getAllGenders() {
		return em.createQuery("from Gender g", Gender.class).getResultList();
	}

}
