<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get form data
    String name = request.getParameter("names");
    String role = request.getParameter("specialties");
    String area = request.getParameter("locations");



    // Update database
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbuser", "root", "root");

        // Update diycrafter table
        PreparedStatement ps = con.prepareStatement("UPDATE diycrafter SET name=?, role=?, area=?");
        ps.setString(1, name);
        ps.setString(2, role);
        ps.setString(3, area);
        
        ps.executeUpdate();
        con.close();
        out.println("Profile updated successfully!");
    } catch (Exception e) {
        out.println(e);
    }


%>
