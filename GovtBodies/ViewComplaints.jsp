<%-- 
    Document   : ViewComplaints
    Created on : 12 Mar, 2018, 11:08:13 AM
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
        <%
            String a="";
            if (request.getParameter("Aid") != null)
            {
                    String upApprove="update tbl_postcomplaint set status=1 where postcomplaint_id='"+request.getParameter("Aid")+"'";
                    boolean b=obj.ExecuteCommand(upApprove);
                    if(b)
                    {
                        %>
                        <script type="text/javascript">
                        alert("Approved Successfully..");
                        setTimeout(function() {
                        window.location.href = 'ViewComplaints.jsp'
                                }, 100);
                     </script><%
                    }
                    else
                    {
                        out.println(upApprove);
                    }
            }
        if(request.getParameter("did")!=null)
        {
             
              String upApprove="update tbl_postcomplaint set status=2 where postcomplaint_id='"+request.getParameter("did")+"'";
                    boolean b=obj.ExecuteCommand(upApprove);
                    if(b)
                    {
                        %>
                        <script type="text/javascript">
                        alert("Removed Successfully..");
                        setTimeout(function() {
                        window.location.href = 'ViewComplaints.jsp'
                                }, 100);
                     </script><%
                    }
                    else
                    {
                        out.println(upApprove);
                    }
          
        } 
       %>
       
        <form name="frmpending">
            <h1 align ="center"> <font color ="blue">Complaints</font></h1>
            <table align="center" border="1">
                
                <tr>
                    <td>Sl.No</td>
                    <td>Complaint person</td>
                    <td>Department</td>
                    <td>Complaint Type</td>
                    <td>Description</td>
                    <td>File</td>
                    <td>Posting Date</td>
                     
                      <td>Place</td>
                      <td>Location</td>
                </tr>
                <%
               
                int i=1;
                String selQry="select distinct postcomplaint_id,complainttype_name,user_name,departmenttype_name,complaint_desc,location,p.place,post_date,filename,goverbody_name from tbl_postcomplaint p inner join tbl_complainttype c on p.complainttype_id=c.complainttype_id inner join tbl_user u on u.user_id=p.user_id inner join tbl_departmenttype dt on p.departmenttype_id=dt.departmenttype_id inner join tbl_goverbody gb on p.goverbody_id=gb.goverbody_id where status=0 and p.goverbody_id='"+session.getAttribute("gbdy")+"'";
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
