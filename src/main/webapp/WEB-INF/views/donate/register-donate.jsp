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
<title>Cadastro - Doação</title>

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

<!--  
<script> 
		window.onload = function() {
	
		    var navListItems = $('ul.setup-panel li a'),
		        allWells = $('.setup-content');

		    allWells.hide();

		    navListItems.click(function(e)
		    {
		        e.preventDefault();
		        var $target = $($(this).attr('href')),
		            $item = $(this).closest('li');
		        
		        if (!$item.hasClass('disabled')) {
		            navListItems.closest('li').removeClass('active');
		            $item.addClass('active');
		            allWells.hide();
		            $target.show();
		        }
		    });
		    
		    $('ul.setup-panel li.active a').trigger('click');
		    
		    // DEMO ONLY //
		    $('#activate-step-2').on('click', function(e) {
		        $('ul.setup-panel li:eq(1)').removeClass('disabled');
		        $('ul.setup-panel li a[href="#step-2"]').trigger('click');
		        $(this).remove();
		    })   
		    $('#activate-step-3').on('click', function(e) {
		        $('ul.setup-panel li:eq(2)').removeClass('disabled');
		        $('ul.setup-panel li a[href="#step-3"]').trigger('click');
		        $(this).remove();
		    })  
		};

</script> 
-->
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
							<p class="list-group-item-text">Como você vai doar?</p>
					</a></li>
					<li class="nav-item disabled"><a class="nav-link"
						href="#step-2">
							<h4 class="list-group-item-heading">Tags</h4>
							<p class="list-group-item-text">Descreva o seu produto!</p>
					</a></li>
					<li class="nav-item disabled"><a class="nav-link"
						href="#step-3">
							<h4 class="list-group-item-heading">Conclusão</h4>
							<p class="list-group-item-text">Confirme o seu anúncio</p>
					</a></li>
				</ul>
			</div>
		</div>
		<!--
		<div class="row setup-content p-4" id="step-1">
			<div class="col-12">
				<div class="col-md-12 well text-center">
					<h2>Escolha o que você quer anunciar</h2>
					<p>Lorem ipsum dolor sit amet.</p>
					<div class="row my-3">
						<div class="col-lg-6">
							<div class="card p-5">
								<h1>Enxoval</h1>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card p-5">
								<h1>Evento</h1>
							</div>
						</div>
					</div>
					<button id="activate-step-2" class="btn">Próximo</button>
				</div>
			</div>
		</div>
		  -->
		<div class="row setup-content p-4" id="step-2">
			<div class="col-12">
				<div class="col-md-12 well ">
					<h2>Descreva sobre o enxoval que está doando</h2>
					<p>Lorem ipsum dolor sit amet.</p>
					<form:form
						action="${s:mvcUrl('DCR#registerProcessDonate').build() }"
						method="POST" modelAttribute="donate"
						enctype="multipart/form-data">
						<div class="mb-3">
							<label for="validationTextarea">Título:</label>
							<form:input path="title" cssClass="form-control" />
							<form:errors path="title" cssClass="alert-danger" />
						</div>

						<div class="mb-3">
							<label for="validationDescription">Descrição:</label>
							<form:textarea path="description" cssClass="form-control"
								id="validationDescription" />
							<form:errors path="description" cssClass="alert-danger" />
						</div>

						<div class="mb-3">
							<label for="validationInformation">Informações
								Adicionais:</label>
							<form:textarea path="informations" cssClass="form-control"
								id="validationInformation" />
							<form:errors path="informations" cssClass="alert-danger" />
						</div>

						<div class="mb-3">
							<label for="validationSexo">Sexo:</label>
							<div class="form-group">
								<form:select path="gender.id" cssClass="custom-select">
									<form:option value="">Selecione</form:option>
									<c:forEach items="${genders }" var="gender">
										<form:option value="${gender.id }">${gender.name }</form:option>
									</c:forEach>
								</form:select>
								<form:errors path="gender" cssClass="alert-danger" />
							</div>
						</div>
						<div class="mb-3">
							<label for="validationCor">Cor:</label>
							<div class="form-group">
								<form:select class="custom-select" path="color.id">
									<form:option value="">Selecione</form:option>
									<c:forEach items="${colors }" var="color">
										<form:option value="${color.id }">${color.name }</form:option>
									</c:forEach>
								</form:select>
								<form:errors path="color" cssClass="alert-danger" />
							</div>
						</div>

						<div class="mb-3">
							<label for="validationCategoria">Categorias:</label>
							<div class="form-group">
								<c:forEach items="${categories }" var="category"
									varStatus="status">
									<form:checkbox path="categories[${status.index}].id"
										value="${category.id }" />
									<label>${category.name }</label>
								</c:forEach><br/>
								<form:errors path="categories" cssClass="alert-danger" />
							</div>
						</div>

						<!--<div class="custom-file mb-3">
						    <input type="file" class="custom-file-input" id="validatedCustomFile" required>
						    <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
						    <div class="invalid-feedback">Fotos do enxoval</div>
						  </div>-->
						<div class="input-default-wrapper ">
							<input name="foto" type="file">
							<c:if test="${erroPhoto != null }">
								<br/>
								<label class="alert-danger">${erroPhoto }</label>
							</c:if>
						</div>
						<form:hidden path="id"/>
						<button id="activate-step-3" class="btn mt-4">Cadastrar</button>
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