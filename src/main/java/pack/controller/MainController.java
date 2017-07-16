package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pack.entity.Product;
import pack.entity.User;
import pack.model.CartInfo;
import pack.model.ProductInfo;
import pack.service.ProductService;
import pack.service.UserService;
import pack.service.impl.Utils;
import pack.validator.UserValidator;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class MainController {
    @Autowired
    UserService userService;

    @Autowired
    ProductService productService;

    @Autowired
    UserValidator validator;

    @RequestMapping("/")
    public String toIndex(Model model){
        model.addAttribute("nullUser" , new User());
        return "index";
    }

//
//    @RequestMapping("addNull")
//    public String signUp(Model model){
//        model.addAttribute("nullUser" ,new User());
//        return "index";
//    }


    @PostMapping("save")
    public String save(@ModelAttribute("nullUser") @Valid User user,
                       BindingResult result){
        if (result.hasErrors()){
            return "index";
        }
        userService.save(user);
        return "index";
    }


    @GetMapping("details-{id}")
    public String toDetailsPage(@PathVariable("id") int id, Model model){
        Product product = productService.findOne(id);
        model.addAttribute("product",product);
        return "details";
    }

    @InitBinder("user")
    public void binder(WebDataBinder webDataBinder) {
        webDataBinder.addValidators(validator);
    }
}
