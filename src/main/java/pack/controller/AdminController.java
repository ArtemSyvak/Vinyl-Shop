package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import pack.entity.Product;
import pack.validator.UserValidator;
//import pack.service.ProductService;

/**
 * Created by Artem on 12.07.2017.
 */
@Controller
@RequestMapping("/admin/")
public class AdminController {

//
//    @Autowired
//    ProductService productService;

    @Autowired
    UserValidator validator;


    @GetMapping("/")
    public String adminIndex(){
        return "index";
    }

    @RequestMapping("admin_page")
    public String adminPage(Model model){
        model.addAttribute("product", new Product());
        return "adminPage";
    }


    @InitBinder
    public void binder(WebDataBinder webDataBinder) {
        webDataBinder.addValidators(validator);
    }

}
