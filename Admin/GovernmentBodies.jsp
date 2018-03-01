<%-- 
    Document   : GovernmentBodies
    Created on : 8 Feb, 2018, 9:50:41 AM
    Author     : win7u
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GovernmentBodies</title>
    </head>
    <body>
        <%
             String GovernID="";
             
             String GovernTypeID="";
             String DistID="";
             String DepartID="";
             String LogID="";
             String GovernName="";
             String UserName="";
             String PassWord="";
             String GovernAddress="";
             String GovernPhone="";
             String GovernEmail="";
             
             if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_goverbody where goverbody_id='"+request.getParameter("did")+"'";
                obj.ExecuteCommand(del);
            }
             if (request.getParameter("btnsubmit")!=null)
             {
                 String govtypename="";
                 GovernTypeID=request.getParameter("governbody");
                 String sel="select goverbodiestype_name from tbl_goverbodiestype where goverbodiestype_id="+GovernTypeID;
                 ResultSet rs=obj.selectData(sel);
                 if(rs.next())
                 {
                     govtypename=rs.getString("goverbodiestype_name");
                 }
                 DistID=request.getParameter("dist");
                 
                 GovernName=request.getParameter("txtgvernbodyname");
                 UserName=request.getParameter("txtuname");
                 PassWord=request.getParameter("pwd");
                 GovernAddress=request.getParameter("txtaddress");
                 GovernPhone=request.getParameter("txtnumber");
                 GovernEmail=request.getParameter("txtemail");
                 String insQry="insert into tbl_login(login_username,login_password,login_usertype)values('"+UserName+"','"+PassWord+"','"+govtypename+"')";
                 out.println(insQry);
                 boolean b2=obj.ExecuteCommand(insQry);
                 if(b2)
                 {
                 String sel1="select max(login_id) as login from tbl_login";
                 ResultSet rs1=obj.selectData(sel1);
                 if (rs1.next())
                 {
                     LogID=rs1.getString("login");
                 }
                 
                String insQry1="insert into tbl_goverbody(goverbodytpye_id,district_id,goverbody_address,goverbody_phone,goverbody_name,goverbody_email,login_id) values('"+GovernTypeID+"','"+DistID+"','"+GovernAddress+"','"+GovernPhone+"','"+GovernName+"','"+GovernEmail+"','"+LogID+"')";
                 boolean b1=obj.ExecuteCommand(insQry1);
                 out.println(insQry1);
                 if(b1){
                     response.sendRedirect("GovernmentBodies.jsp");
                     
                 }else
                 {
                     out.println(insQry1);
                     
                 }
                 }
             }
            %>
            <h1 align ="center"> Government Body </h1>
            <form name="frmgovernbody">
                <table align ="center">
                    <tr>
                        <th> Name:</th>
                        <td><input type="text" value="" required="" name="txtgvernbodyname" placeholder="enter the name"></td> 
                    </tr>
                    <tr>
                        <th> Username:</th>
                        <td><input type="text" value="" required="" name="txtuname"></td> 
                    </tr>
                    <tr>
                        <th> Password:</th>
                        <td> <input type="password" name="pwd"></td>
                    </tr>
                   
                    
                    <tr><th> Government Body:</th>
                        <td> <select name="governbody">
                                <option value="g">--select--</option>
                                <%
                                String g="select * from tbl_goverbodiestype";
                                ResultSet rs1=obj.selectData(g);
                                while (rs1.next())
                                {
                                %>
                                <option value="<%=rs1.getString("goverbodiestype_id")%>"><%=rs1.getString("goverbodiestype_name")%></option>
                                <%
                                }
                                %>
                            </select></td></tr>
                    
                   
                    
                    <tr>
                        <th>
                            Address:</th>
                        <td> <textarea name="txtaddress"></textarea></td>
                    </tr>
                    
                    
                    
                    
                    <tr>
                        <th>District:</th>
                        <td><select name="dist">
                                <option value="d">--select--</option>
                                <%
             String d="select * from tbl_district";
             ResultSet rs3=obj.selectData(d);
             while(rs3.next())
             {
                 %>
                 <option value="<%=rs3.getString("district_id")%>">
                     <%=rs3.getString("district_name")%></option>
                 <%
             }
           
                              %>
                            </select></td>
                    </tr>
                    <tr>
                        <th>Phone:</th>
                        <td><input type="text" name="txtnumber"></td>
                    </tr>   
                    <tr>
                        <th>Email:</th>
                        <td><input type="text" name="txtemail"></td>
                    </tr>
                    
                    <tr><td colspan="2" align ="center">
                                    <input type ="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                              </td></tr>
                </table>
                
            </form>
                            <table align="center" border="1">
                            <tr>
                                <th>
                                    sl.no
                                </th>
                                
                                <th>
                                    Name:
                                   
                                </th>
                                <th>
                                    Address:
                                   
                                </th>
                                <th>
                                    Government Body:
                                    
                                   
                                </th>
                                
                                 
                                <th>
                                    District:
                                   
                                </th>
                                <th>
                                    Phone:
                                   
                                </th><th>
                                    Email:</th>
                                   </tr>
                            
               <%
              String GoverbodyId=""; 
             int i=1;
              String selQry="select * from tbl_goverbody g inner join tbl_district d on g.district_id=d.district_id inner join tbl_goverbodiestype gt on g.goverbodytpye_id=gt.goverbodiestype_id";
              ResultSet rs4 = obj.selectData(selQry);
              while(rs4.next())
              {
                  GoverbodyId=rs4.getString("goverbody_id");
                  
                  %>
                  <tr>
                      <td><%=i%></td>
                      <td><%=rs4.getString("goverbody_name")%></td>
                      <td><%=rs4.getString("goverbody_address")%></td>
                      <td><%=rs4.getString("goverbodiestype_name")%></td>
                      <td><%=rs4.getString("district_name")%></td>
                      
                      <td><%=rs4.getString("goverbody_phone")%></td>
                      
                      
                      <td><%=rs4.getString("goverbody_email")%></td>
                      
                      
                     
                      <td><a href="GovernmentBodies.jsp?did=<%=GoverbodyId%>">Delete</a></td>
                  </tr>
                  <%
                    i++;
                }
            %>
                       </table>
    </body>
</html>
