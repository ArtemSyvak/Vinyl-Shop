package pack.service.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pack.dao.OrderDAO;
import pack.dao.OrderDetailDAO;
import pack.dao.ProductDAO;
import pack.entity.Order;
import pack.entity.OrderDetail;
import pack.entity.Product;
import pack.model.*;
import pack.service.OrderService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderDAO orderDAO;

    @Autowired
    OrderDetailDAO orderDetailDAO;


    @Autowired
    ProductDAO productDAO;

    public int getMaxOrderNum() {
        return orderDAO.getMaxIntNum();
    }

    public void saveOrder(CartInfo cartInfo) {
        int orderNum = this.getMaxOrderNum() + 1;
        Order order = new Order();

        order.setId(cartInfo.getOrderNum());
        order.setOrderNum(orderNum);
        order.setOrderDate(new Date());
        order.setAmount(cartInfo.getAmountTotal());

        CustomerInfo customerInfo = cartInfo.getCustomerInfo();
        order.setCustomerName(customerInfo.getName());
        order.setCustomerEmail(customerInfo.getEmail());
        order.setCustomerPhone(customerInfo.getPhone());
        order.setCustomerAddress(customerInfo.getAddress());

        orderDAO.save(order);

        List<CartLineInfo> lines = cartInfo.getCartLines();
        for(CartLineInfo line : lines){
            OrderDetail detail = new OrderDetail();
            detail.setId(line.getProductInfo().getCode());
            detail.setOrder(order);
            detail.setAmount(line.getAmount());
            detail.setPrice(line.getProductInfo().getPrice());
            detail.setQuanity(line.getQuanity());

            int code = line.getProductInfo().getCode();
            Product product = this.productDAO.findByCode(code);
            detail.setProduct(product);

            orderDetailDAO.save(detail);

        }
        cartInfo.setOrderNum(orderNum);
    }

    public Order findOrder(int orderId){
        orderDAO.findOne(orderId);
    }


    public OrderInfo getOrderInfo(int orderId) {
        Order order = this.findOrder(orderId);
        if(order == null){
            return null;
        }
            return new OrderInfo(order.getId(), order.getOrderDate(), order.getOrderNum(),order.getAmount(),
                    order.getCustomerName(),order.getCustomerAddress(), order.getCustomerEmail(),
                    order.getCustomerPhone());
    }

    public List<OrderDetailInfo> listOrderDetailInfos(int orderId) {
//        List<OrderDetailInfo> detailInfoList = new ArrayList<OrderDetailInfo>();
//        OrderDetailInfo detailInfo = orderDetailDAO.fetchOrderDetail(orderId);
//
//        Order order = orderDAO.fi

        return orderDetailDAO.findAll();


    }
}
