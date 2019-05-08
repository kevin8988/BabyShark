package br.com.babyshark.service;

import java.util.List;
import java.util.Set;

import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.Color;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Gender;
import br.com.babyshark.entity.User;

public interface DonateService {
	
	public void add(Donate donate);
	
	public List<Donate> find();

	public List<Donate> getAllDonates();

	public List<Donate> getDonatesByFilter(List<Integer> categories, List<Integer> genders, List<Integer> colors,
			List<String> states, String search);

	public List<Category> getAllCategoriesDonate();

	public List<Gender> getAllGendersDonate();

	public List<Color> getAllColorsDonate();
	
	public Set<String> getAllAddressesDonate();
	
	public List<Donate> getDonatesByUser(User user);

	public void delete(User user, Integer id);

	public Donate getDonateById(User user, Integer id);
	
	public List<Donate> getDonatesInterest(User user);
	
	public List<String> getPathPhotos(Donate donate);
	
	public void deletePhotoByDonate(Integer id);
	
	public Donate getDonateDetail(Integer id);

}
