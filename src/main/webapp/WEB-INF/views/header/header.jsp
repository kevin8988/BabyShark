<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<s:url value="/resources/img/home/Logo.png" var="logo"></s:url>
</head>
<body>

	<header>
		<nav class="navbar fixed-top navbar-light navbar-expand-sm bg-light">
			<a class="navbar-brand ml-5" href="#"> <img src="${logo }"
				width="40" height="40" class="align-left" alt="logo"> <a
				class="h3" href=""><a class="h3" style="color: #018BBE;">BabyShark</a></a>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#conteudoNavbarSuportado"
				aria-controls="conteudoNavbarSuportado" aria-expanded="false"
				aria-label="Alterna navegação">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
				<ul class="navbar-nav ml-auto mr-3 justify-content-end">
					<li class="nav-item active"><a class="nav-link" href="#">Home<span
							class="sr-only">(página atual)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#">Doações</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Eventos</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Ajude-nos</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="user/register">Cadastre-se</a>
					</li>
				</ul>
				<form method = "post" action = "user/login" class="form-inline my-2 my-lg-0">
					<button class="btn btn-outline-segundary my-2 my-sm-0">
						<i class="fas fa-sign-in-alt mr-1"></i>Login
					</button>
				</form>
			</div>
		</nav>
	</header>

</body>
</html>