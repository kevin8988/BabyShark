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
<s:url value="/resources/css/donate/donatelayout.css" var="layout"></s:url>
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
	<c:if test="${user == null }">
		<c:import url="/WEB-INF/views/header/header.jsp"></c:import>
	</c:if>
	<c:if test="${user != null }">
		<c:import url="/WEB-INF/views/header/header-login.jsp"></c:import>
	</c:if>

	<div class="container-fluid " style="margin-top: 10%;">
		<form:form method="GET" action="${s:mvcUrl('EC#events').build() }">
			<div class="row">
				<div class="col-lg-12">
					<div class="card text-center m-3">
						<div class="card-body">
							<div class="form-group row justify-content-center"
								style="margin-bottom: 0px;">

								<label for="exampleFormControlSelect1" class="mx-2"
									style="line-height: 2.5;">Estado:</label> <select
									class="form-control" style="width: 9%;"
									id="exampleFormControlSelect1" name="state">
									<option value="">Selecione</option>
									<option value="São Paulo">SP</option>
									<option>RJ</option>
									<option>BA</option>
									<option>MG</option>
									<option>SC</option>
								</select> <label for="exampleFormControlSelect1" class="mx-2"
									style="line-height: 2.5;">Cidades:</label> <select
									class="form-control " style="width: 15%;"
									id="exampleFormControlSelect1" name="city">
									<option value="">Selecione</option>
									<option value="São Paulo">São Paulo</option>
									<option>Rio</option>
									<option>Salvador</option>
									<option>Jundíai</option>
									<option>Curitiba</option>
								</select>

								<!--<label for="pesquisa" class="mx-2">Pesquisar</label>-->
								<input type="text" class="form-control w-25 ml-2" id="pesquisa"
									aria-describedby="pesquisa" name="text">

								<button class="btn my-2 my-sm-0 m-3" type="submit">
									<i class="fas fa-search mr-1"></i> Pesquisar
								</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>
		<c:if test="${events.isEmpty() || events == null }">
				<p>Não há eventos!</p>
			</c:if>
		<div class="row">
			<c:if test="${!events.isEmpty() }">
				<c:forEach items="${events }" var="event">
					<div class="col-lg-4">
						<div class="card text-center carde m-3">
							<div class="card-body">
								<h5 class="card-title">${event.title }</h5>
								<p class="card-text">${event.description }</p>
								<a href="#" class="btn btn-primary">Ver Mais</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			
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