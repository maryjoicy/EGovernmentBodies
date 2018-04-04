<%-- 
    Document   : Quotations
    Created on : 21 Mar, 2018, 11:24:10 AM
    Author     : win7u
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contractors Quotations</title>
    </head>
    <body>
      <form name="frmpending">
            <h1 align ="center"> <font color ="blue">Work Contractors</font></h1>
            <table align="center" border="1">
                
                <tr>
                    <td>Sl.No</td>
                    <td>Name</td>
                    <td>Address</td>
                    <td>Phone</td>
                    <td>District</td>
                    <td>Place</td>
                    <td>Registration Date</td>
                    <td>Adhar Proof</td>
                    <td>Previous Work</td>
                     
                      <td>Place</td>
                      <td>Location</td>
                </tr>
                <%
               
                int i=1;
                String selQry="select distinct contractor_id,contractor_name,contractor_address,phone,reg_date,district_name,place,adharproof,previouswork from tbl_contractor con inner join tbl_district dis on con.district_id=dis.district_id inner join tbl_departmenttype dt on dt.separtmenttype_id=con.departmenttype_id inner join tbl_department dep on dep";
                System.out.println("select"+selQry);
                ResultSet rs4 =obj.selectData(selQry);
                while(rs4.next())
                {
                   
                    %>
                    
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs4.getString("user_name")%></td>
                        <td><%=rs4.getString("departmenttype_name")%></td>
                        <td><%=rs4.getString("complainttype_name")%></td>z
                        <td><%=rs4.getString("complaint_desc")%></td>
                        <td><img style="width: 100px; height: 100px" src="../Public/ComplaintImage/<%=rs4.getString("filename")%>"></td>
                      <td><%=rs4.getString("post_date")%></td>
                      
                      <td><%=rs4.getString("place")%></td>
                      <td><%=rs4.getString("location")%></td>
                     
                        
                    <td><a href="ViewComplaints.jsp?Aid=<%=rs4.getString("postcomplaint_id")%>">Approved</a></td>
                    <td><a href="ViewComplaints.jsp?did=<%=rs4.getString("postcomplaint_id")%>">Reject</a></td></tr>
                    
                 
                  <%
                    i++;
                }
            %>
            </table>
        </form>
    </body>
</html>
