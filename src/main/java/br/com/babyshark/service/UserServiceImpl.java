package br.com.babyshark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.dao.UserDAO;
import br.com.babyshark.entity.Authority;
import br.com.babyshark.entity.Role;
import br.com.babyshark.entity.User;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {

	@Autowired
	private UserDAO userDAO;

	@Transactional
	@Override
	public User getUserById(Integer id) {
		return null;
	}

	@Transactional
	@Override
	public void insert(User user) {
		String novaSenha = user.getPassword().substring(6);
		String encode = new BCryptPasswordEncoder().encode(novaSenha);
		Authority authority = new Authority();
		authority.setUser(user);
		authority.setAuthority(Role.ROLE_USER.toString());
		user.setUsername(user.getEmail());
		user.setPassword(encode);
		user.setConfirmPassword(encode);
		userDAO.insert(user);
	}

	@Transactional
	@Override
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
