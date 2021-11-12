/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class ProductDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    
    public List<ProductDTO> getListVegetableByName(String search) throws SQLException {
        List<ProductDTO> proList = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT productID,productName,categoryID,price,quantity,statusID,image FROM TblProduct WHERE productName LIKE ? AND statusID=1";
                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + search + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String categoryID = rs.getString("categoryID");
                    String image = rs.getString("image");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    boolean status = rs.getBoolean("statusID");

                    proList.add(new ProductDTO(productID, productName, categoryID, image, price, quantity, status));
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return proList;
    }
    
    public boolean updateProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE TblProduct "
                        + " SET productName = ?, price = ?, quantity = ?, description = ? "
                        + " WHERE productID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, product.getProductName());
                ps.setFloat(2, product.getPrice());
                ps.setInt(3, product.getQuantity());
                ps.setString(4, product.getProductID());
                check = ps.executeUpdate() == 0 ? false : true;
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean deleteProduct(String productID) throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE TblProduct SET statusID = 0 WHERE productID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, productID);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean InsertProduct(ProductDTO product) throws SQLException {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO TblProduct(productID,productName,categoryID,price,quantity,statusID,image) "
                        + "VALUES (?,?,?,?,?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, product.getProductID());
                ps.setString(2, product.getProductName());
                ps.setString(3, product.getCategoryID());
                ps.setFloat(4, product.getPrice());
                ps.setInt(5, product.getQuantity());
                ps.setBoolean(6, product.isStatus());
                ps.setString(7, product.getImage());
                result = ps.executeUpdate() == 0 ? false : true;
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public String checkCategoryID(String categoryID) throws SQLException {
ProductDTO pro=null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT categoryID FROM TblCategory WHERE categoryID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, categoryID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String cate=rs.getString("categoryID");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            closeConnection();
        }
        return "";
    }
    
    public boolean checkProductID(String productID) throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT productID FROM TblProduct WHERE productID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, productID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }
        return check;
    }
    
}
