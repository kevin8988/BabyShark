<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<s:url value="/resources/img/home/Logo.png" var="logo"></s:url>
<s:url value="/resources/css/header/header.css" var="layout"></s:url>

<link rel="stylesheet" type="text/css" href="${layout}">
</head>
<body>

	<header>
		<nav class="navbar fixed-top navbar-light navbar-expand-sm bg-light">
			<a class="navbar-brand ml-5" href="${s:mvcUrl('HC#test').build() }">
				<img src="${logo }" width="40" height="40" class="align-left"
				alt="logo">
			</a> 
			<a class="logo_link" href="#">BabyShark</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#conteudoNavbarSuportado"
				aria-controls="conteudoNavbarSuportado" aria-expanded="false"
				aria-label="Alterna navegação">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
				<ul class="navbar-nav ml-auto mr-3 justify-content-end">
					<li class="nav-item"><a class="nav-link" href="${s:mvcUrl('HC#home').build() }">Home</a></li>
					<li class="nav-item active"><a class="nav-link" href="${s:mvcUrl('DC#search').build() }">Doações<span
							class="sr-only">(página atual)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#">Eventos</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Ajude-nos</a>
					</li>					
				</ul>
				<!--<form class="form-inline my-2 my-lg-0">				       
				       <button class="btn btn-outline-segundary my-2 my-sm-0"><i class="fas fa-sign-in-alt mr-1"></i>Login</button>
			 	    </form>-->
				<div class="dropdown">
					<button
						class="btn btn-outline-segundary my-2 my-sm-0 dropdown-toggle"
						data-toggle="dropdown" data-display="static" aria-haspopup="true"
						aria-expanded="false">
						<i class="far fa-user-circle fa-lg mr-1"></i> <a>Bem-vindo!
							${user.firstName } </a>

					</button>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="dropdownMenuButton" style="border: 0;">
						<a class="dropdown-item" href="${s:mvcUrl('UC#profile').build() }">Perfil</a> <a
							class="dropdown-item" href="#">Configurações</a> 
							<form:form action="${pageContext.request.contextPath}/logout" method="POST">
								<input type="submit" class="dropdown-item" value = "Logout">
							</form:form>
					</div>
				</div>
			</div>
		</nav>
	</header>

</body>
</html>