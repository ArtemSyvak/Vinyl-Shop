package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pack.entity.Product;
import pack.entity.User;
import pack.service.ProductService;


@RestController
public class ProductController {
    @Autowired
    ProductService productService;

//    @GetMapping("/products")
//    public String toProducts(Model model){
//
//        return "products";
//    }

    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public ModelAndView list(@PageableDefault(page = 0, value = 9) final Pageable pageable, Model model){
            model.addAttribute("nullUser" , new User());
            return new ModelAndView("products", "page", productService.listAllByPage(pageable));
    }



}
