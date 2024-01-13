<%@page import="java.security.interfaces.RSAKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
 <%@page import="java.sql.PreparedStatement,java.sql.ResultSet,cz.ekf.dbCon.DBcon,java.sql.SQLException, java.sql.Statement , java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Info</title>
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
<c:if test="${empty sessionScope.Admin}">
<c:redirect url="prihlaseni.jsp"></c:redirect>
</c:if>
</head>
<%
String p= (String)request.getAttribute("produkt");
String c = (String)request.getAttribute("cenaP");
String m = (String)request.getAttribute("mnozstvo");
String h =(String)request.getAttribute("hodnota");
%>
<body>
<table border="1" class="table" style="margin-bottom: 20px">
<thead style="background-color:  #FFE4B5">
<tr>
    <td>Produkt</td>
    <td>Cena </td>
    <td>Množství</td>
    <td>Hodnota</td>

</tr>
</thead>
<tbody>
<tr>
    <td><%=p %></td>
    <td><%=c %></td>
    <td><%=m %></td>
    <td><%=h %></td>
</tr>
</tbody>
</table>
<footer class="container-fluid text-center">
   <div class="container">
        <span class="text-muted"><a href="https://www.facebook.com/RestauraceMalcovna" target="blank"><img src="fbLoo.png" height="60px"/></a></span>
        <span class="text-muted" style="opacity:0.6;"><a href="http://malcovna.cz/" target="blank"><img src="malc.png" height="60px"/></a></span>
      </div>
</footer>
</body>
</html>