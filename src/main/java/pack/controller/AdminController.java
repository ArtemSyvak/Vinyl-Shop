package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pack.model.ProductInfo;
import pack.service.ProductService;

/**
 * Created by Artem on 12.07.2017.
 */
@Controller
@RequestMapping("/admin/")
public class AdminController {


    @Autowired
    ProductService productService;

    @GetMapping("/")
    public String adminIndex(){
        return "index";
    }

    @RequestMapping("admin_page")
    public String adminPage(Model model){
        model.addAttribute("nullProduct", new ProductInfo());
        return "adminPage";
    }

    @GetMapping("admin/admin_page")
    public String backtothefurure(){
        return "redirect:/admin/admin_page";
    }

    @GetMapping("products")
    public String backtothepast(){
        return "redirect:/products";
    }



    @PostMapping("saveProduct")
    public String saveProduct( @ModelAttribute("nullProduct") ProductInfo productInfo){
        productInfo.setInStock(true);
        productService.save(productInfo);
        return "adminPage";
    }

}
