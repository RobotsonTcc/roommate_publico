<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="com.roomate.controller.common"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Roomate - Cadastro</title>
<link href="<%=common.url%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=common.url%>css/style.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
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

.input-invisivel {
	display: none;
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
    function mascara(i) {

        var v = i.value;

        if (isNaN(v[v.length - 1])) { // impede entrar outro caractere que nÃ£o seja nÃºmero
            i.value = v.substring(0, v.length - 1);
            return;
        }

        i.setAttribute("maxlength", "14");
        if (v.length == 3 || v.length == 7) i.value += ".";
        if (v.length == 11) i.value += "-";

    }
    
    function formatarCampo(campoTexto) {
        if (campoTexto.value.length <= 11) {
            campoTexto.value = mascaraCpf(campoTexto.value);
        } else {
            campoTexto.value = mascaraCnpj(campoTexto.value);
        }
    }
    function retirarFormatacao(campoTexto) {
        campoTexto.value = campoTexto.value.replace(/(\.|\/|\-)/g,"");
    }
    function mascaraCpf(valor) {
        return valor.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/g,"\$1.\$2.\$3\-\$4");
    }
    function mascaraCnpj(valor) {
        return valor.replace(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/g,"\$1.\$2.\$3\/\$4\-\$5");
    }
</script>

<body class="background-fundo" style="overflow-x: hidden;">

	<c:if test="${erro != null}">
		<script>alert("${erro}")</script>
	</c:if>

	<div class="row background-cinza" style="color: rgb(248, 248, 248);">
		<div class="col-md-1 px-4 py-3">
			<img src="<%=common.url%>imgs/logo.png" width="140" height="35">
		</div>
		<div class="col-md-9"></div>
	</div>
	<div class="container" style="margin-top: 8rem;">
		<!-- Sign up form -->
		<form action="cadastro" enctype="multipart/form-data" method="POST">
			<!-- Sign up card -->
			<div class="card person-card">
				<div class="card-body">
					<!-- Sex image -->
					<label for="file-input"> <img id="img_sex"
						class="person-img" src="${sessionScope.editar == "S" ? sessionScope.imagem_usuario : common.url.concat("imgs/homem.png")}">
					</label> <input class="input-invisivel" name="file-input" id="file-input"
						type="file" />
					<h2 id="who_message" class="card-title">Qual seu nome ?</h2>
					<!-- First row (on medium screen) -->
					<div class="row">
						<input name="first_name" id="first_name" type="text"
							class="form-control" value="${sessionScope.editar == "S" ? sessionScope.dados_usuario.getNome() : "" }"
							${sessionScope.editar == "S" ? "" : 'placeholder="Seu nome"'}>
						<div id="first_name_feedback" class="invalid-feedback"></div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<div class="card-body">
							<h2 class="card-title">Como podemos nos comunicar ?</h2>
							<label for="email" class="col-form-label">Email</label> <input
								type="email" name="email" class="form-control" id="email"
								value="${sessionScope.editar == "S" ? sessionScope.dados_usuario.getEmail() : "" }"
								${sessionScope.editar == "S" ? "readonly" : "required"}
								${sessionScope.editar == "S" ? "" : 'placeholder="email@exemplo.com"'}>
							<div class="email-feedback"></div>
							<label for="input-sex" class="col-form-label">Você é: </label> 
							<select
								name="input_sex" id="input_sex" class="form-control">
								<option value="M">Masculino</option>
								<option value="F">Feminino</option>
							</select>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="card">
						<div class="card-body">
							<h2 class="card-title">Fique seguro !</h2>
							<label for="password" class="col-form-label">Senha</label> <input
								type="password" class="form-control" name="password"
								id="password" placeholder="Coloque sua senha"
								value="${sessionScope.editar == "S" ? sessionScope.dados_usuario.getSenha() : "" }" required>
							<div class="password-feedback"></div>
							<label for="password_conf" class="col-form-label">Confirme
								a senha</label> <input type="password" class="form-control"
								name="password_conf" id="password_conf"
								placeholder="Confirme sua senha"
								value="${sessionScope.editar == "S" ? sessionScope.dados_usuario.getSenha() : "" }" required>
							<div class="password_conf-feedback"></div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body">
							<h2 class="card-title">Fale sobre você !</h2>
							<textarea name="descricao" id="descricao" cols="140" rows="10"
								placeholder="Descreva sobre você!">${sessionScope.editar == "S" ? sessionScope.dados_usuario.getDescricao() : "" }</textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body">
							<h2 class="card-title">Quais opções estão presentes no seu
								dia-a-dia?</h2>
							<div class="form-group">
								<br>
								<div class="gato">
									POSSUI GATO:&nbsp; <label class="radio-inline"><input
										type="radio" id="gato" name="gato" value="S">SIM </label>&nbsp; <label
										class="radio-inline"><input type="radio" id="gato" name="gato"
										value="N">NAO</label>
								</div>
								<br>
								<div class="cachorro">
									POSSUI CACHORRO:&nbsp; <label class="radio-inline"><input
										type="radio" id="cachorro" name="cachorro" value="S">SIM</label>&nbsp; <label
										class="radio-inline"><input type="radio"
										id="cachorro" name="cachorro" value="N">NAO</label>
								</div>
								<br>
								<div class="fumante">
									É FUMANTE:&nbsp; <label class="radio-inline"><input
										type="radio" id="fumante" name="fumante" value="S">SIM</label>&nbsp; <label
										class="radio-inline"><input type="radio"
										id="fumante" name="fumante" value="N">NAO</label>
								</div>
								<br>
								<div class="trabalha">
									TRABALHA:&nbsp; <label class="radio-inline"><input
										type="radio" id="trabalha" name="trabalha" value="S">SIM</label>&nbsp; <label
										class="radio-inline"><input type="radio"
										id="trabalha" name="trabalha" value="N">NAO</label>
								</div>
								<br>
								<div class="curso">
								    <h6 class="curso">Qual seu curso?</h6>
									<select name="curso" id="curso" class="form-control">
										<c:forEach items="${cursos}" var="curso">
											<option id="curso" name="curso" value="${curso.key}">${curso.value}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<div class="card-body">
							<h2 class="card-title">Qual sua data de nascimento ?</h2>
							<input type="date" name="aniversario" class="form-control"
								id="aniversario" required>
						</div>
					</div>
				</div>
				<div class="col-md-6 mb-3">
					<div class="card">
						<div class="card-body">
							<h2 class="card-title">Qual seu cpf ?</h2>
							<input class="form-control" 
								value="${sessionScope.editar == "S" ? sessionScope.dados_usuario.getCpf() : ""}"
								${sessionScope.editar == "S" ? "readonly" : "required"}
								class="cpf" id="cpf" name="cpf" oninput="mascara(this)" type="text">
						</div>
					</div>
				</div>
				<div class="text-center" style="margin-top: 1em;">
					<button type="submit" value="upload"
						class="btn btn-secondary btn-lg btn-block">Continuar</button>
				</div>
			</div>


		</form>
	</div>
	<div
		class="row background-cinza justify-content-center bg-blue flex-grow-1 mt-5"
		style="color: white;">
		<div class="col-lg-12">
			<p class="mt-3 mx-5 text-center">Roommate @ 2021</p>
			<p class="mb-3 mx-5 text-center">
				Made in: <img
					src="<%=common.url%>imgs/bandeira_minimalista_brasil.png"
					width="40" height="20">
			</p>
		</div>
	</div>
	<script src="<%=common.url%>js/jquery.min.js"></script>
	<script src="<%=common.url%>js/bootstrap.min.js"></script>
	<script src="<%=common.url%>js/scripts.js"></script>
	<script>
		$(document).ready(function() {
			$("input_sex").val("${sessionScope.editar == "S" ? sessionScope.dados_usuario.getSexo() : ""}").attr('selected', 'selected');
			$("curso").val("${sessionScope.editar == "S" ? sessionScope.dados_usuario.getCurso() : ""}").attr('selected', 'selected');
			$('input[name=gato][value=${sessionScope.editar == "S" ? sessionScope.dados_usuario.getGato() : "ZZZ"}]').prop("checked", true);
			$('input[name=cachorro][value=${sessionScope.editar == "S" ? sessionScope.dados_usuario.getCachorro() : "ZZZ"}]').prop("checked", true);
			$('input[name=fumante][value=${sessionScope.editar == "S" ? sessionScope.dados_usuario.getFumante() : "ZZZ"}]').prop("checked", true);
			$('input[name=trabalha][value=${sessionScope.editar == "S" ? sessionScope.dados_usuario.getTrabalha() : "ZZZ"}]').prop("checked", true);
			$('input[type=date]').val("${sessionScope.editar == "S" ? sessionScope.dados_usuario.getDataAniversario() : ""}");
			formatarCampo(document.getElementById("cpf"));
		});
	</script>
</body>

</html>
