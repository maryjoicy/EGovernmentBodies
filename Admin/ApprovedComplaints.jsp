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
                    <td>File</td>
                    <td>Complaint Type</td>
                    <td>Description</td>
                    <td>Government Body</td>
                    <td>District</td>
                    <td>Posting Date</td>
                    <td>Place</td>
                    <td>Location</td>
                </tr>
                <%
               
                int i=1;
                String selQry="select complainttype_name,goverbody_name,departmenttype_name,user_name,district_name,pc.place,location,post_date,complaint_desc,filename from tbl_postcomplaint pc inner join tbl_complainttype com on com.complainttype_id=pc.complainttype_id inner join tbl_goverbody gov on gov.goverbody_id=pc.goverbody_id inner join tbl_departmenttype deptyp on deptyp.departmenttype_id=pc.departmenttype_id inner join tbl_user u on u.user_id=pc.user_id inner join tbl_district dis on dis.district_id=pc.district_id where pc.status=1"; 
                ResultSet rs4 =obj.selectData(selQry);
                while(rs4.next())
                {
                   
                    %>
                    
                    <tr>
                        <td><%=i%></td>
                        <td><img style="width: 100px; height: 100px" src="../Public/ComplaintImage/<%=rs4.getString("filename")%>"></td>
                       <td><%=rs4.getString("complainttype_name")%></td>
                        <td><%=rs4.getString("complaint_desc")%></td>
                        <td><%=rs4.getString("goverbody_name")%></td>
                        <td><%=rs4.getString("district_name")%></td>
                        <td><%=rs4.getString("post_date")%></td>
                        <td><%=rs4.getString("place")%></td>
                        <td><%=rs4.getString("location")%></td>
                     
                        
                   
                    
                 
                  <%
                    i++;
                }
            %>
            </table>
        </form>
    </body>
</html>
