<!DOCTYPE html>
<html lang="pt-br">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link href="https://fonts.googleapis.com/css?family=Capriola|Montserrat" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<title>Cadastre uma conta</title>
</head>

<body>
	<header class="header">
		<nav class="navbar fixed-top navbar-light navbar-expand-sm bg-light">
			<a class="navbar-brand ml-5" href="${s:mvcUrl('HC#test').build() }">
				<img src="${logo }" width="40" height="40" class="align-left" alt="logo">
			</a>
			<a class="logo_link" style="color: #018BBE" href="#">BabyShark</a>
			<button class="navbar-toggler btn" type="button" data-toggle="collapse"
				data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false"
				aria-label="Alterna navegação">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
				<ul class="navbar-nav ml-auto mr-3 justify-content-end">
					<li class="nav-item active"><a class="nav-link" href="${s:mvcUrl('HC#home').build() }">Home<span
								class="sr-only">(página atual)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="${s:mvcUrl('DC#search').build() }">Doações</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Eventos</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Ajude-nos</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${s:mvcUrl('UC#register').build() }">Cadastre-se</a>
					</li>
				</ul>
				<div class="form-inline my-2 my-lg-0">
					<button
						onclick="window.location.href='${pageContext.servletContext.contextPath}/user/login';return false;"
						class="btn btn-outline-segundary my-2 my-sm-0">
						<i class="fas fa-sign-in-alt mr-1"></i>Login
					</button>
				</div>
			</div>
		</nav>
	</header>

	<form class="form-cadastro">
		<h1 class="">Faça seu cadastro</h1>
		<h3 class="">Preencha os campos abaixo</h3>
		<div class="form-group">
			<label for="nome">Nome</label>
			<input type="text" class="form-control" id="nome" placeholder="Nome" required>
		</div>
		<div class="form-group">
			<label for="sobrenome">Sobrenome</label>
			<input type="text" class="form-control" id="sobrenome" placeholder="Sobrenome" required>
		</div>
		<div class="form-group">
			<label for="cpf">CPF</label>
			<input type="text" class="form-control" id="cpf" placeholder="000.000.000-00" required>
		</div>
		<div class="form-group">
			<label for="email">Email</label>
			<input type="email" class="form-control" id="email" placeholder="exemple@exemple.com" required>
		</div>
		<div class="form-group">
			<label for="senha">Senha</label>
			<input type="password" class="form-control" id="senha" placeholder="******" required>
		</div>
		<div class="form-group">
			<label for="confirmSenha">Confrime a senha</label>
			<input type="password" class="form-control" id="confirmSenha" placeholder="******" required>
		</div>

		<button type="submit" class="btn btn-primary">Entrar</button>
	</form>

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
                        <li class="list-inline-item"><a href="#" target="_blank" title="twitter"
                                class="text-hover-primary" style="color: #0386A8;"> <i class="fab fa-2x fa-twitter"></i>
                            </a></li>
                        <li class="list-inline-item"><a href="#" target="_blank" title="facebook"
                                class="text-hover-primary" style="color: #0386A8;"> <i
                                    class="fab fa-2x fa-facebook"></i>
                            </a></li>
                        <li class="list-inline-item"><a href="#" target="_blank" title="instagram"
                                class="text-hover-primary" style="color: #0386A8;"> <i
                                    class="fab fa-2x fa-instagram"></i>
                            </a></li>
                        <li class="list-inline-item"><a href="#" target="_blank" title="google"
                                class="text-hover-primary" style="color: #0386A8;">
                                <i class="fab fa-2x fa-google"></i>
                            </a></li>
                    </ul>
				</div>
				<div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
					<img src="${uam }" alt="Universidade Anhembi Morumbi">
				</div>
			</div>
		</div>
		<div class="container-fluid p-1 text-center" style="background-color: #0386A8; color: white;">
			<p style="margin-bottom: 0px;">© 2019 Baby Shark. Todos os
				direitos reservados</p>
		</div>
	</footer>
</body>

</html>
<script src="${jquery }" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html>