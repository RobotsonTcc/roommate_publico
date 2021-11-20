<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page import="com.roomate.controller.common" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="<%=common.url%>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=common.url%>css/style.css" rel="stylesheet">
    <link href="<%=common.url%>css/all.min.css" rel="stylesheet">
</head>
<style>
    html {
        background-color: #56baed;
    }
    
    body {
        font-family: "Poppins", sans-serif;
        height: 100vh;
    }
    
    a {
        color: #92badd;
        display: inline-block;
        text-decoration: none;
        font-weight: 400;
    }
    
    h2 {
        text-align: center;
        font-size: 16px;
        font-weight: 600;
        text-transform: uppercase;
        display: inline-block;
        margin: 40px 8px 10px 8px;
        color: #cccccc;
    }
    /* STRUCTURE */
    
    .wrapper {
        display: flex;
        align-items: center;
        flex-direction: column;
        justify-content: center;
        width: 100%;
        min-height: 100%;
        padding: 20px;
    }
    
    #formContent {
        -webkit-border-radius: 10px 10px 10px 10px;
        border-radius: 10px 10px 10px 10px;
        background: #fff;
        padding: 30px;
        width: 90%;
        max-width: 450px;
        position: relative;
        padding: 0px;
        -webkit-box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
        box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
        text-align: center;
    }
    
    #formFooter {
        background-color: #f6f6f6;
        border-top: 1px solid #dce8f1;
        padding: 25px;
        text-align: center;
        -webkit-border-radius: 0 0 10px 10px;
        border-radius: 0 0 10px 10px;
    }
    /* TABS */
    
    h2.inactive {
        color: #cccccc;
    }
    
    h2.active {
        color: #0d0d0d;
        border-bottom: 2px solid #5fbae9;
    }
    /* FORM TYPOGRAPHY*/
    
    input[type=button],
    input[type=submit],
    input[type=reset] {
        background-color: #56baed;
        border: none;
        color: white;
        padding: 15px 80px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        text-transform: uppercase;
        font-size: 13px;
        -webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
        box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
        -webkit-border-radius: 5px 5px 5px 5px;
        border-radius: 5px 5px 5px 5px;
        margin: 5px 20px 40px 20px;
        -webkit-transition: all 0.3s ease-in-out;
        -moz-transition: all 0.3s ease-in-out;
        -ms-transition: all 0.3s ease-in-out;
        -o-transition: all 0.3s ease-in-out;
        transition: all 0.3s ease-in-out;
    }
    
    input[type=button]:hover,
    input[type=submit]:hover,
    input[type=reset]:hover {
        background-color: #39ace7;
    }
    
    input[type=button]:active,
    input[type=submit]:active,
    input[type=reset]:active {
        -moz-transform: scale(0.95);
        -webkit-transform: scale(0.95);
        -o-transform: scale(0.95);
        -ms-transform: scale(0.95);
        transform: scale(0.95);
    }
    
    input[type=text] {
        background-color: #f6f6f6;
        border: none;
        color: #0d0d0d;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 5px;
        width: 85%;
        border: 2px solid #f6f6f6;
        -webkit-transition: all 0.5s ease-in-out;
        -moz-transition: all 0.5s ease-in-out;
        -ms-transition: all 0.5s ease-in-out;
        -o-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
        -webkit-border-radius: 5px 5px 5px 5px;
        border-radius: 5px 5px 5px 5px;
    }
    
    input[type=text]:focus {
        background-color: #fff;
        border-bottom: 2px solid #5fbae9;
    }
    
    input[type=text]:placeholder {
        color: #cccccc;
    }
    
        input[type=password] {
        background-color: #f6f6f6;
        border: none;
        color: #0d0d0d;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 5px;
        width: 85%;
        border: 2px solid #f6f6f6;
        -webkit-transition: all 0.5s ease-in-out;
        -moz-transition: all 0.5s ease-in-out;
        -ms-transition: all 0.5s ease-in-out;
        -o-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
        -webkit-border-radius: 5px 5px 5px 5px;
        border-radius: 5px 5px 5px 5px;
    }
    
    input[type=password]:focus {
        background-color: #fff;
        border-bottom: 2px solid #5fbae9;
    }
    
    input[type=password]:placeholder {
        color: #cccccc;
    }
    /* ANIMATIONS */
    /* Simple CSS3 Fade-in-down Animation */
    
    .fadeInDown {
        -webkit-animation-name: fadeInDown;
        animation-name: fadeInDown;
        -webkit-animation-duration: 1s;
        animation-duration: 1s;
        -webkit-animation-fill-mode: both;
        animation-fill-mode: both;
    }
    
    @-webkit-keyframes fadeInDown {
        0% {
            opacity: 0;
            -webkit-transform: translate3d(0, -100%, 0);
            transform: translate3d(0, -100%, 0);
        }
        100% {
            opacity: 1;
            -webkit-transform: none;
            transform: none;
        }
    }
    
    @keyframes fadeInDown {
        0% {
            opacity: 0;
            -webkit-transform: translate3d(0, -100%, 0);
            transform: translate3d(0, -100%, 0);
        }
        100% {
            opacity: 1;
            -webkit-transform: none;
            transform: none;
        }
    }
    /* Simple CSS3 Fade-in Animation */
    
    @-webkit-keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }
    
    @-moz-keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }
    
    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }
    
    .fadeIn {
        opacity: 0;
        -webkit-animation: fadeIn ease-in 1;
        -moz-animation: fadeIn ease-in 1;
        animation: fadeIn ease-in 1;
        -webkit-animation-fill-mode: forwards;
        -moz-animation-fill-mode: forwards;
        animation-fill-mode: forwards;
        -webkit-animation-duration: 1s;
        -moz-animation-duration: 1s;
        animation-duration: 1s;
    }
    
    .fadeIn.first {
        -webkit-animation-delay: 0.4s;
        -moz-animation-delay: 0.4s;
        animation-delay: 0.4s;
    }
    
    .fadeIn.second {
        -webkit-animation-delay: 0.6s;
        -moz-animation-delay: 0.6s;
        animation-delay: 0.6s;
    }
    
    .fadeIn.third {
        -webkit-animation-delay: 0.8s;
        -moz-animation-delay: 0.8s;
        animation-delay: 0.8s;
    }
    
    .fadeIn.fourth {
        -webkit-animation-delay: 1s;
        -moz-animation-delay: 1s;
        animation-delay: 1s;
    }
    /* Simple CSS3 Fade-in Animation */
    
    .underlineHover:after {
        display: block;
        left: 0;
        bottom: -10px;
        width: 0;
        height: 2px;
        background-color: #56baed;
        content: "";
        transition: width 0.2s;
    }
    
    .underlineHover:hover {
        color: #0d0d0d;
    }
    
    .underlineHover:hover:after {
        width: 100%;
    }
    /* OTHERS */
    
    *:focus {
        outline: none;
    }
    
    .background-fundo {
        background-color: rgb(248, 248, 248) !important;
    }
    
    .background-azul {
        background-color: rgb(0, 140, 180) !important;
    }
    
    .background-cinza {
        background-color: rgb(64, 64, 64) !important;
    }
</style>

<body style="overflow-x: hidden;">

	<c:if test= "${sessionScope.usuario != null}"> 
		<script> 
			window.location.href = 'http://localhost:8080/principal.jsp'; 
		</script>
	</c:if> 

	
	<c:if test= "${erro != null}"> 
		<script> alert("${erro}") </script> 
	</c:if> 

    <div class="row background-cinza" style="color: rgb(248, 248, 248);">
        <div class="col-md-1 px-4 py-3">
        	<a href="<%=common.base%>">
            	<img src="<%=common.url%>imgs/logo.png" width="140" height="35">
            </a>
        </div>
        <div class="col-md-9">
        </div>
    </div>
    <div class="wrapper fadeInDown background-fundo">
        <div id="formContent" class="background-cinza">
            <!-- Tabs Titles -->

            <!-- Icon -->
            <div class="fadeIn first">
                <img src="<%=common.url%>imgs/logo.png" id="icon" alt="Logo" style="height: 50%; width: 50%;" />
            </div>

            <!-- Login Form -->
            <form form action="validaLogin" method="post">
                <input type="text" id="email" class="fadeIn second" name="email" placeholder="email">
                <input type="password" id="senha" class="fadeIn third" name="senha" placeholder="senha">
                <input type="submit" class="fadeIn fourth" name="logar" value="Entrar">
            </form>

            <!-- Remind Passowrd -->
            <div id="formFooter background-cinza">
                <a class="underlineHover" href="<%=common.base%>cadastro">Não possui cadastro?</a>
            </div>

        </div>
    </div>
    <div class="row background-cinza justify-content-center bg-blue flex-grow-1" style="color: white;">
        <div class="col-lg-12">
            <p class="mt-3 mx-5 text-center">
                Roommate @ 2021
            </p>
            <p class="mb-3 mx-5 text-center">
                Made in:
                <img src="<%=common.url%>imgs/bandeira_minimalista_brasil.png" width="40" height="20">
            </p>
        </div>
    </div>
    <script src="<%=common.url%>js/jquery.min.js"></script>
    <script src="<%=common.url%>js/bootstrap.min.js"></script>
    <script src="<%=common.url%>js/scripts.js"></script>
</body>

</html>