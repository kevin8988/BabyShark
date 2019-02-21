package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.models.Category;
import br.com.babyshark.models.Donate;
import br.com.babyshark.models.User;

public interface DonateDAO {
	
	public List<Donate> getAllDonates();
	
	public List<Donate> getDonatesByUser(User user);
	
	public List<Donate> getDonatesDonated();
	
	public List<Donate> getDonatesByCategories(Category... categories);
	 
	public List<Donate> getDonatesByName(String name);

}
