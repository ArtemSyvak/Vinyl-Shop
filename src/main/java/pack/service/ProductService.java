package pack.service;

import pack.entity.Product;

import java.util.List;

/**
 * Created by Artem on 13.07.2017.
 */
public interface ProductService {

    void save(Product product);

    void delete(int id);

    Product findOne(int id);

    List<Product> findAll();


}
