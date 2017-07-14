package pack.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pack.entity.Order;
import pack.model.OrderDetailInfo;

import java.util.List;


public interface OrderDAO extends JpaRepository<Order,Integer>{


}
