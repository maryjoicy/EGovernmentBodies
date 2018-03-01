<%-- 
    Document   : logout
    Created on : 28 Feb, 2018, 1:56:09 PM
    Author     : win7u
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <% session.invalidate(); %>
        
        <% response.sendRedirect("../Public/HomePage.jsp");%>
        
<p>You have been successfully logout</p>
    </body>
</html>
