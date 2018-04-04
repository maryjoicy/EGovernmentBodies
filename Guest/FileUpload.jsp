<%-- 
    Document   : FileUpload
    Created on : 28 Feb, 2018, 12:29:35 PM
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
            String PostComID="";
            String ComTypeID="";
            String UserId="";
            String PostDate="";
            String ComSub="";
            String ComDesc="";
            String FileName="";
            
            
            
             if (request.getParameter("btnsubmit") != null)
            {
                
                ComTypeID=request.getParameter("complaint");
                //UserId=request.getParameter("txtname");
                PostDate=request.getParameter("undate");
                ComSub=request.getParameter("complaint");
                ComDesc=request.getParameter("txtname");
                FileName=request.getParameter("txtfile");
                
            String insQry = "insert into tbl_postcomplaint(complainttype_id,user_id,post_date,complaint_subject,complaint_desc,filename)values('"+ComTypeID+"','"+ session.getAttribute("user")+"','"+PostDate+"','"+ComSub+"','"+ComDesc+"','"+FileName+"')";
                out.println(insQry);
                boolean b1 = obj.ExecuteCommand(insQry);
                if (b1) {
                    response.sendRedirect("FileUpload.jsp");

                } else {
                    out.println(insQry);

                }
                
            }
             
                
        %>
       <form name="frmcomplaint" action="UsercomplaintReg.jsp" method="post" enctype="multipart/form-data">
             <table align="center">
                   
                 <tr>
                       <td>File Upload:</td>
                       <td>
                           <input type="file" name="txtfile">
                   </td>
                   </tr>
                   <tr><td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit">
                                     <input  formaction="UsercomplaintReg.jsp" type="submit" name="btncancel" value="Cancel">
                       </td>
                            </tr>
                </table>
        </form>
</html>
