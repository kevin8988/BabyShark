package br.com.babyshark.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.Photo;

@Repository
public class PhotoDAOImpl implements PhotoDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Photo> getPhotosByDonate(Integer id) {
		return em.createQuery("from Photo p where p.donate.id = :pId", Photo.class).setParameter("pId", id)
				.getResultList();
	}

	@Override
	public void deletePhotoByDonate(Integer id) {
		em.createQuery("delete from Photo p where p.donate.id = :pId").setParameter("pId", id).executeUpdate();
	}

}
