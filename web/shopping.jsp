<%-- 
    Document   : shopping
    Created on : Oct 27, 2021, 8:49:55 AM
    Author     : dotro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
    </head>
    <body>
        <h1>Choose your vegetable:</h1>
        
        <form action="MainController" method="POST">
            
            <select name="cmbProduct">
                <option value="N001-Broccoli-P001-30000-100">Broccoli-30000</option>
                <option value="N002-Potato-P001-20000-100">Potato-30000</option>
                <option value="N003-Apple-P003-15000-100">Apple-15000</option>
                <option value="N004-Orange-P003-20000-100">Orange-20000</option>
                <option value="N005-Walnut-P004-40000-100">Walnut-40000</option>
                <option value="N006-Chestnut-P004-40000-100">Chestnut-40000</option>
                <option value="N007-Ganoderma-P002-20000-100">Ganoderma-20000</option>
                <option value="N008-Sweet Potato-P001-15000-100">Sweet Potato-15000</option>
                <option value="N009-Chia Seed-P004-50000-100">Chia Seed-50000</option>
                <option value="N010-Water Spinach-P001-20000-100">Water Spinach-50000</option>
            </select>
            <input type="submit" name="action" value="Add">
            <input type="submit" name="action" value="View">
        </form>
        ${requestScope.MESSAGE}
    </body>
</html>
