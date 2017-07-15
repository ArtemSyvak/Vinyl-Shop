package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import pack.service.ProductService;

@RestController
public class ProductController {
    @Autowired
    ProductService productService;

    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public ModelAndView list(@PageableDefault(page = 0, value = 9) final Pageable pageable){

            return new ModelAndView("products", "page", productService.listAllByPage(pageable));
    }

}
