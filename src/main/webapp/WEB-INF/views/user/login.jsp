<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<s:url value="/resources/img/icon/favicon.ico" var="icon"></s:url>
<s:url value="/resources/css/bootstrap/bootstrap.min.css"
	var="bootstrap"></s:url>
<s:url value="/resources/css/login/login.css" var="style"></s:url>
<s:url value="/resources/img/login/LogoBabyShark.png" var="logo"></s:url>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Capriola|Montserrat"
	rel="stylesheet">

<link rel="shortcut icon" type="image/x-icon" href="${icon }">
<link rel="stylesheet" type="text/css" href="${bootstrap }" />
<link rel="stylesheet" type="text/css" href="${style }" />


<title>Login</title>
</head>

<body class="text-center">

	<form:form action="${pageContext.request.contextPath}/loginProcess"
		method="POST" class="form-login">

		<img src="${logo}" alt="Ícone Baby Shark" width="80px" height="80px">

		<h1 class="mb-3">Login</h1>

  
		<c:if test="${message != null }">
			<div class="alert alert-success">
				<i>${message }</i>
			</div>
		</c:if>


		<c:if test="${param.error != null }">
			<div class="alert alert-danger">
				<i>Você inseriu um e-mail/senha inválido</i>
			</div>
		</c:if>

		<c:if test="${param.logout != null }">
			<div class="alert alert-success">
				<i>Você foi desconectado</i>
			</div>
		</c:if>

		<div class="form-group">
			<label for="email" class="sr-only">Endereço de e-mail</label> <input
				type="text" name="username" class="form-control"
				placeholder="E-mail" autofocus>
		</div>
		<div class="form-group">
			<label for="password" class="sr-only">Senha</label> <label
				for="password" class="sr-only">Senha</label> <input type="password"
				name="password" class="form-control" placeholder="Senha">
		</div>
		<div class="remember-checkbox">
			<input type="checkbox" name="remember-me" id="rm" /> <label for="rm">Mantenha-me
				conectado</label>
		</div>
		<div class="remember-checkbox">
			<label> <a href="${s:mvcUrl('HC#home').build() }">Home</a>
			</label>
		</div>
		<div class="remember-checkbox">
			<label> <a href="${s:mvcUrl('UC#register').build() }">Cadastre-se</a>
			</label>
		</div>

		<button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
	</form:form>

</body>

</html>