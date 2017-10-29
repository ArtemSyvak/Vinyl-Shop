package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pack.entity.User;
import pack.service.ProductService;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;


@Controller
public class ProductController {
    @Autowired
    ProductService productService;

    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public String list(@PageableDefault(page = 0, value = 9) final Pageable pageable, Model model){
        model.addAttribute("page", productService.listAllByPage(pageable));
        return "products";
    }

}
