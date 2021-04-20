package com.yadiel.products_categories.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.yadiel.products_categories.models.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long> {

}
