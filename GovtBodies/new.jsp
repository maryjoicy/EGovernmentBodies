<%-- 
    Document   : new
    Created on : 13 Mar, 2018, 2:07:50 PM
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
        if(request.getParameter("did")!=null)
        {
             
             String SEL="SELECT * from tbl_postcomplaint where postcomplaint_id='" + request.getParameter("did") + "'";
                ResultSet rs=obj.selectData(SEL);
                while(rs.next())
                {
                  a=rs.getString("login_id");
                    
                }
                String del="delete from tbl_login where login_id='" +a+ "'";
                boolean b1 = obj.ExecuteCommand(del);
             
          String delk="delete from tbl_petitioner where pet_id='" + request.getParameter("did") + "'";
          boolean b=obj.ExecuteCommand(delk);
          if(b)
          {
              response.sendRedirect("ApprovePetitioner.jsp");
          }
          else
          {
              out.print(del);
          }
        } 
            %>    
            <td><a href="ApprovePetitioner.jsp?did=<%=rs.getString("pet_id")%>">DELETE</a></td></tr>
    </body>
</html>
