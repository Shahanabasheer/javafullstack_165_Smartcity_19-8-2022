<%@ page import="java.sql.*"%>
<%
String email = request.getParameter("email");
if (email.contains("@") && email.contains(".")) {
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project", "root", "");
		
		PreparedStatement ps = con.prepareStatement("select * from user_registration where User_email=?");
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
	out.print("Unavailable! ");
		} else {
	out.print("Available!");
		}
	} catch (Exception e) {
		out.print(e);
	}
} else {
	out.print("Invalid email!");
}
%>
