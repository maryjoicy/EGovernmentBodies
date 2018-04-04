<%-- 
    Document   : GuestUserComplaint
    Created on : 12 Mar, 2018, 10:35:15 AM
    Author     : win7u
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guest User Complaint Reg</title>
    </head>
    <script src="jquery.min.js" type="text/javascript"></script>
        <script>
         function ctype(a)
         {
             $.ajax({url:"UserComplaintAjax.jsp?id=" +a, success: function (result) {
             $("#tp").html(result);              
                  
        }});
         
     }
    
    
        </script>
       
    <body>
         <h1 align="center"> Please register your complaints..</h1>
      
        <form name="frmcomplaint" action="FileUpload.jsp">
            <table align="center">
                
                <tr>
                    <th>Government Body:</th>
                    <td> <select name="governbodies">
                            <option value="g">--select--</option>
                            <%
                                String g ="select * from tbl_goverbodiestype";
                                ResultSet rs = obj.selectData(g);
                               while (rs.next())
                               {
                                   
                            %>
                            <option value="<%=rs.getString("goverbodiestype_id")%>"><%=rs.getString("goverbodiestype_name")%></option>
                               <%
                               }
                                %>
                        </select></td></tr>
                <tr>
                    <th>Department:</th>
                    <td><select name="depart" onchange="ctype(this.value)">
                            <option>--select--</option>
                            <%
                               String d="select * from tbl_departmenttype";
                               ResultSet rs1 = obj.selectData(d);
                               while (rs1.next())
                               {
                                  
                               %>
                               <option value="<%=rs1.getString("departmenttype_id")%>"><%=rs1.getString("departmenttype_name")%></option>
                               <%
                               }
                                 %>
                        </select></td>
                        
                </tr>
                <tr><th>Complaint Type</th>
                    <td><select name="complaint" id="tp">
                            <option>--Select--</option>
                        </select></td></tr>
                
                <tr>
                    <th>Complaints:</th>
                <td>
                <textarea  name="txtname" placeholder="Please write your complaints!!" required=""></textarea>
           </td></tr>
           <tr>
                    <th>District:</th>
                    <td> <select name="dist">
                            <option value="dis">--select--</option>
                            <%
                                String dis ="select * from tbl_district";
                                ResultSet rs2 = obj.selectData(dis);
                               while (rs2.next())
                               {
                                   
                            %>
                            <option value="<%=rs2.getString("district_id")%>"><%=rs2.getString("district_name")%></option>
                               <%
                               }
                                %>
                        </select></td></tr>
           
                <tr>
                    <th>Place:</th>
                <td>
                    <input type="text"  name="txtname"  required="">
           </td></tr>
                
                <tr>
                    <th>Location:</th>
                <td>
                <textarea  name="txtname" placeholder="..." required=""></textarea>
           </td></tr>
           
            <tr>
                <th>Date:</th>
                <td><input type="date" name="undate"> </td>
            </tr>
           
                                <tr><td colspan="2" align ="center">
                                    <input type ="submit" name="btnsubmit" value="Submit">
                                    <input type="submit" name="btncancel" value="Cancel">
                              </td></tr>            
            </table>
        </form>
    </body>
</html>
