<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin page</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  </style>
</head>
<c:if test="${empty sessionScope.Admin }">
<c:redirect url="prihlaseni.jsp"></c:redirect>
</c:if>
<body>

		<nav class="navbar navbar-expand-lg navbar-light fixed-top bg-light">
			<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
        <a class="nav-link" href="admin.jsp">Home <span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a href="addProduct.jsp" class="nav-link">Přidat produkt </a></li>
			<li class="nav-item "><a href="categories.jsp"class="nav-link">Přidat kategorii </a></li>
			<li class="nav-item "><a href="allCategories.jsp" class="nav-link">Všechny kategorie </a></li>
			<li class="nav-item  "><a href="allProducts.jsp" class="nav-link">Všechny produkty </a></li>
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
		
<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="food.png" alt="Los Angeles" >
    </div>
    <div class="carousel-item">
      <img src="meat.jpg" alt="Chicago" >
    </div>
    <div class="carousel-item">
      <img src="food.png" alt="New York" >
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>


<footer class="container-fluid text-center">
   <div class="container">
        <span class="text-muted"><a href="https://www.facebook.com/RestauraceMalcovna" target="blank"><img src="fbLoo.png" height="60px"/></a></span>
        <span class="text-muted" style="opacity:0.6;"><a href="http://malcovna.cz/" target="blank"><img src="malc.png" height="60px"/></a></span>
      </div>
</footer>
</body>


</html>