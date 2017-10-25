package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pack.entity.Order;
import pack.entity.User;
import pack.model.*;
import pack.service.MailService;
import pack.service.OrderService;
import pack.service.ProductService;
import pack.service.UserService;
import pack.validator.OrderInfoValidator;
import pack.validator.UserInfoValidator;
import pack.validator.UserValidator;

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
    MailService mailService;

    @Autowired
    OrderInfoValidator orderInfoValidator;

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
        model.addAttribute("cartForm", cart);
        return "cartPage";
    }


    @RequestMapping("toUserForm")
    public String toUserForm(Model model, Principal principal){

        UserFormWrapper wrapper = new UserFormWrapper();
        OrderInfo orderInfo = new OrderInfo();

        CartInfo cartInfo = cart;

        if(principal!=null){
            User user = userService.findByEmail(principal.getName());
            orderInfo.setCustomerName(user.getFirstname());
            orderInfo.setCustomerSurname(user.getSurname());
            orderInfo.setCustomerPhone(user.getPhone());
            orderInfo.setCustomerAddress(user.getAddress());
            orderInfo.setCustomerEmail(user.getEmail());
        }
        wrapper.setOrderInfo(orderInfo);

        model.addAttribute("wrapper", wrapper);

        return "userForm";
    }

    /// переписать логику
//    @RequestMapping("toUserForm")
//    public String toUserForm(Model model, Principal principal){
//        CartInfo cartInfo = cart;
//        UserInfo userInfo = cart.getUserInfo();
//        if(userInfo==null){
//            userInfo = new UserInfo();
//        }
//        User user = userService.findByEmail(principal.getName());
//        userInfo.setFirstname(user.getFirstname());
//        userInfo.setSurname(user.getSurname());
//        userInfo.setPhone(user.getPhone());
//        userInfo.setAddress(user.getAddress());
//        userInfo.setEmail(user.getEmail());
//        model.addAttribute("userInfo", userInfo);
//        model.addAttribute("cartForm", cartInfo);
//        return "userForm";
//    }

    @PostMapping("toConfirmOrder")
    public String userFormSave(@ModelAttribute("wrapper") @Valid UserFormWrapper wrapper, BindingResult result,
                               Principal principal, ModelMap map){

        System.out.println("hello! "+result.hasErrors());
        if (result.hasErrors()){
            return "userForm";
        }

        User user = new User();
        if(userService.findByEmail(wrapper.getOrderInfo().getCustomerEmail()) == null){
            user = wrapper.getNullUser();
            System.out.println(user);
            user.setEmail(wrapper.getOrderInfo().getCustomerEmail());
            userService.save(user);
        }
        user.setFirstname(wrapper.getOrderInfo().getCustomerName());
        user.setSurname(wrapper.getOrderInfo().getCustomerSurname());
        user.setAddress(wrapper.getOrderInfo().getCustomerAddress());
        user.setPhone(wrapper.getOrderInfo().getCustomerPhone());
        userService.save(user);
        System.out.println(user);

        CartInfo cartInfo = cart;
        map.addAttribute("cartInfo", cartInfo);
        map.addAttribute("wrapper", wrapper);
        return "confirmOrder";
    }

        // старый
//    @PostMapping("toConfirmOrder")
//    public String userFormSave(@ModelAttribute("userInfo") @Valid UserInfo userInfo, BindingResult result,
//                               Model model,
//                               Principal principal){
//        System.out.println("hello! "+result.hasErrors());
//        if (result.hasErrors()){
//            return "userForm";
//        }
//        cart.setUserInfo(userInfo);
//        String email = principal.getName();
//        User user = userService.findByEmail(email);
//        user.setAddress(userInfo.getAddress());
//        user.setPhone(userInfo.getPhone());
//        user.setFullName(userInfo.getName());
//        userService.save(user);
//        cart.getUserInfo().setEmail(user.getEmail());
//
//        CartInfo cartInfo = cart;
//        model.addAttribute("cartInfo", cartInfo);
//        return "confirmOrder";
//    }

    @PostMapping("confirmOrder")
    public String toFinalPage(@ModelAttribute("wrapper") UserFormWrapper wrapper, Model model){
        orderService.saveOrder(wrapper.getOrderInfo(), cart);
//        mailService.sendOrder(wrapper.getOrderInfo().getCustomerEmail());
        model.addAttribute("order", wrapper.getOrderInfo());
        System.out.println(wrapper.getOrderInfo());
        return "final";
    }
    @RequestMapping("/genre/myCart")
    public String backCart(Model model){
        CartInfo cartInfo = cart;
        model.addAttribute("cartForm", cartInfo);
        return "cartPage";
    }

//    @InitBinder
//    public void binder(WebDataBinder webDataBinder) {
//        webDataBinder.addValidators(infoValidator, orderInfoValidator);
//    }

    /// старые биндеры
//    @InitBinder("userInfo")
//    public void binder(WebDataBinder webDataBinder) {
//        webDataBinder.setValidator(infoValidator);
//    }
//
//    @InitBinder("orderInfo")
    public void orderBinder(WebDataBinder webDataBinder) {
        webDataBinder.setValidator(orderInfoValidator);
    }

}
