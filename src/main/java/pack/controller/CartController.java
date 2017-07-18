package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import pack.entity.Order;
import pack.entity.User;
import pack.model.CartInfo;
import pack.model.ProductInfo;
import pack.model.UserInfo;
import pack.service.OrderService;
import pack.service.ProductService;
import pack.service.UserService;
import pack.validator.UserInfoValidator;

import javax.validation.Valid;
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

    @Autowired
    UserInfoValidator infoValidator;

    //PRINCIPAL

    @RequestMapping("/addToCart")
    public String addToCart(@RequestParam("id") int id){
        ProductInfo productInfo = new ProductInfo(productService.findOne(id));
        cart.addProduct(productInfo, 1);
        return "redirect:myCart";
    }

    @RequestMapping("/removeFromCart")
    public String removeFromCart(@RequestParam("id") int id){
        cart.removeProduct(id);
        return "redirect:myCart";
    }

    @RequestMapping("myCart")
    public String toCart(Model model){
        CartInfo cartInfo = cart;
        model.addAttribute("cartForm", cartInfo);
        return "cartPage";
    }

    @RequestMapping("toUserForm")
    public String toUserForm(Model model, Principal principal){
        CartInfo cartInfo = cart;
        UserInfo userInfo = cart.getUserInfo();
        if(userInfo==null){
            userInfo = new UserInfo();
        }
        User user = userService.findByName(principal.getName());
        userInfo.setName(user.getFullName());
        userInfo.setPhone(user.getPhone());
        userInfo.setAddress(user.getAddress());
        userInfo.setEmail(user.getEmail());
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("cartForm", cartInfo);
        return "userForm";
    }

    @PostMapping("toConfirmOrder")
    public String userFormSave(@ModelAttribute("userInfo") @Valid UserInfo userInfo, BindingResult result,
                               Model model,
                               Principal principal                               ){
        System.out.println("hello! "+result.hasErrors());
        if (result.hasErrors()){
            return "userForm";
        }
        cart.setUserInfo(userInfo);
        String username = principal.getName();
        User user = userService.findByName(username);
        user.setAddress(userInfo.getAddress());
        user.setPhone(userInfo.getPhone());
        user.setFullName(userInfo.getName());
        userService.save(user);
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
    @RequestMapping("/genre/myCart")
    public String backCart(Model model){
        CartInfo cartInfo = cart;
        model.addAttribute("cartForm", cartInfo);
        return "cartPage";
    }

    @InitBinder("userInfo")
    public void binder(WebDataBinder webDataBinder) {
        webDataBinder.setValidator(infoValidator);
    }

}
