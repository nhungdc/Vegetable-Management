<%-- 
    Document   : admin
    Created on : Oct 20, 2021, 9:06:00 AM
    Author     : dotro
--%>

<%@page import="dtos.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="dtos.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <div class="container-x1">
            <h1>Welcome Admin: <%=loginUser.getFullName()%></h1>
            <form action="MainController" method="POST">
                <input type="submit" name="action" value="Logout">
            </form>
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-8"><h2>User <b>Details</b></h2></div>
                            <div class="col-sm-4">
                                <form action="MainController" method="POST">
                                    <input type="text" name="search" value="<%=search%>"/>
                                    <input type="submit" name="action" value="Search"/>
                                </form>
                            </div>
                        </div>     
                    </div>
                    <%
                        List<UserDTO> list = (List<UserDTO>) request.getAttribute("LIST_USER");
                        if (list != null) {
                    %>
                    <table border="1" class="table table-striped">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>ID</th>
                                <th>Full Name</th>
                                <th>Password</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int count = 1;
                                for (UserDTO user : list) {
                            %>
                        <form action="MainController">
                            <tr>
                                <td><%= count++%></td>
                                <td><%= user.getUserID()%></td>
                                <td><input type="text" name="fullName" value="<%= user.getFullName()%>"/></td>
                                <td><%= user.getPassword()%></td>
                                <td><input type="text" name="phone" value="<%= user.getPhone()%>"/></td>
                                <td><input type="text" name="address" value="<%= user.getAddress()%>"/></td>
                                <td>
                                    <input type="hidden" name="userID" value="<%= user.getUserID()%>"/>
                                    <input type="hidden" name="search" value="<%= search%>"/>
                                    <input type="submit" name="action" value="Update"/>
                                </td>
                                <td>
                                    <a href="MainController?search=<%= search%>&action=Delete&userID=<%= user.getUserID()%>">Delete</a>
                                </td>
                            </tr>
                        </form>
                        </tbody>
                        <%
                            }
                        %>
                    </table>
                    <% }%>
                </div>
            </div>
        </div>
        <div class="container-lg">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-8"><h2>Product <b>Details</b></h2></div>
                            <div class="col-sm-4">
                                <form action="MainController">
                                    Search Vegetable by name<input type="text" name="search_pro" placeholder="Search"/>
                                    <button name="action" value ="SearchPro" class="button">Search</button>
                                </form>                                                                                     
                            </div>
                        </div>
                    </div>
                    <%
                        List<ProductDTO> listPro = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
                        if (listPro != null) {
                    %>
                    <table border="1" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Product ID</th>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Image</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int count = 1;
                                for (ProductDTO product : listPro) {
                            %>
                        <form action="MainController">
                            <tr>
                                <td><%=count++%></td>
                                <td>
                                    <%= product.getProductID()%>
                                </td>
                                <td>
                                    <input type="text" name="productName" value="<%= product.getProductName()%>"/>
                                </td>
                                <td>
                                    <%= product.getCategoryID()%>
                                </td>
                                <td>
                                    <input type="text" name="price" value="<%= product.getPrice()%>"/>
                                </td>
                                <td>
                                    <input type="text" name="quantity" value="<%= product.getQuantity()%>" id="quantity"/>
                                </td>
                                <td>
                                    <img src="<%= product.getImage()%>" width="100">
                                </td>
                                <td>
                                    <input type="hidden" name="productID" value="<%= product.getProductID()%>"/>
                                    <input type="hidden" name="search" value="<%= search%>"/>
                                    <button name="action" value ="UpdatePro" class="button">Update</button>
                                </td>
                                <td>
                                    <a href="MainController?search=<%= search%>&action=DeletePro&productID=<%= product.getProductID()%>">Delete</a>
                                </td>
                            </tr> 
                        </form>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                    <%}%>
                </div>
                <form action="MainController">
                    <a href="addProduct.jsp" target="_blank">Add New Product</a>
                </form>
            </div>
        </div>
    </body>
</html>
