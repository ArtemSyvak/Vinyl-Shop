package pack.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pack.entity.Product;

/**
 * Created by Artem on 13.07.2017.
 */
public interface ProductDAO extends JpaRepository<Product,Integer > {

}
