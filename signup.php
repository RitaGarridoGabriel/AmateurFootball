<?php

	include "php_functions/signup_functions.php";
	start();	
	
	if (isset($_SESSION['logged'])){
		if ($_SESSION['logged']==true){

	    	if(strcasecmp($_SESSION['user_login'], "admin")==0){
	    		header('Location: php_functions/admin_set_notifications.php');
	    	}
	    	else{
	    		header('Location: user_page.php');
	    	}
        }
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
	<body>
		<!-- Header -->
		<header id="header">
			<h1><a href="index.php">Futebol Amador</a></h1>
		</header>
		<section id="main" class="wrapper">
			<div class="container">
				<!-- Form -->
				<section>
					<form method="post">
						<div class="row uniform 50%">
							<div class="4u$">
								<h3>Informações de registo</h3>
							</div>
							<div class="4u$">
								<input type="text" name="input_username" id="username" placeholder="Nome de utilizador*" value = "<?php inputRead('input_username')?>"/>
		 							<?php errorCheck('e_username'); ?>
							</div>
							<div class="4u">
								<input type="password" name="input_password1" id="password1" placeholder="Palavra-Passe*" 
								value="<?php inputRead('input_password1')?>"/>
		 							<?php errorCheck('e_password'); ?>
							</div>						
													
							<div class="4u$">
								<input type="password" name="input_password2" id="password2" placeholder="Repetir Palavra-Passe*" value="<?php inputRead('input_password2')?>" />
									<?php errorCheck('e_password');	?>
									<?php errorCheck('e_pass');	?>							
							</div>
							<div class="4u$">
								<h3>Informações pessoais</h3>
							</div>
					
							<div class="4u" style="width: 21%">
								<input type="text" name="identification_number1" id="identification_number1" placeholder="Nº Cartão de Cidadão*" value="<?php inputRead('identification_number1')?>"/> 

							</div>
							
							<div class="4u" style="width: 5%">
								<input type="text" name="identification_number2" id="identification_number2" 
								value="<?php inputRead('identification_number2')?>"/>
		 						
							</div>

							<div class="4u$" style="width: 7%">
								<input type="text" name="identification_number3" id="identification_number3" 
								value="<?php inputRead('identification_number3')?>"/>
							</div>
							<div class="4u$" style="width: 50%">
								<?php errorCheck('e_id1'); ?>
								<?php errorCheck('e_id2'); ?>
								<?php errorCheck('e_id3'); ?>	
								<?php errorCheck('e_ccs'); ?>	
							</div>
										
							<div class="4u">
								<input type="text" name="input_name" id="firstname" placeholder="Primeiro Nome*" 
								 value="<?php inputRead('input_name')?>"/>
								<?php errorCheck('e_name');	?>
							</div>
								
							<div class="4u$">
								<input type="text" name="input_surname" id="surname" placeholder="Último Nome*" value="<?php inputRead('input_surname')?>"/>
								<?php errorCheck('e_surname');	?>
							</div>
							<div class="4u">
								<input type="text" name="input_email" id="email" placeholder="Email*" value="<?php inputRead('input_email') ?>"/>
									<?php errorCheck('e_email'); ?>
							</div>	
							<div class="4u$">
								<input type="text" name="input_contact" id="contact" placeholder="Número de telemóvel*" value="<?php inputRead('input_contact') ?>"/>
								<?php errorCheck('e_contact'); ?>
							</div>		
							<div class="4u$">
								<br>
							</div>	
							<div class="6u$ 12u$(3)">
								<input type="checkbox" name="input_human" id="input_human"  unchecked>
								<label for="input_human">Não sou um robot</label>
								<?php errorCheck('e_human'); ?>
							</div>
							<div class="12u$">
								<ul class="actions">
									<li><input type="submit" value="Criar nova conta" class="special" /></li>			
									<li><a href="index.php" class="button">Cancelar</a></li>
									<?php
						 			if(isset($_SESSION['signup_result'])){
						 				echo  $_SESSION['signup_result'];
						 				unset($_SESSION['signup_result']);
						 			}	
						 		?>
								</ul>
							</div>
						</div>
					</form>
				</section>
			</div>
		</section>
		
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