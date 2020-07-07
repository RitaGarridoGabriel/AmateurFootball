<?php
	session_start();

    require_once "connect.php";
    
    $connection = @new mysqli($host, $db_user, $db_password, $db_name);
    mysqli_set_charset($connection,"utf8");
	if ($connection->connect_errno != 0)
	{
		throw new Exception(mysqli_connect_errno());
	}        
        
	$user = $_GET['user_id'];	
	               
    $result = $connection->query("SELECT CC, Username, Primeiro_nome, Ultimo_nome, Email, Telemovel
									FROM utilizadores
									WHERE utilizadores.CC="."'$user'");

    $num_of_results = mysqli_num_rows($result);

        
	if($num_of_results>0){

        $_SESSION['user_details'] = 
        '<div  id="user_details" class="management">
            <h2>Detalhes do Utilizador</h2>
                <div class="table-wrapper">
                    <table style="max-width:90%;">
                        <thead>
                            <tr>       
                                <th>Nº Identificação</th>   
                                <th>Nome de Utilizador</th>        
                                <th>Nome</th>
                                <th>Email</th>
                                <th>Telemóvel</th>                               
                            </tr>
                        </thead>
                        <tbody>';

        for ($i = 1; $i <= $num_of_results; $i++) {
							
            $row = mysqli_fetch_assoc($result);

            $_SESSION['user_details'] = $_SESSION['user_details'].                
            '<tr>
                <td>'.$row['CC'].'</td>
                <td>'.$row['Username'].'</td>
                <td>'.$row['Primeiro_nome'].' '.$row['Ultimo_nome'].'</td>
                <td>'.$row['Email'].'</td>
                <td>'.$row['Telemovel'].'</td>'; 
        }

        $_SESSION['user_details'] = $_SESSION['user_details'].
                    '</tr>
                    </tbody>
                </table>
            </div>
            <a href="php_functions/admin_manage_users.php" class="button">Voltar</a>
        </div>';      
        
        if($_SESSION['admin']==1){
            header('Location: ../admin_page.php');
        }
        else{
            header('Location: ../user_page.php');
        }
        exit();   
    }
    else
    {
        $_SESSION['user_details'] ='<h2><b>O utilizador não foi encontrado</b></h2>';
        
        if($_SESSION['admin']==1){
            header('Location: ../admin_page.php');
        }
        else{
            header('Location: ../user_page.php');
        }
        exit();
    }
    $connection->close();
       
?>