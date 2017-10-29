package pack.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pack.dao.ProductDAO;
import pack.entity.Product;
import pack.model.ProductInfo;
import pack.service.ProductService;

import java.util.ArrayList;
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
        product.setInStock(productInfo.isInStock());
        productDAO.save(product);
    }

    public Product findOne(int id) {
        return productDAO.findOne(id);
    }

    public void delete(int id) {
        productDAO.delete(id);
    }

    public Page<Product> listAllByPage(Pageable pageable) {
        return productDAO.findAll(pageable);
    }


//    public List<Product> findByGenre(String genre) {
//        return productDAO.findByGenre(genre);
//    }

    public Page<Product> listGenreByPage(String genreName, Pageable pageable) {
        return productDAO.findByGenre(genreName, pageable);
    }
}
