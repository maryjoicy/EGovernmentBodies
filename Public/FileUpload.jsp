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
            String GovBodyId="";
            String Depart="";
            String UserId="";
            String DistId="";
            String Place="";
            String Location="";
            
            String ComSub="";
            String ComDesc="";
            String FileName="";
            
            
            
             if (request.getParameter("btnsubmit") != null)
            {
                
                ComTypeID=request.getParameter("complaint");
                GovBodyId=request.getParameter("govbdysec");
                Depart=request.getParameter("depart");
                //UserId=request.getParameter("txtname");
                DistId=request.getParameter("dist");
                Place=request.getParameter("txtplace");
                Location=request.getParameter("txtloc");
               
                ComDesc=request.getParameter("txtname");
                FileName=request.getParameter("txtfile");
                
            String insQry = "insert into tbl_postcomplaint(complainttype_id,goverbody_id,departmenttype_id,user_id,district_id,place,location,post_date,complaint_desc,filename)values('"+ComTypeID+"','"+GovBodyId+"','"+Depart+"','"+ session.getAttribute("user")+"','"+DistId+"','"+Place+"','"+Location+"',curdate(),'"+ComDesc+"','"+FileName+"')";
                out.println(insQry);
                boolean b1 = obj.ExecuteCommand(insQry);
                if (b1) {
                    response.sendRedirect("FileUpload.jsp");

                } else {
                    out.println(insQry);

                }
                
            }
             
                
        %>
        <form name="frmcomplaint" action="UploadActioncomplaint.jsp" method="post" enctype="multipart/form-data">
             <table align="center">                       <td>File Upload:</td>

                   
                 <tr>
                       <td>
                           <input type="file" name="txtfile">
                   </td>
                   </tr>
                   <tr><td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit">
                                    <input  type="reset" name="btncancel" value="Cancel">
                       </td>
                            </tr>
                </table>
        </form>
</html>
