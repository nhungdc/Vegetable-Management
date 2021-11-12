<%-- 
    Document   : login
    Created on : Oct 20, 2021, 9:05:45 AM
    Author     : dotro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <form action="MainController" method="POST">
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>
            <%=error%>
            <h1>Login</h1>
            <div class="container">
                User ID<input type="text" name="userID" placeholder="Enter Username"/></br>
                Password<input type="password" name="password" placeholder="Enter Password"/></br>
                <button type="submit" name="action" value="Login"/>Login</button>
                <input type="reset" value="Reset"/>
            </div>
        </form>
        <p style="color: red">${requestScope.ERROR}<p>
        <a href="createUser.jsp">Create user</a>
        
    </body>
</html>
