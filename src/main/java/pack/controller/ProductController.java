package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pack.entity.User;
import pack.service.ProductService;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;


@RestController
public class ProductController {
    @Autowired
    ProductService productService;

    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public ModelAndView list(@PageableDefault(page = 0, value = 9) final Pageable pageable){
        ModelAndView modelAndView = new ModelAndView("products");
        modelAndView.addObject("page", productService.listAllByPage(pageable));
        return modelAndView;
    }

}
