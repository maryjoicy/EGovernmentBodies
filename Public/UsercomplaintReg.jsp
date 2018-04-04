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
        
        <script src="jquery.min.js" type="text/javascript"></script>
        <script>
         function dtype(a)
         {
             $.ajax({url:"UserComGoverBodyAjax.jsp?id=" +a, success: function (result) {
             $("#GB").html(result);              
                  
        }});
         
     }
    
    
        </script>
        
        </script>
        
        <script src="jquery.min.js" type="text/javascript"></script>
        <script>
         function gbstype(a)
         {
             $.ajax({url:"GoverBodySecAjax.jsp?id=" +a, success: function (result) {
             $("#GBS").html(result);              
                  
        }});
         
     }
    
    
        </script>
       
    
    <body>
        
        <h1 align="center"> Please register your complaints..</h1>
      
        <form name="frmcomplaint" action="FileUpload.jsp">
            <table align="center">
                <tr>
                    <td>District</td>
                    <td> <select name="dist" onchange="dtype(this.value)">
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
                    <td>Government Body</td>
                    <td> <select name="governbodies" id="GB" onchange="gbstype(this.value)">
                            <option>--Select--</option>
                            <%
                               String gbody="select * from tbl_goverbodiestype";
                               ResultSet rs22 = obj.selectData(gbody);
                             while (rs22.next())
                               {
                                   
                            %>
                            <option value="<%=rs22.getString("goverbodiestype_id")%>"><%=rs22.getString("goverbodiestype_name")%></option>
                               <%
                               }
                                %>
                        </select></td></tr>
                
                 <tr>
                    <td>Government section</td>
                    <td> <select name="govbdysec" id="GBS">
                            <option>--Select--</option>
                            <%
                               String gbs="select * from tbl_goverbody";
                               ResultSet rs23 = obj.selectData(gbs);
                             while (rs23.next())
                               {
                                   
                            %>
                            <option value="<%=rs23.getString("goverbody_id")%>"><%=rs23.getString("goverbody_name")%></option>
                               <%
                               }
                                %>
                        </select></td></tr>
                
                
                
                <tr>
                    <td>Department</td>
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
                <tr><td>Complaint Type</td>
                    <td><select name="complaint" id="tp">
                            <option>--Select--</option>
                        </select></td></tr>
                
                <tr>
                    <td>Complaints</td>
                <td>
                <textarea  name="txtname" placeholder="Please write your complaints!!" required=""></textarea>
           </td></tr>
           
           
                <tr>
                    <td>Place</td>
                <td>
                    <input type="text"  name="txtplace"  required="">
           </td></tr>
                
                <tr>
                    <td>Location</td>
                <td>
                <textarea  name="txtloc" placeholder="..." required=""></textarea>
           </td></tr>
           
           
           
                                <tr><td colspan="2" align ="center">
                                    <input type ="submit" name="btnsubmit" value="Submit">
                                    <input type="submit" name="btncancel" value="Cancel">
                              </td></tr>  
                                
            </table>
        </form>
       
    </body>
</html>
