package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.User;

public interface DonateDAO {
	
	public void add(Donate donate);

	public List<Donate> getAllDonates();

	public List<Donate> getDonatesByUser(User user);

	public List<Donate> getDonatesDonated();

	public List<Donate> getLastThreeDonates();

	public List<Donate> getDonatesByFilter(List<Integer> categories, List<Integer> genders, List<Integer> colors,
			List<String> states, String search);

}
