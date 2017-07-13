package pack.entity;



import javax.persistence.*;

/**
 * Created by Artem on 13.07.2017.
 */

@Entity
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int price;
    private String artist;
    private String album;
    private String description;
//
//    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    private Order order = new Order();

    public Product() {
    }

//    public Product(int price, String artist, String album, String description,Order order) {
//        this.price = price;
//        this.artist = artist;
//        this.album = album;
//        this.description = description;
//        this.order = order;
//    }

    public Product(int price, String artist, String album, String description) {
        this.price = price;
        this.artist = artist;
        this.album = album;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getAlbum() {
        return album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

//    public Order getOrder() {
//        return order;
//    }
//
//    public void setOrder(Order order) {
//        this.order = order;
//    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", price=" + price +
                ", artist='" + artist + '\'' +
                ", album='" + album + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
