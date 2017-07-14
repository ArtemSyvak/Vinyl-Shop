package pack.model;

import pack.entity.Product;

public class ProductInfo {

    private int productId;
    private String productName;
    private String artist;
    private int releaseYear;
    private String genre;
    private String description;
    private String image; //pathToImage
    private double price;


    public ProductInfo() {

    }

    public ProductInfo(Product product) {
        this.productId = product.getId();
        this.productName = product.getProductName();
        this.artist = product.getArtist();
        this.releaseYear = product.getReleaseYear();
        this.genre = product.getGenre();
        this.description = product.getDescription();
        this.image = product.getImage();
        this.price = product.getPrice();
    }


    public ProductInfo(int productId, String productName, String artist, int releaseYear, String genre, String description, String image, double price) {
        this.productId = productId;
        this.productName = productName;
        this.artist = artist;
        this.releaseYear = releaseYear;
        this.genre = genre;
        this.description = description;
        this.image = image;
        this.price = price;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
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

    public int getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
