package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pack.entity.User;
import pack.service.UserService;

@Controller
public class MainController {
    @Autowired
    UserService userService;

    @RequestMapping("/")
    public String toIndex(){
        return "index";
    }

    @GetMapping("toLogin")
    public String toLogin(){
        return "login";
    }

    @GetMapping("logout_page")
    public String toLogout(){
        return "logout_page";
    }

    @PostMapping("save")
    public String save(@RequestParam("username") String username,
                       @RequestParam("password") String password){
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        userService.save(user);
        return "index";
    }

}
