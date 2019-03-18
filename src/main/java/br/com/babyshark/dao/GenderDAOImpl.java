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

	public List<Gender> getAllGendersDonate() {
		return em.createQuery("select distinct g from Gender g join fetch g.donates", Gender.class).getResultList();
	}

}
