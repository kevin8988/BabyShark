package br.com.babyshark.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.dao.UserDAO;
import br.com.babyshark.entity.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;

	public User getUserById(Integer id) {
		return null;
	}

	public void insert(User user) {
		userDAO.insert(user);
	}

	public User getUserByEmail(String email) {
		return null;
	}

}
