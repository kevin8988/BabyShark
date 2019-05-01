<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<s:url value="/resources/img/home/uam.png" var="uam"></s:url>
</head>
<body>

	<footer class="footer">
		<div class="container-fluid p-5">
			<div class="row justify-content-center">
				<div class="col-lg-4 mb-5 mb-lg-0">
					<div class="mb-3">
						<h5>Directory</h5>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing. sit
						amet, consectetur Lorem ipsum dolor sit amet, conse</p>

				</div>
				<div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
					<h5 class="mb-3">Site</h5>
					<ul class="list-unstyled">
						<li><a href="index.html" class="text-muted">Sobre </a></li>
						<li><a href="index.html" class="text-muted">Fundadores </a></li>
						<li><a href="index.html" class="text-muted">Contato </a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mt-5 mb-lg-0">
					<ul class="list-inline">
						<li class="list-inline-item"><a href="#" target="_blank"
							title="twitter" class="text-hover-primary"
							style="color: #0386A8;"> <i class="fab fa-2x fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a href="#" target="_blank"
							title="facebook" class="text-hover-primary"
							style="color: #0386A8;"> <i class="fab fa-2x fa-facebook"></i>
						</a></li>
						<li class="list-inline-item"><a href="#" target="_blank"
							title="instagram" class="text-hover-primary"
							style="color: #0386A8;"> <i class="fab fa-2x fa-instagram"></i>
						</a></li>
						<li class="list-inline-item"><a href="#" target="_blank"
							title="google" class="text-hover-primary" style="color: #0386A8;">
								<i class="fab fa-2x fa-google"></i>
						</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
					<img src="${uam }" alt="Univercidade Anhembi Morumbi">
				</div>
			</div>
		</div>
		<div class="container-fluid p-1 text-center"
			style="background-color: #0386A8; color: white;">
			<p style="margin-bottom: 0px;">Â© 2019 Baby Shark. Todos os
				direitos reservados</p>
		</div>
	</footer>

</body>
</html>