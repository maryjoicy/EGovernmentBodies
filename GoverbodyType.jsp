<%-- 
    Document   : GoverbodyType
    Created on : 6 Feb, 2018, 10:46:49 PM
    Author     : win7u
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-GoverBodies::GoverBodyType</title>
    </head>
    <body>
        
        <%
            String GoverBodyTypeName="";
            String GoverBodyTypeID="";
            String GBTId="",GBTName="";
            
            if(request.getParameter("editGoverBodyTypeid")!=null)
            {
                String sel="select * from tbl_goverbodiestype where goverbodiestype_id='"+request.getParameter("editGoverBodyTypeid")+"'";
                ResultSet rs=obj.selectData(sel);
                if(rs.next())
                    {
                    GBTId=rs.getString("goverbodiestype_id");
                    GBTName=rs.getString("goverbodiestype_name");
                }
            }
            if(request.getParameter("did")!=null)
            {

              
                String del="delete from tbl_goverbodiestype where goverbodiestype_id='"+request.getParameter("did")+"'";
                obj.ExecuteCommand(del);
            }
             if(request.getParameter("btnsubmit")!=null)
            {
                GoverBodyTypeName=request.getParameter("txtgoverbodytpe");
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_goverbodiestype set goverbodiestype_name='"+GoverBodyTypeName+"' where goverbodiestype_id='"+request.getParameter("hid")+"'";
                   boolean b=obj.ExecuteCommand(up);
                  if(b)
                  {
                    response.sendRedirect("GoverbodyTypsse.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }
                }else{
                    
                    String insQry="insert into tbl_goverbodiestype (goverbodiestype_name)values('"+GoverBodyTypeName+"')";
                out.println(insQry);
                boolean b1=obj.ExecuteCommand(insQry);
                if(b1)
                {
                    response.sendRedirect("GoverbodyType.jsp");
                    
                }
                else
                {
                    out.println(insQry);
                }
                }
            }
            %>
                 <form name="frmGoverbodyType">
                <input type="hidden" value="<%=GBTId%>" name="hid"  >
                <table align="center">
                    <tr>
                        <td>GovernmentBodyName</td>
                        <td><input type="text" value="<%=GBTName%>" name="txtgoverbodytpe" placeholder="Enter government body"></td>
                    </tr>
                            <tr><td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                                  </td>
                            </tr>
                            
                </table>
            </form>
                     <table align="center" border="1">
                <tr>
                    <th> sl.no</th>
                    <th>Government Body</th>
                </tr>
                
                
                
                <%
                    int i=1;
                    String selQry="select * from tbl_goverbodiestype";
                    ResultSet rs=obj.selectData(selQry);
                    while(rs.next())
                    {
                        String goverbodytypeid=rs.getString("goverbodiestype_id");
                %>  
                    <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("goverbodiestype_name")%></td>
                    <td><a href="GoverbodyType.jsp?did=<%=goverbodytypeid%>">Delete</a>
                        <a href="GoverbodyType.jsp?editGoverBodyTypeid=<%=goverbodytypeid%>">Edit</a></td>
                    </tr>
                    <%
                        i++;
                    }
                    %>
            </table>
          
           
    </body>
</html>
