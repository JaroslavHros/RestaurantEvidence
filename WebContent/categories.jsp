<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.PreparedStatement,java.sql.ResultSet,cz.ekf.dbCon.DBcon,java.sql.SQLException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
      position: fixed;
   left: 0;
   bottom: 0;
    }
  
   
</style>
</head>
<body>
<c:if test="${empty sessionScope.Admin }">
<c:redirect url="prihlaseni.jsp"></c:redirect>
</c:if>
<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
			<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			<li class="nav-item">
        <a class="nav-link" href="admin.jsp">Home</a></li>
			<li class="nav-item"><a href="addProduct.jsp" class="nav-link">Přidat produkt </a></li>
			<li class="nav-item active"><a href="categories.jsp"class="nav-link">Přidat kategorii <span class="sr-only">(current)</span></a></li>
			<li class="nav-item "><a href="allCategories.jsp" class="nav-link">Všechny kategorie </a></li>
			<li class="nav-item "><a href="allProducts.jsp" class="nav-link">Všechny produkty  </a></li>
			<li class="nav-item"><a href="onStock.jsp"class="nav-link">Přidat na sklad</a></li>
			<li class="nav-item "><a href="stockStatus.jsp"class="nav-link">Produkty na skladě </a></li>
			<li class="nav-item "><a href="soldP.jsp"class="nav-link">Prodané produkty </a></li>
			 <li class="nav-item"><a href="VsechnyRezervace.jsp"class="nav-link">Seznam rezervaci</a></li>
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
			<hr>
		<hr>
		<hr>
	
		<main class="container" role="main">
<div style="text-align: center; padding: 0; height: 80%" class="border border-dark">
<h2>Přidat novou kategorii:</h2>
<form action="AddSomething" method="post" >
<div class="form-group">
<label for="categoryName">Zadejte meno kategorie:</label>
<input type="text" name="categoryName" class="form-control"> 
</div>
<div class="form-group">
<input type="submit" value="Přidat" class="btn btn-primary">
<input type="hidden" name="akce"  value="addCat">
</div>
</form>
</div>
<form>

	
</form>
</main>
<%-- paticka stranky --%>
<footer class="container-fluid text-center">
   <div class="container">
        <span class="text-muted"><a href="https://www.facebook.com/RestauraceMalcovna" target="blank"><img src="fbLoo.png" height="60px"/></a></span>
        <span class="text-muted" style="opacity:0.6;"><a href="http://malcovna.cz/" target="blank"><img src="malc.png" height="60px"/></a></span>
      </div>
</footer>
</body>
</html>