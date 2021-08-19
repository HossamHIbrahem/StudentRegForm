
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%

    if (request.getParameter("submit") != null) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        String Email = request.getParameter("Email");
        String Address = request.getParameter("Address");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/?user=root/records", "root", "Password");
        pst = con.prepareStatement("update record set name = ?, course = ?, fee =?, Email=?, Address=? where id = ?");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.setString(4, id);
        pst.setString(5, Email);
        pst.setString(6, Address);

        pst.executeUpdate();
%>  

<script>

    alert("Record Updated");

</script> 

<%
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>update Data</h1>
        <div class="row"
             <div class="col-sm-4">
                <form  method="POST" action="#">

                    <%                       
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/records", "root", "Password");
                        String id = request.getParameter("id");
                        pst = con.prepareStatement("select * from records where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();

                        while (rs.next()) {


                    %>

                    <div alight="left"> 
                        <label class="form-label"> Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" value="<%=rs.getString("name")%>"  name="name" id="
                               name" required>
                    </div>
                    <div alight="left"> 
                        <label class="form-label"> Course </label>
                        <input type="text" class="form-control" placeholder="Course" value="<%=rs.getString("course")%> name="course" id="course" required>
                    </div>> 

                    <div alight="left"> 
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" value="<%=rs.getString("fee")%>required>
                               </div>  


                               <%   }%>


                               </br>
                               <div alight="right"> 
                               <input  type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                        <input  type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>   


                    <div align="right">
                        <p>
                            <a href="index.jsp" > Click Back</a>
                        </p>
                    </div>
                </form>
            </div>

        </div>

    </body>
</html>
