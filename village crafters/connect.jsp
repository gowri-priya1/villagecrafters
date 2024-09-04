<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course Registration</title>
</head>
<body>
    <h2>Course Registration Form Submission</h2>
    <%
        // Retrieve form data
        String name = request.getParameter("Name");
        String email = request.getParameter("e_mail");
        String contactNumber = request.getParameter("contno");
        String address = request.getParameter("address");
        String area = request.getParameter("area");
        String role = request.getParameter("role");
        String occupation = request.getParameter("occupation");

        // JDBC variables
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish database connection
            String url = "jdbc:mysql://localhost:3306/mydbuser";
            String username = "root";
            String password = "root";
            conn = DriverManager.getConnection(url, username, password);

            // SQL INSERT statement
            String sql = "INSERT INTO diyform (name, email, contactNumber,address,area,role,occupation ) VALUES (?, ?, ?, ?, ?, ?,?)";
            
            // Prepare the statement
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, contactNumber);
            pstmt.setString(4, address);
            pstmt.setString(5, area);
            pstmt.setString(6, role);
            pstmt.setString(7, occupation);
            
            // Execute the statement
            pstmt.executeUpdate();
            
            out.println("<p>Registration successful!</p>");
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            // Close JDBC objects
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    %>
</body>
</html>
