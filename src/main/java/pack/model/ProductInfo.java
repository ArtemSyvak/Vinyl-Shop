package pack.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;
import pack.entity.Product;

public class ProductInfo {

    private int code;
    private double price;

    private String productName;
    private String artist;
    private String genre;
    private String description;
    private int releaseYear;

    private Boolean newProduct = false;

    private CommonsMultipartFile fileData;

    public ProductInfo() {
    }

    public ProductInfo(Product product){
        this.code = product.getCode();
        this.productName = product.getProductName();
        this.price = product.getPrice();
        this.artist = product.getArtist();
        this.genre = product.getGenre();
        this.description = product.getDescription();
        this.releaseYear = product.getReleaseYear();
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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

    public Boolean getNewProduct() {
        return newProduct;
    }

    public void setNewProduct(Boolean newProduct) {
        this.newProduct = newProduct;
    }

    public CommonsMultipartFile getFileData() {
        return fileData;
    }

    public void setFileData(CommonsMultipartFile fileData) {
        this.fileData = fileData;
    }
}
