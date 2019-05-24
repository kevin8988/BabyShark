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
<title>Cadastro - Evento</title>

<s:url value="/resources/js/home/jquery-3.3.1.min.js" var="jquery"></s:url>
<s:url value="/resources/css/bootstrap/bootstrap.min.css"
	var="bootstrap"></s:url>
<s:url value="/resources/img/icon/favicon.ico" var="icon"></s:url>
<s:url value="/resources/css/donate/layoutCadastro.css" var="layout"></s:url>

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
	<div class="container p-3 mb-5"
		style="background: white; margin-top: 10%;">
		<div class="row form-group">
			<div class="col-12">
				<ul
					class="nav justify-content-center nav-tabs nav-fill thumbnail setup-panel">
					<li class="nav-item active"><a class="nav-link" href="#step-1">
							<h4 class="list-group-item-heading">Escolha</h4>
							<p class="list-group-item-text">Como você vai criar seu
								evento?</p>
					</a></li>
					<li class="nav-item disabled"><a class="nav-link"
						href="#step-2">
							<h4 class="list-group-item-heading">Tags</h4>
							<p class="list-group-item-text">Descreva o seu evento!</p>
					</a></li>
					<li class="nav-item disabled"><a class="nav-link"
						href="#step-3">
							<h4 class="list-group-item-heading">Conclusão</h4>
							<p class="list-group-item-text">Confirme o seu evento</p>
					</a></li>
				</ul>
			</div>
		</div>
		<!--EVENTOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO-->
		<div class="row setup-content p-4" id="step-2">
			<div class="col-12">
				<div class="col-md-12 well">
					<h2>Descreva tudo sobre o seu evento</h2>
					<p>Lorem ipsum dolor sit amet.</p>
					<form:form method="POST"
						action="${s:mvcUrl('ECR#registerProcess').build() }"
						modelAttribute="event">
						<div class="form-group">
							<label for="inputTitulo">Título</label>
							<form:input path="title" id="inputTitulo" cssClass="form-control" />
							<form:errors path="title" cssClass="alert-danger" />
						</div>
						<div class="mb-3">
							<label for="validationTextarea">Descrição</label>
							<form:textarea path="description" id="validationTextarea"
								cssClass="form-control" />
							<form:errors path="description" cssClass="alert-danger" />
						</div>

						<div class="form-row">
							<div class="form-group col-md-4">
								<label for="data">Escolha a data do evento:</label>
								<form:input path="dayOfEvent" id="data" cssClass="form-control" />
								<form:errors path="dayOfEvent" cssClass="alert-danger" />
							</div>

							<div class="form-group col-md-4">
								<label for="initialHour">Escolha a hora de início do
									evento:</label> <input type="time" name="initial" id="initialHour"
									class="form-control"> <p class="alert-danger">${erro }</p>
							</div>

							<div class="form-group col-md-4">
								<label for="endHour">Escolha a hora de fim do evento:</label> <input
									type="time" name="end" id="endHour" class="form-control">
								<p class="alert-danger">${erro2 }</p>
							</div>

						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEstado">Estado</label>
								<form:select path="eventAddress.state" class="custom-select"
									id="inputEstado">
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
								<form:errors class="form-control" path="eventAddress.state"
									cssClass="alert-danger" />
							</div>
							<div class="form-group col-md-4">
								<label for="inputCidade">Cidade</label>
								<form:select path="eventAddress.city" class="custom-select"
									id="inputEstado">
									<form:option value="" label="Selecione" />
									<form:option value="São Paulo" label="São Paulo" />
								</form:select>
								<form:errors class="form-control" path="eventAddress.city"
									cssClass="alert-danger" />
							</div>
							<div class="form-group col-md-2">
								<label for="inputCEP">CEP</label>
								<form:input path="eventAddress.postalCode" id="inputCEP"
									cssClass="form-control" />
								<form:errors path="eventAddress.postalCode"
									cssClass="alert-danger" />
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEndereco">Endereço</label>
								<form:input path="eventAddress.street" id="inputEndereco"
									cssClass="form-control" />
								<form:errors path="eventAddress.street" cssClass="alert-danger" />
							</div>
							<div class="form-group col-md-5">
								<label for="inputBairro">Bairro</label>
								<form:input path="eventAddress.district" id="inputBairro"
									cssClass="form-control" />
								<form:errors path="eventAddress.district"
									cssClass="alert-danger" />
							</div>
							<div class="form-group col-md-1">
								<label for="inputNumero">Número</label>
								<form:input path="eventAddress.number" id="inputNumero"
									cssClass="form-control" />
								<form:errors path="eventAddress.number" cssClass="alert-danger" />
							</div>
						</div>
						<button id="activate-step-3" class="btn btn-primary btn-lg">Cadastrar</button>
					</form:form>

				</div>
			</div>
		</div>
		<div class="row setup-content p-4" id="step-3">
			<div class="col-12">
				<div class="col-md-12 well">
					<h1 class="text-center">Conclusão</h1>
				</div>
			</div>
		</div>
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