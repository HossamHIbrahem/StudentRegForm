<%@page import="java.sql.*" %>

<%
    String id = request.getParameter("id");
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/records", "root", "");
    pst = con.prepareStatement("Delete records ");
    pst.setString(0, id);
    pst.executeUpdate();
%>  

<script>

    alert("Record Deleted");

</script> 



