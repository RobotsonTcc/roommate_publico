<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<%@page import="com.roomate.controller.common" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Principal</title>
    <link href="<%=common.url%>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=common.url%>css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=common.url%>css/principal.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script type="text/javascript" src="<%=common.url%>js/check.js"></script>
    
<script>
	setInterval(reloadData, 3000);
</script>
</head>
<style>


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
        height: 27em;
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
    
   .cabecalho{
   		margin-top:1em;
   		background-color: #05728f;
   		height: 2.5em;
   		 
   	}
   	.textocaba{
   		margin:9px;
   	}
   	
   	a:hover, a:visited, a:focus, a:active, a{ 
   		text-decoration: none; 
   		color: inherit; 
   	}

</style>

<body>

	<!-- verifica se está logado ou não -->
	<c:if test= "${sessionScope.usuario == null}"> 
		<script> 
			alert("Você não está logado") 
			window.location.href = '<%=common.url%>login'; 
		</script>
	</c:if> 
	
        <div class="row">
            <div class="col-md-12">
            
                <div class="text-center cabecalho row d-flex">
                	<div class="textocaba">
                    	<p>
                    		<font color="#E74C3C">
                    			<a href="<%=common.base%>apagarChat">
                    				<span class='material-icons align-middle'>delete_outline</span>
                    			</a>
                    		</font>
                    		<font color="white">
                    			Conversando com: ${nome}
                    			
                    			<a href="<%=common.base%>login">
                    				<span class='material-icons align-middle'>remove</span>
                    			</a>
                    		</font>
                    		
                    		
                    	</p>
                    	
                    	
                    </div>
                </div>
                
                <div class="mesgs">
                    <div class="msg_history">                        
                        <div id="content"></div>
                    </div>
                    <div id="list" class="type_msg">
                    	<div class="input_msg_write">
                    		<input style="display: none" type="text" id="u" value="${sessionScope.nome}">
                         	<input type="text" id="h" class="write_msg" placeholder="Escreva sua mensagem" />
                           	<button class="msg_send_btn" value="send" onclick="addText()" type="button"> ></button>
                    	</div>
                   	</div>


                </div>
            </div>
        </div>
        
    <!-- partial -->
    <script src='<%=common.url%>js/gsap.min.js'></script>
    <script src='<%=common.url%>js/Draggable.min.js'></script>
    <script src="<%=common.url%>js/jquery.min.js"></script>
    <script src="<%=common.url%>js/bootstrap.min.js"></script>
</body>

</html>