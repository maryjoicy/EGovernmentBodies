<%-- 
    Document   : Collectors
    Created on : 21 Feb, 2018, 11:01:34 AM
    Author     : win7u
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Collector</title>
    </head>
    <body>
        <%
            String CollID = "";
            String CollName = "";
            String UserName = "";
            String PassWord = "";
            String DistID = "";
            String CollAdd = "";
            String CollPhone = "";
            String CollEmail = "";
            String LogID = "";

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_collector where collector_id='" + request.getParameter("did") + "'";
                boolean b = obj.ExecuteCommand(del);
                if (b) {
                    response.sendRedirect("Collectors.jsp");
                } else {
                    out.println(del);
                }
            }
            if (request.getParameter("btnsubmit") != null) {
                CollName = request.getParameter("txtcollname");
                UserName =request.getParameter("txtuname");
                PassWord =request.getParameter("txtcomppass");
                        
                DistID = request.getParameter("dist");
                CollAdd = request.getParameter("txtaddress");
                CollPhone = request.getParameter("txtphone");
                CollEmail = request.getParameter("txtemail");

                String insQry = "insert into tbl_login(login_username,login_password,login_usertype)values('" + UserName + "','" + PassWord + "','collector')";
                boolean b1 = obj.ExecuteCommand(insQry);

                String sel = "select max(login_id) as login from tbl_login";
                ResultSet rs = obj.selectData(sel);
                if (rs.next()) {
                    LogID = rs.getString("login");
                }
                String insQry1 = "insert into tbl_collector(district_id,collector_name,collector_address,collector_phone,login_id,collector_email) values ('" + DistID + "','" + CollName + "','" + CollAdd + "','" + CollPhone + "','" + LogID + "','" + CollEmail + "')";
                boolean b2 = obj.ExecuteCommand(insQry1);
                if (b2) {
                    response.sendRedirect("Collectors.jsp");
                } else {
                    out.println(insQry1);
                }
            }
        %>
        <h1 align="center">Collector</h1>
        <form name="frmdepartment">
            <table align ="center">
                <tr>
                    <th>District:</th>
                    <td> <select name="dist">

                            <option value="di">--select--</option>
                            <%
                                String di = "select * from tbl_district";
                                ResultSet rs3 = obj.selectData(di);
                                while (rs3.next()) {
                            %>
                            <option value="<%=rs3.getString("district_id")%>"><%=rs3.getString("district_name")%></option>
                            <%
                                }

                            %>
                        </select></td>
                </tr>
                <tr>
                    <th> Name:</th>
                    <td><input type="text" value="" required="" name="txtcollname" placeholder="enter the name"></td>
                </tr>
                
                <tr>
                        <th> Username:</th>
                        <td><input type="text" value="" required="" name="txtuname"></td> 
                    </tr>
                <tr>
                    <th> Password: </th>
                    <td><input type="password" name="txtcomppass"></td>
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

            <table align="center" border="1">
                <tr>
                    <th>
                        sl.no
                    </th>
                    <th>
                        District

                    </th>
                    
                    <th>Name:</th>

                    

                    <th>
                        Address:

                    </th>

                    <th>
                        Phone:

                    </th><th>
                        Email:</th>
                </tr>

                <%  String collectId = "";
                    int i = 1;
                    String selQry = "select * from tbl_collector c inner join tbl_district d on c.district_id=d.district_id";
                    ResultSet rs4 = obj.selectData(selQry);
                    while (rs4.next()) {
                        collectId = rs4.getString("collector_id");
                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=rs4.getString("district_name")%></td>
                    <td><%=rs4.getString("collector_name")%></td>
                    <td><%=rs4.getString("collector_address")%></td>
                    <td><%=rs4.getString("collector_phone")%></td>
                    <td><%=rs4.getString("collector_email")%></td>

                    <td><a href="Collectors.jsp?did=<%=collectId%>">Delete</a></td>
                </tr>
                <%
                        i++;
                    }
                %>

            </table>
        </form>
    </body>
</html>
