package br.com.babyshark.service;

import java.util.List;

import br.com.babyshark.entity.User;

public interface UserService {

	public User getUserById(Integer id);

	public void insert(User user);
	
	public void update(User user, String email);

	public List<String> getUserEmails();

}
