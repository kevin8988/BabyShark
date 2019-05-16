package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.User;

public interface UserDAO {
	
	//Leitura

	public List<String> getUserEmails();

	public User getUserByUsername(String username);

	public User getUserByEmail(String email);

	public User getUserById(Integer id);
	
	//Inserção e Alteração

	public void insertOrUpdate(User user);

	public void updateEmailAndPassword(User user, String email, String password);

	public void updateEmail(User user, String email);

}
