package pack.model;

import java.util.ArrayList;
import java.util.List;

public class CartInfo {

    private int orderId;
    private UserInfo userInfo;
    private final List<CartLineInfo> cartLines = new ArrayList<CartLineInfo>();

    public CartInfo() {
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    private CartLineInfo findLineById(int productId){
        for(CartLineInfo line : this.cartLines){
            int id = line.getProductInfo().getProductId();
            if(id==productId)return line;
        }
        return null;
    }

    public void addProduct(ProductInfo productInfo, int quantity) {

        CartLineInfo line = this.findLineById(productInfo.getProductId());

        if (line == null) {
            line = new CartLineInfo();
            line.setQuantity(0);
            line.setProductInfo(productInfo);
            this.cartLines.add(line);
        }
        int newQuantity = line.getQuantity() + quantity;
        if (newQuantity <= 0) {
            this.cartLines.remove(line);
        } else {
            line.setQuantity(newQuantity);
        }
    }

    public void removeProduct(int id){
        CartLineInfo line = this.findLineById(id);
        this.cartLines.remove(line);
    }

    public void validate(){

    }

    public void updateProduct(int productId, int quantity){

        CartLineInfo line = this.findLineById(productId);

        if(line!=null){
            if(quantity<=0){
                this.cartLines.remove(line);
            }else{
                line.setQuantity(quantity);
            }
        }
    }

    public void removeProduct(ProductInfo productInfo){
        CartLineInfo line = this.findLineById(productInfo.getProductId());
        if(line != null){
            if(this.cartLines.remove(line));
        }
    }

    public boolean isValidCustomer(){
        return this.userInfo != null && this.userInfo.isValid();
    }

    public int getQuantityTotal(){
        int quantity = 0;
        for (CartLineInfo line : this.cartLines){
            quantity += line.getQuantity();
        }
        return quantity;
    }

    public double getAmountTotal(){
            double total = 0;
            for(CartLineInfo line : this.cartLines){
                total += line.getAmount();
            }
            return total;
    }

    public void updateQuantity(CartInfo cartForm){
        if(cartForm!=null){
            List<CartLineInfo> lines = cartForm.getCartLines();
            for(CartLineInfo line : lines){
                this.updateProduct(line.getProductInfo().getProductId(), line.getQuantity());
            }

        }
    }

    public List<CartLineInfo> getCartLines() {
        return cartLines;
    }
}
