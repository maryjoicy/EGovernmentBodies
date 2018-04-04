<%-- 
    Document   : ApprovedComplaints
    Created on : 14 Mar, 2018, 1:50:41 PM
    Author     : win7u
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="frmpending">
            <h1 align ="center"> <font color ="blue">Complaints</font></h1>
            <table align="center" border="1">
                
                <tr>
                    <td>Sl.No</td>
                    <td>Government Body</td>
                     <td>Complaint Type</td>
                    <td>Description</td>
                      <td>File</td>
                     <td>Posting Date</td>
                   <td>Place</td>
                    <td>Location</td>
                   
                     
                      
                   
                   
                    
                      
                      
                </tr>
                <%
               
                int i=1;
                String selQry="select goverbody_name,complaint_desc,post_date,location,filename,place,complainttype_name from tbl_postcomplaint ps inner join tbl_goverbody g on ps.goverbody_id=g.goverbody_id inner join tbl_complainttype ct on ct.complainttype_id=ps.complainttype_id inner join tbl_departmenttype dt on dt.departmenttype_id=ps.departmenttype_id inner join tbl_department dp on dt.departmenttype_id=dp.departmenttype_id inner join tbl_district d on d.district_id=dp.district_id where ps.status=1 and dp.department_id='"+session.getAttribute("dep")+"'";
                ResultSet rs4 =obj.selectData(selQry);
                while(rs4.next())
                {
                   
                    %>
                    
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs4.getString("goverbody_name")%></td>
                        <td><%=rs4.getString("complainttype_name")%></td>
                        <td><%=rs4.getString("complaint_desc")%></td>
                         <td><img style="width: 100px; height: 100px" src="../Public/ComplaintImage/<%=rs4.getString("filename")%>"></td>
                         <td><%=rs4.getString("post_date")%></td>
                       <td><%=rs4.getString("place")%></td>
                        <td><%=rs4.getString("location")%></td>
                        
                        <td><a href="Quotations.jsp">Post Quotation</a></td>
                        
                  <%
                    i++;
                }
            %>
            </table>
        </form>
    </body>
</html>
