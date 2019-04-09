<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Baby Shark</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<s:url value="/resources/img/icon/favicon.ico" var="icon"></s:url>
<s:url value="/resources/js/home/jquery-3.3.1.min.js" var="jquery"></s:url>
<s:url value="/resources/css/register/test.css" var="layout"></s:url>
<s:url value="/resources/css/bootstrap/bootstrap.min.css"
	var="bootstrap"></s:url>
<s:url value="/resources/img/home/home.jpg" var="home"></s:url>
<s:url value="/resources/img/home/produto.png" var="produto"></s:url>
<s:url value="/resources/img/home/footer.jpg" var="footer"></s:url>

<link rel="shortcut icon" type="image/x-icon" href="${icon }">
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

<style type="text/css">
.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}
</style>

</head>
<body>
	<!--  
	<div class="pre-loader" id="loading">
		<div id="loading-center">
			<div id="loading-center-absolute">
				<div class="object" id="object_four"></div>
				<div class="object" id="object_three"></div>
				<div class="object" id="object_two"></div>
				<div class="object" id="object_one"></div>
			</div>
		</div>
	</div>
-->

	<c:import url="/WEB-INF/views/header/header.jsp"></c:import>

	<form:form action="${s:mvcUrl('UC#registerProcess').build() }"
		class="form-cadastro" method="POST" modelAttribute="user" acceptCharset="utf-8">
		<h1 class="">Faça seu cadastro</h1>
		<h3 class="">Preencha os campos abaixo</h3>
		<div class="form-group">
			<label for="nome">Nome</label>
			<form:input path="firstName" cssClass="form-control" />
			<form:errors path="firstName" cssClass="alert-danger" />
		</div>
		<div class="form-group">
			<label for="sobrenome">Sobrenome</label>
			<form:input path="lastName" cssClass="form-control" />
			<form:errors path="lastName" cssClass="alert-danger" />
		</div>
		<div class="form-group">
			<label for="email">E-mail</label>
			<form:input path="email" cssClass="form-control" />
			<form:errors path="email" cssClass="alert-danger" />
		</div>
		<div class="form-group">
			<label for="senha">Senha</label>
			<form:password path="password" cssClass="form-control" />
			<form:errors path="password" cssClass="alert-danger" />
		</div>
		<div class="form-group">
			<label for="confirmSenha">Confirme a senha</label>
			<form:password path="confirmPassword" cssClass="form-control" />
			<form:errors path="confirmPassword" cssClass="alert-danger" />
		</div>

		<form:hidden path="enabled" value="true" />

		<button type="submit" class="btn btn-primary">Registrar</button>
	</form:form>


	<c:import url="/WEB-INF/views/footer/footer.jsp"></c:import>

	<script src="${jquery }" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

	<script>
		//Loader
		window.addEventListener('DOMContentLoaded', function() {
			setTimeout(function() {
				$('#loading').fadeOut('slow', function() {
					$(window).scrollTop(0);
					$(this).remove();
				});
			}, 1000);
		});
		//Fim do Loader
	</script>



	<script>
		var swiper = new Swiper('.swiper-container', {
			slidesPerView : 3,
			spaceBetween : 30,
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			breakpoints : {
				1024 : {
					slidesPerView : 3,
					spaceBetween : 30,
				},
				768 : {
					slidesPerView : 1,
					spaceBetween : 30,
				},
				640 : {
					slidesPerView : 1,
					spaceBetween : 30,
				},
				320 : {
					slidesPerView : 1,
					spaceBetween : 30,
				}
			}
		});
	</script>

</body>
</html>