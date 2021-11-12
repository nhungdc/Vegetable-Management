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
public class ProductError {
    private String productID,productName,description,categoryID,image,price,quantity;

    public ProductError(String productID, String productName, String description, String categoryID, String image, String price, String quantity) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.categoryID = categoryID;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
    }

    public ProductError() {
        this.productID = "";
        this.productName = "";
        this.description = "";
        this.categoryID = "";
        this.image = "";
        this.price = "";
        this.quantity = "";
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    
}
