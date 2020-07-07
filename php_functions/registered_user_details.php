<?php
	session_start();

    require_once "connect.php";
    
    $connection = @new mysqli($host, $db_user, $db_password, $db_name);
    mysqli_set_charset($connection,"utf8");
	if ($connection->connect_errno != 0)
	{
		throw new Exception(mysqli_connect_errno());
	}   
    $_SESSION['registered_user_details'] = 
        '<script>
            document.getElementById("app_contents").style.display = "none"; 
            document.getElementById("banner").style.display = "none"; 
        </script>
        <div id="registered_user_details" class="registered" style="padding-left:15em;padding-top:2em;padding-bottom:2em">
            <h2>Detalhes do Utilizador</h2>';     
        
	$user = $_GET['user_id'];	
	               
    $result = $connection->query("SELECT utilizadores.CC, Username, Primeiro_nome, Ultimo_nome, Email, Telemovel, `equipas jogadores`.Nome_equipa
									FROM utilizadores, `equipas jogadores`
									WHERE utilizadores.CC LIKE `equipas jogadores`.CC AND utilizadores.CC="."'$user'");

    $num_of_results = mysqli_num_rows($result);

        
	if($num_of_results>0){

        $_SESSION['registered_user_details'] = $_SESSION['registered_user_details'].
                '<div class="table-wrapper">
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
            
            $_SESSION['registered_user_details'] = $_SESSION['registered_user_details'].                
            '<tr>
                <td>'.$row['CC'].'</td>
                <td>'.$row['Username'].'</td>
                <td>'.$row['Primeiro_nome'].' '.$row['Ultimo_nome'].'</td> 
                <td>'.$row['Email'].'</td>
                <td>'.$row['Telemovel'].'</td>'; 
        }

        $_SESSION['registered_user_details'] = $_SESSION['registered_user_details'].
                    '</tbody>
                </table>
            </div>';
            if(isset($_GET['back_torneio'])){
                $_SESSION['registered_user_details'] = $_SESSION['registered_user_details'].
                    '<a href="php_functions/tournament_details.php?Nome_torneio='.$_GET['back_torneio'].'" class="button">Voltar</a>
                     </div>';
            }
            else{
                $_SESSION['registered_user_details'] = $_SESSION['registered_user_details'].
                    '<a href="php_functions/team_details.php?team_id='.$row['Nome_equipa'].'" class="button">Voltar</a>
                     </div>';
            }
           
        header('Location: ../index.php');
        exit();   
    }
    else
    {
        $_SESSION['registered_user_details'] =$_SESSION['registered_user_details'].'<h2><b>O utilizador não foi encontrado</b></h2>';

        
        if(isset($_GET['back_torneio'])){
            $_SESSION['registered_user_details'] = $_SESSION['registered_user_details'].
                '<a href="php_functions/tournament_details.php?Nome_torneio='.$_GET['back_torneio'].'" class="button">Voltar</a>
                 </div>';
        }
        else{
            $_SESSION['registered_user_details'] = $_SESSION['registered_user_details'].
                '<a href="php_functions/team_details.php?team_id='.$row['Nome_equipa'].'" class="button">Voltar</a>
                 </div>';
        }
        header('Location: ../index.php');
        exit();
    }
    $connection->close();
       
?>