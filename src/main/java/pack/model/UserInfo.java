package pack.model;

import pack.entity.User;

public class UserInfo {

    public String firstname;
    public String surname;
    public String address;
    public String email;
    public String phone;

    private boolean valid;

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public UserInfo() {

    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public UserInfo(User user) {
        this.firstname = user.getFirstname();
        this.address = user.getAddress();
        this.email = user.getEmail();
        this.phone = user.getPhone();
    }

    public UserInfo(String firstname, String surname, String address, String email, String phone) {
        this.firstname = firstname;
        this.surname = surname;
        this.address = address;
        this.email = email;
        this.phone = phone;
    }
}


