package pack.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pack.entity.OrderDetail;
import pack.model.OrderDetailInfo;

import java.util.List;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{

}
