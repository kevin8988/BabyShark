<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Perfil - Meus Interesses</title>

<s:url value="/resources/img/icon/favicon.ico" var="icon"></s:url>
<s:url value="/resources/css/bootstrap/bootstrap.min.css"
	var="bootstrap"></s:url>
<s:url value="/resources/css/profile/layoutProfile.css" var="layout"></s:url>
<s:url value="/resources/js/home/jquery-3.3.1.min.js" var="jquery"></s:url>

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

<link rel="shortcut icon" type="image/x-icon" href="${icon }">
<link rel="stylesheet" type="text/css" href="${bootstrap }" />
<link rel="stylesheet" type="text/css" href="${layout }" />

</head>
<body>

	<c:import url="/WEB-INF/views/header/header-login.jsp"></c:import>

	<div class="container-fluid container-perfil">
		<div class="row">

			<c:import url="/WEB-INF/views/profile/menu.jsp"></c:import>

			<div class="col-lg-9" id="doacoes">
				<div class="card shadow">
					<div class="card-head p-3">
						<h1>${user.firstName } ${user.lastName }</h1>
					</div>
					<div class="card-body">
						<div class="card w-100" style="border-bottom: 1px solid #dee2e6;">
							<c:if test="${interests.isEmpty() }">
								<p>Nenhum interesse.</p>
							</c:if>

							<c:if test="${!interests.isEmpty() }">
								<c:forEach items="${interests }" var="interest">
									<c:forEach items="${interest.donate.photos }" var="photo"
										begin="0" end="0">
										<a
											href="${s:mvcUrl('DC#donateDetail').arg(0, interest.donate.id).build() }"><img
											class="card-img-top img-detail-2" src="${photo.path }"
											alt="Imagem de capa do card"></a>
									</c:forEach>
									<div class="card-body">
										<h4 class="card-title">Título: ${interest.donate.title }</h4>
										<p class="card-text">Descrição:
											${interest.donate.description }</p>
										<p class="card-text">Doador:
											${interest.donate.user.firstName }
											${interest.donate.user.lastName }</p>
										<c:if test="${interest.status == ACEITO }">
											<p class="card-text">Entre em contato:
											${interest.donate.user.email }</p>
										</c:if>
										<p class="card-text">Status: ${interest.status }</p>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/footer/footer.jsp"></c:import>

	<script src="${jquery }" type="text/javascript"></script>
	<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
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