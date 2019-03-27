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

	<div class="container-fluid container-perfil">
		<div class="row">
			<div class="col-lg-3">
				<div class="card shadow" style="text-align: center;">
					<div class="card-head">
						<img class="img-fluid rounded-circle center m-3"
							src="https://kcl-mrcdtp.com/wp-content/uploads/sites/201/2017/05/person_icongray-300x300.png"
							width="250" height="250" alt="First slide">
					</div>
					<div class="card-body m-3">
						<div class="row">
							<a href=""><h4>
									<i class="fas fa-database"></i>Dados
								</h4></a>
						</div>
						<div class="row">
							<a href=""><h4>
									<i class="fas fa-gifts"></i>Doações
								</h4></a>
						</div>
						<div class="row">
							<a href=""><h4>
									<i class="fas fa-heart"></i>Interesses
								</h4></a>
						</div>
						<div class="row mt-3">
							<button class="btn">
								<h4 style="margin-bottom: 0px;">
									Quero Doar <i class="fas fa-gifts"></i>
								</h4>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="card shadow">
					<div class="card-head p-3">
						<h1>${user.firstName } ${user.lastName }</h1>
					</div>
					<div class="card-body">
						<form:form class="needs-validation" modelAttribute="user"
							method="POST" action="registerProcess">
							<div class="form-group">
								<label for="inputEmail">Email:</label>
								<form:input class="form-control" id="inputEmail4"
									onchange="verifica_valor(this)" path="email" />
							</div>
							<div class="form-group">
								<label for="inputCPF">CPF:</label>
								<form:input class="form-control" id="inputCPF"
									onchange="verifica_valor(this)" path="cpf" />
							</div>
							<div class="form-group">
								<label for="inputPassword">Senha:</label>
								<form:password class="form-control" id="inputPassword"
									onchange="verifica_valor(this)" path="password" />
							</div>
							<div class="form-group">
								<label for="inputConfirmPassword">Confime a senha:</label>
								<form:password class="form-control" id="inputConfirmPassword"
									onchange="verifica_valor(this)" path="confirmPassword" />
							</div>
							<button class="btn" id="Alterar" style="float: right;" disabled>
								<h6 style="margin-bottom: 0px;">Alterar</h6>
							</button>
						</form:form>
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