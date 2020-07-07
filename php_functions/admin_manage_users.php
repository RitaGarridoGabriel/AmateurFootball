<?php
	session_start();

    require_once "connect.php";
    
    $connection = @new mysqli($host, $db_user, $db_password, $db_name);
    mysqli_set_charset($connection,"utf8");
	if ($connection->connect_errno != 0)
	{
		throw new Exception(mysqli_connect_errno());
	}        
        
	if (isset($_POST['input_search_user']))
		$input = $_POST['input_search_user'];
	else
		$input = '';

    if(isset($_GET['order'])){
        $order=$_GET['order'];  
    }   
    else{
        $order="";
    }	
	       
    $query="SELECT CC, Username, Primeiro_nome, Ultimo_nome, Email, Admin, Banido
            FROM utilizadores
            WHERE LOWER(utilizadores.Primeiro_nome) LIKE LOWER('%$input%') 
                 OR LOWER(utilizadores.Username) LIKE LOWER('%$input%') 
                 OR LOWER(utilizadores.Ultimo_nome) LIKE LOWER('%$input%')";


    if(strcmp($order, "Username")==0){
        $query=$query." ORDER BY utilizadores.Username, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
    }
    else if(strcmp($order, "PNome")==0){
        $query=$query." ORDER BY utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
    }
    else if(strcmp($order, "Email")==0){
        $query=$query." ORDER BY utilizadores.Email, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
    }
    else{
        $query=$query." ORDER BY utilizadores.Username, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
    }       
    $result = $connection->query($query);

    $num_of_results = mysqli_num_rows($result);

        
	if($num_of_results>0)
	{
        $_SESSION['search_result'] = 
        '  
        <script>  see(event, \'users_management\');
        </script> 
        <div class="table-wrapper">
            <table id="futebol_users" style="max-width:90%;">
                <thead>
                    <tr>       
                        <th style="display:none">Nº Identificação</th>    
                        <th><a href="php_functions/admin_manage_users.php?order=Username">Nome de Utilizador</a></th>        
                        <th><a href="php_functions/admin_manage_users.php?order=PNome">Nome</a></th>
                        <th><a href="php_functions/admin_manage_users.php?order=Email">Email</a></th>
                        <th>Banir utilizador</th>
                    </tr>
                </thead>
                <tbody>';
        

        for ($i = 1; $i <= $num_of_results; $i++){
							
            $row = mysqli_fetch_assoc($result);
           
            $name=$row['Primeiro_nome'].' '.$row['Ultimo_nome'];
            
            $_SESSION['search_result'] = $_SESSION['search_result'].                
            '<tr>
                <td style="display:none">'.$row['CC'].'</td> 
                <td><a onclick="show_user_details(this)">'.$row['Username'].'</a></td>
                <td><a onclick="show_user_details(this)">'.$name.'</a></td>
                <td><a onclick="show_user_details(this)">'.$row['Email'].'</a></td>';

            if($row["Admin"]==1) {   
                $_SESSION['search_result'] = $_SESSION['search_result'].'<td></td></tr>';
            }
            else{
                if ($row['Banido']==1){
                    $_SESSION['search_result'] = $_SESSION['search_result'].
                    '<td style="text-align:center; font-weight:bold; color:red">BANIDO</td></tr>';
                }
                else{
                    $_SESSION['search_result'] = $_SESSION['search_result'].
                    '<td style="text-align:center"> <a class="icon fa-ban" onclick="delete_user(this)"></a></td></tr>';
                }             
            }
        }

        $_SESSION['search_result'] = $_SESSION['search_result'].
                    '</tbody>
                </table>
            </div>';      
        
        header('Location: ../admin_page.php');
         exit();   
    }
    else
    {
        $_SESSION['search_result'] ='<script>  see(event, \'users_management\');</script> <h2><b>Sem resultados</b></h2>';
        
        header('Location: ../admin_page.php');
        exit();
    }
    $connection->close();
       
?>