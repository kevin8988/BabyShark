package br.com.babyshark.service;

import java.util.List;

import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.Color;
import br.com.babyshark.entity.Gender;
import br.com.babyshark.entity.User;
import br.com.babyshark.entity.UserAddress;
import br.com.babyshark.entity.UserDetail;

public interface UserService {

	// User

	public void insertOrUpdate(User user);

	public User getUserById(Integer id);

	public void updateEmailAndPassword(User user, String email, String password);

	public List<String> getUserEmails();

	// User Address

	public void insertOrUpdate(UserAddress userAddress);

	// User Detail

	public void insertOrUpdate(UserDetail userDetail);

	// Color

	public List<Color> getAllColors();

	// Gender

	public List<Gender> getAllGenders();

	// Category

	public List<Category> getAllCategories();

}
