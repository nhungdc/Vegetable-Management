<%-- 
    Document   : createUser
    Created on : Oct 20, 2021, 9:07:15 AM
    Author     : dotro
--%>

<%@page import="dtos.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <%
            UserError errorUser = (UserError) request.getAttribute("USER_ERROR");
            if (errorUser == null) {
                errorUser = new UserError();
            }
        %>
        <form action="MainController" method="POST">
            <div class="container">
                <h1>Register</h1>
                <p>Please fill in this form to create an account.</p>
                <label for="userID"><b>User ID</b></label>
                <input type="text" placeholder="Enter User ID" name="userID" id="userID" required="">
                <%= errorUser.getUserID()%></br>
                <label for="fullName"><b>Full Name</b></label>
                <input type="text" placeholder="Enter full name" name="fullName" id="fullName" required="">
                <%= errorUser.getFullName()%></br>
                <label for="password"><b>Password</b></label>
                <input type="password" placeholder="Password" name="password" id="password" required="">
                <label for="confirm"><b>Confirm</b></label>
                <input type="password" placeholder="Enter confirm password" name="confirm" id="confirm" required="">
                <%= errorUser.getConfirm()%></br>
                <label for="phone"><b>Phone</b></label>
                <input type="text" placeholder="Enter phone" name="phone" id="phone" required="">
                <%= errorUser.getPhone()%></br>
                <label for="address"><b>Address</b></label>
                <input type="text" placeholder="Enter Address" name="address" id="address" required="">
                <%= errorUser.getAddress()%></br>
                <hr>
                <button type="submit" name="action" value="Register" class="registerbtn">Register</button>
            </div>
            <div class="container signin">
                <p>Already have an account? <a href="login.jsp">Sign in</a>.</p>
            </div>
        </form>
    </body>
</html>
