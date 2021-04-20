package com.yadiel.products_categories.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.yadiel.products_categories.models.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {

}
