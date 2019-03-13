<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Doações</title>

<s:url value="/resources/js/home/jquery-3.3.1.min.js" var="jquery"></s:url>
<s:url value="/resources/css/bootstrap/bootstrap.min.css"
	var="bootstrap"></s:url>
<s:url value="/resources/img/icon/favicon.ico" var="icon"></s:url>
<s:url value="/resources/css/donate/layoutDoacao.css" var="layout"></s:url>

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


<script>
	//Loader
	window.addEventListener('DOMContentLoaded', function() {
		setTimeout(function() {
			$('#loading').fadeOut('slow', function() {
				$(window).scrollTop(0);
				$(this).remove();
			});
		}, 500);
	});
	//Fim do Loader
</script>

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

	<c:import url="/WEB-INF/views/header/header-login.jsp"></c:import>

	<div class="container-fluid " style="margin-top: 10%;">
		<div class="row">
			<div class="col-lg-3 col-md-12">
				<div class="menu-pesquisa shadow rounded pt-5 m-2">
					<div class="col-2">
						<h4 style="color: #0386A8;">Categorias</h4>
						<div class="card m-3">
							<div class="card-header" id="headingOne" data-toggle="collapse"
								data-target="#collapseSexo" aria-expanded="true"
								aria-controls="collapseSexo">
								<h5><span>► Sexo</span></h5>
							</div>
							<div id="collapseSexo" class="collapse"
								aria-labelledby="headingOne" data-parent="#containerAcordeon">
								<div class="card-body">
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="menino"> <label class="custom-control-label"
												style="display: inline-flex;" for="menino"> Meninos
												<i class="fas fa-male ml-2"
												style="color: #0386A8; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="menina"> <label class="custom-control-label"
												style="display: inline-flex;" for="menina"> Meninas<i
												class="fas fa-female ml-2"
												style="color: #0386A8; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card m-3">
							<div class="card-header" id="headingTwo" data-toggle="collapse"
								data-target="#collapseItens" aria-expanded="true"
								aria-controls="collapseItens">
								<h5><span>► Itens</span></h5>
							</div>
							<div id="collapseItens" class="collapse"
								aria-labelledby="headingTwo" data-parent="#containerAcordeon">
								<div class="card-body">
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="berco"> <label class="custom-control-label"
												style="display: inline-flex;" for="berco"> Berço <i
												class="fas fa-bed ml-2"
												style="color: #0386A8; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="roupa"> <label class="custom-control-label"
												style="display: inline-flex;" for="roupa"> Roupas <i
												class="fas fa-baby ml-2"
												style="color: #0386A8; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="comoda"> <label class="custom-control-label"
												style="display: inline-flex;" for="comoda"> Cômoda <i
												class="fas fa-archive ml-2"
												style="color: #0386A8; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card m-3">
							<div class="card-header" id="headingThree" data-toggle="collapse"
								data-target="#collapseCor" aria-expanded="true"
								aria-controls="collapseCor">
								<h5><span>► Cor</span></h5>
							</div>
							<div id="collapseCor" class="collapse"
								aria-labelledby="headingThree" data-parent="#containerAcordeon">
								<div class="card-body">
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="amarelo"> <label class="custom-control-label"
												style="display: inline-flex;" for="amarelo"> Amarelo
												<i class="fas fa-square ml-2"
												style="color: yellow; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" id="azul">
											<label class="custom-control-label"
												style="display: inline-flex;" for="azul"> Azul <i
												class="fas fa-square ml-2"
												style="color: blue; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" id="bege">
											<label class="custom-control-label"
												style="display: inline-flex;" for="bege"> Bege <i
												class="fas fa-square ml-2"
												style="color: #EAEAB4; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="branco"> <label class="custom-control-label"
												style="display: inline-flex;" for="branco"> Branco <i
												class="far fa-square ml-2"
												style="color: gray; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="cinza"> <label class="custom-control-label"
												style="display: inline-flex;" for="cinza"> Cinza <i
												class="fas fa-square ml-2"
												style="color: grey; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="marron"> <label class="custom-control-label"
												style="display: inline-flex;" for="marron"> Marron <i
												class="fas fa-square ml-2"
												style="color: #bf8040; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" id="rosa">
											<label class="custom-control-label"
												style="display: inline-flex;" for="rosa"> Rosa <i
												class="fas fa-square ml-2"
												style="color: pink; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="verde"> <label class="custom-control-label"
												style="display: inline-flex;" for="verde"> Verde <i
												class="fas fa-square ml-2"
												style="color: green; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="vermelho"> <label class="custom-control-label"
												style="display: inline-flex;" for="vermelho">
												Vermelho <i class="fas fa-square ml-2"
												style="color: red; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
									<div class="col mt-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="outras"> <label class="custom-control-label"
												style="display: inline-flex;" for="outras"> Outras <i
												class="fas fa-square ml-2"
												style="color: black; line-height: 1.5rem;"></i>
											</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<button class="btn my-2 my-sm-0 m-3" type="submit">
							<i class="fas fa-search mr-1"></i> Pesquisar
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-12">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div id="carouselExampleIndicators" class="carousel slide my-4"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner" role="listbox">
								<div class="carousel-item active">
									<img class="d-block img-fluid"
										src="http://placehold.it/900x350" alt="First slide">
								</div>
								<div class="carousel-item">
									<img class="d-block img-fluid"
										src="http://placehold.it/900x350" alt="Second slide">
								</div>
								<div class="carousel-item">
									<img class="d-block img-fluid"
										src="http://placehold.it/900x350" alt="Third slide">
								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<c:forEach items="${donates }" var="donate">
						<div class="col-lg-4 col-md-12 mb-4">
							<div class="card h-100">
								<a
									href="#"><img
									class="card-img-top" src="#"
									alt="Imagem de capa do card"></a>
								<div class="card-body">
									<h4 class="card-title">${donate.title }</h4>									
									<p class="card-text">${donate.description }</p>									
								</div>
								<div class="card-footer">
									<button class="btn btn-outline-segundary">Ver mais</button>
								</div>
							</div>
						</div>


					</c:forEach>
				</div>
			</div>
		</div>
		<nav class="mt-2" aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1" aria-disabled="true">Anterior</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Proximo</a>
				</li>
			</ul>
		</nav>
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
</body>
</html>