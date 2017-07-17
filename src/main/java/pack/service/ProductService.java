package pack.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import pack.entity.Product;
import pack.model.ProductInfo;

import java.util.List;


public interface ProductService {

    Product findOne(int code);

    ProductInfo findProductInfo(int id);

    void save(ProductInfo productInfo);

    void delete(int id);

    Page<Product> listAllByPage(Pageable pageable);

    List<Product> findByGenre(String genre);
}
