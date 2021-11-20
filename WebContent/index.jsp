<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<%@page import="com.roomate.controller.common" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Roomate </title>
    
      <link rel="stylesheet" type="text/css" media="screen" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"  />
  		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</head>
<style>
    .background-fundo {
        background-color: rgb(248, 248, 248) !important;
    }
    
    .background-azul {
        background-color: rgb(0, 140, 180) !important;
    }
    
    .background-cinza {
        background-color: rgb(64, 64, 64) !important;
    }
    
    .carousel-inner img {
        height: 30em;
        width: auto;
		overflow: hidden;
		margin: 1em;
	}
    
    .btn1 {
        text-align: left !important;
        padding: 0;
        width: 50px;
    }
    
    html,
    body {
        height: 100%;
    }
</style>

<body class="background-fundo">
    <div class="container-fluid h-100 d-flex flex-column">
    
        <div class="row background-cinza" style="color: rgb(248, 248, 248);">
            <div class="col-md-1 px-4 py-3">
            	<img src="<%=common.url%>imgs/logo.png" width="140" height="35">
            </div>
            <div class="col-md-9">
            </div>
            <div class="col-md-1 px-2 py-2">
	            <a href="<%=common.base%>cadastro" style="text-decoration:none">
	                <button type="button" class="btn btn-md btn-block btn-secondary my-2">
	                    Cadastro
	                </button>
	            </a>
            </div>
            <div class="col-md-1 px-2 py-2">
	            <a href="<%=common.base%>login" style="text-decoration:none">  
	                <button type="button" class="btn btn-md btn-block btn-secondary my-2">
	                    Login
	                </button>
                </a>
            </div>
        </div>
        
        <!-- ------------------------------------------------------------------------- -->
        <div class="carrossel row">
            <div class="col-md-12">
                <div id="carouselSite" class="carousel slide" data-ride="carousel"> 
    				<ol class="carousel-indicators">
        				<li data-target="#carouselSite" data-slide-to="0" class="active"></li>
       					<li data-target="#carouselSite" data-slide-to="1"></li>
        				<li data-target="#carouselSite" data-slide-to="2"></li>
    				</ol>


	    			<div class="carousel-inner">
	        			<div class="carousel-item active">
							<img src="<%=common.url%>imgs/carrosselNovo1.jpg" class="img-fluid d-block w-100">
							<div class="carousel-caption d-none d-md-block">
	              				<h5><font color="black" style="background-color:white"> &nbsp;&nbsp;&nbsp; Dificuldade de Encontrar o Parceiro ideal? &nbsp;&nbsp;&nbsp;</font></h5>
	               				<p> <font color="black" style="background-color:white"> &nbsp;&nbsp;&nbsp; Nem sempre é uma tarefa fácil encontrar pessoas dispostas a dividir uma residência com preferencias semelhantes. &nbsp;&nbsp;&nbsp;</font></p>
	               				<p> <font color="black" style="background-color:white"> &nbsp;&nbsp;&nbsp; Nós te ajudamos com isso!&nbsp;&nbsp;&nbsp;</font></p>
	            			</div>
	        			</div>
	
	        			<div class="carousel-item">
							<img src="<%=common.url%>imgs/carrosselNovo6.jpg" class="img-fluid d-block w-100">
							<div class="carousel-caption d-none d-md-block">
	              				<h5> <font color="black" style="background-color:white"> &nbsp;&nbsp;&nbsp; Partindo para uma nova aventura? &nbsp;&nbsp;&nbsp;</font></h5>
	               				<p> <font color="black" style="background-color:white"> &nbsp;&nbsp;&nbsp; Te ajudamos a encontrar pessoas dispostas a dividir uma residência no estado que você quiser. &nbsp;&nbsp;&nbsp;</font></p>
	            			</div>
	        			</div>
	
	        			<div class="carousel-item">
	            			<img src="<%=common.url%>imgs/carrosselNovo7.jpg" class="img-fluid d-block w-100">
	            			<div class="carousel-caption d-none d-md-block">
	              				<h5> <font color="black" style="background-color:white"> &nbsp;&nbsp;&nbsp; O aluguel está muito caro?&nbsp;&nbsp;&nbsp; </font></h5>
	               				<p><font color="black" style="background-color:white"> &nbsp;&nbsp;&nbsp; O preço dos alugueis estão cada vez mais caros, que tal encontrar a alguém dispostos a dividir isso com você &nbsp;&nbsp;&nbsp;</font></p>
	            			</div>
	        			</div>
	
					</div>
					
					<a class="carousel-control-prev" href="#carouselSite" role="button" data-slide="prev">
          				<span class="carousel-control-prev-icon"></span>
          				<span class="sr-only">Anterior</span>
       				</a>
       				<a class="carousel-control-next" href="#carouselSite" role="button" data-slide="next">
          				<span class="carousel-control-next-icon"></span>
          				<span class="sr-only">Proximo </span>
     			 	</a>
            	</div>
        	</div>
       </div>
        
       <!-- ------------------------------------------------------------------------- -->
        
        <div class="row background-cinza justify-content-center bg-blue flex-grow-1" style="color: white;">
            <div class="col-lg-12">
                <p class="mt-3 mx-5">
                    O projeto visa auxiliar jovens e estudantes que buscam por pessoas dispostas a dividir uma residência. 
                    Com base em suas preferencias unimos pessoas, tornando sua busca ainda mais eficiente.
                </p>
                <p class="mx-5">
                    Desenvolvido por: <strong>Lucas Guilherme Lias</strong> e <strong>Pedro França</strong>
                </p>
                <p class="mb-3 mx-5 text-center">
                    Made in:
                    <img src="<%=common.url%>imgs/bandeira_minimalista_brasil.png" width="40" height="20">
                </p>
            </div>
        </div>
        
    </div>
    
    <script src="<%=common.url%>js/jquery.min.js"></script>
    <script src="<%=common.url%>js/bootstrap.min.js"></script>
    <script src="<%=common.url%>js/scripts.js"></script>
</body>

</html>
