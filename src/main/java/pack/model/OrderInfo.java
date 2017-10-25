package pack.model;

import java.util.Date;
import java.util.List;

public class OrderInfo {


    //Info from Order
    private int orderId;
    private Date orderDate;
    private double amount;

    //Info from User
    private String customerName;
    private String customerSurname;
    private String customerAddress;
    private String customerEmail;
    private String customerPhone;
    private String comment;
    private String payment;

    //Info from product
    List<OrderDetailInfo> details;

    public OrderInfo() {
    }

    public OrderInfo(int orderId, Date orderDate, double amount, String customerName, String customerSurname, String customerAddress, String customerEmail, String customerPhone, String comment, String payment) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.amount = amount;
        this.customerName = customerName;
        this.customerSurname = customerSurname;
        this.customerAddress = customerAddress;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.comment = comment;
        this.payment = payment;
    }

    public String getCustomerSurname() {
        return customerSurname;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setCustomerSurname(String customerSurname) {
        this.customerSurname = customerSurname;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public int getId() {
        return orderId;
    }

    public void setId(int id) {
        this.orderId = id;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public List<OrderDetailInfo> getDetails() {
        return details;
    }

    public void setDetails(List<OrderDetailInfo> details) {
        this.details = details;
    }
}
