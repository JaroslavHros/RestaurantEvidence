<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Rezervace</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light fixed-top bg-light">
			<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			<li class="nav-item">
        <a class="nav-link" href="prihlaseni.jsp">Přihlášení</a></li>
			
			<li class="nav-item active"><a href="rezervace.jsp"class="nav-link">Rezervace <span class="sr-only">(current)</span></a></li>
			
		</ul>
         </div>
		</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="food.png" alt="Image">
        <div class="carousel-caption">
          <h1 >Rezervace</h1>
          <p  class="fs-2">Neváhej nás kontaktovat </p>
        </div>      
      </div>

      <div class="item">
        <img src="meat.jpg"  alt="Image">
        <div class="carousel-caption">
          <h1  >Vynikajíci kuchyně </h1>
          <p class="fs-1">Navštiv nás..</p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
<div class="container text-center">    
<h1 class="mt-5">Rezervace prostoru</h1>
      <p class="lead">V areálu nabízíme pronájem prostor. Možnost zřízení provozovny nebo skladu.
      <p>Nabízime pronájem salových prostoru, které mohou být pro Vás ideálnim místem na organizáci fíremních nebo rodinných osláv..</p>
  <div class="row">
    <div class="col-sm-4">
      <img src="salon.jpg" class="img-responsive" style="width:100%" alt="prostory">
      
    </div>
    <div class="col-sm-4"> 
      <img src="salon1.jpg" class="img-responsive" style="width:100%" alt="prostory">
 
    </div>
    <div class="col-sm-4">
      <img src="salon2.jpg" class="img-responsive" style="width:100%" alt="prostory">
   
      </div>
      </div>
      <h1 class="mt-4">Nezávazný formulář</h1>
  <div class="jumbotron">
       <p class="lead">V prípadě záujmu prosím vyplňte následujíci formulář... </p>
      <form action="RezervaceServlet" method="POST">

  <div class="row mb-4">
    <div class="col">
      <div class="form-outline">
        <input type="text" id="form6Example1" class="form-control" name="Fname" />
        <label class="form-label" for="form6Example1">Méno</label>
      </div>
    </div>
    <div class="col">
      <div class="form-outline">
        <input type="text" id="form6Example2" class="form-control" name="Lname" />
        <label class="form-label" for="form6Example2">Příjmení</label>
      </div>
    </div>
  </div>

  <!-- Text input -->
  <div class="form-outline mb-4">
    <input type="text" id="form6Example3" class="form-control" />
    <label class="form-label" for="form6Example3">Méno firmy</label>
  </div>

  <!-- Text input -->
  <div class="form-outline mb-4">
    <input type="text" id="form6Example4" class="form-control" />
    <label class="form-label" for="form6Example4">Adresa</label>
  </div>

  <div class="form-outline mb-4">
    <input type="email" id="form6Example5" class="form-control" name="to" />
    <label class="form-label" for="form6Example5">Email</label>
  </div>

  <div class="form-outline mb-4">
    <input type="number" id="form6Example6" class="form-control" name="phone"/>
    <label class="form-label" for="form6Example6">Telefón</label>
  </div>

  <div class="form-outline mb-4">
    <textarea class="form-control" id="form6Example7" rows="4" name="message"></textarea>
    <label class="form-label" for="form6Example7"> Poznámka</label>
  </div>

  <button type="submit" class="btn btn-primary btn-block mb-4">Nezávazně rezervovat</button>
</form>

<span> ${requestScope.hlaska} </span>
      </div>
    
  </div>
<br>

<footer class="container-fluid text-center">
   <div class="container">
        <span class="text-muted"><a href="https://www.facebook.com/RestauraceMalcovna" target="blank"><img src="fbLoo.png" height="60px"/></a></span>
        <span class="text-muted" style="opacity:0.6;"><a href="http://malcovna.cz/" target="blank"><img src="malc.png" height="60px"/></a></span>
      </div>
</footer>

</body>
</html>