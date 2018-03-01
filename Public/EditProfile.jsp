<%-- 
    Document   : EditProfile
    Created on : 22 Feb, 2018, 11:43:23 AM
    Author     : win7u
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <%
        
            
            String Add="";
            String Phone="";
            String Email="";
            
            String Place="";
            String loginid="";
            String UserName="";
            
            
            
            String addr="";
            String ph="";
            String eml="";
            String dist="";
            String pla="";
            
            String uname="";
            String logid="";
                
                String sel = "select * from tbl_User u inner join tbl_login l on u.login_id=l.login_id where user_id="+session.getAttribute("user");
                ResultSet rs =obj.selectData(sel);
                if (rs.next())
                {
                   
                    ph = rs.getString("user_phone");
                    eml= rs.getString("user_email");
                    addr= rs.getString("user_address");
                    //Dist=rs.getString("district_name");
                    pla =rs.getString("place");
                    uname= rs.getString("login_username");
                    logid=rs.getString("login_id");
                }
            
                  if (request.getParameter("btnsubmit") != null)
            {

                Phone =request.getParameter("txtphone");
                Email =request.getParameter("txtemail");
                Add =request.getParameter("txtadd");
                Place =request.getParameter("txtplace");
                UserName=request.getParameter("txtuname");
                loginid=request.getParameter("hid");
                
                
                    String up="update tbl_user set user_phone='"+Phone+"',user_email='"+Email+"',user_address='"+Add+"',place='"+Place+"' where user_id='"+session.getAttribute("user")+"'";
                   // out.println(up);
                    boolean b=obj.ExecuteCommand(up);
                    if(b)
                    {
//                        response.sendRedirect("EditProfile.jsp");
                    }
                    else
                    {
                        out.println(up);
                    }
               
            
            }
                %>
                <form name="frmDistrict">
          
            <table align="center">
                <tr>
                 <th>Phone</th>
                    <td><input type="text" value="<%=ph%>" name="txtphone" ></td></tr>
                
                <tr><th>email</th>
                    <td><input type="text" value="<%=eml%>" name="txtemail" ></td></tr>
                
                <tr> <th>Address</th>
                    <td><input type="text" value="<%=addr%>" name="txtadd" ></td></tr>
                
                <tr> <th>Place</th>
                    <td><input type="text" value="<%=pla%>" name="txtplace" ></td></tr>
                
                <tr> <th>UserName</th>
                    <td><input type="text" value="<%=uname%>" name="txtuname">
                        
                    <input type="hidden" name="hid" value="<%=logid%>"></td></tr>
                    
                
                
                <tr>
                    <td colspan="2" align ="center">
                        <input type="submit" name="btnsubmit" value="Update">
                        <input type="reset" name="btnreset" value="Cancel">
                    </td>
                </tr>
                
            <tr>
           <a href="HomePage.jsp" >Back</a></tr>
            </table>
        </form>
                   
    </body>
</html>
