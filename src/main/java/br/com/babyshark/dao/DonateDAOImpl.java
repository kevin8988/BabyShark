package br.com.babyshark.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.babyshark.entity.Address;
import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.User;

@Repository
public class DonateDAOImpl implements DonateDAO {

	@PersistenceContext
	private EntityManager em;

	public List<Donate> getAllDonates() {
		return em.createQuery("from Donate", Donate.class).getResultList();
	}

	public List<Donate> getDonatesByUser(User user) {
		return null;
	}

	public List<Donate> getDonatesDonated() {
		return null;
	}

	public List<Donate> getDonatesByCategories(Category... categories) {
		return null;
	}

	public List<Donate> getDonatesByName(String name) {
		return null;
	}

	public List<Donate> getDonatesByAddress(Address adress) {
		return null;
	}

}
