package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pack.entity.Product;
import pack.service.ProductService;

import java.util.List;


/**
 * Created by Artem on 17.07.2017.
 */


@Controller
public class FilterController {

    @Autowired
    ProductService productService;



    @RequestMapping("genre/{name}")
    public String genres(@PathVariable(value = "name") String name, Model model){

        List<Product> genreList = productService.findByGenre(name);
        model.addAttribute("genreList", genreList);
        return "genres";
    }



}
