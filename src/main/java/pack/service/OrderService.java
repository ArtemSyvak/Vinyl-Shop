package pack.service;

import pack.model.CartInfo;
import pack.model.OrderDetailInfo;
import pack.model.OrderInfo;

import java.util.List;

public interface OrderService {

    void saveOrder(CartInfo cartInfo);
    OrderInfo getOrderInfo(int orderId);
    List<OrderDetailInfo> listOrderDetailInfos(int orderId);

}
