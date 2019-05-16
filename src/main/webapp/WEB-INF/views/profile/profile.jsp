<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<title>Perfil</title>

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

			<c:import url="/WEB-INF/views/user/profileMenu.jsp"></c:import>

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
								<form:form modelAttribute="user" method="POST"
									acceptCharset="utf-8"
									action="${s:mvcUrl('UC#updateProcess').build() }">
									<div class="form-group">
										<label for="inputEmail">Email:</label>
										<form:hidden path="id" />
										<form:hidden path="firstName" />
										<form:hidden path="lastName" />
										<form:hidden path="userDetail.fone" />
										<form:hidden path="userDetail.cpf" />
										<form:hidden path="userDetail.dayOfBirth" />
										<!-- <form:hidden path="userAddress.city" /> -->
										<form:hidden path="userAddress.state" />

										<form:input class="form-control" id="inputEmail4" path="email" />
										<form:errors class="form-control" path="email"
											cssClass="alert-danger" />
										<br /> <label for="inputEmail">Senha:</label>
										<form:password class="form-control" path="password" value="" />
										<form:errors class="form-control" path="password"
											cssClass="alert-danger" />
										<br /> <label for="inputEmail">Confirme a senha:</label>
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
									<!-- <form:hidden path="userAddress.city" /> -->
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
									<!--  
									<div class="form-group">
										<label for="inputEmail">Cidade:</label>
										<form:input class="form-control" path="userAddress.city" />
										<form:errors class="form-control" path="userAddress.city"
											cssClass="alert-danger" />
									</div>
									-->
									<div class="form-group">
										<label for="inputCPF">Estado:</label>
										<form:select path="userAddress.state" class="custom-select">
											<form:option value="" label="Selecione" />
											<form:option value="Acre" label="Acre" />
											<form:option value="Alagoas" label="Alagoas" />
											<form:option value="Amapá" label="Amapá" />
											<form:option value="Amazonas" label="Amazonas" />
											<form:option value="Bahia" label="Bahia" />
											<form:option value="Ceará" label="Ceará" />
											<form:option value="Espírito Santo" label="Espírito Santo" />
											<form:option value="Goiás" label="Goiás" />
											<form:option value="Maranhão" label="Maranhão" />
											<form:option value="Mato Grosso" label="Mato Grosso" />
											<form:option value="Mato Grosso do Sul"
												label="Mato Grosso do Sul" />
											<form:option value="Minas Gerais" label="Minas Gerais" />
											<form:option value="Pará" label="Pará" />
											<form:option value="Paraíba" label="Paraíba" />
											<form:option value="Paraná" label="Paraná" />
											<form:option value="Pernambuco" label="Pernambuco" />
											<form:option value="Rio de Janeiro" label="Rio de Janeiro" />
											<form:option value="Rio Grande do Norte"
												label="Rio Grande do Norte" />
											<form:option value="Rio Grander do Sul"
												label="Rio Grander do Sul" />
											<form:option value="Rondônia" label="Rondônia" />
											<form:option value="Roraima" label="Roraima" />
											<form:option value="Santa Catarina" label="Santa Catarina" />
											<form:option value="São Paulo" label="São Paulo" />
											<form:option value="Sergipe" label="Sergipe" />
											<form:option value="Tocantins" label="Tocantins" />
										</form:select>
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
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html>