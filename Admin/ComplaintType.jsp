<%-- 
    Document   : ComplaintType
    Created on : 8 Feb, 2018, 10:15:22 AM
    Author     : win7u
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ComplaintType</title>
    </head>
    <body>
        <%
            
            String CompTypeId="";
            String CompTypeName="";
            String CompTypeDesc="";
            String DepartTypeId="";
            
             if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_complainttype where complainttype_id='"+request.getParameter("did")+"'";
                obj.ExecuteCommand(del);
            }
            
            if(request.getParameter("btnsubmit")!=null)
            {
                CompTypeName=request.getParameter("txtcomtype");
                DepartTypeId=request.getParameter("depart");
                CompTypeDesc=request.getParameter("txtdesc");
                
                String insQry="insert into tbl_complainttype(complainttype_name,departmenttype_id,complainttype_desc) values('"+CompTypeName+"','"+DepartTypeId+"','"+CompTypeDesc+"')";
                boolean b1=obj.ExecuteCommand(insQry);
                if (b1){
                        response.sendRedirect("ComplaintType.jsp");

                            }else
                                {
                                    out.println(insQry);
                                }
                
            }
        %>
        <h1 align="center"> Complaint Types</h1>
        <form name="frmcomplaintType">
            <table align="center">
                <tr>
                    <th> Complaint Type:</th>
                    <td><input type="text" value="" required="" name="txtcomtype" placeholder="Enter the complaint"></td>
                </tr>
                <tr> <th> Under which Department:</th>
                            <td> <select name="depart">
                                    <option value="s">---select---</option>
                                    <%
                                        String s="select * from tbl_departmenttype";
                                        ResultSet rs=obj.selectData(s);
                                        while(rs.next())
                                        {
                                            %>
                                            <option value="<%=rs.getString("departmenttype_id")%>"><%=rs.getString("departmenttype_name")%></option>
                                            <%
                                        }
                                        %>
                           
                              </select></td>
                                 </tr>
                                        <tr>
                                            <th>
                                                Complaint Description:</th>
                                            <td> <textarea  required="" name="txtdesc"></textarea></td>
                                            
                                        </tr>
                                        <tr><td colspan="2" align ="center">
                                    <input type ="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                              </td>
                                    </tr>
                                    
                
            </table>
                                        <table align="center" border="1">
            <tr>
                <th> sl.no</th>
                <th>Type of Complaints</th>
                <th>Complaint description</th>
                <th>Department</th>
                
            </tr>
            <%
                int i = 1;
                String selQry = "select * from tbl_complainttype c,tbl_departmenttype d where c.departmenttype_id=d.departmenttype_id";
                ResultSet rs1 = obj.selectData(selQry);
                while (rs1.next()) 
                {
                    String comptypeid = rs1.getString("complainttype_id");
            %>  
            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("complainttype_name")%></td>
                <td><%=rs1.getString("complainttype_desc")%></td>
                <td><%=rs1.getString("departmenttype_name")%></td>
                <td><a href="ComplaintType.jsp?did=<%=comptypeid%>">Delete</a>
            </tr>
            <%
                    i++;
                }
            %>
        </table>
        </form>
    </body>
</html>
