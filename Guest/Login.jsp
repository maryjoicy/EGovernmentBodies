<%-- 
    Document   : Login
    Created on : 8 Feb, 2018, 1:20:42 PM
    Author     : win7u
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>    <body>

        <%
            String UserName = "";
            String PassWord = "";
            String LoginType = "";
           
            if (request.getParameter("btnLogin") != null) {
                
                UserName = request.getParameter("txtname");
                PassWord = request.getParameter("txtpassword");
               
               String sel = "select * from tbl_login where login_username='" + UserName + "' and login_password='" + PassWord + "' and login_usertype='Admin'";
                String sel1 = "select * from tbl_collector c inner join tbl_login l on c.login_id=l.login_id where l.login_username='"+UserName+"' and l.login_password='" +PassWord+"' and l.login_usertype='collector'";
                String sel2 = "select * from tbl_goverbody g inner join tbl_login l on g.login_id =l.login_id where l.login_username='" + UserName + "' and l.login_password='" + PassWord + "' and l.login_usertype='Municipality'";
                String sel3= "select * from tbl_goverbody g inner join tbl_login l on g.login_id =l.login_id where l.login_username='" + UserName + "' and l.login_password='" + PassWord + "' and l.login_usertype='Corporation'";
                String sel4 = "select * from tbl_goverbody g inner join tbl_login l on g.login_id =l.login_id where l.login_username='" + UserName + "' and l. login_password='" + PassWord + "' and l.login_usertype='Taluk'";
                String sel5 = "select * from tbl_department d inner join tbl_login l on d.login_id =l.login_id where l.login_username='" + UserName + "' and l.login_password='" + PassWord + "' and l.login_usertype='PWD'";
                String sel6 = "select * from tbl_department d inner join tbl_login l on d.login_id =l.login_id where l.login_username='" + UserName + "' and l.login_password='" + PassWord + "' and l.login_usertype='Electricity Board'";
                String sel7 = "select * from tbl_department d inner join tbl_login l on d.login_id =l.login_id where l.login_username='" + UserName + "' and l.login_password='" + PassWord + "' and l.login_usertype='Water Authority'";
                System.out.println(sel7);
                 String sel8 = "select * from tbl_user u inner join tbl_login l on u.login_id =l.login_id where l.login_username='" + UserName + "' and l.login_password='" + PassWord + "' and l.login_usertype='public' and u.user_status='1'";
               
               
                ResultSet rs = obj.selectData(sel);
                ResultSet rs1 = obj.selectData(sel1);
                ResultSet rs2 = obj.selectData(sel2);
                ResultSet rs3 = obj.selectData(sel3);
                ResultSet rs4 = obj.selectData(sel4);
                ResultSet rs5 = obj.selectData(sel5);
                ResultSet rs6 = obj.selectData(sel6);
                ResultSet rs7 = obj.selectData(sel7);
                 ResultSet rs8 = obj.selectData(sel8);
                
               if (rs.next()) {
                   session.setAttribute("a", rs.getString("login_id")) ;
                    response.sendRedirect("../Admin/HomePage.jsp");
            }
                else 
                if(rs1.next())
                    {
                    session.setAttribute("c", rs1.getString("collector_id"));
                    response.sendRedirect("../Collector/HomePage.jsp");
            }
                else if(rs2.next()){
                    session.setAttribute("gbdy", rs2.getString("goverbody_id"));
                    response.sendRedirect("../GovtBodies/HomePage.jsp");
                }
                  else if(rs3.next()){
                    session.setAttribute("gbdy", rs3.getString("goverbody_id"));
                    
                    response.sendRedirect("../GovtBodies/HomePage.jsp");
                }
                else if(rs4.next()){
                    session.setAttribute("gbdy", rs4.getString("goverbody_id"));
                    
                    response.sendRedirect("../GovtBodies/HomePage.jsp");
                }
                else if(rs5.next()){
                    session.setAttribute("dep", rs5.getString("department_id"));
                    response.sendRedirect("../Department/HomePage.jsp");
                }
                else if(rs6.next()){
                    session.setAttribute("dep", rs6.getString("department_id"));
                    response.sendRedirect("../Department/HomePage.jsp");
                }
                else if(rs7.next()){
                    session.setAttribute("dep", rs7.getString("department_id"));
                    response.sendRedirect("../Department/HomePage.jsp");
                }
                else if(rs8.next()){
                    session.setAttribute("user", rs8.getString("user_id"));
                    response.sendRedirect("../Public/HomePage.jsp");
                }
            }
        %>
        <form name ="frmcustomerlogin" action="Login.jsp" method="post">

            <table align="center">
                <tr > <h1 align="center" style="color:blue">Login</h1></tr>
                <tr>
                    <td>Username:</td>
                    <td> <input type="text" name="txtname" placeholder="Name" required="" value="">
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <input type="password" name="txtpassword" required="" value="">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnLogin" value="Login">
                    </td>
                </tr>
            </table>

        </form>
    </body>
</html>
