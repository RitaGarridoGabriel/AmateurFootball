<?php

	include_once "php_functions/start.php";
	include_once "php_functions/main_info.php";
	
	session_start();
    require_once "php_functions/connect.php";
    $_SESSION['host']=$host;
    $_SESSION['db_user']=$db_user;
    $_SESSION['db_password']=$db_password; 
    $_SESSION['db_name']=$db_name;
    $connection = @new mysqli($host, $db_user, $db_password, $db_name);
    mysqli_set_charset($connection,"utf8");
    if ($connection->connect_errno != 0)
    {
        throw new Exception(mysqli_connect_errno());
    } 
	include_once "php_functions/main_info.php";
	
	if (isset($_SESSION['logged']))
	{
		header('Location: index_logged.php');
		exit();
	}	
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
	 	<section id=details style="padding-left: 2em"> 	 		
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