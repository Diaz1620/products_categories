package com.yadiel.products_categories.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.yadiel.products_categories.models.Category;
import com.yadiel.products_categories.models.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {

	
//	find all Products that don't have a relationship with a specific Category in the DB
	List<Product> findByCategoriesNotContains(Category category);
	
}
