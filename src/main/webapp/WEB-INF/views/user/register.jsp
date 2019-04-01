<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<s:url value="/resources/js/home/jquery-3.3.1.min.js" var="jquery"></s:url>
<s:url value="/resources/css/bootstrap/bootstrap.min.css"
	var="bootstrap"></s:url>
<s:url value="/resources/img/icon/favicon.ico" var="icon"></s:url>
<s:url value="/resources/css/register/style.css" var="layout"></s:url>

<link rel="shortcut icon" type="image/x-icon" href="${icon }">

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<link rel="stylesheet" type="text/css" href="${bootstrap }" />
<link rel="stylesheet" type="text/css" href="${layout }" />
<link href="https://fonts.googleapis.com/css?family=Capriola"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/css/swiper.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/css/swiper.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">


<title>Cadastre uma conta</title>
</head>

<body>
	<c:import url="/WEB-INF/views/header/header.jsp"></c:import>

	<div class="container">
		<form:form action="registerProcess" modelAttribute="user"
			method="post" cssClass="form-cadastro">

			<h1 class="">Faça seu cadastro</h1>
			<h3 class="">Preencha os campos abaixo</h3>
			<form:hidden path="enabled" value="true" />
			<div class="form-group">
				<label for="nome">Nome</label>
				<form:input path="firstName" cssClass="form-control" />
				<form:errors path="firstName" />
			</div>
			<div class="form-group">
				<label for="sobrenome">Sobrenome</label>
				<form:input path="lastName" cssClass="form-control" />
				<form:errors path="lastName" />
			</div>
			<div class="form-group">
				<label for="cpf">CPF</label>
				<form:input path="cpf" cssClass="form-control" />
				<form:errors path="cpf" />
			</div>
			<div class="form-group">
				<label for="email">Email</label>
				<form:input path="email" cssClass="form-control" />
				<form:errors path="email" />
			</div>
			<div class="form-group">
				<label for="senha">Senha</label>
				<form:password path="password" cssClass="form-control" />
				<form:errors path="password" />
			</div>
			<div class="form-group">
				<label for="confirmSenha">Confirme a senha</label>
				<form:password path="confirmPassword" cssClass="form-control" />
				<form:errors path="confirmPassword" />
			</div>

			<button type="submit" class="btn btn-primary">Registrar</button>
		</form:form>
	</div>
	<script src="${jquery }" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html>