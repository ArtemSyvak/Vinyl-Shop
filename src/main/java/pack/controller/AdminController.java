package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pack.entity.Product;
import pack.service.ProductService;


/**
 * Created by Artem on 12.07.2017.
 */
@Controller
@RequestMapping("/admin/")
public class AdminController {
    @Autowired
    ProductService productService;

    @PostMapping("saveProduct")
    public String saveProduct(@ModelAttribute("product") Product product){
        productService.save(product);
        return "redirect:/";
    }

    @GetMapping("/")
    public String adminIndex(){
        return "index";
    }

    @GetMapping("admin_page")
    public String adminPage(Model model){
        model.addAttribute("product", new Product());
        return "adminPage";

    }

}
