package br.com.babyshark.service;

import java.util.List;

import br.com.babyshark.entity.User;
import br.com.babyshark.entity.UserAddress;
import br.com.babyshark.entity.UserDetail;

public interface UserService {

	public User getUserById(Integer id);

	public void insert(User user);
	
	public void insert(UserAddress userAddress);
	
	public void insert(UserDetail userDetail);
	
	public void update(User user, String email);

	public List<String> getUserEmails();

}
