package pack.model;

public class CartLineInfo {

    private ProductInfo productInfo;
    private int quanity;


    public CartLineInfo() {
        this.quanity = 0;
    }

    public ProductInfo getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(ProductInfo productInfo) {
        this.productInfo = productInfo;
    }

    public int getQuanity() {
        return quanity;
    }

    public void setQuanity(int quanity) {
        this.quanity = quanity;
    }
    public double getAmount(){
        return this.productInfo.getPrice() * this.quanity;
    }

}
