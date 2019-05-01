package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.Gender;

public interface GenderDAO {
	
	public List<Gender> getAllGendersDonate();
	
	public List<Gender> getAllGenders();

}
