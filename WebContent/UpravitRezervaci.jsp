<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.PreparedStatement,cz.ekf.dbCon.DBcon,java.sql.ResultSet" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			<li class="nav-item">
        <a class="nav-link" href="admin.jsp">Home</a></li>
				<li class="nav-item"><a href="addProduct.jsp" class="nav-link">Přidat produkt </a></li>
			<li class="nav-item"><a href="categories.jsp"class="nav-link">Přidat kategorii</a></li>
			<li class="nav-item"><a href="allCategories.jsp" class="nav-link">Všechny kategorie</a></li>
			<li class="nav-item "><a href="allProducts.jsp" class="nav-link">Všechny produkty </a> </li>
			<li class="nav-item"><a href="onStock.jsp"class="nav-link">Přidat na sklad</a></li>
			<li class="nav-item"><a href="stockStatus.jsp"class="nav-link">Produkty na skladě</a></li>
			<li class="nav-item "><a href="soldP.jsp"class="nav-link">Prodané produkty</a></li>
			 <li class="nav-item active"><a href="VsechnyRezervace.jsp"class="nav-link">Seznam rezervaci  <span class="sr-only">(current)</span></a></li>
			</ul>
			<div style=" margin-right: 10px" >
  <span class="navbar-text" style="color: black ">
   Logged as: <span style="color:green;">${sessionScope.Admin}</span>
    </span>
    </div>
    <div style="padding-right: 10px">
     <form class="form-inline my-2 my-lg-0"  action="LogOutServlet" method="post">
     <input type="submit" value="Odhlásit se" class="btn btn-outline-success my-2 my-sm-0">
    </form>
		</div>
			</div>
		</nav>
<%
 String i = request.getParameter("id");
%>

<main class="container" role="main">
 <div class="border border-dark" style="text-align: center;">
 <h1> Upravujete rezervaci : <%=i%></h1>
<form  method="post" action="UpdateServlet" >
<% 
 String query = "select * from rezervace where id_rezervace='"+i+"'";
 PreparedStatement pst = DBcon.createConnection().prepareStatement(query);
 ResultSet rs= pst.executeQuery();

 while(rs.next()){
 %>
 <div class="form-group"> 
<input type="hidden" name="id" value="<%=rs.getInt("id_rezervace") %>">
<label for="p_name">Jmeno:</label>
<input type="text" name="Jmeno" id="p_name" class="form-control" value="<%=rs.getString("Jmeno") %>">
</div>
 <div class="form-group"> 
 <label for="info">Email:</label>
<input type="text" name="Mail" id="info" class="form-control" value="<%=rs.getString("Email") %>">
</div>
<div class="form-group">
<label for="price">Mobil:</label>
<input type="number" name="Tel" id="price" class="form-control" value="<%=rs.getInt("Mobil") %>">
</div>
<%
}
%>

<input type="hidden" name="akce" value="updateRez">
<input type="submit" value="Upravit" class="btn btn-primary">

</form>
</div>
</main>
<footer class="container-fluid text-center">
   <div class="container">
        <span class="text-muted"><a href="https://www.facebook.com/RestauraceMalcovna" target="blank"><img src="fbLoo.png" height="60px"/></a></span>
        <span class="text-muted" style="opacity:0.6;"><a href="http://malcovna.cz/" target="blank"><img src="malc.png" height="60px"/></a></span>
      </div>
</footer>

</body>
</html>