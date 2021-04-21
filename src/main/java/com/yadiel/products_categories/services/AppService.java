package com.yadiel.products_categories.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yadiel.products_categories.models.Category;
import com.yadiel.products_categories.models.CategoryProduct;
import com.yadiel.products_categories.models.Product;
import com.yadiel.products_categories.repositories.CategoryProductRepository;
import com.yadiel.products_categories.repositories.CategoryRepository;
import com.yadiel.products_categories.repositories.ProductRepository;

@Service
public class AppService {
	
	private final ProductRepository prodRepo;
	private final CategoryRepository catRepo;
	private final CategoryProductRepository crRepo;
	public AppService(ProductRepository prodRepo, CategoryRepository catRepo, CategoryProductRepository crRepo) {
		super();
		this.prodRepo = prodRepo;
		this.catRepo = catRepo;
		this.crRepo = crRepo;
	}
	
	public Product createProduct (Product product) {
		return this.prodRepo.save(product);
	}
	
	public List<Product> getAllProducts(){
		return (List<Product>)this.prodRepo.findAll();
	}
	
	public Product getProductById(Long id) {
		return this.prodRepo.findById(id).orElse(null);
	}
	
	public List<Category> getAllCategories(){
		return (List<Category>)this.catRepo.findAll();
	}
	
	public Category createCategory (Category category) {
		return this.catRepo.save(category);
	}
	
	public Category getCategoryById(Long id) {
		return this.catRepo.findById(id).orElse(null);
	}
	
	public CategoryProduct creatAssociation(CategoryProduct cp) {
		return this.crRepo.save(cp);
	}
	
	public List<Product> FindLeftOverProducts(Category category) {
		return this.prodRepo.findByCategoriesNotContains(category);
	}
	
	public List<Category> FindLeftOverCategories(Product product) {
		return this.catRepo.findByProductsNotContains(product);
	}
	
}
