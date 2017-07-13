package pack.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pack.entity.Order;
import pack.model.CartInfo;
import pack.model.OrderDetailInfo;
import pack.model.OrderInfo;

import java.util.List;

public interface OrderDAO extends JpaRepository<Order,Integer>{

    @Query("Select max(o.orderNum) from Order o")
    int getMaxIntNum();
}
