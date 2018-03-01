<%-- 
    Document   : UserRegistration
    Created on : 21 Feb, 2018, 10:50:26 AM
    Author     : win7u
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UserRegistration</title>
    </head>
    <body>
      
        <%
            String UserID="";
            String UserAdd="";
            String UserPhone="";
            String UserEmail="";
            String DistID="";
            String Place="";
            String GoverBodyID="";
            String AdharNo="";
            String LogID="";
            String PuUserName="";
            String PassWord="";
            String UserName="";
            
            if(request.getParameter("btnsubmit")!=null)
            {
                        UserAdd=request.getParameter("txtaddress");
                        UserPhone=request.getParameter("txtphone");
                        UserEmail=request.getParameter("txtemail");
                        DistID=request.getParameter("dist");
                        Place=request.getParameter("txtplace");
                        GoverBodyID=request.getParameter("governbody");
                        AdharNo=request.getParameter("txtadhar");
                        PuUserName=request.getParameter("txtpuname");
                        PassWord=request.getParameter("txtpass");
                        UserName=request.getParameter("txtuname");
                        
                         String insQry ="insert into tbl_login(login_username,login_password,login_usertype) values ('"+UserName+"','"+PassWord+"','public')";
                         boolean b1=obj.ExecuteCommand(insQry);
                         
                         String sel="select max(login_id) as login from tbl_login";
                         ResultSet rs=obj.selectData(sel);
                         if(rs.next())
                         {
                             LogID =rs.getString("login");
                         }
                         String insQry1="insert into tbl_user(user_address,user_phone,user_email,district_id,place,goverbody_id,adhar_no,login_id,user_name)values('"+UserAdd+"','"+UserPhone+"','"+UserEmail+"','"+DistID+"','"+Place+"','"+GoverBodyID+"','"+AdharNo+"','"+LogID+"','"+PuUserName+"')";
                         boolean b2 = obj.ExecuteCommand(insQry1);
                         if(b2){
                             response.sendRedirect("UserRegistration.jsp");
                } else {
                           out.println(insQry1);  
                         }
            }
            
            
                    
        %>
        <h1 align ="center"> UserRegistration</h1>
        <form name="frmuserRegistration">
            <table align="center">
                <tr>
                    <th> Name:</th>
                    <td><input type="text" value="" required="" name="txtpuname" placeholder="enter the name"></td>
                </tr>
                
                <tr>
                        <th> Username:</th>
                        <td><input type="text" value="" required="" name="txtuname"></td> 
                    </tr>
                <tr>
                    <th> Password: </th>
                    <td><input type="password" name="txtpass"></td>
                </tr>
                 <tr>
                    <th>Address: </th>
                    <td><textarea name="txtaddress"></textarea></td>
                </tr>
                 <tr>
                    <th>District:</th>
                            <td> <select name="dist">
                   
                                <option value="di">--select--</option>
                                <%
             String di="select * from tbl_district";
             ResultSet rs1=obj.selectData(di);
             while(rs1.next())
             {
                 %>
                 <option value="<%=rs1.getString("district_id")%>"><%=rs1.getString("district_name")%></option>
                 <%
             }
           
                              %>
                        </select></td>
                </tr>
                <tr>
                    <th>Place:</th>
                    <td><input type="text" name="txtplace"></td>    
                </tr>
                
                <tr>
                    <th>Phone:</th>
                    <td><input type="text" name="txtphone"></td>    
                </tr>
                <tr>
                    <th>Email:</th>
                    <td><input type="text" name="txtemail"></td>
                </tr>
                <tr>
                    <th>Government Body:</th>
                    <td> <select name="governbody">
                            <option value="g">--select--</option>
                            <%
                                String g ="select * from tbl_goverbody";
                                ResultSet rs2 = obj.selectData(g);
                               while (rs2.next())
                               {
                            %>
                               <option value="<%=rs2.getString("goverbody_id")%>"><%=rs2.getString("goverbody_name")%></option>
                               <%
                               }
                                %>
                        </select></td></tr>
                <tr>
                    <th>Adhar No:</th>
                    <td><input type="text" name="txtadhar"></td>
                </tr>
                <tr><td colspan="2" align ="center">
                                    <input type ="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                              </td></tr>
                </table>
                
                   </form>
           
                       
    </body>
</html>
