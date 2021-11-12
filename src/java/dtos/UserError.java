/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author ADMIN
 */
public class UserError {
    private String userID,fullName,password,phone,address,confirm;

    public UserError() {
        this.userID = "";
        this.fullName = "";
        this.password = "";
        this.phone = "";
        this.address = "";
        this.confirm = "";
    }

    public UserError(String userID, String fullName, String password, String phone, String address, String confirm) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.confirm = confirm;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }
    
    
}
