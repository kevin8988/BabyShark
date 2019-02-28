<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<s:url value="/resources/css/login/style.css"
	var="style"></s:url>
<s:url value="/resources/img/login/LogoBabyShark.png" var="logo"></s:url>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Capriola|Montserrat"
	rel="stylesheet">

<link href="${bootstrap }" rel="stylesheet" />
<link href="${style }" rel="stylesheet" />

<title>Login</title>
</head>

<body class="text-center" style="margin: 50px;">
	<form action="loginProcess" method="post" class="form-login">

		<img src="${logo}" alt="Ícone Baby Shark" width="80px" height="80px">

		<h1 class="mb-3">Login</h1>

		<div class="form-group">

			<label for="email" class="sr-only">Endereço de e-mail</label> <input
				type="email" name="email" class="form-control"
				placeholder="exemple@exemple.com" required autofocus>
		</div>
		<div class="form-group">
			<label for="password" class="sr-only">Senha</label> <label
				for="password" class="sr-only">Senha</label> <input type="password"
				name="password" class="form-control" placeholder="Senha" required>
		</div>
		<div class="remember-checkbox">
			<label> <input type="checkbox" value="remember-me">
				Mantenha-me Conectado
			</label>
		</div>

		<button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
	</form>

</body>

</html>