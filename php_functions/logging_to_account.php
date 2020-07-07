<?php
	
	session_start();
	$input_username = "";
	$input_password = "";
	$flag_everything_OK = true;

	if((empty($_POST['input_username']))||(empty($_POST['input_password'])))
	{
		header('Location: ../login.php');
		exit();
	}

	$input_username = $_POST['input_username'];
	$input_password = $_POST['input_password'];

	if (!isset($_POST['human']))
	{
		$flag_everything_OK = false;
		$_SESSION['error_log'] = '<span style="color:red">Prove que não é um robot!</span>';
		$_SESSION['input_username'] = $input_username;
		//$_SESSION['input_password'] = $input_password;
		header('Location: ../login.php');	
		exit();
	}
	else{
		require_once "connect.php";
		$connection = @new mysqli($host, $db_user, $db_password, $db_name);
		mysqli_set_charset($connection,"utf8");
		if ($connection->connect_errno!=0)
		{
			echo "Error: ".$connection->connect_errno;
		}
		else
		{
			$login = $_POST['input_username'];
			$pass = $_POST['input_password'];
		
			$login = htmlentities($login, ENT_QUOTES, "UTF-8");

			if ($result= @$connection->query(
			sprintf("SELECT * FROM utilizadores WHERE Username='%s' AND Password= '%s'" , mysqli_real_escape_string($connection,$login),mysqli_real_escape_string($connection,$pass))))
			{
				$count_users = $result->num_rows;
				if($count_users>0)
				{
					$row = $result->fetch_assoc();
					if($row['Confirmado']==1){
						if($row['Banido']==0){
							$_SESSION['logged'] = true;
							$_SESSION['user_login'] = $row['Username'];
							$_SESSION['user_name'] = $row['Primeiro_nome'];
							$_SESSION['user_surname'] = $row['Ultimo_nome'];
							$_SESSION['cc'] = $row['CC'];
							$_SESSION['admin'] = $row['Admin'];
							
							unset($_SESSION['error_log']);
							$result->free_result();
							
					    	header('Location: ../index_logged.php');
				    	}
				    	else{
				    		$_SESSION['error_log'] = '<span style="color:red">Utilizador BANIDO! Contacte o administrador do sistema!</span>';
						echo $_SESSION['error_log'];
						header('Location: ../login.php');
				    	}
					}
					else{
						$_SESSION['error_log'] = '<span style="color:red">A aguardar confirmação de registo pelo administrador do sistema!</span>';
						echo $_SESSION['error_log'];
						header('Location: ../login.php');	
					}


				
				} 
				else
				{
					$_SESSION['error_log'] = '<span style="color:red">Nome de Utilizador ou Password errado!</span>';
					echo $_SESSION['error_log'];
					header('Location: ../login.php');	
				}
			}
			else
			{
				$_SESSION['error_log'] = '<span style="color:red">no user</span>';
				header('Location: ../login.php');
			}

			$connection->close();
		}
	}
?>