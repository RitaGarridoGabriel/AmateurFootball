<?php
	include_once "php_functions/start.php";
	include_once "php_functions/main_info.php";
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
	<body >

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
						      <img src="php image" srcset="images/admin.png" style="width:auto;height:50px;">
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

		<!-- Banner -->
		<section id="banner">
			<h2>Torneios com inscrições abertas:</h2>
			<?php 
		 		set_tournament_available();
	 			if(isset($_SESSION['tournament_available'])){
	 				echo  $_SESSION['tournament_available'];
	 				unset($_SESSION['tournament_available']);
	 			}			
	 		?>		
			<ul class="actions">
				<li>
					<a href="login.php" class="button big">Inscreve-te já!</a>
				</li>
			</ul>
		</section>
		
		<section id=app_contents>
			<?php 
		 		set_tournament_list();
	 			if(isset($_SESSION['tournaments_list'])){
	 				echo  $_SESSION['tournaments_list'];
	 				unset($_SESSION['tournaments_list']);
	 			}			
	 		?>
	 	</section>
	 	<section id=details>
	 		<?php 
	 			if(isset($_SESSION['tournament_details'])){
	 				echo  $_SESSION['tournament_details'];
	 				unset($_SESSION['tournament_details']);
	 			}			
	 		?>
	 		<?php 
	 			if(isset($_SESSION['team_details'])){
	 				echo  $_SESSION['team_details'];
	 				unset($_SESSION['team_details']);
	 			}		
	 		?>
	 		<?php 
	 			if(isset($_SESSION['field_details'])){
	 				echo  $_SESSION['field_details'];
	 				unset($_SESSION['field_details']);
	 			}		
	 		?>
	 		<?php 
	 			if(isset($_SESSION['registered_user_details'])){
	 				echo  $_SESSION['registered_user_details'];
	 				unset($_SESSION['registered_user_details']);
	 			}		
	 		?>
	 	</section>
		

		<!-- Footer -->
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