package pack.service;

import org.springframework.stereotype.Service;
import pack.dao.UserDAO;
import pack.entity.Product;
import pack.model.ProductInfo;

import java.util.List;

public interface ProductService {

    Product findProduct(String code);
    ProductInfo findProductInfo(String code);
    void save(ProductInfo productInfo);
}
