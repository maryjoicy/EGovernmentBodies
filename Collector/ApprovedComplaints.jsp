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
                String selQry="select place,location,post_date,complaint_desc,filename,goverbody_name,complainttype_name from tbl_goverbody g inner join tbl_postcomplaint p inner join tbl_complainttype ct inner join tbl_collector c on g.goverbody_id=p.goverbody_id and p.complainttype_id=ct.complainttype_id and c.district_id=p.district_id and c.collector_id='"+session.getAttribute("c")+"' and p.status=1";
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
                     
                        
                   
                    
                 
                  <%
                    i++;
                }
            %>
            </table>
        </form>
    </body>
</html>
