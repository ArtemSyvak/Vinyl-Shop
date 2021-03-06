package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import pack.entity.Order;
import pack.entity.OrderDetail;
import pack.entity.Product;
import pack.entity.User;
import pack.service.MailService;
import pack.service.OrderService;
import pack.service.ProductService;
import pack.service.UserService;
import pack.validator.UserValidator;

import javax.validation.Valid;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    MailService mailService;

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

    @RequestMapping("createAccount")
    public String toregistryPage(Model model){
        model.addAttribute("nullUser", new User());
        return "registry-page";
    }

    @RequestMapping("myPage")
    private String toUserPage(Model model, Principal principal){
        String email = principal.getName();
        User user = userService.findByEmail(email);
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

    @PostMapping("save")
    public String save(@ModelAttribute("nullUser") @Valid User user,
                       BindingResult result){
        if (result.hasErrors()){
            return "index";
        }
        System.out.println("before: " + user);
        userService.saveWithPassword(user);
        System.out.println("after: " + user);
//        mailService.send(user.getEmail());
        return "index";
    }

    @GetMapping("details-{id}")
    public String toDetailsPage(@PathVariable("id") int id, Model model){
        model.addAttribute("nullUser", new User());
        Product product = productService.findOne(id);
        model.addAttribute("product",product);
        return "details";
    }


    @GetMapping("mySettings")
    public String toSettings(Model model, Principal principal){
        String email = principal.getName();
        User userSet = userService.findByEmail(email);
        model.addAttribute("userSet", userSet);
        return "settings";
    }

    @PostMapping("saveSettings")
    public String saveSettings(@ModelAttribute("userSet") User modelUser){
        System.out.println("from PostMapping " + modelUser);
        userService.setUserSettings(modelUser);
        return "userPage";
    }


    @InitBinder("nullUser")
    public void binder(WebDataBinder webDataBinder) {
        webDataBinder.addValidators(validator);
    }


}
