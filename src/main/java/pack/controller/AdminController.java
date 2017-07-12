package pack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Artem on 12.07.2017.
 */
@Controller
@RequestMapping("/admin/")
public class AdminController {

    @GetMapping("/")
    public String adminIndex(){
        return "index";
    }

    @GetMapping("admin_page")
    public String adminPage(){
        return "adminPage";
    }

}
