package br.com.babyshark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import br.com.babyshark.dao.AddressDAO;

public class AddressServiceImpl implements AddressService {

	@Autowired
	private AddressDAO addressDAO;

	public List<String> getAllStates() {
		return addressDAO.getAllStates();
	}

}
