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
<s:url value="/resources/css/donate/donatelayout.css" var="layout"></s:url>

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


	<c:if test="${user == null }">
		<c:import url="/WEB-INF/views/header/header.jsp"></c:import>
	</c:if>
	<c:if test="${user != null }">
		<c:import url="/WEB-INF/views/header/header-login.jsp"></c:import>
	</c:if>


	<div class="container-fluid " style="margin-top: 10%;">
		<div class="row">
			<div class="col-lg-3 col-md-12">
				<div class="menu-pesquisa shadow rounded pt-2 m-2">
					<div class="col-2">
						<form method="get" action="${s:mvcUrl('DC#search').build() }">
							<div class="form-row align-items-center py-3"
								style="width: max-content;">
								<div class="col-9 my-1">
									<input class="form-control" type="search"
										placeholder="Pesquisar" aria-label="Pesquisar" name="search"
										style="width: 160px;">
								</div>
								<div class="col-3 my-1">
									<button class="btn " type="submit" style="">
										<i class="fas fa-search mr-1"></i>
									</button>
								</div>
							</div>
							<h4 style="color: #0386A8;">Categorias</h4>
							<div class="card m-3">
								<div class="card-header" id="headingOne">
									<h5>
										<span>► Sexo</span>
									</h5>
								</div>
								<div aria-labelledby="headingOne"
									data-parent="#containerAcordeon">
									<div class="card-body">
										<c:forEach items="${genders }" var="gender">
											<div class="col mt-1">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input"
														id="${gender.name }" value="${gender.id }" name="gender">
													<label class="custom-control-label"
														style="display: inline-flex;" for="${gender.name }">
														${gender.name } </label>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="card m-3">
								<div class="card-header" id="headingTwo">
									<h5>
										<span>► Itens</span>
									</h5>
								</div>
								<div aria-labelledby="headingTwo"
									data-parent="#containerAcordeon">
									<div class="card-body">
										<c:forEach items="${categories }" var="category">
											<div class="col mt-1">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input"
														id="${category.name }" value="${category.id }"
														name="category"> <label
														class="custom-control-label" style="display: inline-flex;"
														for="${category.name }"> ${category.name } </label>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="card m-3">
								<div class="card-header" id="headingThree">
									<h5>
										<span>► Cor</span>
									</h5>
								</div>
								<div aria-labelledby="headingThree"
									data-parent="#containerAcordeon">
									<div class="card-body">
										<c:forEach items="${colors }" var="color">
											<div class="col mt-1">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input"
														id="${color.name}" name="color" value="${color.id }">
													<label class="custom-control-label"
														style="display: inline-flex;" for="${color.name }">
														${color.name } <i class="fas fa-square ml-2"
														style="color: ${color.nameHexa}; line-height: 1.5rem;"></i>
													</label>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="card m-3">
								<div class="card-header" id="headingFour">
									<h5>
										<span>► Localização</span>
									</h5>
								</div>
								<c:if test="${!addresses.isEmpty() }">
									<div aria-labelledby="headingFour"
										data-parent="#containerAcordeon">
										<div class="card-body">

											<c:forEach items="${addresses }" var="address">
												<div class="col mt-1">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input"
															id="${address}" value="${address}" name="state">
														<label class="custom-control-label"
															style="display: inline-flex;" for="${address}">
															${address} </label>
													</div>
												</div>
											</c:forEach>

										</div>
									</div>
								</c:if>
							</div>
							<button class="btn my-2 my-sm-0 m-3" type="submit">
								<i class="fas fa-search mr-1"></i> Pesquisar
							</button>
						</form>


					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-12">
				<div class="row">
					<!--  
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
-->
					<c:if test="${donates.isEmpty() }">
						<div class="col-lg-4 col-md-12 mb-4">
							<p>Nenhuma doação</p>
						</div>
					</c:if>

					<c:if test="${!donates.isEmpty() }">
						<c:forEach items="${donates }" var="donate">
							<div class="col-lg-4 col-md-12 mb-4">
								<div class="card h-100">
									<c:forEach items="${donate.photos }" var="photo" begin="0"
										end="0">
										<img class="card-img-top" src="${photo.path }"
											alt="Imagem de capa do card">
									</c:forEach>
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
					</c:if>

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