package br.com.babyshark.dao;

import java.util.List;

import br.com.babyshark.entity.Category;

public interface CategoryDAO {
	
	public List<Category> getAllCategoriesDonate();
	
	public List<Category> getAllCategories();

}
