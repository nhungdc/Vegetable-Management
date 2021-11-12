<%-- 
    Document   : addProduct
    Created on : Oct 20, 2021, 9:07:42 AM
    Author     : dotro
--%>

<%@page import="dtos.UserDTO"%>
<%@page import="dtos.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Add Product Page</title>
    </head>
    <body>
        <div class="container-lg">
            <div class="row">
                <div class="col-md-10 mx-auto">
                    <div class="contact-form">
                        <h1>Vegetable Information</h1>
                        <p class="hint-text">Please fill out the information completely!</p>       
                        <form action="MainController" method="POST">
                            <%
                                ProductError errorPro = (ProductError) request.getAttribute("Product_Error");
                                if (errorPro == null) {
                                    errorPro = new ProductError();
                                }
                            %>
                            <%
                                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                                    response.sendRedirect("login.jsp");
                                }

                            %>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="inputProductID">Product ID</label>
                                        <input type="text" name="productID" class="form-control" id="inputProductID" required="">
                                        <%= errorPro.getProductID()%></br>
                                    </div>
                                </div>                
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="inputProductName">Name</label>
                                        <input type="text" name="productName"class="form-control" id="inputProductName" required="">
                                        <%= errorPro.getProductName()%></br>
                                    </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="inputPrice">Price</label>
                                        <input type="text" name="price" class="form-control" id="Desc" required="">
                                        <%= errorPro.getPrice()%></br>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="inputQuantity">Quantity</label>
                                        <input type="text" name="quantity" class="form-control" id="inputQuantity" required="">
                                        <%= errorPro.getQuantity()%></br>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>Category</label>
                                        <input type="text" name="categoryID" class="form-control" id="inputCate" requirerd="">
                                        <%= errorPro.getCategoryID()%></br>
                                    </div>
                                </div>
                                
                            </div>            
                            <div class="form-group">
                                <label for="inputLink">Link Image</label>
                                <input type="text" name="imageLink" class="form-control" id="inputLink" rows="5" required=''>
                                <%= errorPro.getImage()%></br>
                            </div>
                            <button type="submit" name="action" value="AddProduct" class="btn btn-primary"><i class="fa fa-paper-plane"></i>Add New</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
    
</html>
