//package pack.service.editors;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import pack.entity.Order;
//import pack.service.OrderService;
//
//import java.beans.PropertyEditorSupport;
//
///**
// * Created by Artem on 13.07.2017.
// */
//
//@Component
//public class OrderEditor extends PropertyEditorSupport {
//
//
//    @Autowired
//    OrderService orderService;
//
//    @Override
//    public void setAsText(String idOfOrder) throws IllegalArgumentException {
//        int id = Integer.parseInt(idOfOrder);
//        Order order = orderService.findOne(id);
//        setValue(order);
//    }
//}
