package br.com.babyshark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.dao.AddressDAO;
import br.com.babyshark.dao.CategoryDAO;
import br.com.babyshark.dao.ColorDAO;
import br.com.babyshark.dao.DonateDAO;
import br.com.babyshark.dao.GenderDAO;
import br.com.babyshark.entity.Address;
import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.Color;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Gender;

@Service
public class DonateServiceImpl implements DonateService {

	@Autowired
	private DonateDAO donateDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private GenderDAO genderDAO;

	@Autowired
	private ColorDAO colorDAO;

	@Autowired
	private AddressDAO addressDAO;

	@Transactional
	public List<Donate> getAllDonates() {
		return donateDAO.getAllDonates();
	}

	@Transactional
	public List<Category> getAllCategoriesDonate() {
		return categoryDAO.getAllCategoriesDonate();
	}

	@Transactional
	public List<Gender> getAllGendersDonate() {
		return genderDAO.getAllGendersDonate();
	}

	@Transactional
	public List<Color> getAllColorsDonate() {
		return colorDAO.getAllColorsDonate();
	}

	@Transactional
	public List<Address> getAllAddressesDonate() {
		return addressDAO.getAllAddressDonate();
	}

	@Transactional
	public List<Donate> getDonatesByFilter(List<Integer> categories, List<Integer> genders, List<Integer> colors,
			List<String> state, String search) {
		return donateDAO.getDonatesByFilter(categories, genders, colors, state, search);
	}

}
