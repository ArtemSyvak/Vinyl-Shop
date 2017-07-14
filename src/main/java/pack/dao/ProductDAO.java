package pack.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pack.entity.Product;
import pack.model.ProductInfo;

import java.util.List;

public interface ProductDAO extends JpaRepository<Product, Integer> {

}
