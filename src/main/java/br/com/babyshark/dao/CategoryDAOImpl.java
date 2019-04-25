package br.com.babyshark.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@PersistenceContext
	private EntityManager em;

	public List<Category> getAllCategoriesDonate() {
		return em.createQuery("select distinct c from Category c join fetch c.donates d where d.isDonated = false", Category.class).setHint("org.hibernate.cacheable", true).getResultList();
	}

	@Override
	public List<Category> getAllCategories() {
		return em.createQuery("from Category c", Category.class).getResultList();
	}

}
