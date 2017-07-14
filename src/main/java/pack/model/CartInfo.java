package pack.model;

import java.util.ArrayList;
import java.util.List;

public class CartInfo {

    private int orderNum;
    private UserInfo userInfo;
    private final List<CartLineInfo> cartLines = new ArrayList<CartLineInfo>();

    public CartInfo() {
    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    private CartLineInfo findLineByCode(int productId){
        for(CartLineInfo line : this.cartLines){
            int id = line.getProductInfo().getCode();
            if(id==productId)return line;
        }
        return null;
    }

    public void addProduct(ProductInfo productInfo, int quality) {

        CartLineInfo line = this.findLineByCode(productInfo.getCode());

        if (line == null) {
            line = new CartLineInfo();
            line.setQuanity(0);
            line.setProductInfo(productInfo);
            this.cartLines.add(line);
        }
        int newQuanity = line.getQuanity() + quality;
        if (newQuanity <= 0) {
            this.cartLines.remove(line);
        } else {
            line.setQuanity(newQuanity);
        }
    }

    public void validate(){

    }

    public void updateProduct(int code, int quanity){

        CartLineInfo line = this.findLineByCode(code);

        if(line!=null){
            if(quanity<=0){
                this.cartLines.remove(line);
            }else{
                line.setQuanity(quanity);
            }
        }
    }

    public void removeProduct(ProductInfo productInfo){
        CartLineInfo line = this.findLineByCode(productInfo.getCode());
        if(line != null){
            if(this.cartLines.remove(line));
        }
    }

    public boolean isEmpty(){
        return  this.cartLines.isEmpty();
    }

    public boolean isValidCustomer(){
        return this.userInfo != null && this.userInfo.isValid();
    }

    public int getQuantityTotal(){
        int quantity = 0;
        for (CartLineInfo line : this.cartLines){
            quantity += line.getQuanity();
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
                this.updateProduct(line.getProductInfo().getCode(), line.getQuanity());
            }

        }
    }

    public List<CartLineInfo> getCartLines() {
        return cartLines;
    }
}
