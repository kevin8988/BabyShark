package br.com.babyshark.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.entity.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	public User getUserById(Integer id) {
		return null;
	}

	public void insert(User user) {
	}

	public User getUserByEmail(String email) {
		return null;
	}

}
