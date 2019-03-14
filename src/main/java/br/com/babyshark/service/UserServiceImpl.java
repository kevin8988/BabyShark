package br.com.babyshark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.dao.UserDAO;
import br.com.babyshark.entity.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Transactional
	public User getUserById(Integer id) {
		return null;
	}

	@Transactional
	public void insert(User user) {
		userDAO.insert(user);
	}

	@Transactional
	public List<String> getUserEmails() {
		return userDAO.getUserEmails();
	}

}
