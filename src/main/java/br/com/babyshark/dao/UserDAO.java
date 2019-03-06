package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.User;

public interface UserDAO {

	public User getUserById(Integer id);

	public void insert(User user);
	
	public List<String> getUserEmails();

}
