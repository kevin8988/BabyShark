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
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<s:url value="/resources/img/icon/favicon.ico" var="icon"></s:url>
<s:url value="/resources/css/bootstrap/bootstrap.min.css"
	var="bootstrap"></s:url>
<s:url value="/resources/css/profile/layoutProfile.css" var="layout"></s:url>
<s:url value="/resources/js/home/jquery-3.3.1.min.js" var="jquery"></s:url>

<link rel="shortcut icon" type="image/x-icon" href="${icon }">
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

<link href="${bootstrap }" rel="stylesheet" />
<link href="${layout }" rel="stylesheet" />

<title>Profile</title>
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

	var ultimovalor = document.getElementId("#inputEmail").value;

	function verifica_valor(element) {
		if (ultimovalor != element.value) {
			document.getElementById("Alterar").disabled = false;
		}
	}

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

	<c:import url="/WEB-INF/views/header/header-login.jsp"></c:import>

	<div class="container-fluid container-perfil">
		<div class="row">


			<c:import url="/WEB-INF/views/user/profileMenu.jsp"></c:import>


			<div class="col-lg-9" id="doacoes">
				<div class="card shadow">
					<div class="card-head p-3">
						<h1>${user.firstName } ${user.lastName }</h1>
					</div>
					<div class="card-body">
						<div class="card w-100" style="border-bottom: 1px solid #dee2e6;">
							<c:if test="${interests.isEmpty() }">
								<p>Nenhum interesse em suas doações.</p>
							</c:if>
							<c:if test="${!interests.isEmpty() }">
								<c:forEach items="${interests }" var="interest">

									<div class="card-body">
										<h5 class="card-title">Título: ${interest.donate.title }</h5>
										<p class="card-text">Interessado:
											${interest.user.firstName }</p>
										<p class="card-text">Mensagem: ${interest.message }</p>
										<div class="row">
											<form:form
												action="${s:mvcUrl('IC#acceptDonate').arg(0, interest.id.userId).arg(1,interest.id.donateId).build() }"
												method="POST" class="mr-2">
												<button class="btn btn-outline-segundary">Aceitar</button>
											</form:form>
											<form:form
												action="${s:mvcUrl('IC#declineDonate').arg(0, interest.id.userId).arg(1,interest.id.donateId).build() }"
												method="POST" class="mr-2" modelAttribute="${ interest}">
												<button class="btn btn-outline-segundary">Recusar</button>
											</form:form>
										</div>
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
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		crossorigin="anonymous"></script>
</body>

</html>