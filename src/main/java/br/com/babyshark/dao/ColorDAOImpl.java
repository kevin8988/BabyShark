package br.com.babyshark.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.Color;

@Repository
public class ColorDAOImpl implements ColorDAO {

	@PersistenceContext
	private EntityManager em;

	public List<Color> getAllColorsDonate() {
		return em.createQuery("select distinct c from Color c join fetch c.donates", Color.class)
				.setHint("org.hibernate.cacheable", true).getResultList();
	}

	@Override
	public List<Color> getAllColors() {
		return em.createQuery("from Color c", Color.class).getResultList();

	}

}
