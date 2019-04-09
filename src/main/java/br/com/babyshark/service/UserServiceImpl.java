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

import br.com.babyshark.dao.UserAddressDAO;
import br.com.babyshark.dao.UserDAO;
import br.com.babyshark.dao.UserDetailDAO;
import br.com.babyshark.entity.Authority;
import br.com.babyshark.entity.Role;
import br.com.babyshark.entity.User;
import br.com.babyshark.entity.UserAddress;
import br.com.babyshark.entity.UserDetail;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private UserAddressDAO userAddressDAO;

	@Autowired
	private UserDetailDAO userDetailDAO;

	@Transactional
	@Override
	public User getUserById(Integer id) {
		return null;
	}

	@Transactional
	@Override
	public void insert(User user) {

		String encode = new BCryptPasswordEncoder().encode(user.getPassword());
		Authority authority = new Authority();
		authority.setUser(user);
		authority.setAuthority(Role.ROLE_USER.toString());

		UserDetail userDetail = new UserDetail();
		userDetail.setUser(user);

		UserAddress userAddress = new UserAddress();
		userAddress.setUser(user);

		user.add(authority);
		user.setUserAddress(userAddress);
		user.setUserDetail(userDetail);
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

	@Override
	@Transactional
	public void insert(UserAddress userAddress) {
		userAddressDAO.insert(userAddress);
	}

	@Override
	@Transactional
	public void insert(UserDetail userDetail) {
		userDetailDAO.insert(userDetail);
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

	@Override
	@Transactional
	public void update(User user, String email, String password) {
		if (password == null) {
			userDAO.update(user, email);
		} else {
			String encode = new BCryptPasswordEncoder().encode(password);
			userDAO.update(user, email, encode);
		}
	}

}
