<%-- 
    Document   : DistGovernBodyType
    Created on : 15 Mar, 2018, 11:19:33 AM
    Author     : win7u
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DistGovernBodyType</title>
    </head>
    <body>
        <%
            String DistId="";
            String GovBodyType="";
            
             if (request.getParameter("btnsubmit") != null)
            {
                DistId=request.getParameter("dist");
                GovBodyType=request.getParameter("governbodies");
                
            String insQry="insert into tbl_distgoverntype(district_id,goverbodiestype_id)values('"+DistId+"','"+GovBodyType+"')";
                    out.println(insQry);
                    boolean b1 =obj.ExecuteCommand(insQry);
                    if (b1){
                        response.sendRedirect("DistGovernBodyType.jsp");

                            }else
                                {
                                    out.println(insQry);
                                }
            }
        %>
        <form name="frmDistGovernBodyType">
            <table align="center">
                <tr>
                    <th>District:</th>
                            <td> <select name="dist">
                   
                                <option value="di">--select--</option>
                                <%
             String di="select * from tbl_district";
             ResultSet rs1=obj.selectData(di);
             while(rs1.next())
             {
                 %>
                 <option value="<%=rs1.getString("district_id")%>">
                     <%=rs1.getString("district_name")%></option>
                 <%
             }
           
                              %>
                        </select></td>
                        <tr>
                    <th>Government Body:</th>
                    <td> <select name="governbodies">
                            <option value="g">--select--</option>
                            <%
                                String g ="select * from tbl_goverbodiestype";
                                ResultSet rs2 = obj.selectData(g);
                               while (rs2.next())
                               {
                            %>
                               <option value="<%=rs2.getString("goverbodiestype_id")%>"><%=rs2.getString("goverbodiestype_name")%></option>
                               <%
                               }
                                %>
                        </select></td></tr>
                        
                        <tr><td colspan="2" align ="center">
                                    <input type ="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                              </td></tr>
            </table>
        
                         </form>
                                   <table align="center" border="1">
                            <tr>
                                <th>
                                    sl.no
                                </th>
                                <th>District:</th>
                                 
                                  <th>
                                    Government Body:
                                   
                                </th>
                            </tr>
                            
                            
                <%
                String DistgovBodyType="";
                int i=1;
                String selQry3="select * from tbl_distgoverntype dgt inner join tbl_district dis on dgt.district_id=dis.district_id inner join tbl_goverbodiestype gov on dgt.goverbodiestype_id=gov.goverbodiestype_id;";
                ResultSet rs5 =obj.selectData(selQry3);
                while(rs5.next())
                {
                    DistgovBodyType=rs5.getString("distgoverntype_id");
                    %>
                    
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs5.getString("district_name")%></td>
                         <td><%=rs5.getString("goverbodiestype_name")%></td>
                       
                        
                    <td><a href="DistGovernBodyType.jsp?did=<%=DistgovBodyType%>">Delete</a></td>
                  </tr>
                  <%
                    i++;
                }
            %>
                                   </table>
    </body>
</html>
