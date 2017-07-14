package pack.entity;

import javax.persistence.*;
import java.util.Arrays;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String productName;
    private String artist;
    private String genre;
    private String description;
    private String image; //pathToImage

    public Product(String productName, String artist, String genre, String description, String image, int releaseYear, double price) {
        this.productName = productName;
        this.artist = artist;
        this.genre = genre;
        this.description = description;
        this.image = image;
        this.releaseYear = releaseYear;
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    private int releaseYear;

    private double price;

    public Product() {

    }

    public int getCode() {
        return id;
    }

    public void setCode(int code) {
        this.id = code;
    }


    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }



    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", productName='" + productName + '\'' +
                ", artist='" + artist + '\'' +
                ", genre='" + genre + '\'' +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                ", releaseYear=" + releaseYear +
                ", price=" + price +
                '}';
    }
}
