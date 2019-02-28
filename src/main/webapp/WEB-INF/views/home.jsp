<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<s:url value="/resources/js/home/jquery-3.3.1.min.js" var="jquery"></s:url>
<s:url value="/resources/css/home/layout.css" var="layout"></s:url>
<s:url value="/resources/css/bootstrap/bootstrap.min.css"
	var="bootstrap"></s:url>
<s:url value="/resources/img/home/home.jpg" var="home"></s:url>
<s:url value="/resources/img/home/produto.png" var="produto"></s:url>
<s:url value="/resources/img/home/uam.png" var="uam"></s:url>
<s:url value="/resources/img/home/footer.jpg" var="footer"></s:url>
<s:url value="/resources/img/home/Logo.png" var="logo"></s:url>

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
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">

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
	<!--importar Cabe�alho-->
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
							class="sr-only">(p�gina atual)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#">Estoque</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contato</a>
					</li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<button class="btn btn-outline-segundary my-2 my-sm-0">
						<i class="fas fa-sign-in-alt mr-1"></i>Login
					</button>
				</form>
			</div>
		</nav>
	</header>
	<div class="container fundo mt-lg-3 mt-md-5" style="height: 60%;">
		<h1 class="slogan">"Como dizer n�o</h1>
		<h2 class="slogan">para uma carinha dessas?"</h2>
		<nav class="navbar navbar-light bg-light mb-lg-5 mb-md-3 ">
			<a class="nav-link" href="#">Boys</a> <a class="nav-link" href="#">Girls</a>
			<a class="nav-link" href="#">Unissexs</a>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Pesquisar" aria-label="Pesquisar">
				<button class="btn my-2 my-sm-0" type="submit">
					<i class="fas fa-search mr-1"></i> Pesquisar
				</button>
			</form>
		</nav>
	</div>
	<div class="container shadow rounded mb-5"
		style="background-color: white; padding: 0px;">
		<div class="container-fluid p-5">
			<h1 class="mb-3">�ltimas doa��es</h1>
			<div class="swiper-container">
				<div class="swiper-wrapper"
					style="transition-duration: 0ms; transform: translate3d(-520.75px, 0px, 0px);">
					<div class="swiper-slide h-auto px-2 swiper-slide-next p-3 ">
						<div class="row">
							<div class="col">
								<div class="card shadow" style="width: 18rem;">
									<img class="card-img-top" src="${produto }"
										alt="Imagem de capa do card">
									<div class="card-body">
										<h3 class="card-title">T�tulo do card</h3>
										<p class="card-text">Um exemplo de texto r�pido para
											construir o t�tulo do card e fazer preencher o conte�do do
											card.</p>
										<a href="#" class="btn btn-primary">Visitar</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>

			</div>

		</div>
		<div class="container-fluid p-5" style="background-color: #0386A8;">
			<h1 class="mb-3" style="color: white;">Eventos</h1>
			<div class="row justify-content-center">
				<div class="card text-center col-lg-5 col-md-12 m-2 shadow">
					<div class="card-header">Eventos</div>
					<div class="card-body">
						<h5 class="card-title">T�tulo especial</h5>
						<p class="card-text">"Lorem ipsum dolor sit amet, consectetur
							adipiscing elit, sed do eiusmod tempor incididunt ut labore et
							dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
							exercitation ullamco laboris nisi ut aliquip ex ea commodo
							consequat. Duis aute irure dolor in reprehenderit in voluptate
							velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
							occaecat cupidatat non proident, sunt in culpa qui officia
							deserunt mollit anim id est laborum. Duis aute irure dolor in
							reprehenderit in voluptate velit esse cillum dolore eu fugiat
							nulla pariatur. Excepteur sint occaecat cupidat"</p>
						<a href="#" class="btn btn-primary">Visitar</a>
					</div>
					<div class="card-footer text-muted">2 dias atr�s</div>
				</div>			
			</div>
		</div>
	</div>
	<footer>
		<div class="container-fluid p-5">
			<div class="row justify-content-center">
				<div class="col-lg-4 mb-5 mb-lg-0">
					<div class="mb-3">
						<h5>Directory</h5>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing. sit
						amet, consectetur Lorem ipsum dolor sit amet, conse</p>

				</div>
				<div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
					<h5 class="mb-3">Site</h5>
					<ul class="list-unstyled">
						<li><a href="index.html" class="text-muted">Sobre </a></li>
						<li><a href="index.html" class="text-muted">ONGs </a></li>
						<li><a href="index.html" class="text-muted">Fundadores </a></li>
						<li><a href="index.html" class="text-muted">Contato </a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mt-5 mb-lg-0">
					<ul class="list-inline">
						<li class="list-inline-item"><a href="#" target="_blank"
							title="twitter" class="text-hover-primary"
							style="color: #0386A8;"> <i class="fab fa-2x fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a href="#" target="_blank"
							title="facebook" class="text-hover-primary"
							style="color: #0386A8;"> <i class="fab fa-2x fa-facebook"></i>
						</a></li>
						<li class="list-inline-item"><a href="#" target="_blank"
							title="instagram" class="text-hover-primary"
							style="color: #0386A8;"> <i class="fab fa-2x fa-instagram"></i>
						</a></li>
						<li class="list-inline-item"><a href="#" target="_blank"
							title="google" class="text-hover-primary" style="color: #0386A8;">
								<i class="fab fa-2x fa-google"></i>
						</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
					<img src="${uam }" alt="Univercidade Anhembi Morumbi">
				</div>
			</div>
		</div>
		<div class="container-fluid p-1 text-center"
			style="background-color: #0386A8; color: white;">
			<p style="margin-bottom: 0px;">© 2019 Baby Shark. Todos os
				direitos reservados</p>
		</div>
	</footer>
	<!--<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<script src="js/layout.min.js" type="text/javascript"></script>-->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		crossorigin="anonymous"></script>
	<script src="${jquery }" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		crossorigin="anonymous"></script>

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