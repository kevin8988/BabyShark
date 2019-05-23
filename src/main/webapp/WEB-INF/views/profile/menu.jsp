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
</head>
<body>

	<div class="col-lg-3">
		<div class="card shadow" style="text-align: center;">
			<div class="card-head">
				<img class="img-fluid rounded-circle center m-3"
					src="https://kcl-mrcdtp.com/wp-content/uploads/sites/201/2017/05/person_icongray-300x300.png"
					width="250" height="250" alt="First slide">
			</div>
			<div class="card-body m-3">
				<div class="row">
					<a href="${s:mvcUrl('UC#profile').build() }"><h4>
							<i class="fas fa-database"></i>Dados
						</h4></a>
				</div>
				<div class="row">
					<a href="${s:mvcUrl('UC#profileDonates').build() }"><h4>
							<i class="fas fa-gifts"></i>Doações
						</h4></a>
				</div>
				<div class="row">
					<a href="${s:mvcUrl('UC#profileInterests').build() }"><h4>
							<i class="fas fa-heart"></i>Interesses
						</h4></a>
				</div>
				<div class="row">
					<a href="${s:mvcUrl('UC#profileDonateInterests').build() }"><h4>
							<i class="fas fa-thumbs-up"></i>Interessados
						</h4></a>
				</div>
				<div class="row mt-3">
					<button class="btn">
						<h4 style="margin-bottom: 0px;">
							<a href="${s:mvcUrl('DCR#registerDonate').build() }">Quero
								Doar</a> <i class="fas fa-gifts"></i>
						</h4>
					</button>

				</div>
				<div class="row mt-3">
					<button class="btn">
						<h4 style="margin-bottom: 0px;">
							<a href="${s:mvcUrl('ECR#register').build() }">Criar Evento</a> <i
								class="fas fa-gifts"></i>
						</h4>
					</button>
				</div>
			</div>
		</div>
	</div>

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