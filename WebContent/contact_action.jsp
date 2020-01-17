<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String msg=request.getParameter("msg");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/teaching_zone","root","");
			Statement st=con.createStatement();
			int i=st.executeUpdate("insert into queries values('"+name+"','"+email+"','"+msg+"')");
			if(i>0)
			{
				System.out.println("succefully insert");
				out.println("thank you for querie,we will response next 24 hours at your email address.");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
%>
</body>
</html>