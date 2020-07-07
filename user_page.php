<?php
	include_once "php_functions/start.php";
	start();
?>

<!DOCTYPE html>
<!--
	Transit by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Futebol Amador</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-xlarge.css" />
		</noscript>
	</head>
	<body>
		<!-- Header -->
		<header id="header">
			<h1><a href="index.php">Futebol Amador</a></h1>
			<nav id="nav">
				<ul>
					<?php 
						set_nav();
			 			if(isset($_SESSION['nav'])){
			 				echo $_SESSION['nav'];
			 				unset($_SESSION['nav']);
			 			}
			 		?>	
		            <li>
		                <a href="php_functions/notifications.php?f=set_notifications" class="icon rounded fa-bell"></a>       
		            </li>
					<li>
						<div class="dropdown">					
						    <button class="dropbtn">						    
						      <img src="php image" srcset="images/user.png" style="width:auto;height:50px;">
						      <br><a><?php echo $_SESSION['user_name']." ".$_SESSION['user_surname']."<br>(".$_SESSION['user_login'].")";?></a>
						    </button>
						    <div class="dropdown-content">						    	
						    	<a href="#">Ver perfil</a>
						    	<a href="#">Editar perfil</a>		
						    	<a href="php_functions/logout.php">Terminar sessão</a> 							   
						    </div>
						</div>
					</li>
				</ul>
			</nav>
		</header>
		

		<!-- Colocar conteudo do ecra -->
		<div class="box alt">
			<div class="row">
				<section class="3u">		
					<section class="sidebar">					
						<ul class="default" style="padding-left: 40px;">

					</section>
				</section>

				<section class="9u 12u$(medium)" >
					<!-- Notifications -->		
					<div  id="notifications" class="management">
						<?php
				 			if(isset($_SESSION['notifications'])){
				 				echo  $_SESSION['notifications'];
				 				unset($_SESSION['notifications']);
				 			}	
				 		?>
			 		</div>
			 	</section>
			</div>	 				 		
	 	</div>


		<footer id="footer">
			<div class="container">
				<div class="row">
					<div class="8u 12u$(medium)">
						<ul class="copyright">
							<li>&copy; Untitled. All rights reserved.</li>
							<li>Design: <a href="http://templated.co">TEMPLATED</a></li>
							<li>Images: <a href="http://unsplash.com">Unsplash</a></li>
						</ul>
					</div>
					<div class="4u$ 12u$(medium)">
						<ul class="icons">
							<li>
								<a class="icon rounded fa-facebook"><span class="label">Facebook</span></a>
							</li>
							<li>
								<a class="icon rounded fa-twitter"><span class="label">Twitter</span></a>
							</li>
							<li>
								<a class="icon rounded fa-google-plus"><span class="label">Google+</span></a>
							</li>
							<li>
								<a class="icon rounded fa-linkedin"><span class="label">LinkedIn</span></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
	</body>
</html>