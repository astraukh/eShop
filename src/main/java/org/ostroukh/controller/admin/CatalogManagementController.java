package org.ostroukh.controller.admin;

import org.ostroukh.model.entity.Product;
import org.ostroukh.model.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class CatalogManagementController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CatalogManagementController.class);

    @Autowired
    private ProductService productService;

    @RequestMapping("/catalog")
    public String listProducts(Model model){
        model.addAttribute("product", new Product());
        model.addAttribute("listProducts", productService.getAllProducts());

        return "admin/catalog_mng";
    }

    @RequestMapping("/catalog/add")
    public String addProduct(@Valid @ModelAttribute("product") Product product, BindingResult bindingResult){
        if (bindingResult.hasErrors()){
            return "admin/catalog_mng";
        }

        productService.saveProduct(product);

        return "redirect:/admin/catalog";
    }

    @RequestMapping("/editProduct/{id}")
    public String editProduct(@PathVariable("id") int id, Model model){
        Optional<Product> optional = productService.getProductById(id);
        if (optional.isPresent()) {
            model.addAttribute("product", optional.get());
        } else {
            return "admin/catalog_mng";
        }
        model.addAttribute("listProducts", productService.getAllProducts());

        return "admin/catalog_mng";
    }

    @RequestMapping("/deleteProduct/{id}")
    public String deleteProduct(@PathVariable("id") int id, Model model){
        Optional<Product> optional = productService.getProductById(id);
        if (optional.isPresent()) {
            Product product = optional.get();
            model.addAttribute("product", product);
            productService.deleteProduct(product);
        } else {
            return "admin/catalog_mng";
        }
        model.addAttribute("listProducts", productService.getAllProducts());

        return "redirect:/admin/catalog";
    }
}