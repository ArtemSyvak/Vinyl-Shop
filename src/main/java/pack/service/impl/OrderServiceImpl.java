package pack.service.impl;

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

        UserInfo userInfo = cartInfo.getUserInfo();
        order.setCustomerName(userInfo.getName());
        order.setCustomerEmail(userInfo.getEmail());
        order.setCustomerPhone(userInfo.getPhone());
        order.setCustomerAddress(userInfo.getAddress());

        orderDAO.save(order);

        List<CartLineInfo> lines = cartInfo.getCartLines();
        for(CartLineInfo line : lines){
            OrderDetail detail = new OrderDetail();
            detail.setId(line.getProductInfo().getCode());
            detail.setOrder(order);
            detail.setAmount(line.getAmount());
            detail.setPrice(line.getProductInfo().getPrice());
            detail.setQuantity(line.getQuanity());

            int code = line.getProductInfo().getCode();
            Product product = this.productDAO.findOne(code);
            detail.setProduct(product);

            orderDetailDAO.save(detail);

        }
        cartInfo.setOrderNum(orderNum);
    }

    public Order findOrder(int orderId){
         return orderDAO.findOne(orderId);
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

        List<OrderDetailInfo> infoList = new ArrayList<OrderDetailInfo>();
        OrderDetail orderDetail = orderDetailDAO.findOne(orderId);

        for (OrderDetailInfo of: infoList) {
            of.setId(orderDetail.getId());
            of.setAmount(orderDetail.getAmount());
            of.setPrice(orderDetail.getPrice());
            of.setProductCode(orderDetail.getProduct().getCode());
            of.setProductName(orderDetail.getProduct().getProductName());
            of.setQuantity(orderDetail.getQuantity());
            infoList.add(of);
        }
        return infoList;
    }

}
