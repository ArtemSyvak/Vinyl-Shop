package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pack.entity.Product;
import pack.entity.User;
import pack.model.CartInfo;
import pack.model.ProductInfo;
import pack.service.ProductService;

import java.util.List;


/**
 * Created by Artem on 17.07.2017.
 */


@Controller
public class FilterController {

    @Autowired
    ProductService productService;



    @RequestMapping("genre/{name}")
    public String genres(@PathVariable(value = "name") String name, Model model){
        model.addAttribute("nullUser" , new User());
        List<Product> genreList = productService.findByGenre(name);
        model.addAttribute("genreList", genreList);
        return "genres";
    }

    @GetMapping("/genre/genre/blues")
    public String backblues(){
        return "redirect:/genre/blues";
    }
    @GetMapping("/genre/genre/electronic")
    public String backelectronic(){
        return "redirect:/genre/electronic";
    }
    @GetMapping("/genre/genre/experimental")
    public String backexperimental(){
        return "redirect:/genre/experimental";
    }
    @GetMapping("/genre/genre/indie")
    public String backindie(){
        return "redirect:/genre/indie";
    }
    @GetMapping("/genre/genre/hiphop")
    public String backhiphop(){
        return "redirect:/genre/hiphop";
    }
    @GetMapping("/genre/genre/rock")
    public String backrock(){
        return "redirect:/genre/rock";
    }
    @GetMapping("/genre/genre/chillout")
    public String backchillout(){
        return "redirect:/genre/chillout";
    }
    @GetMapping("/genre/genre/minimal")
    public String backminimal(){
        return "redirect:/genre/minimal";
    }
    @GetMapping("/genre/genre/techno")
    public String backtechno(){
        return "redirect:/genre/techno";
    }
    @GetMapping("/genre/genre/edm")
    public String backedm(){
        return "redirect:/genre/edm";
    }
    @GetMapping("/genre/genre/drum")
    public String backdrum(){
        return "redirect:/genre/drum";
    }
    @GetMapping("/genre/genre/pop")
    public String backpop(){
        return "redirect:/genre/pop";
    }
    @GetMapping("/genre/genre/alternative")
    public String backalternative(){
        return "redirect:/genre/alternative";
    }
    @GetMapping("/genre/products")
    public String backproducts(){
        return "redirect:/products";
    }

    @GetMapping("/genre/myPage")
    public String backmyPage(){
        return "redirect:/myPage";
    }



    @GetMapping("/genre/details-{id}")
    public String toDetailsPage(@PathVariable("id") int id, Model model){
        model.addAttribute("nullUser", new User());
        Product product = productService.findOne(id);
        model.addAttribute("product",product);
        return "details";
    }


}
