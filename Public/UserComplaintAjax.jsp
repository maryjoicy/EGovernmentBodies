<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class="MyDB.DBConnection"></jsp:useBean>

                            <%
                                String a=request.getParameter("id");
                               String com="select * from tbl_complainttype where departmenttype_id='"+a+"'";
                               ResultSet rs2 = obj.selectData(com);
                               while (rs2.next())
                               {
                                   
                               %>
                               <option value="<%=rs2.getString("complainttype_id")%>"><%=rs2.getString("complainttype_name")%></option>
                               
                               <%
                               }
                                 %>