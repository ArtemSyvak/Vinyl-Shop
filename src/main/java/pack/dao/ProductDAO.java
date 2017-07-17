package pack.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import pack.entity.Product;

import java.util.List;

public interface ProductDAO extends JpaRepository<Product, Integer>, PagingAndSortingRepository<Product, Integer> {


    @Query("select o from Product o where o.genre=:genre")
    List<Product> findByGenre(@Param("genre") String genre);
}
