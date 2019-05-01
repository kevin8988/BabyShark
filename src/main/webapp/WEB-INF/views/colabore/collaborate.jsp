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
<title>Sobre Nós</title>

<s:url value="/resources/js/home/jquery-3.3.1.min.js" var="jquery"></s:url>
<s:url value="/resources/css/bootstrap/bootstrap.min.css"
	var="bootstrap"></s:url>
<s:url value="/resources/img/icon/favicon.ico" var="icon"></s:url>
<s:url value="/resources/css/colabore/colabore.css" var="layout"></s:url>

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
<body class="content-body">

	<c:if test="${user == null }">
		<c:import url="/WEB-INF/views/header/header.jsp"></c:import>
	</c:if>
	<c:if test="${user != null }">
		<c:import url="/WEB-INF/views/header/header-login.jsp"></c:import>
	</c:if>


	<main class="content-main">
	<div class="title">
		<h1>Colabore conosco</h1>
		<h3>Isso nos serve de incentivo</h3>
	</div>

	<div>
		<h5>Participe! Essa é uma forma de você contriubuir para o
			desenvolvimento do projeto.</h5>
		<p>Uma forma rápida, simples e segura de ser um colaborador do
			BabyShark</p>
	</div>
	<ol>
		<li>
			<p>Para ajudar, você primeiro precisa clicar nesse botãozinho,
				ele vai te redirecionar direto para a nossa página do paypal,
				fazendo que seja uma colaboração segura.</p>
			<form action="https://www.paypal.com/cgi-bin/webscr" method="post"
				target="_top">
				<input type="hidden" name="cmd" value="_s-xclick" /> <input
					type="hidden" name="hosted_button_id" value="45TNWY2WP66VQ" /> <input
					type="image"
					src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif"
					border="0" name="submit"
					title="PayPal - The safer, easier way to pay online!"
					alt="Donate with PayPal button" /> <img alt="" border="0"
					src="https://www.paypal.com/en_BR/i/scr/pixel.gif" width="1"
					height="1" />
			</form>
		</li>

		<li>
			<p>Depois é simples, basta escolher o valor que deseja doar para
				nós.</p>
		</li>
	</ol>
	</main>


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