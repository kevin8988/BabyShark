package br.com.babyshark.dao;

import br.com.babyshark.entity.UserDetail;

public interface UserDetailDAO {
	
	//Inserção e Alteração
	
	public void insertOrUpdate(UserDetail userDetail);

}
