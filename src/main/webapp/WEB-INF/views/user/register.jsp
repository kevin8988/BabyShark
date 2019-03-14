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
<s:url value="/resources/css/bootstrap/bootstrap.min.css"
	var="bootstrap"></s:url>
<s:url value="/resources/img/icon/favicon.ico" var="icon"></s:url>
<s:url value="/resources/css/register/style.css" var="style"></s:url>

<link rel="shortcut icon" type="image/x-icon" href="${icon }">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Capriola|Montserrat"
	rel="stylesheet">
<link rel="stylesheet" href="${style}">
<link href="${bootstrap}" rel="stylesheet" />
<title>Cadastre uma conta</title>


</head>

<body>
	<form:form action="registerProcess" modelAttribute="user" method="post"
		cssClass="form-cadastro">

		<h1 class="">Faça seu cadastro</h1>
		<h3 class="">Preencha os campos abaixo</h3>
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
</body>

</html>