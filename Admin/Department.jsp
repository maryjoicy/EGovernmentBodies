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
           // String GovernBodyTypeID="";
            String DeptTypeID="";
            String DistID="";
            String LogID="";
            String DeptName="";
            String UserName="";
            String PassWord="";
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
                String department="";
                DeptTypeID=request.getParameter("depart");
                String sel="select departmenttype_name from tbl_departmenttype where departmenttype_id="+DeptTypeID;
                ResultSet rs=obj.selectData(sel);
                if (rs.next())
                {
                    department=rs.getString("departmenttype_name");
                }
                DeptName=request.getParameter("txtdeptname");
                UserName=request.getParameter("txtdepartname");
                PassWord=request.getParameter("txtdeptpass");
                //GovernBodyTypeID=request.getParameter("governbodies");
                DeptTypeID=request.getParameter("depart");
                DistID=request.getParameter("dist");
                DeptAddress=request.getParameter("txtaddress");
                DeptPhone=request.getParameter("txtphone");
                DeptEmail=request.getParameter("txtemail");
                
                String insQry="insert into tbl_login(login_username,login_password,login_usertype)values('"+UserName+"','"+PassWord+"','"+department+"')"; 
                boolean b1=obj.ExecuteCommand(insQry);
                if(b1)
                {
                String sel1="select max(login_id) as login from tbl_login";
                ResultSet rs1=obj.selectData(sel1);
                if (rs1.next())
                {
                    LogID=rs1.getString("login");
                }
                String insQry1="insert into tbl_department(departmenttype_id,district_id,department_name,department_address,department_phone,department_email,login_id) values('"+DeptTypeID+"','"+DistID+"','"+DeptName+"','"+DeptAddress+"','"+DeptPhone+"','"+DeptEmail+"','"+LogID+"')";
                boolean b2=obj.ExecuteCommand(insQry1);
                 if(b2){
                     response.sendRedirect("Department.jsp");
                     
                 }else{
                     out.println(insQry1);
                     
                 }
             }
            }
        %>
      
        <h1 align="center">Department</h1>
        <form name="frmdepartment">
            <table align ="center">
                
                <tr>
                    <th>District:</th>
                            <td> <select name="dist">
                   
                                <option value="di">--select--</option>
                                <%
             String di="select * from tbl_district";
             ResultSet rs4=obj.selectData(di);
             while(rs4.next())
             {
                 %>
                 <option value="<%=rs4.getString("district_id")%>">
                     <%=rs4.getString("district_name")%></option>
                 <%
             }
           
                              %>
                        </select></td>
                </tr>
                <tr>
                    <th> Name:</th>
                    <td><input type="text" value="" required="" name="txtdeptname" placeholder="enter the name"></td>
                </tr>
                
                <tr>
                        <th> Username:</th>
                        <td><input type="text" value="" required="" name="txtdepartname"></td> 
                    </tr>
                <tr>
                    <th> Password: </th>
                    <td><input type="password" name="txtdeptpass"></td>
                </tr>
                
                <tr>
                    <th>Department: </th>
                    <td><select name="depart">
                            <option value="d">--select--</option>
                            <%
                               String d="select * from tbl_departmenttype";
                               ResultSet rs3 = obj.selectData(d);
                               while (rs3.next())
                               {
                               %>
                               <option value="<%=rs3.getString("departmenttype_id")%>"><%=rs3.getString("departmenttype_name")%></option>
                               <%
                               }
                                 %>
                        </select></td></tr>
                    
                
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
                                 <th>
                                    District:
                                   
                                </th>
                                <th>Name:</th>
                                 
                                  
                                 <th>
                                    Department:
                                   
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
                String selQry3="select * from tbl_department d inner join tbl_departmenttype dt on d.departmenttype_id=dt.departmenttype_id inner join tbl_district di on d.district_id=di.district_id";
                ResultSet rs5 =obj.selectData(selQry3);
                while(rs5.next())
                {
                    DepartId=rs5.getString("department_id");
                    %>
                    
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs5.getString("district_name")%></td>
                        <td><%=rs5.getString("department_name")%></td>
                        <td><%=rs5.getString("departmenttype_name")%></td>
                      <td><%=rs5.getString("department_address")%></td>
                      <td><%=rs5.getString("department_phone")%></td>
                      <td><%=rs5.getString("department_email")%></td>
                        
                    <td><a href="Department.jsp?did=<%=DepartId%>">Delete</a></td>
                  </tr>
                  <%
                    i++;
                }
            %>
                
            </table>
       
    </body>
</html>
