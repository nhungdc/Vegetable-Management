/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.UserDAO;
import dtos.UserDTO;
import dtos.UserError;
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
@WebServlet(name = "CreateUserController", urlPatterns = {"/CreateUserController"})
public class CreateUserController extends HttpServlet {

    private static final String ERROR = "createUser.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        UserError userError = new UserError();
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            //check validation
            boolean check = true;
            if (userID.length() < 2 || userID.length() > 10) {
                userError.setUserID("UserID must be in [2,10]");
                check = false;
            }
            if (fullName.length() < 5 || fullName.length() > 50) {
                userError.setFullName("Full Name must be in [5,50]");
                check = false;
            }
            if (password.length() < 1 || password.length() > 50) {
                userError.setPassword("Password must be in [1,50]");
                check = false;
            }
            if (!confirm.equals(password)) {
                userError.setConfirm("Don't match!");
                check = false;
            }
            if (phone.length() > 15 || phone.length() < 9 || !phone.matches("\\b\\d+\\b")) {
                userError.setPhone("Please input just in 9 to 15 digits");
                check = false;
            }
            if (address.length() > 200) {
                userError.setAddress("Invalid address");
                check = false;
            }
            // kiem ta trung userID
            if (check) {
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO(userID, fullName, password, phone, address, "US", true);
                UserDTO checkUser = dao.getUserInfo(userID);
                if (checkUser != null) {
                    userError.setUserID("Duplitcate userID !");
                    request.setAttribute("USER_ERROR", userError);
                    check = false;
                } else {
                    boolean checkInsert = dao.insert(user);
                    if(checkInsert){
                        url=SUCCESS;
                    }
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
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
