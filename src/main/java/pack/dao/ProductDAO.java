package pack.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import pack.entity.Product;
import pack.model.ProductInfo;

import java.util.List;

public interface ProductDAO extends JpaRepository<Product, Integer>, PagingAndSortingRepository<Product, Integer> {
    Page<Product> findByInStockIsTrueOrderByIdDesc(Pageable pageable);
}
