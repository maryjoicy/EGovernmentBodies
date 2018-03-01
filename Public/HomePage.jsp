<%-- 
    Document   : HomePage
    Created on : 21 Feb, 2018, 10:48:20 AM
    Author     : win7u
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User HomePage</title>
    </head>
    <body>
        <form name="frmuser">
            <%
                String sel="select user_name from tbl_user where user_id='"+session.getAttribute("user")+"'";
                ResultSet rs=obj.selectData(sel);
                if(rs.next())
                {
                    %>
                    <h1 align="center">Welcome <%=rs.getString("user_name")%></h1>
                    <%
                }
            %>
            <h4 align="center"><a href="ViewProfile.jsp">View Profile</a></h4>
            <h4 align="center"><a href="EditProfile.jsp">Edit Profile</a></h4>
            <h4 align="center"><a href="ChangePass.jsp">Change Password</a></h4>
            <h4 align="center"><a href="UsercomplaintReg.jsp">Complaint Registration</a></h4>
             
       
            </form>
    </body>
</html>
