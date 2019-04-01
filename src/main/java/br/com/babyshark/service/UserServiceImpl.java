package br.com.babyshark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.dao.UserDAO;
import br.com.babyshark.entity.User;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {

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

	@Transactional
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userDAO.getUserByUsername(username);
		
		UserBuilder builder = null;
		if (user != null) {
			builder = org.springframework.security.core.userdetails.User.withUsername(username);
			builder.disabled(!user.isEnabled());
			builder.password(user.getPassword());
			String[] authorities = user.getAuthorities().stream().map(a -> a.getAuthority()).toArray(String[]::new);
			builder.authorities(authorities);
		} else {
			throw new UsernameNotFoundException("User not found.");
		}
		return builder.build();
	}
}
