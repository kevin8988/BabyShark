package br.com.babyshark.service;

import java.util.List;

import br.com.babyshark.entity.Address;
import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.Color;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Gender;

public interface DonateService {

	public List<Donate> getAllDonates();

	public List<Donate> getDonatesByFilter(List<Integer> categories, List<Integer> genders, List<Integer> colors,
			List<String> states, String search);

	public List<Category> getAllCategoriesDonate();

	public List<Gender> getAllGendersDonate();

	public List<Color> getAllColorsDonate();
	
	public List<Address> getAllAddressesDonate();

}
