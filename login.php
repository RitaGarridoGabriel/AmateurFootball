<?php	
    session_start();
	if ((isset($_SESSION['logged'])) && ($_SESSION['logged']==true))
    {
    	if(strcasecmp($_SESSION['user_login'], "admin")==0){
    		header('Location: php_functions/admin_set_notifications.php');
    	}
    	else{
    		header('Location: user_page.php');
    	}
        
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
	<body>
		<!-- Header -->
		<header id="header">
			<h1><a href="index.php">Futebol Amador</a></h1>
		</header>
		<section id="main" class="wrapper">
			<div class="container">
				<!-- Form -->
				<section>
					<h2>Entrar</h2>					
					<form method="post" action="php_functions/logging_to_account.php" >
						<div class="row uniform 50%">
							<div class="4u$">
								<input type="text" name="input_username" id="username" placeholder="Nome de utilizador" value= "<?php
								    if(isset($_SESSION['input_username']))
									{
										echo $_SESSION['input_username'];
										unset($_SESSION['input_username']);
									}
								?>"
								/>
							</div>
							<div class="4u$">
								<input type="password" name="input_password" id="password" placeholder="Palavra-Passe"
								value= "<?php
								    if(isset($_SESSION['input_password']))
									{
										echo $_SESSION['input_password'];
										unset($_SESSION['input_password']);
									}
								?>"/>
								<?php
							
								    if(isset($_SESSION['error_log']))
									{
										echo $_SESSION['error_log'];
										unset($_SESSION['error_log']);
									}
								?>
							</div>								
							<div class="6u$ 12u$(3)">
								<input type="checkbox" id="human" name="human" unchecked/>
								<label for="human">Não sou um robot</label>										
							</div>							
							<div class="12u$">
								<ul class="actions">
									<li><input type="submit" value="Entrar" class="special" /></li>
									<li><a href="index.php" class="button">Cancelar</a></li>			
								</ul>								
							</div>							
						</div>						 
					</form>	
					<h4>Novo utilizador? <a href="signup.php" style="color:#3cadd4">Regista-te já!</a></h4>
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