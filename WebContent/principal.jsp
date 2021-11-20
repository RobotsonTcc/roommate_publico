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
    <link href="<%=common.url%>css/principal.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/principal.css">
    
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
</head>
<style>
	.modal_img{
		padding-bottom: 1rem;
	 	margin: 0 0 1rem 0;
        text-align: center;
        width: 120px;
        height: 120px;
        -webkit-border-radius: 100px;
        -moz-border-radius: 100px;
        border-radius: 100px;
	}

    .account-settings .user-profile {
        margin: 0 0 1rem 0;
        padding-bottom: 1rem;
        text-align: center;
    }
    
    .account-settings .user-profile .user-avatar {
        margin: 0 0 1rem 0;
        text-align: center;
    }
    
    .account-settings .user-profile .user-avatar img {
        width: 120px;
        height: 120px;
        -webkit-border-radius: 100px;
        -moz-border-radius: 100px;
        border-radius: 100px;
    }
    
    .account-settings .user-profile h5.user-name {
        margin: 0 0 0.5rem 0;
        text-align: center;
    }
    
    .account-settings .user-profile h6.user-email {
        margin: 0;
        font-size: 0.8rem;
        font-weight: 400;
        color: #9fa8b9;
    }
    
    .account-settings .about {
        margin: 2rem 0 0 0;
        text-align: center;
    }
    
    .account-settings .about h5 {
        margin: 0 0 15px 0;
        color: #007ae1;
    }
    
    .account-settings .about p {
        font-size: 0.825rem;
    }
    
    .chat_img img {
        max-width: 100%;
    }
    
    .inbox_people {
        background: #f8f8f8 none repeat scroll 0 0;
        float: left;
        overflow: hidden;
        width: 100%;
        border-right: 1px solid #c4c4c4;
    }
    
    .inbox_msg {
        border: 1px solid #c4c4c4;
        clear: both;
        overflow: hidden;
    }
    
    .top_spac {
        margin: 20px 0 0;
    }
    
    .recent_heading {
        float: left;
        width: 40%;
    }
    
    .srch_bar {
        display: inline-block;
        text-align: right;
        width: 60%;
    }
    
    .headind_srch {
        padding: 10px 29px 10px 20px;
        overflow: hidden;
        border-bottom: 1px solid #c4c4c4;
    }
    
    .recent_heading h4 {
        color: #05728f;
        font-size: 21px;
        margin: auto;
    }
    
    .srch_bar input {
        border: 1px solid #cdcdcd;
        border-width: 0 0 1px 0;
        width: 80%;
        padding: 2px 0 4px 6px;
        background: none;
    }
    
    .srch_bar .input-group-addon button {
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
        border: medium none;
        padding: 0;
        color: #707070;
        font-size: 18px;
    }
    
    .srch_bar .input-group-addon {
        margin: 0 0 0 -27px;
    }
    
    .chat_ib h5 {
        font-size: 15px;
        color: #464646;
        margin: 0 0 8px 0;
    }
    
    .chat_ib h5 span {
        font-size: 13px;
        float: right;
    }
    
    .chat_ib p {
        font-size: 14px;
        color: #989898;
        margin: auto
    }
    
    .chat_img {
        float: left;
        width: 11%;
    }
    
    .chat_ib {
        float: left;
        padding: 0 0 0 15px;
        width: 88%;
    }
    
    .chat_people {
        overflow: hidden;
        clear: both;
    }
    
    .chat_list {
        border-bottom: 1px solid #c4c4c4;
        margin: 0;
        padding: 18px 16px 10px;
    }
    
    .inbox_chat {
        height: 550px;
        overflow-y: scroll;
    }
    
    .active_chat {
        background: #ebebeb;
    }
    
    .incoming_msg_img {
        display: inline-block;
        width: 6%;
    }
    
    .received_msg {
        display: inline-block;
        padding: 0 0 0 10px;
        vertical-align: top;
        width: 92%;
    }
    
    .received_withd_msg p {
        background: #ebebeb none repeat scroll 0 0;
        border-radius: 3px;
        color: #646464;
        font-size: 14px;
        margin: 0;
        padding: 5px 10px 5px 12px;
        width: 100%;
    }
    
    .time_date {
        color: #747474;
        display: block;
        font-size: 12px;
        margin: 8px 0 0;
    }
    
    .received_withd_msg {
        width: 57%;
    }
    
    .mesgs {
        float: left;
        padding: 30px 15px 0 25px;
        width: 100%;
    }
    
    .sent_msg p {
        background: #05728f none repeat scroll 0 0;
        border-radius: 3px;
        font-size: 14px;
        margin: 0;
        color: #fff;
        padding: 5px 10px 5px 12px;
        width: 100%;
    }
    
    .outgoing_msg {
        overflow: hidden;
        margin: 26px 0 26px;
    }
    
    .sent_msg {
        float: right;
        width: 46%;
    }
    
    .input_msg_write input {
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
        border: medium none;
        color: #4c4c4c;
        font-size: 15px;
        min-height: 48px;
        width: 100%;
    }
    
    .type_msg {
        border-top: 1px solid #c4c4c4;
        position: relative;
    }
    
    .msg_send_btn {
        background: #05728f none repeat scroll 0 0;
        border: medium none;
        border-radius: 50%;
        color: #fff;
        cursor: pointer;
        font-size: 17px;
        height: 33px;
        position: absolute;
        right: 0;
        top: 11px;
        width: 33px;
    }
    
    .messaging {
        padding: 0 0 50px 0;
    }
    
    .msg_history {
        height: 516px;
        overflow-y: auto;
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
    
    .teste{
    	margin-left: 1em;
    	margin-right: 1em;
    }
    
    .match{
    	margin-left: 1em;
    	margin-right: 1em;
    	margin-top:1em;
    }
    
    
</style>

<body style="background-color:rgb(248 248 248)"> 

	
	<!-- verifica se está logado ou não -->
	<c:if test= "${sessionScope.usuario == null}"> 
		<script> 
			alert("Você não está logado") 
			window.location.href = '<%=common.url%>login'; 
		</script>
	</c:if> 


    <div class="container-fluid d-flex flex-column">
        <div class="row background-cinza" style="color: rgb(248, 248, 248);">
            <div class="col-md-1 px-4 py-3">
            	<img src="<%=common.url%>imgs/logo.png" width="140" height="35">
            </div>
            <div class="col-md-9">
            </div>
        </div>
        
        
        <!------------- Primeira coluna ------------> 
        <div class="row">
            <div class="col-md-3">
                <div class="card h-100" style="background-color:rgb(248 248 248)"> 
                    <div class="card-body d-flex justify-content-center">
                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar">
                                    <img src="${sessionScope.imagem_usuario == null ? "<%=common.url%>imgs/homem.png" : sessionScope.imagem_usuario}">
                                </div>
                            </div>
                            
                            <div class="user-profile">
                                <h5 class="user-name">${sessionScope.nome}</h5>
                            </div>
                            
                            <div class="about">
                            	<a href="<%=common.base%>editar">
                                	<button type="button" class="btn btn-secondary">Editar Perfil </button>
                                </a>
                            </div>
                            
                        </div>  
                    </div> 
                    
                    	<button type="button" class="btn btn-danger my-4 teste" onclick="window.location.href ='<%=common.base%>deslogar'">Deslogar</button> 
                    	
                    <br><br>
                    
                </div>
            </div>
            
            <!------------------------------- Coluna do Meio ------------------------------------>          
            	<!--  
	            <div class="col-md-6">
	                <div class="container" id="container">
	                    <div class="stack" id="stack"><span id="qmark">?</span></div>
	                    <div class="content background-fundo" id="content"></div>
	                    <div class="user-profile" id="user-profile">
	                        <div class="profile-buttons">
	                            <div class="button" id="pass">X</div>
	                            <div class="button" id="like">V</div>   
	                            <button type="button" class="btn btn-dark" id="botao" onclick="alerta()">I</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            -->
	            
	       <!--  <div class="col-md-6">   
				<div class="match">
					
					<table>
						<c:if test="${!sessionScope.lista_match.isEmpty()}">
							<c:forEach var="match" items="${sessionScope.lista_match}">
								<tr>
									<td> ${match.getNome()} </td>
									<td> ${match.getSexo()} </td>
								</tr>
			                </c:forEach>
		                </c:if>
					</table>
					
					<form form action="registraOpcao" method="post">
						<button type="submit" name="opcao" value="like" class="btn btn-primary" 
							'javascript:Swal.fire({icon: 'error',)'> achei top </button>
						<button type="submit" name="opcao" value="dislike" class="btn btn-secondary">achei ruim</button>
            		</form>
            		
					<button type="button" class="btn btn-success btn-lg mt-2 ml-2"  onclick="teste()" >Abrir Modal</button>
					    
					 <script>
					 
					  function teste(){
						  Swal.fire({
						    title: '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getNome()}',
						    html:
					            '<img width="250px" height="250px" src="'+ '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getImagem() == null ? "" : sessionScope.lista_match.get(0).getImagem()}"/>'
					            + '<p> ' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getDescricao()}' + ' </p>' 	            
					            + '<div align=left>'    
					            + '<p> <b> Sexo: </b>' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getSexo() == 'F' ? "Feminino" : "Maculino"}' + ' </p>' 
					            + '<p> <b> Possui Cachorro?: </b>' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getCachorro() == 'S' ? "Sim" : "Não"}' + ' </p>' 
					            + '<p> <b> Possui Gato?: </b>' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getGato() == 'S' ? "Sim" : "Não"}' + ' </p>' 
					            + '<p> <b> É fumante?: </b>' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getFumante() == 'S' ? "Sim" : "Não"}' + ' </p>' 
					            + '<p> <b> Trabalha?: </b>' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getTrabalha() == 'S' ? "Sim" : "Não"}' + ' </p>' 
					            + '<p> <b> Faz curso de:: </b>' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getDescricao_curso()}' + ' </p>' 
					            + '</div>'  ,
					   	 	})
						}
					 
					 </script>  
					    

    				<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
   					<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    				<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
									
					</div>
			</div> -->
				
	            	                            
	                  
          <c:if test= "${sessionScope.principal == 'match'}"> 
          	<div class="col-md-6">   
				<div class="match">
					<c:if test="${!sessionScope.lista_match.isEmpty()}">
						<%@ include file="match.jsp" %>
					</c:if>	
					<c:if test="${sessionScope.lista_match.isEmpty()}">
						<%@ include file="sempref.jsp" %>
					</c:if>
				</div>
			</div>     
	      </c:if>
	       
	      <c:if test= "${sessionScope.principal == 'chat'}"> 
	            <div class="col-md-6"> 
						<%@ include file="chat.jsp" %>
	            </div>
	      </c:if>
            
            
            <!------------- Coluna do CHAT ------------>
            <div class="col-md-3">
                <div class="card background-fundo">
                    <div class="card-body d-flex justify-content-center">
                        <div class="inbox_people">
                            <div class="headind_srch">
                                <div class="recent_heading">
                                    <h4>CHAT</h4>
                                </div>
                            </div>
                            <div class="inbox_chat">
                            
                            <c:forEach var="chat" items="${sessionScope.chat}">
	                            <a href="<%=common.base%>chat?id=${chat.getId()}">
	                                <div class="chat_list active_chat">
	                                    <div class="chat_people">
	                                        <div class="chat_img"> <img src="${chat.getImagem()}" alt="sunil"> </div>
	                                        <div class="chat_ib">
	                                            <h5>${chat.getNome()}</h5>
	                                        </div>
	                                    </div>
	                                </div>
	                             </a>
	                         </c:forEach> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- partial -->
    <script src='<%=common.url%>js/gsap.min.js'></script>
    <script src='<%=common.url%>js/Draggable.min.js'></script>
    <script src="<%=common.url%>js/principal.js"></script>
    <script src="<%=common.url%>js/check.js"></script>
    
</body>
</html>