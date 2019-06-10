package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.UserAddress;

public interface UserAddressDAO {

	public List<UserAddress> getAllAddressDonate();

	public void insertOrUpdate(UserAddress userAddress);
}
