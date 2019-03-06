package br.com.babyshark.dao;

import br.com.babyshark.entity.User;

public interface UserDAO {

	public User getUserById(Integer id);

	public void insert(User user);
	
	public User getUserByEmail(String email);

}
