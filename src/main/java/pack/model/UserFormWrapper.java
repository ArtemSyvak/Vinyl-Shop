package pack.model;

import pack.entity.User;

import javax.validation.Valid;

public class UserFormWrapper {
    @Valid
    private User nullUser = new User();

    @Valid
    private OrderInfo orderInfo = new OrderInfo();

    public User getNullUser() {
        return nullUser;
    }

    public void setNullUser(User nullUser) {
        this.nullUser = nullUser;
    }

    public OrderInfo getOrderInfo() {
        return orderInfo;
    }

    public void setOrderInfo(OrderInfo orderInfo) {
        this.orderInfo = orderInfo;
    }
}
