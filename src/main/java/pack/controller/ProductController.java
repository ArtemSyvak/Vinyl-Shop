package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import pack.entity.Product;
import pack.service.ProductService;

@RestController
public class ProductController {
    @Autowired
    ProductService productService;

    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public ModelAndView list(@PageableDefault(page=0, value = 5) final Pageable pageable){
        return new ModelAndView("products", "page", productService.listAllByPage(pageable));
    }

//    Page<Product> list(Pageable pageable){
//        Page<Product> products = productService.listAllByPage(pageable);
//        return products;
//    }



//
//    @RequestMapping(value="/products", method = RequestMethod.GET)
//    public String toProducts(@PageableDefault(size = 9, sort = "id", direction = Sort.Direction.DESC) Pageable pageable,
//                             Model model){
//        Page<Product> products = productService.listAllByPage(pageable);
//        model.addAttribute("productPage" ,products);
//        return "products";
//    }

}
