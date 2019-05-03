package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.Photo;

public interface PhotoDAO {
	
	public List<Photo> getPhotosByDonate(Integer id);

}
