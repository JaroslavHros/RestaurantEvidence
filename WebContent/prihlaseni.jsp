<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Login</title>
<style>
body, html {
  height: 100%;
  margin: 0;
  justify-content: center;
  
}

.bg {
  /* The image used */
  background-image: url("background_new.png");
  opacity: 0.8;
  /* Full height */
  height: 100%; 
  
  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;

  
}
.login-form {
		width: 340px;
    	margin: 0 auto;
    	position: fixed;
  top: 50%;
  left: 50%;
  /* bring your own prefixes */
  transform: translate(-50%, -50%)
	}
    .login-form form {
        opacity: 0.95;
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
   }
   .main {
 
    background: black;
  color: white;
  width: 50%;
  padding: 20px;
  resize: both;
  overflow: auto;
  
   }
   
</style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light fixed-top bg-light" >
			<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
        <a class="nav-link" href="prihlaseni.jsp">Přihlášení <span class="sr-only">(current)</span></a></li>
			
			<li class="nav-item "><a href="rezervace.jsp"class="nav-link">Rezervace </a></li>
			
		</ul>
         </div>
		</nav>

<div class="bg">
 <main role="main" class="container" >
 <div class= "login-form">

<form name="form" action="LoginServlet" method="POST">
   
        <div class="form-group">
        <label for="name">Username</label>
        <input type="text" name="username" class="form-control" id="name" />
        </div>
       
        
        <div class="form-group">
        <label for="pass">Password</label>
        <input type="password" name="password" class="form-control" id="pass"  />
        <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>        
        </div>
        <div class="form-group">
        <input type="submit" value="Login" class="btn btn-primary btn-sm"></input>
       
        <input type="reset" value="Reset" class="btn btn-secondary btn-sm"></input>
      </div>

     
        </form>
      
    </div>
 </main> 
</div>


</body>
</html>