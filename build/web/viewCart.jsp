<%-- 
    Document   : viewCart
    Created on : Oct 27, 2021, 8:48:06 AM
    Author     : dotro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dtos.ProductDTO"%>
<%@page import="dtos.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Cart Page</title>
    </head>
    <body>
        <h1>Your selected vegetable:</h1>

        <c:if test="${sessionScope.CART != null}">
            <c:if test="${sessionScope.CART.getCart().size() != 0}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" varStatus="counter" items="${sessionScope.CART.getCart().values()}">
                        <form action="MainController" method="POST">
                            <tr>
                                <td>${counter.count}</td>
                                <td>
                                    ${product.productID}
                                    <input type="hidden" name="id" value="${product.productID}">
                                </td>
                                <td>${product.productName}</td>
                                <td>${product.price}$</td>
                                <td>
                                    <input type="number" name="quantity" value="${product.quantity}">
                                </td>
                                <td>${product.quantity * product.price}$</td>
                                <td>
                                    <input type="submit" name="action" value="Remove">
                                </td>
                                <td>
                                    <input type="submit" name="action" value="Edit">
                                </td>

                            </tr>
                            <c:set var="total" value="${total + product.quantity * product.price}"></c:set>
                            </form>
                    </c:forEach>
                </tbody>
            </table>
                 <h1>Total: ${total}</h1>
        </c:if>
       
    </c:if>


    <c:url var="shopLink" value="shopping.jsp"/>
    <a href="${shopLink}">Add More</a> 
</body>
</html>

