package br.com.babyshark.service;

import br.com.babyshark.entity.User;

public interface UserService {
	
	public User getUserById(Integer id);

	public void insert(User user);
	
	public User getUserByEmail(String email);

}
