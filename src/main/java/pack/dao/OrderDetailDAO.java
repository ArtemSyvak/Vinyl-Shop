package pack.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pack.entity.OrderDetail;
import pack.model.OrderDetailInfo;

import java.util.List;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{

    @Query("from OrderDetail o left join fetch o.order left join fetch o.product where o.order.id = :orderId")
    List<OrderDetail> orderDetailsByOrderIdWithFetch(@Param("orderId") int orderId);

    @Query("select o from OrderDetail o where o.order.id = :orderId")
    List<OrderDetail> orderDetailListByOrderId(@Param("orderId") int orderId);

    @Query("from OrderDetail o left join fetch o.order left join fetch o.product where o.order.id > 1")
    List<OrderDetail> findOrderDetailsAndFetch();
}
