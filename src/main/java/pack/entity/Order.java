package pack.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Artem on 13.07.2017.
 */

@Entity
public class Order {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

//    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "order")
//    private List<Product> products = new ArrayList<Product>();

    public Order() {
    }
//
//    public Order(List<Product> products) {
//        this.products = products;
//    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

//    public List<Product> getProducts() {
//        return products;
//    }
//
//    public void setProducts(List<Product> products) {
//        this.products = products;
//    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                '}';
    }
}
