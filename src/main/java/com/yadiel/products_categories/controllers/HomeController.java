package com.yadiel.products_categories.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yadiel.products_categories.models.Category;
import com.yadiel.products_categories.models.CategoryProduct;
import com.yadiel.products_categories.models.Product;
import com.yadiel.products_categories.services.AppService;

@Controller
public class HomeController {
	
	private final AppService appService;
	
	public HomeController(AppService appService) {
		this.appService = appService;
	}
	
	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("allProducts", this.appService.getAllProducts());
		return "index.jsp";
	}
	
	@GetMapping("/products/new")
	public String newProduct(@ModelAttribute("product") Product product) {
		return "makeProduct.jsp";
	}
	
	@PostMapping("/products/make")
	public String makeProduct(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "makeProduct.jsp";
		} else {
			
			this.appService.createProduct(product);
			
			return "redirect:/";
		}
	}
	
	@GetMapping("/products/{id}")
	public String showProduct(@PathVariable("id") Long id, Model model) {
		model.addAttribute("oneProd", this.appService.getProductById(id));
		model.addAttribute("allCats", this.appService.getAllCategories() );
		return "showProd.jsp";
	}
	

	@GetMapping("/categories/new")
	public String  newCategory(Model model) {
		model.addAttribute("addCategory", new Category());
		return "makeCategory.jsp";
	}

	@PostMapping("/addCatToProd")
	public String addToProd(@RequestParam(value="hiddenProdId") Long prodid, @RequestParam(value="selectedCat") Long catid) {

//		get a product with selected id
		Product prodtoGet = this.appService.getProductById(prodid);
		
//		get an category with selected id
		Category cattoGet = this.appService.getCategoryById(catid);
		
		CategoryProduct association = new CategoryProduct(prodtoGet, cattoGet);
		
//		tell the service to create a new entry in the third table
		this.appService.creatAssociation(association);
		
		return String.format("redirect:/products/%d", prodid);
	}



}
