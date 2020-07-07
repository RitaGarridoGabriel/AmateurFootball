<?php
    session_start();

    require_once "connect.php";
    
    $connection = @new mysqli($host, $db_user, $db_password, $db_name);
    mysqli_set_charset($connection,"utf8");
    if ($connection->connect_errno != 0)
    {
        throw new Exception(mysqli_connect_errno());
    }   
    $_SESSION['field_details'] = 
        '<script>
            document.getElementById("app_contents").style.display = "none"; 
            document.getElementById("banner").style.display = "none"; 
        </script>
        <div id="field_details" class="registered" style="padding-left:15em;padding-top:2em;padding-bottom:2em">
            <h2>Detalhes do Campo</h2>';     
        
    $field = $_GET['field_id'];   
                   
    $result = $connection->query("SELECT Nome_campo, Rua, Numero, Cidade, GPS, Custo
                                    FROM campos
                                    WHERE campos.Nome_campo LIKE ("."'$field'".")");

    $num_of_results = mysqli_num_rows($result);

        
    if($num_of_results>0){

        $_SESSION['field_details'] = $_SESSION['field_details'].
                '<div class="table-wrapper">
                    <table style="max-width:90%;">
                        <thead>
                            <tr>         
                                <th>Nome do campo</th>        
                                <th>Morada</th>
                                <th>Coordenadas GPS</th>
                                <th>Custo</th>                               
                            </tr>
                        </thead>
                        <tbody>';

        for ($i = 1; $i <= $num_of_results; $i++) {
                            
            $row = mysqli_fetch_assoc($result);
            
            $_SESSION['field_details'] = $_SESSION['field_details'].                
            '<tr>
                <td>'.$row['Nome_campo'].'</td>
                <td>'.$row['Rua'].', '.$row['Numero'].' - '.$row['Cidade'].'</td> 
                <td>'.$row['GPS'].'</td>
                <td>'.$row['Custo'].'</td>'; 
        }

        $_SESSION['field_details'] = $_SESSION['field_details'].
                    '</tbody>
                </table>
            </div>';
            if(isset($_GET['back_torneio'])){
                $_SESSION['field_details'] = $_SESSION['field_details'].
                    '<a href="php_functions/tournament_details.php?Nome_torneio='.$_GET['back_torneio'].'" class="button">Voltar</a>
                     </div>';
            }
            else{
                $_SESSION['field_details'] = $_SESSION['field_details'].
                    '<a href="index.php" class="button">Voltar</a>
                     </div>';
            }
           
        header('Location: ../index.php');
        exit();   
    }
    else
    {
        $_SESSION['field_details'] =$_SESSION['field_details'].'<h2><b>O utilizador não foi encontrado</b></h2>';

        
        if(isset($_GET['back_torneio'])){
            $_SESSION['field_details'] = $_SESSION['field_details'].
                '<a href="php_functions/tournament_details.php?Nome_torneio='.$_GET['back_torneio'].'" class="button">Voltar</a>
                 </div>';
        }
        else{
            $_SESSION['field_details'] = $_SESSION['field_details'].
                '<a href="index.php" class="button">Voltar</a>
                 </div>';
        }
        header('Location: ../index.php');
        exit();
    }
    $connection->close();
       
?>