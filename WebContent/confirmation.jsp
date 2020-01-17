<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" type="text/css" href="bootstrap.css">
        <link rel="stylesheet" type="text/css" href="style2.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String confo=request.getParameter("active");
String mail=session.getAttribute("key").toString();
try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/teaching_zone","root","");
    Statement st=con.createStatement();
    int i=st.executeUpdate("update registration set status ='active' where email= '"+mail+"' ");
    if(i>0)
	{
    	out.println("this profile is actived");
		System.out.println("succefully update");
	}
    }

    catch(Exception e){
	e.printStackTrace();
	
}  
%>

</body>
</html>