<%-- 
    Document   : ComplaintStatus
    Created on : 14 Mar, 2018, 11:44:30 AM
    Author     : win7u
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint Status</title>
    </head>
    
    <body>
        
    
        <form>
            <table align="center" border="1">
                
                <tr>
                    <td>Sl.No</td>
                   
                    <td>Department</td>
                    <td>Complaint Type</td>
                    <td>Description</td>
                    
                    <td>Posting Date</td>
                    <td>Status</td>
                     
                </tr>
                <%
               
                int i=1;
                 String selQry="select * from tbl_postcomplaint pc inner join tbl_departmenttype dt inner join tbl_complainttype ct on pc.complainttype_id=ct.complainttype_id where pc.departmenttype_id=dt.departmenttype_id and user_id='"+ session.getAttribute("user")+"'";
            ResultSet rs4=obj.selectData(selQry);
            while(rs4.next())
                {
                   String status="";
                    %>
                    
                    <tr>
                        <td><%=i%></td>
                        
                        <td><%=rs4.getString("departmenttype_name")%></td>
                        <td><%=rs4.getString("complainttype_name")%></td>
                        <td><%=rs4.getString("complaint_desc")%></td>
                     
                      <td><%=rs4.getString("post_date")%></td>
                      <%
                            status=rs4.getString("status");
                            if(status.equals("1"))
                            {
                                %>
                                <td>Accepted</td>
                                <%
                            }
                            else if(status.equals("2"))
                            {
                                %>
                                <td>Rejected</td>
                                <%
                            }
                            else
                            {
                                %>
                                
                                
                                <td>Under Processing</td>
                                <%
                            }
                                
                    i++;
                }
            %>
            </table>
        </form>
       
    </body>
</html>
