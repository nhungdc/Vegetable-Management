/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.ProductDAO;
import dtos.ProductDTO;
import dtos.ProductError;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dotro
 */
@WebServlet(name = "CreateProductController", urlPatterns = {"/CreateProductController"})
public class CreateProductController extends HttpServlet {

    private static final String ERROR = "addProduct.jsp";
    private static final String SUCCESS = "admin.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            float price = Float.parseFloat(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String categoryID = request.getParameter("categoryID");
            String imgURL = request.getParameter("imageLink");
            ProductError error = new ProductError();
            ProductDAO dao = new ProductDAO();
            boolean check = true;
            if (productID.length() < 2 || productID.length() > 10 || !productID.toUpperCase().matches("N\\d{3}")) {
                error.setProductID("Invalid ID !");
                check = false;
            }
            
            if (productName.length() < 3 || productName.length() > 50) {
                error.setProductID("Invalid Name length not higher than 10");
                check = false;
            }
            if (price < 0) {
                error.setPrice("Vegetable price must > 0");
                check = false;
            }

            if (quantity < 0) {
                error.setQuantity("Quantity must > 0");
                check = false;
            }

            String cateCheck = dao.checkCategoryID(categoryID);
            if (cateCheck.equalsIgnoreCase(categoryID.toUpperCase())) {
                error.setCategoryID("Does not match the database");
                check = false;
            }
            
            if (check) {
                boolean checkDup = dao.checkProductID(productID);
                ProductDTO dto = new ProductDTO(productID.toUpperCase(), productName, categoryID.toUpperCase(), imgURL, price, quantity, true);
                if (checkDup) {
                    error.setProductID(productID + " has already!");
                    request.setAttribute("Product_Error", error);
                } else {
                    boolean ins = dao.InsertProduct(dto);
                    if (ins) {
                        url = SUCCESS;
                    }
                }
            } else {
                request.setAttribute("Product_Error", error);
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
