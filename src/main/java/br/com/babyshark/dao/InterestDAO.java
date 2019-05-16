package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.Interest;
import br.com.babyshark.entity.User;

public interface InterestDAO {

	public void insertOrUpdate(Interest interest);

	public void delete(Integer id);

	public List<Interest> getMyInterests(User user);

	public List<Interest> getInterestInMyDonates(User user);

}
