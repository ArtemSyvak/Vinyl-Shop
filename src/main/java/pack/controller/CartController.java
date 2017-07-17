package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pack.dao.OrderDAO;
import pack.dao.ProductDAO;
import pack.entity.Order;
import pack.entity.User;
import pack.model.CartInfo;
import pack.model.ProductInfo;
import pack.model.UserInfo;
import pack.service.OrderService;
import pack.service.ProductService;
import pack.service.UserService;
import pack.service.impl.Utils;

import java.security.Principal;

@Controller
@Scope("session")
public class CartController {
    private CartInfo cart = new CartInfo();

    @Autowired
    ProductService productService;

    @Autowired
    OrderService orderService;

    @Autowired
    UserService userService;

    @RequestMapping("/addToCart")
    public String addToCart(@RequestParam("id") int id){
        ProductInfo productInfo = new ProductInfo(productService.findOne(id));
        cart.addProduct(productInfo, 1);
        return "redirect:myCart";
    }

    @RequestMapping("myCart")
    public String toCart(Model model){
        CartInfo cartInfo = cart;
        model.addAttribute("cartForm", cartInfo);
        return "cartPage";
    }

    @RequestMapping("toUserForm")
    public String toUserForm(Model model){
        CartInfo cartInfo = cart;
        UserInfo userInfo = cart.getUserInfo();
        if(userInfo==null){
            userInfo = new UserInfo();
        }
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("cartForm", cartInfo);
        return "userForm";
    }
//
//    @GetMapping("toUserForm")
//    public String linkToUserForm(Model model){
//        CartInfo cartInfo = cart;
//        UserInfo userInfo = cart.getUserInfo();
//        if(userInfo==null){
//            userInfo = new UserInfo();
//        }
//        model.addAttribute("userInfo", userInfo);
//        model.addAttribute("cartForm", cartInfo);
//        return "userForm";
//    }

    @PostMapping("toConfirmOrder")
    public String userFormSave(@ModelAttribute("userInfo") UserInfo userInfo, Model model, Principal principal){
        userInfo.setValid(true);
        cart.setUserInfo(userInfo);

        String username = principal.getName();
        User user = userService.findByName(username);
        cart.getUserInfo().setEmail(user.getEmail());

        CartInfo cartInfo = cart;
        model.addAttribute("cartInfo", cartInfo);
        return "confirmOrder";
    }

    @PostMapping("confirmOrder")
    public String toFinalPage(Model model){
        Order order = orderService.saveOrder(cart);
        model.addAttribute("order", order);
        return "final";
    }

}
