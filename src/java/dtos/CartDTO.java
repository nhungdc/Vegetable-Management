/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author dotro
 */
public class CartDTO {

    private Map<String, ProductDTO> cart;

    public CartDTO() {
    }

    public CartDTO(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public boolean add(ProductDTO product) {
        boolean check = false;
        try {
            if (cart == null) {
                cart = new HashMap<>();
            }
            if (cart.containsKey(product.getProductID())) {
                int quantity = cart.get(product.getProductID()).getQuantity();
                product.setQuantity(quantity +product.getQuantity());
            }
            cart.put(product.getProductID(), product);
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean delete(String id) {
        boolean check = false;
        try {
            if (cart != null) {
                if (cart.containsKey(id)) {
                    cart.remove(id);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

    public boolean update(String id, ProductDTO product) {
        boolean check = false;
        try {
            if (cart != null) {
                if (cart.containsKey(id)) {
                    this.cart.replace(id, product);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
}
