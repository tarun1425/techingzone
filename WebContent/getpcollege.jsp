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
String ctype=request.getParameter("ctype");
try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/teaching_zone","root","");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from registration where college_type='"+ctype+"'and c_program='pg' and status='active'");
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
    String n=rs.getString("college");
    //String r=rs.getString("display_name");
    String w=rs.getString("website");
    String e=rs.getString("email");
    String m=rs.getString("phone_no");
    String a=rs.getString("contact_address");
    
    /*out.println("\ncollage:"+n);
    out.println("\nName:"+r);
    out.println("\nmobile:"+m); */
    %>
        <div id="clist" class="container-fluid">
        <table align="center" class="table table-borderless table-sm border">
            <tr>
                <th>College Name :</th>
                <td> <% out.println(n); %> </td>
            </tr>
            <tr>
                <th>Website :</th>
                <td> <% out.println(w); %> </td>
            </tr>
            <tr>
                <th>E-mail id :</th>
                <td> <% out.println(e); %> </td>
            </tr>
            <tr>
                <th>Phone No :</th>
                <td> <% out.println(m); %> </td>
            </tr>
            <tr>
                <th>Address :</th>
                <td> <% out.println(a); %> </td>
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