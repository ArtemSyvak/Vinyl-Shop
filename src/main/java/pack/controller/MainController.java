package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pack.entity.Order;
import pack.entity.OrderDetail;
import pack.entity.Product;
import pack.entity.User;
import pack.model.CartInfo;
import pack.model.ProductInfo;
import pack.service.OrderService;
import pack.service.ProductService;
import pack.service.UserService;
import pack.service.impl.Utils;
import pack.validator.UserValidator;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    UserService userService;

    @Autowired
    ProductService productService;

    @Autowired
    OrderService orderService;

    @Autowired
    UserValidator validator;

    @RequestMapping("/")
    public String toIndex(Model model){
        model.addAttribute("nullUser" , new User());
        return "index";
    }

    @RequestMapping("myPage")
    private String toUserPage(Model model, Principal principal){
        String username = principal.getName();
        User user = userService.findByName(username);
        String email = user.getEmail();
        List<Order> list = orderService.findAllByCustomerEmail(email);
        List<OrderDetail> allOrderDetails = new ArrayList<OrderDetail>();
        for(Order order : list){
            int id = order.getId();
            List<OrderDetail> listOfDetails = orderService.orderDetailsByOrderIdWithFetch(id);
            for(OrderDetail detail : listOfDetails){
                allOrderDetails.add(detail);
            }
        }
        model.addAttribute("list",list);
        model.addAttribute("allOrderDetails", allOrderDetails);
        return "userPage";
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


    @GetMapping("mySettings")
    public String toSettings(Model model, Principal principal){
        String username = principal.getName();
        User user = userService.findByName(username);
        model.addAttribute(user);
        return "settings";
    }


    @InitBinder("user")
    public void binder(WebDataBinder webDataBinder) {
        webDataBinder.addValidators(validator);
    }
}
