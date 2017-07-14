package pack.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pack.entity.OrderDetail;
import pack.model.OrderDetailInfo;

import java.util.List;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{

    @Query("select o from OrderDetail o where o.order.id = :orderId")
    List<OrderDetail> getListOrderDetail(@Param("orderId") int orderId);
}
