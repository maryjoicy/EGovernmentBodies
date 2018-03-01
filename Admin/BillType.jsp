<%-- 
    Document   : BillType
    Created on : 8 Feb, 2018, 2:46:26 PM
    Author     : win7u
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Type</title>
        
    </head>
    <body>
        
        <%
            String BillId="";
            String BillName="";
            String DepartId="";
            
            if(request.getParameter("btnsubmit")!=null)
            {
                BillName=request.getParameter("txtbilltype");
                DepartId=request.getParameter("bill");
                 String insQry="insert into tbl_billtype(billtype_name,department_id) values('"+BillName+"','"+DepartId+"')";
                 boolean b1=obj.ExecuteCommand(insQry);
                 if(b1){
                     response.sendRedirect("BillType.jsp");
                     
                 }else
                 {
                     out.println(insQry);
                     
                 }
            }
        %>
        <h1 align="center"> Bill Type</h1>
        <form name="frmbilltype">
            <table align="center">
                <tr>
                    <th> Bill Name:</th>
                    <td> <input type="text" value="" required="" name="txtbilltype" placeholder=" enter bill type">
                    </td>
                </tr>
                <tr>
                    <th> Department:</th>
                            <td><select name="bill">
                                    <option value="s">--select--</option>
                      <%
             String s="select * from tbl_billtype";
             ResultSet rs=obj.selectData(s);
             while(rs.next())
             {
                 %>
                 <option value="<%=rs.getString("billtype_id")%>"><%=rs.getString("billtype_name")%></option>
                 <%
             }
             if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_billtype where billtype_id='"+request.getParameter("did")+"'";
                obj.ExecuteCommand(del);
            }
             %>
                        </select></td>
                </tr>
                <tr><td colspan="2" align ="center">
                                    <input type ="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                              </td>
                                    </tr>
            </table>
                        
        </form>
                       <table align="center" border="1">
                            <tr>
                                <th>
                                    sl.no
                                </th>
                                <th>
                                    Bill Type Name:
                                   
                                </th>
                                <th>
                                    Department:
                                </th>
                            </tr>
               <%
               
             int i=1;
              String selQry="select * from tbl_billtype";
              ResultSet rs1 = obj.selectData(selQry);
              while(rs1.next())
              {
                  String BillTypeId=rs1.getString("billtype_id");
                  
                  %>
                  <tr>
                      <td><%=i%></td>
                      <td><%=rs1.getString("billtype_name")%></td>
                      <td><a href="BillType.jsp?=<%=BillTypeId%>">Delete</a></td>
                  </tr>
                  <%
                    i++;
                }
            %>
                       </table>
    </body>
</html>
