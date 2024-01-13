<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%> 
<%@ page import="java.time.LocalDate"%> 
<%@ page import="javax.swing.text.DateFormatter"%> 
<%@ page import="java.time.format.DateTimeFormatter"%> 
 <%@page import="java.sql.PreparedStatement,java.sql.ResultSet,cz.ekf.dbCon.DBcon,java.sql.SQLException, java.sql.Connection" %>
 <%@ page errorPage="errorPage.jsp" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Predané produkty</title>
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
  
   
</style></head>
<c:if test="${empty sessionScope.User }">
<c:redirect url="prihlaseni.jsp"></c:redirect>
</c:if>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
		<li class="nav-item">
        <a class="nav-link" href="user.jsp">Home </a></li>
        	<li class="nav-item"><a href="allProductsU.jsp" class="nav-link">Všechny produkty </a></li>
			<li class="nav-item "><a href="allCategoriesU.jsp" class="nav-link">Všechny kategorie </a></li>
			<li class="nav-item active"><a href="SellProducts.jsp" class="nav-link">Přidat prodané <span class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a href="stockStatusU.jsp"class="nav-link">Produkty na skladě </a></li>
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

<main role="main" class= "container" style="margin-top: 50px">
<div style="text-align: center; padding: 0; height: 80%" class="border border-dark">
<% 
Connection con = null;
PreparedStatement pst = null;
 try{
String query = "select product_name from product";
con =  DBcon.createConnection();
pst = con.prepareStatement(query);
ResultSet rs= pst.executeQuery();
%>
<div style="text-align: center; ">
<h2>Přidat prodané jako : ${sessionScope.User}  </h2>
<form  action="SellServlet" method="post" >
<div class="form-group">
	<label for="pname">Vyberte produkt:</label>

		<select id="pname" name="pname" class="form-control" >
			<%while(rs.next()) {%>
				<option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
<%} %>
		</select>
</div>
<div class="form-group">	
<label for="quan"> Množstvo produktu:</label>
<input type="number" id="quan" name="quan" min="1" max="20" placeholder="Zadejte množství" class="form-control">
</div>		
<div class="form-group">
<label for="dat"> Dátum:</label>
<input type="date" name="today" id="dat" class="form-control">
</div>
<input type="hidden" name="hid" value="${sessionScope.User}">
<input type="submit" value="Odeslat" class="btn btn-primary">
</form>


<span style="color: red">${hlasenie}</span>

</div>

	<div style="align-content:flex-end;text-align: center;  ">
		<p id="demo"></p>
		<script>
				var d = new Date();
				document.getElementById("demo").innerHTML = d.toDateString();
		</script>

	</div>


</div>
</main>
<% 
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
<footer class="container-fluid text-center">
   <div class="container">
        <span class="text-muted"><a href="https://www.facebook.com/RestauraceMalcovna" target="blank"><img src="fbLoo.png" height="60px"/></a></span>
        <span class="text-muted" style="opacity:0.6;"><a href="http://malcovna.cz/" target="blank"><img src="malc.png" height="60px"/></a></span>
      </div>
</footer>

	

</body>
</html>