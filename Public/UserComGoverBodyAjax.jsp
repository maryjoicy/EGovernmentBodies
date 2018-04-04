<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class="MyDB.DBConnection"></jsp:useBean>

                            <%
                                String a=request.getParameter("id");
                               String com="select dg.goverbodiestype_id,goverbodiestype_name from tbl_distgoverntype dg inner join tbl_goverbodiestype g on dg.goverbodiestype_id=g.goverbodiestype_id where dg.district_id='"+a+"'";
                               ResultSet rs2 = obj.selectData(com);
                               while (rs2.next())
                               {
                                   
                               %>
                               <option value="<%=rs2.getString("goverbodiestype_id")%>"><%=rs2.getString("goverbodiestype_name")%></option>
                               
                               <%
                               }
                                 %>