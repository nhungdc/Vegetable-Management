<%-- 
    Document   : user
    Created on : Oct 20, 2021, 7:09:40 PM
    Author     : dotro
--%>

<%@page import="dtos.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Product Page</title>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if(loginUser == null || !"US".equals(loginUser.getRoleID())){
                response.sendRedirect("login.jsp");
            }
        %>
        <h1>Hello User: <%= loginUser.getFullName()%></h1>
         <a href="MainController?action=Logout">Logout</a>
         </p>
        <a href="shopping.jsp">Shopping</a>
    </body>
</html>
