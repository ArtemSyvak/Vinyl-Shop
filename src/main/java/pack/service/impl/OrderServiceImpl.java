package pack.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pack.dao.OrderDAO;
import pack.entity.Order;
import pack.service.OrderService;

/**
 * Created by Artem on 13.07.2017.
 */

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderDAO orderDAO;

    public void save(Order order) {
        orderDAO.save(order);
    }

    public Order findOne(int id) {
        return orderDAO.findOne(id);
    }
}
