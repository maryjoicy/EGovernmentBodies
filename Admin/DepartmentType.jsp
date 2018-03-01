<%-- 
    Document   : DepartmentType
    Created on : 7 Feb, 2018, 10:43:00 AM
    Author     : win7u
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-GoverBodies::DepartmentType</title>
    </head>
    <body>
        
        <%
            String DepartTypeName="";
            String DepartTypeID="";
            String DeptTypeId="",DeptTypeName="";
            
            if(request.getParameter("editdepttypeid")!=null)
            {
                String sel= "select * from tbl_departmenttype where departmenttype_id='"+request.getParameter("editdepttypeid")+"'";
                ResultSet rs =obj.selectData(sel);
                if(rs.next())
                    {
                    DeptTypeId= rs.getString("departmenttype_id");
                    DeptTypeName= rs.getString("departmenttype_name");
                }
            }
            
            
                if(request.getParameter("did")!=null)
            {

              
                String del="delete from tbl_departmenttype where departmenttype_id='"+request.getParameter("did")+"'";
                obj.ExecuteCommand(del);
            }
                
                
             if(request.getParameter("btnsubmit")!=null)
            {
                DepartTypeName=request.getParameter("txtdeparttype");
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_departmenttype set departmenttype_name='"+DepartTypeName+"' where departmenttype_id='"+request.getParameter("hid")+"'";
                   boolean b=obj.ExecuteCommand(up);
                  if(b)
                  {
                    response.sendRedirect("DepartmentType.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }
            }
                
                else{
                    String insQry="insert into tbl_departmenttype(departmenttype_name)values('"+DepartTypeName+"')";
                    out.println(insQry);
                    boolean b1 =obj.ExecuteCommand(insQry);
                    if (b1){
                        response.sendRedirect("DepartmentType.jsp");

                            }else
                                {
                                    out.println(insQry);
                                }
                    }
                }
                %>
                <form name="frmDept">
                    <input type="hidden" value="<%=DeptTypeId%>" name="hid">
                    <table align="center">
                        <tr>
                            <td>Department Name </td>
                            <td><input type="text" value="<%=DeptTypeName%>" name="txtdeparttype" placeholder="enter the department"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" name="btnsubmit" value="submit">
                                <input type="reset" name="btreset" value="Cancel">
                            </td>
                        </tr>
                    </table>
                </form>
                        <table align="center" border="1">
                            <tr>
                                <th>sl.no</th>
                                <th>Department</th>
                            </tr>
                            <%
             int i=1;
             String selQry="Select * from tbl_departmenttype";
             ResultSet rs=obj.selectData(selQry);
             while(rs.next())
             {
                 String deptid = rs.getString("departmenttype_id");
                 %>
                 <tr>
                     <td><%=i%></td>
                     <td><%=rs.getString("departmenttype_name")%></td>
                     <td><a href="DepartmentType.jsp?did=<%=deptid%>">Delete</a>
                     <a href="DepartmentType.jsp?editdepttypeid=<%=deptid%>">Edit</a></td>
                 </tr>
                 <%
                        i++;
                    }
             
                    %>
                          
                        </table>
    </body>

</html>
