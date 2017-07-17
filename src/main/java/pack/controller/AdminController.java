package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pack.entity.Order;
import pack.entity.OrderDetail;
import pack.model.ProductInfo;
import pack.service.OrderService;
import pack.service.ProductService;

import java.io.File;
import java.util.List;

/**
 * Created by Artem on 12.07.2017.
 */
@Controller
@RequestMapping("/admin/")
public class AdminController {


    @Autowired
    ProductService productService;

    @Autowired
    OrderService orderService;

    @GetMapping("/")
    public String adminIndex(){
        return "index";
    }

    @RequestMapping("admin_page")
    public String adminPage(Model model){
        model.addAttribute("nullProduct", new ProductInfo());
        return "adminPage";
    }

    @GetMapping("admin/admin_page")
    public String backtothefurure(){
        return "redirect:/admin/admin_page";
    }

    @GetMapping("products")
    public String backtothepast(){
        return "redirect:/products";
    }

    @RequestMapping("admin_orders")
    public String toAdminOrders(Model model){
        List<Order> orderList = orderService.findAllOrdersByIdDesc();
        List<OrderDetail> orderDetails = orderService.findAllOrderDetails();
        model.addAttribute("orderDetails",orderDetails);
        model.addAttribute("orderList",orderList);
        return "adminOrders";
    }

    @PostMapping("saveProduct")
    public String saveProduct(@ModelAttribute("nullProduct") ProductInfo productInfo,
                              @RequestParam("file")MultipartFile multipartFile){

        productInfo.setInStock(true);
        productInfo.setImage("/image/"+multipartFile.getOriginalFilename());
        productService.save(productInfo);
        return "adminPage";
    }

}
