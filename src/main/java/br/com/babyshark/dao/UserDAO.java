package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.User;

public interface UserDAO {

	public User getUserById(Integer id);

	public void insert(User user);
	
	public void update(User user, String email);
	
	public List<String> getUserEmails();
	
	public User getUserByUsername(String username);

	public User getUserByEmail(String email);

}
