<%-- 
    Document   : UploadactionTouristInsert
    Created on : Dec 10, 2016, 11:06:11 AM
    Author     : MYcomputerr
--%>


<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<jsp:useBean class="MyDB.DBConnection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String field_name = "";
            FileItem f_item = null;
            String file_name = "";

            File savedFile = null;
            String fn = "";
            String pf="";

            String field[] = new String[20];
            String value[] = new String[20];

//checking if request cotains multipart data
//boolean isMultipart=ServletFileUpload.isMultipartContent(request);
            boolean isMultipart = true;
            if (isMultipart) {

                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                //declaring a list of form fields
                List items_list = null;

                //assigning fields to list 'items_list'
                try {
                    items_list = upload.parseRequest(request);
                } catch (FileUploadException ex) {
                    out.println(ex);
                }

                //declaring iterator
                Iterator itr = items_list.iterator();
                int k = 0, i = 0;
                //iterating through the list 'items_list'
                while (itr.hasNext()) {
                    //typecasting next element in items_list as fileitem
                    f_item = (FileItem) itr.next();

                    //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
                    if (f_item.isFormField()) {

                        //getting fieldname and value
                        field[k] = f_item.getFieldName();
                        value[k] = f_item.getString();
                        System.out.println(k + " " + value[k] + " " + field[k]);
                        k++;
                    } else {
            //f_item=(FileItem)itr.next();

                        file_name = f_item.getName();
                        field_name = f_item.getFieldName();
                        if (field_name.equals("txtadhar")) {
                            // if(field_name.equals("photo"))
                            {
                                String ext = file_name.substring(file_name.lastIndexOf("."));
                                //setting path to store image
                                File proj_path = new File(config.getServletContext().getRealPath("/"));
                                
                                
                                
                                String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\web\\Admin\\adhar\\";
                                Random r = new Random();
                                int r_num = r.nextInt(1111) + 999;
                                
                                fn = "adhar" + r_num + ext;
                               
                                //creating a file object
                                savedFile = new File(file_path + fn);
                                try {
                                    //writing the file object
                                    f_item.write(savedFile);
                                } catch (Exception ex) {
                                    out.println(ex);
                                }
                                 i++;
                            }

                        }

                        
                         if (field_name.equals("txtprev")) {
                            // if(field_name.equals("photo"))
                            {
                                String ext = file_name.substring(file_name.lastIndexOf("."));
                                //setting path to store image
                                File proj_path = new File(config.getServletContext().getRealPath("/"));
                                
                                
                                
                                String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\web\\Admin\\previouswork\\";
                                Random r = new Random();
                                int r_num = r.nextInt(1111) + 999;
                                
                                pf = "preWork" + r_num + ext;
                               
                                //creating a file object
                                savedFile = new File(file_path + pf);
                                try {
                                    //writing the file object
                                    f_item.write(savedFile);

                                } catch (Exception ex) {
                                    out.println(ex);
                                }
                                 i++;
                            }

                        }

                    }

                }
    //Strinh str1="insert into tbl_user ()";
                //String image=request.getParameter("image");
                
                String insQry = "insert into tbl_login(login_username,login_password,login_usertype)values('" +value[1]+ "','" +value[2]+ "','contractors')";
                boolean b1 = obj.ExecuteCommand(insQry);
                if (b1)
                {
                    String loginid="";
                     String sel = "select max(login_id) as login from tbl_login";
                ResultSet rs = obj.selectData(sel);
                if (rs.next()) {
                    loginid = rs.getString("login");
                }
                String insQry1 = "insert into tbl_contractor(contractor_name,contractor_address,district_id,place,phone,departmenttype_id,adharproof,previouswork,login_id)"
                        + " values ('" +value[0]+ "','" + value[3] + "','" + value[4]+ "','" +value[5]+ "','" +value[6]+ "','" +value[7]+ "','"+fn+"','"+pf+"','" +loginid + "')";
               
        System.out.println(insQry1);
        boolean b=obj.ExecuteCommand(insQry1);
//             
//String id="";
//String sel="select MAX(category_id) as category_id from tbl_category";
//ResultSet rs=obj.selectData(sel);
//if(rs.next())
//{
//    id=rs.getString("category_id");
//}
//String up="update tbl_category set category_image='"+fn+"' where category_id='"+id+"'";
//boolean b=obj.ExecuteCommand(up);
if(b){
        %> 
        <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function() {
                window.location.href = 'ContractorsReg.jsp'
            }, 100);
        </script>
        <%
                }
            }
            }

        %>
    </body>
</html>
`   