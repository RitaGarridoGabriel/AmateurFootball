<?php
 	if(isset($_GET['f'])){
 		if(strcmp($_GET['f'], 'aceita')==0){
 			aceita();
 		}
 		else if(strcmp($_GET['f'], 'recusa')==0){
 			recusa();
 		}
 		else if(strcmp($_GET['f'], 'start')==0){
 			start();
 		}	
 	}
	function start(){
		session_start();
        require_once "connect.php";
        $_SESSION['host']=$host;
        $_SESSION['db_user']=$db_user;
        $_SESSION['db_password']=$db_password; 
        $_SESSION['db_name']=$db_name;

		if (isset($_POST['input_email']))
		{
			//validation flag
			$flag_everything_OK = true;
			//check login
			$username = $_POST['input_username'];
			//length of login
			if ((strlen($username)<4) || (strlen($username)>20))
			{
				$flag_everything_OK = false;
				$_SESSION['e_username'] = '<span style="color:red">Tem que conter entre 4 e 20 caracteres!</span>';
			}
			if (ctype_alnum($username) == false)
			{
				$flag_everything_OK = false;
				$_SESSION['e_username'] = '<span style="color:red">Só pode conter letras e números!</span>';
			}
			//check email
			$email = $_POST['input_email'];
			$emailB = filter_var($email, FILTER_SANITIZE_EMAIL);
			if ((filter_var($emailB, FILTER_VALIDATE_EMAIL) == false) || ($emailB!=$email))
			{
				$flag_everything_OK = false;
				$_SESSION['e_email'] = '<span style="color:red">Endereço de email inválido!</span>';
			}
			//check password
			$password1 = $_POST['input_password1'];
			$password2 = $_POST['input_password2'];
			if ((strlen($password1)<8) || (strlen($password1)>20))
			{
				$flag_everything_OK = false;
				$_SESSION['e_password'] = '<span style="color:red">Tem que conter entre 8 e 20 caracteres!</span>';
			}
			if ($password1 != $password2)
			{
				$flag_everything_OK = false;
				$_SESSION['e_pass'] = '<span style="color:red">As Palavras-passe introduzidas não coincidem!</span>';
			}
			//$password_hash = password_hash($password1, PASSWORD_DEFAULT);
			$password_hash = $password1;
			//check if terms accepted
			if (!isset($_POST['input_human']))
			{
				$flag_everything_OK = false;
				$_SESSION['e_human'] = '<span style="color:red">Prove que não é um robot!</span>';
			}
			//check name
			$name = $_POST['input_name'];
			if ((strlen($name)<1))
			{
				$flag_everything_OK = false;
				$_SESSION['e_name'] = '<span style="color:red">Preenchimento obrigatório!</span>';
			}
			//check surname
			$surname = $_POST['input_surname'];
			if ((strlen($surname)<1))
			{
				$flag_everything_OK = false;
				$_SESSION['e_surname'] = '<span style="color:red">Preenchimento obrigatório!</span>';
			}

			//check identification number
			$identification_number1 = $_POST['identification_number1'];
			if(!ctype_digit($identification_number1) || strlen($identification_number1)!=8){
				$flag_everything_OK = false;
				$_SESSION['e_id1'] = '<span style="color:red">O primeiro campo do cartão de cidadão tem que ter 8 dígitos!<br></span>';
			}

			$identification_number2 = $_POST['identification_number2'];
			if(!(ctype_digit($identification_number2) && strlen($identification_number2)==1)){
				$flag_everything_OK = false;
				$_SESSION['e_id2'] = '<span style="color:red">O segundo campo do cartão do cidadão tem que ser um digito!<br></span>';
			}

			$identification_number3 = $_POST['identification_number3'];
			if(strlen($identification_number3)!=3){
				$flag_everything_OK = false;
				$_SESSION['e_id3'] = '<span style="color:red">O terceiro campo do cartão de cidadão tem que ter 3 caracteres!<br></span>';
			}
			else{
				if(!(ctype_alnum(substr($identification_number3, 0, -1)) && ctype_digit(substr($identification_number3, -1)))) {
					$flag_everything_OK = false;
					$_SESSION['e_id3'] = '<span style="color:red">Exemplo: XY0!</span>';
				}
			}

			//check telephone number
			$contact = $_POST['input_contact'];
			if(!ctype_digit($contact)){
				$flag_everything_OK = false;
				$_SESSION['e_contact'] = '<span style="color:red">Só pode conter números!</span>';
			}
			if(strlen($contact)!=9 ){
				$flag_everything_OK = false;
				$_SESSION['e_contact'] = '<span style="color:red">Deverá ter 9 dígitos!</span>';
			}

			//save insterted data
			$_SESSION['input_username'] = $username;
			$_SESSION['input_email'] = $email;
			$_SESSION['input_name'] = $name;
			$_SESSION['input_surname'] = $surname;
			$_SESSION['identification_number1'] = $identification_number1;
			$_SESSION['identification_number2'] = $identification_number2;
			$_SESSION['identification_number3'] = $identification_number3;
			$_SESSION['input_email'] = $email;
			$_SESSION['input_contact'] = $contact;
			$cc = "$identification_number1"."$identification_number2"."$identification_number3";
						
			if (isset($_POST['input_human'])) $_SESSION['input_terms'] = true;
			

			require_once "connect.php";
			mysqli_report(MYSQLI_REPORT_STRICT);// throw errors, not warnings

			try
			{
				$connection = new mysqli($host, $db_user, $db_password, $db_name);
				mysqli_set_charset($connection,"utf8");
				if ($connection->connect_errno != 0)
				{
					throw new Exception(mysqli_connect_errno());
				}
				else
				{

					//check if email exists
					$result = $connection->query("SELECT * FROM utilizadores WHERE Email ='$email'");
					

					if (!$result) throw new Exception($connection->error);
					
					$count_emails = $result->num_rows;
					//echo $count_emails.'<br>';
					
					if($count_emails > 0)
					{
						$flag_everything_OK = false;
						$_SESSION['e_email'] = '<span style="color:red">Esta conta de email já existe!</span>';
					}

					//check if login taken
					$result = $connection->query("SELECT * FROM utilizadores WHERE Username ='$username'");
					if (!$result) throw new Exception($connection->error);
					$count_logins = $result->num_rows;
					if($count_logins > 0)
					{
						$flag_everything_OK = false;
						$_SESSION['e_username']= '<span style="color:red">Este nome de utilizador já existe. Escolha outro!</span>';
					}
					$result = $connection->query("SELECT * FROM utilizadores WHERE CC ='$cc'");
					if (!$result) throw new Exception($connection->error);
					$count_ccs = $result->num_rows;
					
					if($count_ccs > 0){
						$flag_everything_OK = false;
						$_SESSION['e_ccs']= '<span style="color:red">Este utilizador já existe!</span>';
					}


					if ($flag_everything_OK == true){
						//Add to database
						$password_hash = $password1;
						if(strcasecmp($_SESSION['input_username'], "admin")==0){
							$admin = 1;
						}
						else{
							$admin=0;
							
						}
						$_SESSION['admin'] = $admin;
						$query="INSERT INTO  utilizadores VALUES 
							('$cc','$name','$surname','$email','$password_hash','$username','$contact','$admin', '', '0')";
						if ($connection->query($query)){
							
							if($admin == 0){
								//criar notificacao para o admin
								$texto = 'Novo utilizador '.$name.' pediu registo na plataforma.<br>
								<a href="php_functions/signup_functions.php?f=aceita&user_id='.$cc.'">Permitir</a> ou 
								<a href="php_functions/signup_functions.php?f=recusa&user_id='.$cc.'">recusar</a>?';
								
								//cc do admin
								$result_admin=$connection->query("SELECT utilizadores.CC
											FROM utilizadores
											WHERE utilizadores.Admin=1");


								$num_of_admin = mysqli_num_rows($result_admin);

								if($num_of_admin>0){
									$row_admin = mysqli_fetch_assoc($result_admin);

									$cc_admin=$row_admin['CC'];

									if($connection->query("INSERT INTO `notifica` VALUES('$cc', '$cc_admin', '', '0')")){
										$result_insert2=$connection->query("INSERT INTO `notificacoes` VALUES(LAST_INSERT_ID(), '$texto', NOW())");
									}									
								}
							}
								
							$_SESSION['registration_success'] = true;
							/*$_SESSION['logged'] = true;*/
							$_SESSION['user_login'] = $username;
							$_SESSION['user_name'] = $name;
							$_SESSION['user_surname'] = $surname;
							$_SESSION['signup_result'] ="<script type='text/javascript'>alert('Pedido de registo enviado ao administrador do sistema!');</script>";
							header('Location: index.php');
						}
						else{
							throw new Exception($connection->error);
						}
					}


					$connection->close();
				}
			}
			catch(Exception $e)
			{
				echo '<span style="color:red;">Servidor em baixo! Tente mais tarde</span>';
				echo '<br />Developer info: '.$e;
			}
		}
	}

	function aceita(){
		require_once "connect.php";       
        
        $connection = new mysqli($host, $db_user, $db_password, $db_name);
		mysqli_set_charset($connection,"utf8");
        if ($connection->connect_errno != 0) {
            throw new Exception(mysqli_connect_errno());
        }
        $user_id=$_GET['user_id'];

        //Verifica se o utilizador ja foi aceite
        $result_check = $connection->query("SELECT utilizadores.Confirmado
        									FROM utilizadores 
        									WHERE `utilizadores`.`CC` = '$user_id'");

        $num_of_results = mysqli_num_rows($result_check);

		if($num_of_results>0){
			$row = mysqli_fetch_assoc($result_check);
			if($row['Confirmado'] == 1){
				echo "<script type='text/javascript'>alert('O utilizador já foi aceite!');
				window.location = \"notifications.php?f=set_notifications\";</script>";
			}
			else{
				//altera flag de utilizador confirmado
		        $result = $connection->query("UPDATE `utilizadores` SET `Confirmado` = '1' 
		        							  WHERE `utilizadores`.`CC` = '$user_id'");
		        
		        if (!$result){ 
		        	throw new Exception($connection->error);
		        }else{
		        	echo "<script type='text/javascript'>alert('O utilizador foi aceite com sucesso!');
		        	window.location = \"notifications.php?f=set_notifications\";</script>";
		        }
			}
		}
	}


	function recusa(){
		$user_id=$_GET['user_id'];
		require_once "connect.php";       
        
        $connection = new mysqli($host, $db_user, $db_password, $db_name);
		mysqli_set_charset($connection,"utf8");
        if ($connection->connect_errno != 0) {
            throw new Exception(mysqli_connect_errno());
        }
        $user_id=$_GET['user_id'];

		//Verifica se o utilizador ja foi aceite
        $result_check = $connection->query("SELECT utilizadores.Confirmado
        									FROM utilizadores 
        									WHERE `utilizadores`.`CC` = '$user_id'");

        $num_of_results = mysqli_num_rows($result_check);

		if($num_of_results>0){
			$row = mysqli_fetch_assoc($result_check);
			if($row['Confirmado'] == 1){
				echo "<script type='text/javascript'>alert('O utilizador já foi aceite!'); window.location = \"notifications.php?f=set_notifications\";</script>";				
			}
			else{
				//remove utilizador da base de dados
		        $result = $connection->query("DELETE FROM `utilizadores` 
		        							  WHERE `utilizadores`.`CC` = '$user_id'");
		        
		        if (!$result){
		        	throw new Exception($connection->error);
		        } 
		        else{
		        	echo "<script type='text/javascript'>alert('O utilizador foi removido da base de dados!'); window.location = \"notifications.php?f=set_notifications\";</script>";			        	
		        }
		    }
		}
		
	}

	function inputRead($type){
		
		if (isset($_SESSION[$type]))
		{
			echo $_SESSION[$type];
			unset($_SESSION[$type]);
		}					
	}

	function errorCheck($type){
		if (isset($_SESSION[$type]))
		{
			echo $_SESSION[$type];
			unset($_SESSION[$type]);
		}
	}

?>