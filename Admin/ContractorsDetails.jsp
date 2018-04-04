<%-- 
    Document   : ContractorsDetails
    Created on : 22 Mar, 2018, 12:15:19 PM
    Author     : win7u
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contractors Details</title>
    </head>
    <body>
        <form name="frm_viewlist">
                   <table class="table table-hover" align="center" border="0">
                       <tr>
                           
        <%
          String ContId="";
          String ContName=""; 
          String DeptType="";
          String Add="";
          String Ph="";
          String Dist="";
          String Place="";
          String Status="";
          String AdharProof="";
          String PrevWork="";
          
        
         
          if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_contractor where contractor_id='"+request.getParameter("did")+"'";
                obj.ExecuteCommand(del);
            }
          
            String selQry="select * from tbl_contractor con inner join tbl_departmenttype deptyp on con.departmenttype_id=deptyp.departmenttype_id inner join tbl_district dis on con.district_id=dis.district_id inner join tbl_login l on l.login_id=con.login_id";
            ResultSet rs =obj.selectData(selQry);
            
            int i=0;
            while(rs.next())
            {
                ContId=rs.getString("contractor_id");
                ContName=rs.getString("contractor_name");
                DeptType=rs.getString("departmenttype_name");
                Add=rs.getString("contractor_address");
                Ph=rs.getString("phone");
                Dist=rs.getString("district_name");
                Place=rs.getString("place");
                //Status=rs.getString("construction_caption");
                AdharProof=rs.getString("adharproof");
                PrevWork=rs.getString("previouswork");
                
                
                  %>
                       
                       <tr align="left">
                       <tr>
                           <td>Name:</td> 
                           <td><%=ContName%></td>
                       </tr>
                       
                       <tr>
                           <td>Contraction Section:</td>
                           <td> <%=DeptType%></td>
                       </tr>
                       
                       <tr>
                           <td>Address:</td>
                           <td><%=Add%></td>
                       </tr>
                       
                       <tr>
                           <td>Phone:</td>
                           <td> <%=Ph%></td>
                       </tr>
                       
                       <tr>
                           <td>District:</td>
                           <td><%=Dist%></td>
                       </tr>
                       
                       <tr>
                           <td>Place: </td>
                           <td><%=Place%></td>
                       </tr>
                       
                       <tr>
                           <td>Adhar Proof:</td> 
                           <td><%=AdharProof%></td>
                       </tr>
                       
                       <tr>
                           <td>Previous Work:</td>
                           <td><%=PrevWork%></td>
                       </tr>
                      
           
                       <th><a href="ContractorsDetails.jsp?did=<%=ContId%>">Delete</a></th>
                   
                   <%
                   i++;
                   %>
          <% } 
            
            if(request.getParameter("aid")!=null)
            {
                 
                 response.sendRedirect("ContractorsDetailss.jsp");
            }
        %>
                    
                  
                   
                   </table>
        
        </form>

    </body>
</html>
