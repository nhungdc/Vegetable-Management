/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dotro
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String LOGOUT = "LogoutController";
    private static final String CREATEUSER = "CreateUserController";
    private static final String CREATEPRODUCT = "CreateProductController";
    private static final String SEARCH = "SearchController";
    private static final String SEARCHPRODUCT = "SearchProductController";
    private static final String UPDATE = "UpdateController";
    private static final String UPDATEPRODUCT = "UpdateProductController";
    private static final String DELETE = "DeleteController";
    private static final String DELETEPRODUCT = "DeleteProductController";
    private static final String ADD_TO_CART = "AddToCartController";
    private static final String VIEW_CART = "viewCart.jsp";
    private static final String EDIT = "EditCartController";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("Logout".equals(action)) {
                url = LOGOUT;
            }else if ("Search".equals(action)) {
                url = SEARCH;
            }else if ("Update".equals(action)) {
                url = UPDATE;
            }else if ("Delete".equals(action)) {
                url = DELETE;
            }else if ("SearchPro".equals(action)) {
                url = SEARCHPRODUCT;
            }else if ("UpdatePro".equals(action)) {
                url = UPDATEPRODUCT;
            }else if ("DeletePro".equals(action)) {
                url = DELETEPRODUCT;
            }else if ("Register".equals(action)) {
                url = CREATEUSER;
            }else if ("AddProduct".equals(action)) {
                url = CREATEPRODUCT;
            }else if ("Add".equals(action)) {
                url = ADD_TO_CART;
            } else if ("View".equals(action)) {
                url = VIEW_CART;
            } else if ("Edit".equals(action)) {
                url = EDIT;
            }else {
                HttpSession session = request.getSession();
                session.setAttribute("ERROR_MESS", "Your function is not available");
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
