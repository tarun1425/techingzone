<%@page import="java.io.PrintWriter"%>
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

String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/teaching_zone", "root", "");
	Statement st = con.createStatement();
	ResultSet rs=st.executeQuery("select * from registration where email='"+email+"' and password='"+pwd+"'");
	%>
    <div class="jumbotron-fluid bg-dark">
            
                <img style=" padding-bottom:10px ;" src="img/1550957740042.png">
                <nav id="navbar_menu" class="sticky-top nav-pills navbar-light">
                    <ul id="navbar_menu" class="nav justify-content-end">
                        <li class="nav-item"><a href="index.html" class="nav-link text-light">Home</a></li>
                        <li class="nav-item"><a href="course.html" class="nav-link text-light">Course</a></li>
                        <li class="nav-item"><a href="register.html" class="nav-link text-light">Register</a></li>
                        <li class="nav-item"><a href="login.html" class="nav-link text-light">Login</a></li>
                        <li class="nav-item"><a href="about.html" class="nav-link text-light">About us</a></li>
                        <li class="nav-item"><a href="contact.html" class="nav-link text-light">Contact us</a></li>
                    </ul>
                </nav>
        </div>
        <div class="container-fluid bg-info">
            <marquee style="display:inline-block;"><h5>Welcome To Teaching zone. i Promise,You get best institute here</h5></marquee>

        </div>
<%
	while(rs.next())
	{
		String dn=rs.getString("display_name");
		String u=rs.getString("user");
		String s=rs.getString("status");
		session.setAttribute("key",dn);
		if(u.equals("admin"))
		{
			
			//response.sendRedirect("index.html");
			%>
			<div id="containt" class="bg">
            <h2 id="heading">Developer Dashboard</h2>
            <hr>
            <h4 style="padding: 25px"><b>Welcome:</b> <%=dn %> </h4>
            
            <ul style="margin-left:50px" class="list-unstyled">
                <form action="profile.jsp" method="get">
                <li><button name="view">Admin Profile</button></li><br>
                </form>
                <form action="college_list.jsp" method="get">
                <li><button name="clist">Colleges List</button></li><br>
                </form>
                <form action="request.jsp" method="get">
                <li><button name="rr">Pending Request</button></li><br>
                </form>
                <li><a href="login.html"><button type="button">Log Out</button></a></li>

            </ul>
            
        	
        </div>  
			<%
			
		}
		else if(s.equals("active"))
		{
			%>
			<div id="containt" class="bg">
            <h2 id="heading">Institute Dashboard</h2>
            <hr>
            <h4 style="padding: 25px"><b>Welcome:</b> <%=dn %> </h4>
            
            <ul style="margin-left:50px" class="list-unstyled">
                <form action="profile.jsp" method="get">
                <li><button name="view">My Profile</button></li><br>
                </form>
                <form action="college_details.jsp" method="get">
                <li><button name="clist">Colleges Details</button></li><br>
                </form>
                <li><a href="login.html"><button type="button">Log Out</button></a></li>

            </ul>
            
        	
        </div>  
			
			<%
		}
		else
		{
			%>
			sorry this profile is not active please contact to admin, E-mail: tarun7582@gmail.com
			<%
			
		}
	}
	
} 

catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>

</body>
</html>