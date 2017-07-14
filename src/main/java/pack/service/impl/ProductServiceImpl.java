package pack.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pack.dao.ProductDAO;
import pack.entity.Product;
import pack.model.ProductInfo;
import pack.service.ProductService;

import java.util.List;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDAO productDAO;

    public ProductInfo findProductInfo(int id) {
        return new ProductInfo(productDAO.findOne(id));
    }

    public void save(ProductInfo productInfo) {
        Product product = new Product();
        product.setId(productInfo.getProductId());
        product.setProductName(productInfo.getProductName());
        product.setArtist(productInfo.getArtist());
        product.setGenre(productInfo.getGenre());
        product.setDescription(productInfo.getDescription());
        product.setImage(productInfo.getImage());
        product.setPrice(productInfo.getPrice());
        product.setReleaseYear(productInfo.getReleaseYear());
        productDAO.save(product);
    }

    public Product findOne(int id) {
        return productDAO.findOne(id);
    }

    public void delete(int id) {
        productDAO.delete(id);
    }
}
