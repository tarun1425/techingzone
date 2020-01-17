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
String clist=request.getParameter("clist");
String nam=session.getAttribute("key").toString();
try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/teaching_zone","root","");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from registration where user='college'");
%>
    <div class="jumbotron-fluid bg-dark">
            
                <img style=" padding-bottom:10px ;" src="img/1550957740042.png">
                <nav id="navbar_menu" class="sticky-top nav-pills navbar-light">
                    <ul id="navbar_menu" class="nav justify-content-end">
                        <li class="nav-item"><a href="index.html" class="nav-link text-light">Home</a></li>
                        <li class="nav-item"><a href="#" class="nav-link text-light">Course</a></li>
                        <li class="nav-item"><a href="register.html" class="nav-link text-light">Register</a></li>
                        <li class="nav-item"><a href="login.html" class="nav-link text-light">Login</a></li>
                        <li class="nav-item"><a href="#" class="nav-link text-light">About us</a></li>
                        <li class="nav-item"><a href="#" class="nav-link text-light">Contact us</a></li>
                    </ul>
                </nav>
        </div>
        <div class="container-fluid bg-info">
            <marquee style="display:inline-block;"><h5>Welcome To Teaching zone. i Promise,You get best institute here</h5></marquee>

        </div>
<%    
    while(rs.next()){
    String a=rs.getString("email");
    String b=rs.getString("display_name");
    String c=rs.getString("password");
    String d=rs.getString("college");
    String e=rs.getString("c_program");
    String f=rs.getString("college_type");
    String g=rs.getString("contact_name");
    String h=rs.getString("contact_address");
    String i=rs.getString("city");
    String j=rs.getString("pin_code");
    String k=rs.getString("phone_no");
    String l=rs.getString("website");
    String m=rs.getString("tndc");
    String n=rs.getString("status");
       
    /*out.println("\ncollage:"+n);
    out.println("\nName:"+r);
    out.println("\nmobile:"+m); */
    %>
        <div id="clist" class="container-fluid">
        <table align="center" class="table table-borderless table-sm border">
            <tr>
                <th>email :</th>
                <th>display name :</th>
                <th>password :</th>
                <th>College :</th>
                <th>UG or PG :</th>
                <th>college type :</th>
                <th>contact Name :</th>
                <th>address :</th>
                <th>city :</th>
                <th>pin code :</th>
                <th>phone :</th>
                <th>website :</th>
                <th>tndc :</th>
                <th>status :</th>
            </tr>
            <tr>
            <td> <% out.println(a); %> </td>
			<td> <% out.println(b); %> </td>
			<td> <% out.println(c); %> </td>
			<td> <% out.println(d); %> </td>
			<td> <% out.println(e); %> </td>
			<td> <% out.println(f); %> </td>
			<td> <% out.println(g); %> </td>
			<td> <% out.println(h); %> </td>
			<td> <% out.println(i); %> </td>
			<td> <% out.println(j); %> </td>
			<td> <% out.println(k); %> </td>
			<td> <% out.println(l); %> </td>
			<td> <% out.println(m); %> </td>
			<td> <% out.println(n); %> </td>
            </tr>
        </table>
        
        
        
        </div>
    
    <%
    }
	System.out.println("Successs");
	    }
	    
    catch(Exception e){
	e.printStackTrace();
	
}  
%>

</body>
</html>