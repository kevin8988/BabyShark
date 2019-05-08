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
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Detalhes</title>

<s:url value="/resources/js/home/jquery-3.3.1.min.js" var="jquery"></s:url>
<s:url value="/resources/css/bootstrap/bootstrap.min.css"
	var="bootstrap"></s:url>
<s:url value="/resources/img/icon/favicon.ico" var="icon"></s:url>
<s:url value="/resources/css/donate/donatelayout.css" var="layout"></s:url>

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


</head>
<body>

	<c:if test="${user == null }">
		<c:import url="/WEB-INF/views/header/header.jsp"></c:import>
	</c:if>
	<c:if test="${user != null }">
		<c:import url="/WEB-INF/views/header/header-login.jsp"></c:import>
	</c:if>

	<c:if test="${donateDetail == null }">
		<div class="container-fluid mt-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 shadow" style="background-color: white;">
					<div class="text-center my-3">
						<h1>Doação não encontrada!</h1>
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<c:if test="${donateDetail != null }">
		<div class="container-fluid mt-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 shadow" style="background-color: white;">
					<div class="text-center my-3">
						<h1>Você se interessou por este enxoval?</h1>
					</div>
					<div class="row p-3 mb-3">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<c:forEach items="${donateDetail.photos }" var="photo" begin="0"
									end="0">
									<div class="carousel-item active">
										<img class="d-block w-100 img-detail-2" height="400"
											src="${photo.path }">
									</div>
								</c:forEach>

								<c:forEach items="${donateDetail.photos }" var="photo" begin="1">
									<div class="carousel-item">
										<img class="d-block w-100 img-detail" height="400"
											src="${photo.path }">
									</div>
								</c:forEach>

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
					<div class="row p-3 m-1" style="border-bottom: 1px dashed #0386A8;">
						<div class="col-lg-12 ">
							<h5>Nome:</h5>
							<p class="ml-4">${donateDetail.title}</p>
							<h5>Categoria:</h5>
							<c:forEach items="${donateDetail.categories}" var="category">
								<p class="ml-4">${category.name }</p>
							</c:forEach>
							<h5>Gênero:</h5>
							<p class="ml-4">${donateDetail.gender.name}</p>
							<h5>Cor:</h5>
							<p class="ml-4">${donateDetail.color.name}
								<i class="fas fa-square ml-2"
									style="color: ${donateDetail.color.nameHexa}; line-height: 1.5rem;"></i>
							</p>

							<h5>Descrição:</h5>
							<p class="ml-4">${donateDetail.description}</p>
							<h5>Nome do Doador:</h5>
							<p class="ml-4">${donateDetail.user.firstName}
								${donateDetail.user.lastName}</p>
							<h5>Localização:</h5>
							<p class="ml-4">${donateDetail.user.userAddress.state}</p>
						</div>
					</div>
					<c:if test="${user != null }">
						<div class="row justify-content-center p-3">
							<form:form method="POST" modelAttribute="interest"
								action="${s:mvcUrl('DC#donateInterest').build() }">
								<div class="col-lg-12 my-3">
									<div>
										<h5>Solicitação</h5>
										<p>Nós da BabyShark® gostariamos que redigisse uma carta
											para o doador deste produto. Explicando o porquê do seu
											interesse, qual a sua situação e o porque está precisando
											desta doação. Tente ser o mais claro e sincero possível.</p>
									</div>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text">Carta para o Doador</span>
										</div>
										<form:textarea cssClass= "form-control" rows="8" path="message" />
										<form:hidden path="user.id" value = "${user.id }"/>
										<form:hidden path="donate.id" value = "${donateDetail.id }"/>
									</div>
								</div>
								<button class="btn btn-outline-segundary">Enviar</button>
							</form:form>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</c:if>

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