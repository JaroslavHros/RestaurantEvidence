<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.PreparedStatement,java.sql.ResultSet,cz.ekf.dbCon.DBcon,java.sql.SQLException, java.sql.Connection" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add product</title>
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
    body {
   min-height: 400px;
   margin-bottom: 100px;
   clear: both;
}
  
   
</style>
<c:if test="${empty sessionScope.Admin }">
<c:redirect url="prihlaseni.jsp"></c:redirect>
</c:if>
</head>
<body >
<%
Connection con = null;
PreparedStatement pst = null ;
String query = "select category_id, name from category";
try{
  con = DBcon.createConnection();
 pst = con.prepareStatement(query);
ResultSet rs= pst.executeQuery();

%>
	<%--začiatok navigácie --%>
<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
			<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			<li class="nav-item">
        <a class="nav-link" href="admin.jsp">Home</a></li>
					<li class="nav-item active"><a href="addProduct.jsp" class="nav-link">Přidat produkt  <span class="sr-only">(current)</span> </a></li>
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
		<%--začiatok formulara --%>
		<hr>
		<hr>
		<hr>
	
		<main role="main" class= "container" style="margin-bottom: 10%; height: 60%" >
		<h2>Přidat nový produkt do evidence :</h2> 
	<div style="text-align: center; padding: 0; height: 80%" class="border border-dark">
<form  action="AddSomething" method="post" >

<div class="form-group">
<label for="id">Vyberte kategorii :</label>
<select name="cat_id" id="id" class="form-control">
<%
while(rs.next())
{
String cId = rs.getString("category_id"); 
String cN = rs.getString("name"); 
%>
<option value="<%=cId%>">      <%=cId+") "+cN %>   </option>
<%
}
%>
</select>
</div>
<div class="form-group">
<label for="pN">Jmeno produktu :</label>
<input type="text" name="productName" placeholder="Jmeno produktu" required="required" id="pN" class="form-control">
</div>
<div class="form-group">
<label for="pI">Info o produktě :</label>
<input type="text" name="productInfo" placeholder="Info" required="required" id="pI" class="form-control"></div>
<div class="form-group">
<label for="pP">Cena produktu :</label>
<input type="number" name="productPrice" placeholder="Cena produktu" required="required" id="pP" class="form-control" min="1"></div>


<input type="submit" value="Přidat" class="btn btn-primary"  >

<input type="hidden" name="akce"  value="addPro">

</form>

<span>${requestScope.hlaska}</span>
</div>
</main>

<%-- paticka stranky --%>
<footer class="container-fluid text-center">
   <div class="container">
        <span class="text-muted"><a href="https://www.facebook.com/RestauraceMalcovna" target="blank"><img src="fbLoo.png" height="60px"/></a></span>
        <span class="text-muted" style="opacity:0.6;"><a href="http://malcovna.cz/" target="blank"><img src="malc.png" height="60px"/></a></span>
      </div>
</footer>
</body>
<%}
catch(SQLException e){
	e.printStackTrace();
	request.setAttribute("vynimka", e);
	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
}
finally{
	try{
	System.out.println("Succesfully closed connection" + con);
	con.close();
	pst.close();
	}
	catch(SQLException e){
		e.printStackTrace();
		request.setAttribute("vynimka", e);
		request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	
}
	}%>

</html>