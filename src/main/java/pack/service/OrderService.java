package pack.service;

import pack.entity.Order;


/**
 * Created by Artem on 13.07.2017.
 */
public interface OrderService {

    void save (Order order);

    Order findOne(int id);
}
