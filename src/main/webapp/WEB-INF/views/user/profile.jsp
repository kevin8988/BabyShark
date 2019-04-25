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
								<a href="${s:mvcUrl('DC#register').build() }">Quero Doar</a>
									 <i class="fas fa-gifts"></i>
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
					<c:if test="${error != null }">
						<i class="alert-danger">${error}</i>
					</c:if>
					<c:if test="${success != null }">
						<i class="alert-success">${success}</i>
					</c:if>
					<div class="card-body">
						<ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="Principal-tab" data-toggle="tab" href="#Principal"
								role="tab" aria-controls="Principal" aria-selected="true">Principal</a>
							</li>
							<li class="nav-item"><a class="nav-link" id="Meus_dados-tab"
								data-toggle="tab" href="#Meus_dados" role="tab"
								aria-controls="Meus_dados" aria-selected="false">Meus dados</a>
							</li>
							<li class="nav-item"><a class="nav-link" id="Endereço-tab"
								data-toggle="tab" href="#Endereço" role="tab"
								aria-controls="Endereço" aria-selected="false">Endereço</a></li>
						</ul>
						<div class="tab-content container" id="myTabContent">
							<div class="tab-pane fade show active" id="Principal"
								role="tabpanel" aria-labelledby="Principal-tab">
								<form:form modelAttribute="user" method="POST" acceptCharset="utf-8"
									action="${s:mvcUrl('UC#updateProcess').build() }">
									<div class="form-group">
										<label for="inputEmail">Email:</label>
										<form:hidden path="id" />
										<form:hidden path="firstName" />
										<form:hidden path="lastName" />
										<form:hidden path="userDetail.fone" />
										<form:hidden path="userDetail.cpf" />
										<form:hidden path="userDetail.dayOfBirth" />
										<form:hidden path="userAddress.city" />
										<form:hidden path="userAddress.state" />

										<form:input class="form-control" id="inputEmail4" path="email" />
										<form:errors class="form-control" path="email"
											cssClass="alert-danger" /><br/>
										<label for="inputEmail">Senha:</label>
										<form:password class="form-control" path="password" value="" />
										<form:errors class="form-control" path="password"
											cssClass="alert-danger" /><br/>
										<label for="inputEmail">Confirme a senha:</label>
										<form:password class="form-control" path="confirmPassword"
											value="" />
										<form:errors class="form-control" path="confirmPassword"
											cssClass="alert-danger" />
									</div>
									<button class="btn" id="Alterar" style="float: right;">
										<h6 style="margin-bottom: 0px;">Alterar</h6>
									</button>
								</form:form>
							</div>
							<div class="tab-pane fade" id="Meus_dados" role="tabpanel"
								aria-labelledby="Meus_dados-tab">
								<form:form modelAttribute="user" method="POST"
									acceptCharset="utf-8"
									action="${s:mvcUrl('UC#updateUserDetail').build() }">
									<form:hidden path="id" />
									<form:hidden path="firstName" />
									<form:hidden path="lastName" />
									<form:hidden path="email" />
									<form:hidden path="userAddress.city" />
									<form:hidden path="userAddress.state" />
									<form:hidden path="userDetail.id" />
									<div class="form-group">
										<label for="inputEmail">Telefone:</label>
										<form:input class="form-control" path="userDetail.fone" />
										<form:errors class="form-control" path="userDetail.fone"
											cssClass="alert-danger" />
									</div>
									<div class="form-group">
										<label for="inputCPF">CPF:</label>
										<form:input class="form-control" path="userDetail.cpf" />
										<form:errors class="form-control" path="userDetail.cpf"
											cssClass="alert-danger" />
									</div>
									<div class="form-group">
										<label for="inputData">Data de Nascimento:</label>
										<form:input class="form-control" path="userDetail.dayOfBirth" />
										<form:errors class="form-control" path="userDetail.dayOfBirth"
											cssClass="alert-danger" />
									</div>
									<button class="btn" id="Alterar" style="float: right;">
										<h6 style="margin-bottom: 0px;">Alterar</h6>
									</button>
								</form:form>
							</div>
							<div class="tab-pane fade" id="Endereço" role="tabpanel"
								aria-labelledby="Endereço-tab">
								<form:form method="POST"
									action="${s:mvcUrl('UC#updateUserAddress').build() }"
									modelAttribute="user" acceptCharset="utf-8">
									<form:hidden path="id" />
									<form:hidden path="firstName" />
									<form:hidden path="lastName" />
									<form:hidden path="email" />
									<form:hidden path="userDetail.fone" />
									<form:hidden path="userDetail.cpf" />
									<form:hidden path="userDetail.dayOfBirth" />
									<form:hidden path="userAddress.id" />
									<div class="form-group">
										<label for="inputEmail">Cidade:</label>
										<form:input class="form-control" path="userAddress.city" />
										<form:errors class="form-control" path="userAddress.city"
											cssClass="alert-danger" />
									</div>
									<div class="form-group">
										<label for="inputCPF">Estado:</label>
										<form:input class="form-control" path="userAddress.state" />
										<form:errors class="form-control" path="userAddress.state"
											cssClass="alert-danger" />
									</div>
									<button class="btn" id="Alterar" style="float: right;">
										<h6 style="margin-bottom: 0px;">Alterar</h6>
									</button>
								</form:form>
							</div>
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