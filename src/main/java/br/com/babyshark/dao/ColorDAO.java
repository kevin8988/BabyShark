package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.Color;

public interface ColorDAO {
	
	public List<Color> getAllColorsDonate();
	
	public List<Color> getAllColors();

}
