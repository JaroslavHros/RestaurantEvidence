
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@page import="java.sql.PreparedStatement,java.sql.ResultSet,cz.ekf.dbCon.DBcon,java.sql.*" %>
    <%@page import="java.text.ParseException"%>   
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Kategorie</title>
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
</head>
<c:if test="${empty sessionScope.Admin }">
<c:redirect url="prihlaseni.jsp"></c:redirect>
</c:if>
<c:if test="${not empty sessionScope.Admin }">
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			<li class="nav-item">
        <a class="nav-link" href="admin.jsp">Home</a></li>
					<li class="nav-item"><a href="addProduct.jsp" class="nav-link">Přidat produkt </a></li>
			<li class="nav-item "><a href="categories.jsp"class="nav-link">Přidat kategorii </a></li>
			<li class="nav-item active "><a href="allCategories.jsp" class="nav-link">Všechny kategorie <span class="sr-only">(current)</span>  </a></li>
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
<main class="container" role="main">
<table border="1" class="table" style="margin-bottom: 20px">
<thead style="background-color:  #FFE4B5  ">
	<tr>
		<th>ProductID</th>
		<th>Product name</th>
		<th>Info</th>
		<th>Cena</th>
		
	</tr>
</thead>
<%
String query = "select * from product where category_id=?";
String catId = request.getParameter("id"); 
Connection con = null;
PreparedStatement pst =null;
try{
	
 con = DBcon.createConnection();
 pst = con.prepareStatement(query);
pst.setString(1, catId);
ResultSet rs= pst.executeQuery();

while(rs.next()){
%>
<tbody>
	<tr>
		<td><%=rs.getString("product_id") %></td>
		<td><%=rs.getString("product_name") %></td>
		<td><%=rs.getString("info") %></td>
		<td><%=rs.getInt("cena") %></td>
	

	</tr>
</tbody>
<%} %>
</table>
</main>
<% } catch(SQLException e){
	request.setAttribute("vynimka", e);
	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	e.printStackTrace();
	
}
catch(NumberFormatException e){
	request.setAttribute("vynimka", e);
	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	e.printStackTrace();
}
finally{
	con.close();
	pst.close();
	
}%>

<%-- paticka stranky --%>
<footer class="container-fluid text-center">
   <div class="container">
        <span class="text-muted"><a href="https://www.facebook.com/RestauraceMalcovna" target="blank"><img src="fbLoo.png" height="60px"/></a></span>
        <span class="text-muted" style="opacity:0.6;"><a href="http://malcovna.cz/" target="blank"><img src="malc.png" height="60px"/></a></span>
      </div>
</footer>

</body>
</c:if>
</html>