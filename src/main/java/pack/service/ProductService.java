package pack.service;

import pack.entity.Product;
import pack.model.ProductInfo;


public interface ProductService {

    Product findOne(int code);

    ProductInfo findProductInfo(int code);

    void save(ProductInfo productInfo);

    void delete(int id);
}
