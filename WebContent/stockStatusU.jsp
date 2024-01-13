<%@page import="java.security.interfaces.RSAKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
 <%@page import="java.sql.PreparedStatement,java.sql.ResultSet,cz.ekf.dbCon.DBcon,java.sql.SQLException, java.sql.Statement , java.sql.Connection , cz.ekf.dbCon.DBcon" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stav skladu</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    footer {
      background-color: #f2f2f2;
      padding: 25px;
      position: fixed;
   left: 0;
   bottom: 0;
    }
    body {
   min-height: 400px;
   margin-bottom: 100px;
   clear: both;
}
  
   
</style>
</head>
<c:if test="${empty sessionScope.User }">
<c:redirect url="prihlaseni.jsp"></c:redirect>
</c:if>
 <c:if test="${empty sessionScope.User }">
<c:redirect url="prihlaseni.jsp"></c:redirect>
</c:if>
<%--stránka pre uživateľa  --%>
				<c:if test="${not empty sessionScope.User && empty sessionScope.Admin }">
					<body>
    <nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">

			<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			<li class="nav-item ">
        <a class="nav-link" href="user.jsp">Home  </a></li>
        	<li class="nav-item"><a href="allProductsU.jsp" class="nav-link">Všechny produkty </a></li>
			<li class="nav-item "><a href="allCategoriesU.jsp" class="nav-link">Všechny kategorie </a></li>
			<li class="nav-item"><a href="SellProducts.jsp" class="nav-link">Přidat prodané</a></li>
			<li class="nav-item active"><a href="stockStatusU.jsp"class="nav-link">Produkty na skladě <span class="sr-only">(current)</span></a></li>
            <li class="nav-item"><a href="VsechnyRezervaceU.jsp"class="nav-link">Seznam rezervaci</a></li>
			</ul>
			<div style=" margin-right: 10px" >
  <span class="navbar-text" style="color: black ">
   Logged as: <span style="color:green;">${sessionScope.User}</span>
    </span>
    </div>
    <div style="padding-right: 10px">
     <form class="form-inline my-2 my-lg-0"  action="LogOutServlet" method="post">
     <input type="submit" value="Odhlásit se" class="btn btn-outline-success my-2 my-sm-0">
    </form>
		</div>
			</div>
		</nav>
	<hr>
	<hr>
	<hr>
			
		<main role="main" class="container"  >
<table border="1" class="table" style="margin-bottom: 20px">
<thead style="background-color:  #FFE4B5  ">
<tr>
<th>ID</th>
<th>Název Produktu <a href="stockStatusU.jsp">▲ </a> <a href="stockStatusNdescU.jsp">▼ </a></th>
<th>Mnozštví</th>
<th>Dátum<a href="">▲ </a> <a href="stockStatusDdescU.jsp">▼ </a></th>

</tr>
</thead>
<%
String query = "select * from stock";
Connection con = DBcon.createConnection();
PreparedStatement pst = con.prepareStatement(query);
try{
ResultSet rs= pst.executeQuery();
while(rs.next()){
%>
<tbody>
<tr>
<td><%=rs.getInt("id") %></td>
<td><%=rs.getString("p_name") %></td>
<td><%=rs.getInt("quantity") %></td>
<td><%=rs.getString("date") %></td>


</tr>
</tbody>
<% 
}
}catch (SQLException e) {
	request.setAttribute("vynimka", e);
	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	e.printStackTrace();
}finally{ 

	System.out.println("Succesfully closed connection" + con);
	  con.close();
	  pst.close();
	  
  
}
%>
</table>

<span style="color:red">
<p>${requestScope.hlasenie}</p>
</span>
</main>
<hr>
	<hr>
<footer class="container-fluid text-center">
   <div class="container">
        <span class="text-muted"><a href="https://www.facebook.com/RestauraceMalcovna" target="blank"><img src="fbLoo.png" height="60px"/></a></span>
        <span class="text-muted" style="opacity:0.6;"><a href="http://malcovna.cz/" target="blank"><img src="malc.png" height="60px"/></a></span>
      </div>
</footer>
</body>

</c:if>
</html>