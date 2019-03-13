<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Doações</title>

		<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

		<meta charset="utf-8">
	   	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

		<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="css/layoutDoacao.css"/>
		<link href="https://fonts.googleapis.com/css?family=Capriola" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/css/swiper.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/css/swiper.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">


		<script> 
			//Loader
			window.addEventListener('DOMContentLoaded', function(){
			    setTimeout(function(){
			     	$('#loading').fadeOut('slow', function() {
			      	$(window).scrollTop(0);
			      	$(this).remove();
			    	});
			    }, 500);		               
			});
			//Fim do Loader
		</script> 

	</head>
	<body>
		<!-- Pre-Loader -->
	    <div class="pre-loader" id="loading">
	        <div id="loading-center">
	            <div id="loading-center-absolute">
	                <div class="object" id="object_four"></div> <!-- nome do gif -->
	                <div class="object" id="object_three"></div>
	                <div class="object" id="object_two"></div>
	                <div class="object" id="object_one"></div>
	            </div>
	        </div>
	    </div>
		<!--importar Cabeçalho-->
		<header>
			<nav class="navbar fixed-top navbar-light navbar-expand-sm bg-light">
				<a class="navbar-brand ml-5" href="#">
					<img src="img\logo.png" width="40" height="40" class="align-left" alt="logo">
				    <a class="h3 mt-1" href="">Baby<a class="h3 mt-1" style="color: #018BBE;">Shark</a></a>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
				    <span class="navbar-toggler-icon"></span>
				</button>				
				<div class="collapse navbar-collapse" id="conteudoNavbarSuportado" >
				    <ul class="navbar-nav ml-auto mr-3 justify-content-end">
				      <li class="nav-item">
				        <a class="nav-link" href="#">Home</a>
				      </li>
				      <li class="nav-item active">
				        <a class="nav-link" href="#">Doações<span class="sr-only">(página atual)</span></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="#">Eventos</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="#">Ajude-nos</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="#">Cadastre-se</a>
				      </li>
				    </ul>
				    <!--<form class="form-inline my-2 my-lg-0">				       
				       <button class="btn btn-outline-segundary my-2 my-sm-0"><i class="fas fa-sign-in-alt mr-1"></i>Login</button>
			 	    </form>-->
			 	    <div class="dropdown">
				 	    <button class="btn btn-outline-segundary my-2 my-sm-0 dropdown-toggle" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">
				 	    	<i class="far fa-user-circle fa-lg mr-1"></i>
				 	    	<a>Bem-vindo! Kevin </a>
				 	    	
				 	    </button>
				 	    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton" style="border: 0;">
						    <a class="dropdown-item" href="#">Perfil</a>
						    <a class="dropdown-item" href="#">Configurações</a>
						    <a class="dropdown-item" href="#">Sair</a>
						</div>
					</div>
			    </div>	
			</nav>
		</header>
		<div class="container-fluid " style="margin-top: 10%;">
			<div class="row">
				<div class="col-lg-3 col-md-12">
					<div class="menu-pesquisa shadow rounded pt-5 m-2">
					  	<div class="col-2">
					  		<h4 style="color: #0386A8;">Categorias </h4>
					   		<div class="card m-3">
								<div class="card-header" id="headingOne" data-toggle="collapse" data-target="#collapseSexo" aria-expanded="true" aria-controls="collapseSexo">
									<span><h5>► Sexo</h5></span>
								</div>
								<div id="collapseSexo" class="collapse" aria-labelledby="headingOne" data-parent="#containerAcordeon">
									<div class="card-body">
										<div class="col mt-1">
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="menino">
											  	<label class="custom-control-label" style="display: inline-flex;" for="menino">
											  		Meninos <i class="fas fa-male ml-2" style="color: #0386A8; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
										<div class="col mt-1">						
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="menina">
											  	<label class="custom-control-label" style="display: inline-flex;" for="menina">
											  		Meninas<i class="fas fa-female ml-2" style="color: #0386A8; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
									</div>
								</div>
							</div>							
							<div class="card m-3">
								<div class="card-header" id="headingTwo" data-toggle="collapse" data-target="#collapseItens" aria-expanded="true" aria-controls="collapseItens">
									<span><h5>► Itens</h5></span>
								</div>
								<div id="collapseItens" class="collapse" aria-labelledby="headingTwo" data-parent="#containerAcordeon">
									<div class="card-body">
										<div class="col mt-1">
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="berco">
											  	<label class="custom-control-label" style="display: inline-flex;" for="berco">
											  		Berço <i class="fas fa-bed ml-2" style="color: #0386A8; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
										<div class="col mt-1">						
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="roupa">
											  	<label class="custom-control-label" style="display: inline-flex;" for="roupa">
											  		Roupas <i class="fas fa-baby ml-2" style="color: #0386A8; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
										<div class="col mt-1">						
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="comoda">
											  	<label class="custom-control-label" style="display: inline-flex;" for="comoda">
											  		Cômoda <i class="fas fa-archive ml-2" style="color: #0386A8; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card m-3">
								<div class="card-header" id="headingThree" data-toggle="collapse" data-target="#collapseCor" aria-expanded="true" aria-controls="collapseCor">
									<span><h5>► Cor</h5></span>
								</div>
								<div id="collapseCor" class="collapse" aria-labelledby="headingThree" data-parent="#containerAcordeon">
									<div class="card-body">
										<div class="col mt-1">
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="amarelo">
											  	<label class="custom-control-label" style="display: inline-flex;" for="amarelo">
											  		Amarelo <i class="fas fa-square ml-2" style="color: yellow; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
										<div class="col mt-1">						
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="azul">
											  	<label class="custom-control-label" style="display: inline-flex;" for="azul">
											  		Azul  <i class="fas fa-square ml-2" style="color: blue; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
										<div class="col mt-1">						
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="bege">
											  	<label class="custom-control-label" style="display: inline-flex;" for="bege">
											  		Bege  <i class="fas fa-square ml-2" style="color: #EAEAB4; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
										<div class="col mt-1">						
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="branco">
											  	<label class="custom-control-label" style="display: inline-flex;" for="branco">
											  		Branco  <i class="far fa-square ml-2" style="color: gray; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
										<div class="col mt-1">						
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="cinza">
											  	<label class="custom-control-label" style="display: inline-flex;" for="cinza">
											  		Cinza  <i class="fas fa-square ml-2" style="color: grey; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
										<div class="col mt-1">						
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="marron">
											  	<label class="custom-control-label" style="display: inline-flex;" for="marron">
											  		Marron  <i class="fas fa-square ml-2" style="color: #bf8040; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
										<div class="col mt-1">						
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="rosa">
											  	<label class="custom-control-label" style="display: inline-flex;" for="rosa">
											  		Rosa  <i class="fas fa-square ml-2" style="color: pink; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
										<div class="col mt-1">						
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="verde">
											  	<label class="custom-control-label" style="display: inline-flex;" for="verde">
											  		Verde <i class="fas fa-square ml-2" style="color: green; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
										<div class="col mt-1">						
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="vermelho">
											  	<label class="custom-control-label" style="display: inline-flex;" for="vermelho">
											  		Vermelho <i class="fas fa-square ml-2" style="color: red; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
										<div class="col mt-1">						
											<div class="custom-control custom-checkbox">
											  	<input type="checkbox" class="custom-control-input" id="outras">
											  	<label class="custom-control-label" style="display: inline-flex;" for="outras">
											  		Outras  <i class="fas fa-square ml-2" style="color: black; line-height: 1.5rem;"></i>
											  	</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<button class="btn my-2 my-sm-0 m-3" type="submit">
				        	<i class="fas fa-search mr-1"></i> Pesquisar</button>
					  	</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-12">			
					<div class="row">
						<div class="col-lg-12 col-md-12"> 
							<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
					          	<ol class="carousel-indicators">
					            	<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					            	<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					            	<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					          	</ol>
					          	<div class="carousel-inner" role="listbox">
					            	<div class="carousel-item active">
					              		<img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
					            	</div>
					            	<div class="carousel-item">
					              		<img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
					            	</div>
					            	<div class="carousel-item">
					              		<img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
					            	</div>
					          	</div>
					          	<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					            	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					            	<span class="sr-only">Previous</span>
					          	</a>
					          	<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					            	<span class="carousel-control-next-icon" aria-hidden="true"></span>
					            	<span class="sr-only">Next</span>
					          	</a>
					        </div>
			        	</div>
			          	<div class="col-lg-4 col-md-12 mb-4">
			            	<div class="card h-100">
			              		<a href="#"><img class="card-img-top" src="img\produto.png" alt="Imagem de capa do card"></a>
			              		<div class="card-body">
			                		<h4 class="card-title">
			                  			Enchoval One
			                		</h4>
			                		<h6>5 Itens</h6>
			                		<p class="card-text">Ótimio estado</p>
									<p class="card-text">9 meses de uso</p>
									<p class="card-text">+ brinquedos</p>
			              		</div>
			              		<div class="card-footer">
			                		<button class="btn btn-outline-segundary">Interessar-se</button>
			              		</div>
			            	</div>
			          	</div>
			          	<div class="col-lg-4 col-md-12 mb-4">
			            	<div class="card h-100">
			              		<a href="#"><img class="card-img-top" src="img\produto.png" alt="Imagem de capa do card"></a>
			              		<div class="card-body">
			                		<h4 class="card-title">
			                  			Enchoval Two
			                		</h4>
			                		<h6>5 Itens</h6>
			               			<p class="card-text">Ótimio estado</p>
									<p class="card-text">9 meses de uso</p>
									<p class="card-text">+ brinquedos</p>
			              		</div>
			              		<div class="card-footer">
			                		<button class="btn btn-outline-segundary">Interessar-se</button>
			              		</div>
			            	</div>
			          	</div>
			          	<div class="col-lg-4 col-md-12 mb-4">
			            	<div class="card h-100">
			              		<a href="#"><img class="card-img-top" src="img\produto.png" alt="Imagem de capa do card"></a>
			              		<div class="card-body">
			                		<h4 class="card-title">
			                  			Enchoval Three
			                		</h4>
			                		<h6>5 Itens</h6>
			                		<p class="card-text">Ótimio estado</p>
									<p class="card-text">9 meses de uso</p>
									<p class="card-text">+ brinquedos</p>
			              		</div>
			              		<div class="card-footer">
			                		<button class="btn btn-outline-segundary">Interessar-se</button>
			              		</div>
			            	</div>
			          	</div>
			          	<div class="col-lg-4 col-md-12 mb-4">
			            	<div class="card h-100">
			              		<a href="#"><img class="card-img-top" src="img\produto.png" alt="Imagem de capa do card"></a>
			              		<div class="card-body">
			                		<h4 class="card-title">
			                  			Enchoval Four
			                		</h4>
			                		<h6>5 Itens</h6>
			                		<p class="card-text">Ótimio estado</p>
									<p class="card-text">9 meses de uso</p>
									<p class="card-text">+ brinquedos</p>
			              		</div>
			              		<div class="card-footer">
			                		<button class="btn btn-outline-segundary">Interessar-se</button>
			              		</div>
			            	</div>
			          	</div>
			          	<div class="col-lg-4 col-md-12 mb-4">
			            	<div class="card h-100">
			              		<a href="#"><img class="card-img-top" src="img\produto.png" alt="Imagem de capa do card"></a>
			              		<div class="card-body">
			                		<h4 class="card-title">
			                  			Enchoval Five
			                		</h4>
			                		<h6>5 Itens</h6>
			                		<p class="card-text">Ótimio estado</p>
									<p class="card-text">9 meses de uso</p>
									<p class="card-text">+ brinquedos</p>
			              		</div>
			              		<div class="card-footer">
			                		<button class="btn btn-outline-segundary">Interessar-se</button>
			              		</div>
			            	</div>
			          	</div>
			          	<div class="col-lg-4 col-md-12 mb-4">
			            	<div class="card h-100">
			              		<a href="#"><img class="card-img-top" src="img\produto.png" alt="Imagem de capa do card"></a>
			              		<div class="card-body">
			                		<h4 class="card-title">
			                  			Enchoval Six
			                		</h4>
			                		<h6>5 Itens</h6>
			                		<p class="card-text">Ótimio estado</p>
									<p class="card-text">9 meses de uso</p>
									<p class="card-text">+ brinquedos</p>
			              		</div>
			              		<div class="card-footer">
			                		<button class="btn btn-outline-segundary">Interessar-se</button>
			              		</div>
			            	</div>
			          	</div>
					</div>
		        </div>
	    	</div>				
			<nav class="mt-2" aria-label="Page navigation example">
			  	<ul class="pagination justify-content-center">
			    	<li class="page-item disabled">
			      		<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Anterior</a>
			    	</li>
			    	<li class="page-item"><a class="page-link" href="#">1</a></li>
			    	<li class="page-item"><a class="page-link" href="#">2</a></li>
			    	<li class="page-item"><a class="page-link" href="#">3</a></li>
			    	<li class="page-item">
			      		<a class="page-link" href="#">Proximo</a>
			    	</li>
			  	</ul>
			</nav>	
		</div>
		<footer>
			<div class="container-fluid p-5">
				<div class="row justify-content-center">
		            <div class="col-lg-4 mb-5 mb-lg-0">
		              <div class="mb-3"><h5>Directory</h5></div>
		              <p>Lorem ipsum dolor sit amet, consectetur adipisicing. sit amet, consectetur Lorem ipsum dolor sit amet, conse</p>
		              
		            </div>
		            <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
		              <h5 class="mb-3">Site</h5>
		              <ul class="list-unstyled">
		                <li><a href="index.html" class="text-muted">Sobre    </a></li>
		                <li><a href="index.html" class="text-muted">ONGs      </a></li>
		                <li><a href="index.html" class="text-muted">Fundadores    </a></li>
		                <li><a href="index.html" class="text-muted">Contato     </a></li>
		              </ul>
					</div>
					<div class="col-lg-2 col-md-6 mt-5 mb-lg-0">
						<ul class="list-inline">
		                <li class="list-inline-item" >
		                	<a href="#" target="_blank" title="twitter" class="text-hover-primary"style="color: #0386A8;">
		                		<i class="fab fa-2x fa-twitter"></i>
		                	</a>
		                </li>
		                <li class="list-inline-item" >
		                	<a href="#" target="_blank" title="facebook" class="text-hover-primary"style="color: #0386A8;">
		                		<i class="fab fa-2x fa-facebook"></i>
		                	</a>
		                </li>
		                <li class="list-inline-item" >
		                	<a href="#" target="_blank" title="instagram" class="text-hover-primary" style="color: #0386A8;">
		                		<i class="fab fa-2x fa-instagram"></i>
		                	</a>
		                </li>
		                <li class="list-inline-item" >
		                	<a href="#" target="_blank" title="google" class="text-hover-primary"style="color: #0386A8;">
		                		<i class="fab fa-2x fa-google"></i>
		                	</a>
		                </li>
		              </ul>
					</div>
					<div class="col-lg-2 col-md-6 mb-5 mb-lg-0" >
						<img src="img\uam.png" alt="Univercidade Anhembi Morumbi">
					</div>
				</div>
			</div>
			<div class="container-fluid p-1 text-center" style="background-color: #0386A8;color: white;">
				<p style=" margin-bottom: 0px;">© 2019 Baby Shark. Todos os direitos reservados</p>
			</div>
		</footer>

		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" crossorigin="anonymous"></script>
	</body>
</html>