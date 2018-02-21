<%-- 
    Document   : Department
    Created on : 14 Feb, 2018, 2:11:58 PM
    Author     : win7u
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department</title>
    </head>
    <body>
        <%
        
            String DeptID="";
            String GovernBodyTypeID="";
            String DeptTypeID="";
            String DistID="";
            String LogID="";
            String DeptName="";
            String DeptUserName="";
            String DeptPassword="";
            String DeptAddress="";
            String DeptPhone="";
            String DeptEmail="";
            
            if (request.getParameter("did")!=null)
            {
                String del="delete from tbl_department where department_id='"+request.getParameter("did")+"'";
                obj.ExecuteCommand(del);
            }
            if(request.getParameter("btnsubmit")!=null)
            {
                
                DeptName=request.getParameter("txtcomplname");
                DeptPassword=request.getParameter("txtcomppass");
                GovernBodyTypeID=request.getParameter("governbodies");
                DeptTypeID=request.getParameter("depart");
                 DistID=request.getParameter("dist");
                DeptAddress=request.getParameter("txtaddress");
                DeptPhone=request.getParameter("txtphone");
                DeptEmail=request.getParameter("txtemail");
                
                String insQry="insert into tbl_login(login_name,login_password,usertype)values('"+DeptUserName+"','"+DeptPassword+"','pwd')"; 
                boolean b1=obj.ExecuteCommand(insQry);
                
                String sel="select max(login_id) as login from tbl_login";
                ResultSet rs=obj.selectData(sel);
                if (rs.next())
                {
                    LogID=rs.getString("login");
                }
                String insQry1="insert into tbl_department(goverbodiestype_id,departmenttype_id,district_id,department_name,department_address,department_phone,department_email,login_id) values('"+GovernBodyTypeID+"','"+DeptTypeID+"','"+DistID+"','"+DeptName+"','"+DeptAddress+"','"+DeptPhone+"','"+DeptEmail+"','"+LogID+"')";
                boolean b2=obj.ExecuteCommand(insQry1);
                 if(b1){
                     response.sendRedirect("Department.jsp");
                     
                 }else{
                     out.println(insQry1);
                     
                 }
             }
            
        %>
      
        <h1 align="center">Department</h1>
        <form name="frmdepartment">
            <table align ="center">
                <tr>
                    <th> Name:</th>
                    <td><input type="text" value="" required="" name="txtcomplname" placeholder="enter the name"></td>
                </tr>
                
                <tr>
                        <th> Username:</th>
                        <td><input type="text" value="" required="" name="txtgvernbodyname"></td> 
                    </tr>
                <tr>
                    <th> Password: </th>
                    <td><input type="password" name="txtcomppass"></td>
                </tr>
                <tr>
                    <th>Government Body:</th>
                    <td> <select name="governbodies">
                            <option value="g">--select--</option>
                            <%
                                String g ="select * from tbl_goverbodiestype";
                                ResultSet rs1 = obj.selectData(g);
                               while (rs1.next())
                               {
                            %>
                               <option value="<%=rs1.getString("goverbodiestype_id")%>"><%=rs1.getString("goverbodiestype_name")%></option>
                               <%
                               }
                                %>
                        </select></td></tr>
                <tr>
                    <th>Department: </th>
                    <td><select name="depart">
                            <option value="d">--select--</option>
                            <%
                               String d="select * from tbl_departmenttype";
                               ResultSet rs2 = obj.selectData(d);
                               while (rs2.next())
                               {
                               %>
                               <option value="<%=rs2.getString("departmenttype_id")%>"><%=rs2.getString("departmenttype_name")%></option>
                               <%
                               }
                                 %>
                        </select></td></tr>
                    
                <tr>
                    <th>District:</th>
                            <td> <select name="dist">
                   
                                <option value="di">--select--</option>
                                <%
             String di="select * from tbl_district";
             ResultSet rs3=obj.selectData(di);
             while(rs3.next())
             {
                 %>
                 <option value="<%=rs3.getString("district_id")%>">
                     <%=rs3.getString("district_name")%></option>
                 <%
             }
           
                              %>
                        </select></td>
                </tr>
                <tr>
                    <th>Address: </th>
                    <td><textarea name="txtaddress"></textarea></td>
                </tr>
                <tr>
                    <th>Phone:</th>
                    <td><input type="text" name="txtphone"></td>    
                </tr>
                <tr>
                    <th>Email:</th>
                    <td><input type="text" name="txtemail"></td>
                </tr>
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
                                <th>Name:</th>
                                 
                                  <th>
                                    Government Body:
                                   
                                </th>
                                 <th>
                                    Department:
                                   
                                </th>
                                <th>
                                    District:
                                   
                                </th>
                                <th>
                                    Address:
                                   
                                </th>
                               
                                <th>
                                    Phone:
                                   
                                </th><th>
                                    Email:</th>
                                   </tr>
                            
                <%
                String DepartId="";
                int i=1;
                String selQry="select * from tbl_department d inner join tbl_goverbodiestype g on d.goverbodiestype_id=g.goverbodiestype_id inner join tbl_departmenttype dt on d.departmenttype_id=dt.departmenttype_id inner join tbl_district di on d.district_id=di.district_id";
                ResultSet rs4 =obj.selectData(selQry);
                while(rs4.next())
                {
                    DepartId=rs4.getString("department_id");
                    %>
                    
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs4.getString("department_name")%></td>
                         <td><%=rs4.getString("goverbodiestype_name")%></td>
                        <td><%=rs4.getString("departmenttype_name")%></td>
                        <td><%=rs4.getString("district_name")%></td>
                      <td><%=rs4.getString("department_address")%></td>
                      <td><%=rs4.getString("department_phone")%></td>
                      <td><%=rs4.getString("department_email")%></td>
                        
                    <td><a href="Department.jsp?did=<%=DepartId%>">Delete</a></td>
                  </tr>
                  <%
                    i++;
                }
            %>
                
            </table>
       
    </body>
</html>
