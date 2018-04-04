<%-- 
    Document   : ContractorsReg
    Created on : 21 Mar, 2018, 11:26:30 AM
    Author     : win7u
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cntractors Reg</title>
    </head>
    <body>
        <h1 align ="center"> Contractors Registration</h1>
        <form name="frmuserRegistration" action="ContractorRegUpload.jsp" method="post" enctype="multipart/form-data">
            <table align="center">
                <tr>
                    <td> Name:</td>
                    <td><input type="text" value="" required="" name="txtpuname" placeholder="enter the name"></td>
                </tr>
                
                <tr>
                        <td> Username:</td>
                        <td><input type="email" value="" required="" placeholder="Enter the email address" name="email"></td> 
                    </tr>
                <tr>
                    <td> Password: </td>
                    <td><input type="password" name="txtpass"></td>
                </tr>
                 <tr>
                    <td>Address: </td>
                    <td><textarea name="txtaddress"></textarea></td>
                </tr>
                
                 <tr>
                    <td>District:</td>
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
                    <td>Place:</td>
                    <td><input type="text" name="txtplace"></td>    
                </tr>
                
                <tr>
                    <td>Phone:</td>
                    <td><input type="text" name="txtphone"></td>    
                </tr>
                
                <tr>
                    <td>Contracting section:</td>
                    <td><select name="depart" >
                            <option>--select--</option>
                            <%
                               String d="select * from tbl_departmenttype";
                               ResultSet rs2 = obj.selectData(d);
                               while (rs2.next())
                               {
                                  
                               %>
                               <option value="<%=rs2.getString("departmenttype_id")%>"><%=rs2.getString("departmenttype_name")%></option>
                               <%
                               }
                                 %>
                        </select></td>
                    </tr>
                <tr>
                    <td>Adhar Proof:</td>
                    <td><input type="file" name="txtadhar" ></td>
                </tr>
                <tr>
                    <td>Pervious Works:</td>
                    <td><input type="file" name="txtprev"></td>
                </tr>
                <tr><td colspan="2" align ="center">
                                    <input type ="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                                   
                 </td></tr>
                  
            </table>
        </form>
    </body>
</html>
