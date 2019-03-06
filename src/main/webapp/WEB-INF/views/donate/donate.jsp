<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Donate</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<s:url value="/resources/js/home/jquery-3.3.1.min.js" var="jquery"></s:url>
<s:url value="/resources/css/home/layout.css" var="layout"></s:url>
<s:url value="/resources/css/bootstrap/bootstrap.min.css"
	var="bootstrap"></s:url>
<s:url value="/resources/img/home/home.jpg" var="home"></s:url>
<s:url value="/resources/img/home/produto.png" var="produto"></s:url>
<s:url value="/resources/img/home/footer.jpg" var="footer"></s:url>


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


	<c:import url="/WEB-INF/views/header/header.jsp"></c:import>


	<c:import url="/WEB-INF/views/footer/footer.jsp"></c:import>


</body>
</html>