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
		String email=request.getParameter("email");
		String dname=request.getParameter("dname");
		String pwd=request.getParameter("pwd");
		String cname=request.getParameter("cname");
		String cp=request.getParameter("cp");
		String ctype=request.getParameter("ctype");
		String contactname=request.getParameter("contactname");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String pcode=request.getParameter("pcode");
		String phone=request.getParameter("phone");
		String url=request.getParameter("url");
		String agree=request.getParameter("agree");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/teaching_zone","root","");
			Statement st=con.createStatement();
			int i=st.executeUpdate("insert into registration values('"+email+"','"+dname+"','"+pwd+"','"+cname+"','"+cp+"','"+ctype+"','"+contactname+"','"+address+"','"+city+"','"+pcode+"','"+phone+"','"+url+"','"+agree+"','pending','college')");
			if(i>0)
			{
				System.out.println("succefully insert");
				response.sendRedirect("login.html");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
%>

</body>
</html>