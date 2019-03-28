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
<s:url value="/resources/css/home/layout.css" var="layout"></s:url>
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
	<!-- Pre-Loader -->

	<div class="pre-loader" id="loading">
		<div id="loading-center">
			<div id="loading-center-absolute">
				<div class="object" id="object_four"></div>
				<!-- nome do gif -->
				<div class="object" id="object_three"></div>
				<div class="object" id="object_two"></div>
				<div class="object" id="object_one"></div>
			</div>
		</div>
	</div>
	<!--importar Cabeçalho-->
	<c:if test="${user == null }">
		<c:import url="/WEB-INF/views/header/header.jsp"></c:import>
	</c:if>
	<c:if test="${user != null }">
		<c:import url="/WEB-INF/views/header/header-login.jsp"></c:import>
	</c:if>

	<div class="container fundo mt-lg-3 mt-md-5" style="height: 60%;">
		<h1 class="slogan">"Como dizer não</h1>
		<h2 class="slogan">para uma carinha dessas?"</h2>
		<nav class="navbar navbar-light bg-light mb-lg-5 mb-md-3 ">
			<form class="form-inline my-2 my-lg-0" method="get"
				action="${s:mvcUrl('DC#search').build() }">
				<input class="form-control mr-sm-2 " type="search"
					placeholder="Pesquisar" aria-label="Pesquisar" name="search">
				<button class="btn my-2 my-sm-0" type="submit">
					<i class="fas fa-search mr-1"></i> Pesquisar
				</button>
			</form>
		</nav>
	</div>
	<div class="container shadow rounded mb-5"
		style="background-color: white; padding: 0px;">
		<div class="container-fluid p-5">
			<h1 class="mb-3">Últimas doações</h1>
			<div class="swiper-container">
				<div class="swiper-wrapper"
					style="transition-duration: 0ms; transform: translate3d(-520.75px, 0px, 0px);">
					<c:if test="${lastDonates.isEmpty() }">
						<p>Nenhuma doação</p>
					</c:if>
					<c:if test="${!lastDonates.isEmpty() }">
						<c:forEach items="${lastDonates }" var="lastDonate">
							<div class="swiper-slide h-auto px-2 swiper-slide-next p-3 ">
								<div class="row">
									<div class="col">
										<div class="card shadow" style="width: 18rem;">
											<img class="card-img-top" src="${produto }"
												alt="Imagem de capa do card">
											<div class="card-body">
												<h3 class="card-title">${lastDonate.title }</h3>
												<p class="card-text">${lastDonate.description }</p>
												<a href="#" class="btn btn-primary">Ver mais</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>
		<div class="container-fluid p-5" style="background-color: #0386A8;">
			<h1 class="mb-3" style="color: white;">Eventos</h1>
			<div class="row justify-content-center">
				<c:if test="${events.isEmpty() }">
					<p>Nenhum Evento</p>
				</c:if>
				<c:if test="${!events.isEmpty() }">
					<c:forEach items="${events }" var="event">
						<div class="card text-center col-lg-5 col-md-12 m-2 shadow">
							<div class="card-header">Evento</div>
							<div class="card-body">
								<h5 class="card-title">${event.title }</h5>
								<p class="card-text">${event.description }</p>
								<p class="card-text">${event.dayOfEvent }</p>
								<a href="#" class="btn btn-primary">Visitar</a>
							</div>
							<div class="card-footer text-muted">2 dias atrás</div>
						</div>
					</c:forEach>
				</c:if>

			</div>
		</div>
	</div>

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