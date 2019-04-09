package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.UserAddress;

public interface UserAddressDAO {	
	
	public void insert(UserAddress userAddress);
	
	public List<UserAddress> getAllAddressDonate();

}
