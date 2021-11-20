<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.roomate.controller.common"%>

<!DOCTYPE html>
<html lang="pt-BR">

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
.background-fundo {
	background-color: rgb(248, 248, 248) !important;
}

.background-azul {
	background-color: rgb(0, 140, 180) !important;
}

.background-cinza {
	background-color: rgb(64, 64, 64) !important;
}

body {
	background-color: rgb(248, 248, 248);
}

.card {
	margin-top: 1em;
}
/* IMG displaying */
.person-card {
	margin-top: 5em;
	padding-top: 5em;
}

.person-card .card-title {
	text-align: center;
}

.person-card .person-img {
	width: 10em;
	position: absolute;
	top: -5em;
	left: 50%;
	margin-left: -5em;
	border-radius: 100%;
	overflow: hidden;
	background-color: rgb(248, 248, 248);
}
</style>
<script>
	
</script>

<body class="background-fundo" style="overflow-x: hidden">
	<div class="row background-cinza" style="color: rgb(248, 248, 248);">
		<div class="col-md-1 px-4 py-3">
			<img src="<%=common.url%>imgs/logo.png" width="140" height="35">
		</div>
		<div class="col-md-9"></div>
	</div>
	<div class="container" style="margin-top: 8rem;">
		<!-- Sign up form -->
		<form action="manterusuario" method="POST">
			<!-- Sign up card -->
			<div class="card person-card">
				<div class="card-body">
					<!-- Sex image -->
					<img id="img_sex" class="person-img" src="${imagem == null ? "<%=common.url%>imgs/homem.png" : imagem}">
					<!-- INSERIR NOME COM O JSP -->
					<h2 id="who_message" class="card-title">${usuario.getNome() != null ? usuario.getNome() : "SEU NOME"}</h2>
					<!-- First row (on medium screen) -->
				</div>
				<div id="pref_prefs" class="row">
					<select onchange="validaPref()" id="pref_pref" name="pref_pref">
						<option id="pref_pref" name="pref_pref" value="S">Possuo preferências</option>
						<option id="pref_pref" name="pref_pref" value="N">Não possuo preferências</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body">
						<h6 class="card-title">Qual o valor que você deseja pagar no aluguel ?</h6>
								R$ <input name="preco" type="number" min="0.00" max="10000.00"
									step="0.01" value="${sessionScope.editar == "S" ? sessionScope.dados_usuario.getPreferencia().getPreco() : 0}"/>
						<h6 class="card-title">Qual estado você deseja morar?</h6>
								<select name="estado_pref" id="estado_pref" class="form-control">
									<!-- TODO: pegar do banco -->
									<c:forEach items="${estados}" var="estado">
										<option name="estado_pref" value="${estado.key}">${estado.value}</option>
									</c:forEach>
								</select>
								<h6 class="card-title">Qual cidade você deseja morar?</h6>
								<!-- TODO: validar a cidade se existe -->
								<input name="cidade_pref" type="text" id="cidade_pref" value="${sessionScope.editar == "S" ? sessionScope.dados_usuario.getPreferencia().getCidadeMorar() : ""}">
								<h6 class="card-title">Qual zona você deseja morar?</h6>
								<select name="zona_pref" id="zona_pref" class="form-control">
									<option name="zona_pref" value="N">Norte</option>
									<option name="zona_pref" value="S">Sul</option>
									<option name="zona_pref" value="L">Leste</option>
									<option name="zona_pref" value="O">Oeste</option>
									<option name="zona_pref" value="C">Centro</option>
								</select>
						</div>
					</div>
				</div>
			</div>
			<div class="pode_esconder">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body">
							<h2 class="card-title">Quais suas preferencias?</h2>
							<div class="form-group">
								
								<h6 class="card-title">Você prefere morar com pessoas do
									sexo:</h6>
								<select name="sex_pref" id="sex_pref" class="form-control">
									<option name="sex_pref" value="M">Masculino</option>
									<option name="sex_pref" value="F">Feminino</option>
								</select>
								<h6 class="card-title">Você aceita morar com fumantes?</h6>
								<select name="fumante_pref" id="fumante_pref" class="form-control">
									<option name="fumante_pref" value="S">Sim</option>
									<option name="fumante_pref" value="N">Não</option>
								</select>
								
								<!-- LOOP COM TODOS OS ANIMAIS DO BANCO SEGUINDO ESTE PADRÃO -->
								<h6 class="card-title">Quais suas preferencias de animais?</h6>
								<div class="gato">
									GATO:&nbsp; <label class="radio-inline"><input
										type="radio" name="gatoopt" value="S">SIM</label>&nbsp; <label
										class="radio-inline"><input type="radio"
										name="gatoopt" value="N">NAO</label>&nbsp;
								</div>
								<div class="cachorro">
									CACHORRO:&nbsp; <label class="radio-inline"><input
										type="radio" name="cachorroopt" value="S">SIM</label>&nbsp; <label
										class="radio-inline"><input type="radio"
										name="cachorroopt" value="N">NAO</label>&nbsp;
								</div>
								<h6 class="card-title">Deseja morar com quem trabalha?</h6>
								<div class="trabalha">
									<label class="radio-inline"><input type="radio"
										name="trabalhaopt" value="S">SIM</label>&nbsp; <label
										class="radio-inline"><input type="radio"
										name="trabalhaopt" value="N">NAO</label>&nbsp;
								</div>
								<h6 class="card-title">Qual tipo de residência?</h6>
								<select id="tipo_res" class="form-control">
									<option name="tipo_res" value="CASA">Casa</option>
									<option name="tipo_res" value="APARTAMENTO">Apartamento</option>
								</select>
								<h6 class="card-title">Com quantas pessoas deseja dividir a
									residência ?</h6>
								<input name="dividir" type="number" min="1" max="5" step="1" value="${sessionScope.editar == "S" ? sessionScope.dados_usuario.getPreferencia().getQuantidadePessoas() : 1}/>
								<br>
								<div class="curso">
								    <h6 class="curso">Quer morar com alguém que faça um desses cursos?</h6>
									<select name="curso" id="curso" class="form-control">
										<c:forEach items="${cursos}" var="curso">
											<option name="curso" value="${curso.key}">${curso.value}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<c:if test="${sessionScope.editar == null}">
				<div class="text-center" style="margin-top: 1em;">
					<button type="submit" class="btn btn-secondary btn-lg btn-block"
						value="upload">Cadastrar</button>
				</div>
			</c:if>

			<c:if test="${sessionScope.editar != null}">
				<div class="text-center" style="margin-top: 1em;">
					<button type="submit" class="btn btn-secondary btn-lg btn-block"
						value="upload">Editar</button>
				</div>
			</c:if>


		</form>
	</div>
	<div
		class="row background-cinza justify-content-center bg-blue flex-grow-1 mt-5"
		style="color: white;">
		<div class="col-lg-12">
			<p class="mt-3 mx-5 text-center">Roommate @ 2021</p>
			<p class="mb-3 mx-5 text-center">
				Made in: <img src="<%=common.url%>imgs/bandeira_minimalista_brasil.png" width="40"
					height="20">
			</p>
		</div>
	</div>
	<script src="<%=common.url%>js/jquery.min.js"></script>
	<script src="<%=common.url%>js/bootstrap.min.js"></script>
	<script src="<%=common.url%>js/scripts.js"></script>
	<script>
		$(document).ready(function() {
		
			$('option[name=pref_pref][value="${sessionScope.editar == "S" ? sessionScope.pref_usuario.getPossuiPreferencia() : "N"}"]').prop("selected", "selected");
			$("curso").val("${sessionScope.editar == "S" ? sessionScope.pref_usuario.getCursoMorar() : ""}").attr('selected', 'selected');
			$('input[name=cachorroopt][value=${sessionScope.editar == "S" ? sessionScope.pref_usuario.getCachorroMorar() : "ZZZ"}]').prop("checked", true);
			$('input[name=gatoopt][value=${sessionScope.editar == "S" ? sessionScope.pref_usuario.getGatoMorar() : "ZZZ"}]').prop("checked", true);
			$('input[name=trabalhaopt][value=${sessionScope.editar == "S" ? sessionScope.pref_usuario.getTrabalhaMorar() : "ZZZ"}]').prop("checked", true);
			$("sex_pref").val("${sessionScope.editar == "S" ? sessionScope.pref_usuario.getSexoMorar() : ""}").attr('selected', 'selected');
			$("fumante_pref").val("${sessionScope.editar == "S" ? sessionScope.pref_usuario.getFumanteMorar() : ""}").attr('selected', 'selected');
			$("estado_pref").val("${sessionScope.editar == "S" ? sessionScope.pref_usuario.getEstadoMorar() : ""}").attr('selected', 'selected');
			$("zona_pref").val("${sessionScope.editar == "S" ? sessionScope.pref_usuario.getZonaMorar() : ""}").attr('selected', 'selected');
			$("curso").val("${sessionScope.editar == "S" ? sessionScope.pref_usuario.getCursoMorar() : ""}").attr('selected', 'selected');
			$("tipo_res").val("${sessionScope.editar == "S" ? sessionScope.pref_usuario.getTipoMoradia() : ""}").attr('selected', 'selected');
			validaPref();
		});
		
		function validaPref(){
			if ($('#pref_prefs select').val() == 'N') { //'.val()'
				$('.pode_esconder').hide();
			} else {
				$('.pode_esconder').show();
			}
		}
	</script>
</body>

</html>
