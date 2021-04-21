package com.yadiel.products_categories.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.yadiel.products_categories.models.Category;
import com.yadiel.products_categories.models.Product;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long> {

//	find all Categories that don't have a relationship with a specific Product in the DB
	List<Category> findByProductsNotContains(Product product);
	
}
