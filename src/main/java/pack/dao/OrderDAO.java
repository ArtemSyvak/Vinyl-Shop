package pack.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pack.entity.Order;

/**
 * Created by Artem on 13.07.2017.
 */
public interface OrderDAO extends JpaRepository<Order, Integer> {

}
