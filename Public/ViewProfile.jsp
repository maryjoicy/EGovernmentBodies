<%-- 
    Document   : ViewProfile
    Created on : 22 Feb, 2018, 11:43:06 AM
    Author     : win7u
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UserProfileView</title>
    </head>
    <body>
        
         <table align="center" border="1">
        <%
           
            
           String sel="select * from tbl_user u inner join tbl_district d inner join tbl_login l on l.login_id=u.login_id and u.district_id=d.district_id where u.user_id='"+session.getAttribute("user")+"'";
           ResultSet rs = obj.selectData(sel);
           if(rs.next())
           {
        %>
       
       
            <tr>
                <th>Name</th>
                <td><%=rs.getString("user_name")%></td></tr>

            <tr> <th>User Name</th>
            <td><%=rs.getString("login_username")%></td></tr>
            
            
            
            <tr><th>Address</th>
            <td><%=rs.getString("user_address")%></td></tr>
            
            <tr> <th>District</th>
            <td><%=rs.getString("district_name")%></td></tr>
            
            <tr> <th>Place</th> 
            <td><%=rs.getString("place")%></td></tr>
            
            <tr>  <th>Phone</th>
            <td><%=rs.getString("user_phone")%></td></tr>
            
            <tr> <th>Adhar No:</th>
            <td><%=rs.getString("adhar_no")%></td></tr>
            
            <tr> <th>Email:</th>
            <td><%=rs.getString("user_email")%></td></tr>
            <%
            }
              %> 
            <tr>
           <a href="HomePage.jsp" >Back</a></tr>
         </table>
        
    </body>
</html>
