<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Eventos</title>

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

	<c:if test="${user == null }">
		<c:import url="/WEB-INF/views/header/header.jsp"></c:import>
	</c:if>
	<c:if test="${user != null }">
		<c:import url="/WEB-INF/views/header/header-login.jsp"></c:import>
	</c:if>

	<div class="container-fluid ">
		<form:form method="GET" action="${s:mvcUrl('EC#events').build() }">
			<div class="row">
				<div class="col-lg-12">
					<div class="card text-center m-3">
						<div class="card-body">
							<div class="form-group row justify-content-center"
								style="margin-bottom: 0px;">
								<div class="col-lg-3 col-md-12 ">
									<label for="pesquisa" class="mx-2">Buscar</label> <input
										type="text" class="form-control" id="pesquisa"
										aria-describedby="pesquisa" name="text"
										placeholder="Buscar Evento">
								</div>
								<div class="col-lg-3 col-md-12">
									<label for="exampleFormControlSelect1" class="mx-2">Estado:</label>
									<select class="form-control" id="exampleFormControlSelect1"
										name="state">
										<option value="" label="Selecione" />
										<option value="AC" label="Acre" />
										<option value="AL" label="Alagoas" />
										<option value="AP" label="Amapá" />
										<option value="AM" label="Amazonas" />
										<option value="BA" label="Bahia" />
										<option value="CE" label="Ceará" />
										<option value="DF" label="Distrito Federal" />
										<option value="ES" label="Espírito Santo" />										
										<option value="GO" label="Goiás" />
										<option value="MA" label="Maranhão" />
										<option value="MT" label="Mato Grosso" />
										<option value="MS" label="Mato Grosso do Sul" />
										<option value="MG" label="Minas Gerais" />
										<option value="PA" label="Pará" />
										<option value="PB" label="Paraíba" />
										<option value="PR" label="Paraná" />
										<option value="PE" label="Pernambuco" />
										<option value="PI" label="Piauí" />
										<option value="RJ" label="Rio de Janeiro" />
										<option value="RN"
											label="Rio Grande do Norte" />
										<option value="RS" label="Rio Grande do Sul" />
										<option value="RO" label="Rondônia" />
										<option value="RR" label="Roraima" />
										<option value="SC" label="Santa Catarina" />
										<option value="SP" label="São Paulo" />
										<option value="SE" label="Sergipe" />
										<option value="TO" label="Tocantins" />
									</select>
								</div>
								<div class="col-lg-3 col-md-12">
									<label for="exampleFormControlSelect1" class="mx-2">Cidades:</label>
									<select class="form-control " id="exampleFormControlSelect1"
										name="city">
										<option value="">Selecione</option>
										<option value="São Paulo">São Paulo</option>										
									</select>
								</div>
								<div class="col-lg-3 col-md-12 my-4">
									<button class="btn my-2 my-sm-0 m-3" type="submit">
										<i class="fas fa-search mr-1"></i> Pesquisar
									</button>
								</div>
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
								<form:form method="POST"
									action="${s:mvcUrl('EC#detail').arg(0, event.id).build() }">
									<button class="btn btn-primary">Visitar</button>
								</form:form>
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