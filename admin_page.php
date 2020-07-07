<?php
	include_once "php_functions/admin_functions.php";	
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
		<script src="js/admin.js"></script>
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

		<div class="box alt">
			<div class="row">	
				<!-- Menu -->			
				<section class="3u" >
					<section class="sidebar">
						<ul class="default" style="padding-left: 40px;">
			                <li><a class="sidebar_management" id="users_management_link" onclick="see(event, 'users_management')">Banir Utilizadores</a></li>
			                <li><a class="sidebar_management" id="tournament_management_link" onclick="see(event, 'tournament_management')">Gerir Gestores de Torneio</a></li>
			            </ul>
	                </section>            
	            </section>

				
				<section class="9u 12u$(medium)" >
					
					<!-- Notifications list -->		
					<div id="notifications" class="management">
						<!-- <div class="12u$" style="padding-top: 2em;">	-->							
							<?php
					 			if(isset($_SESSION['notifications'])){
					 				echo  $_SESSION['notifications'];
					 				unset($_SESSION['notifications']);
					 			}	
					 		?>					 					
							<?php
					 			if(isset($_SESSION['notification_read'])){
					 				echo  $_SESSION['notification_read'];
					 				unset($_SESSION['notification_read']);
					 			}	
					 		?>

			 		</div>
			 		
			 		<!-- Users Management -->		
			 		<div id="users_management" class="management" style="display: none">
			 			<form method="post" action="php_functions/admin_manage_users.php">
						   <section class="search">
						      <input type="text" class="searchTerm" placeholder="Nome" name="input_search_user"> 
						      <input type="submit" value="Procurar" class="special" >  						      
						   </section>				
		 				</form>
		 				
						<?php 
				 			if(isset($_SESSION['remove_result'])){
				 				echo  $_SESSION['remove_result'];
				 				unset($_SESSION['remove_result']);
				 			}	 			
				 		?>
						<?php 
				 			if(isset($_SESSION['search_result'])){
				 				echo  $_SESSION['search_result'];
				 				unset($_SESSION['search_result']);
				 			}	 			
				 		?>				 		
			 		</div>	
				 		<!-- User Details -->				 					
						<?php
				 			if(isset($_SESSION['user_details'])){
				 				echo  $_SESSION['user_details'];
				 				unset($_SESSION['user_details']);
				 			}	
				 		?>	
			 		
			 		<!-- Tournament Management -->		
			 		<div class="management" id="tournament_management" style="display: none">
			 			<?php 
			 				set_admin_tournament_selection();
				 			if(isset($_SESSION['tournament_selection'])){
				 				echo  $_SESSION['tournament_selection'];
				 				unset($_SESSION['tournament_selection']);
				 			}	 			
				 		?>						
			 		
				 		<?php 
				 			if(isset($_SESSION['demote_manager'])){
				 				echo  $_SESSION['demote_manager'];
				 				unset($_SESSION['demote_manager']);
				 			}	 			
				 		?>
						<?php 
				 			if(isset($_SESSION['search_manager_result'])){
				 				echo  $_SESSION['search_manager_result'];
				 				unset($_SESSION['search_manager_result']);
				 			}	 			
				 		?>
				 		<?php 
				 			if(isset($_SESSION['list_users'])){
				 				echo  $_SESSION['list_users'];
				 				unset($_SESSION['list_users']);
				 			}	 			
				 		?>
				 		<?php 
				 			if(isset($_SESSION['promote_manager'])){
				 				echo  $_SESSION['promote_manager'];
				 				unset($_SESSION['promote_manager']);
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