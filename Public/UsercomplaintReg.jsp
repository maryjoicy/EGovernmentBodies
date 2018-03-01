<%-- 
    Document   : UsercomplaintReg
    Created on : 22 Feb, 2018, 3:43:27 PM
    Author     : win7u
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Complaint Reg</title>
        
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
        
        <h1 align="center"> Please register your complaints in our site..</h1>
      
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
