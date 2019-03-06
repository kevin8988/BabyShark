package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.Address;
import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.User;

public interface DonateDAO {

	public List<Donate> getAllDonates();

	public List<Donate> getDonatesByUser(User user);

	public List<Donate> getDonatesDonated();

	public List<Donate> getDonatesByCategories(Category... categories);

	public List<Donate> getDonatesByName(String name);

	public List<Donate> getDonatesByAddress(Address adress);

}
