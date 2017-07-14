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

    public void saveOrder(CartInfo cartInfo) {
        Order order = new Order();
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
            detail.setOrder(order);
            detail.setAmount(line.getAmount());
            detail.setPrice(line.getProductInfo().getPrice());
            detail.setQuantity(line.getQuantity());

            int productId = line.getProductInfo().getProductId();
            Product product = this.productDAO.findOne(productId);
            detail.setProduct(product);

            orderDetailDAO.save(detail);

        }
        cartInfo.setOrderId(order.getId());
    }

    public Order findOrder(int orderId){
         return orderDAO.findOne(orderId);
    }


    public OrderInfo getOrderInfo(int orderId) {
        Order order = this.findOrder(orderId);
        if(order == null){
            return null;
        }
            return new OrderInfo(order.getId(), order.getOrderDate(), order.getAmount(),
                    order.getCustomerName(),order.getCustomerAddress(), order.getCustomerEmail(),
                    order.getCustomerPhone());
    }

    public List<OrderDetailInfo> listOrderDetailInfos(int orderId) {
            List<OrderDetail> listOrderDetail = orderDetailDAO.getListOrderDetail(orderId);
            List<OrderDetailInfo> listInfos = new ArrayList<OrderDetailInfo>();

            for(OrderDetail detail : listOrderDetail){
                OrderDetailInfo orderDetailInfo = new OrderDetailInfo();
                orderDetailInfo.setId(detail.getId());
                orderDetailInfo.setProductId(detail.getProduct().getId());
                orderDetailInfo.setProductName(detail.getProduct().getProductName());
                orderDetailInfo.setQuantity(detail.getQuantity());
                orderDetailInfo.setPrice(detail.getPrice());
                orderDetailInfo.setAmount(detail.getAmount());
                listInfos.add(orderDetailInfo);
            }
        return listInfos;
    }

}
