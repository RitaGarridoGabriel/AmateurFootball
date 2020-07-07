<?php
	session_start();

    require_once "connect.php";
    
    $connection = @new mysqli($host, $db_user, $db_password, $db_name);
    mysqli_set_charset($connection,"utf8");
	if ($connection->connect_errno != 0)
	{
		throw new Exception(mysqli_connect_errno());
	}        
        
	$jornada = $_GET['Jornada'];	
    $torneio = $_GET['Nome_torneio'];
    $_SESSION['jornada_details'] ='';

	$query = "SELECT jogos.Data, jogos.Nome_equipa_visitante, jogos.Nome_equipa_visitada, COALESCE(jogos.Golos_visitantes, '-') 'Golos_visitantes', COALESCE(jogos.Golos_visitados, '-') 'Golos_visitados', slot.Nome_campo, campos.Rua, campos.Numero, campos.GPS, campos.Cidade, slot.Hora_inicio
            FROM jogos, slot, campos
            WHERE jogos.id_slot=slot.id_slot AND campos.Nome_campo=slot.Nome_campo AND jogos.Nome_torneio='$torneio' AND jogos.jornada='$jornada'";

    $result = $connection->query($query);

    $num_of_results = mysqli_num_rows($result);
    
	
    if($num_of_results>0){
        $_SESSION['jornada_details'] = $_SESSION['jornada_details'].'
        <script>
            var x = document.getElementById("jornada_'.$jornada.'");
            if(x != null){         
               x.style.fontWeight="bold";
           }
        </script>
        <table id="tabela_jornada" style="width:auto; max-width:90%">
                    <tbody>';         
                
            for($i = 1; $i <= $num_of_results; $i++){
                $row = mysqli_fetch_assoc($result);

                $_SESSION['jornada_details'] = $_SESSION['jornada_details'].
                '<tr>
                    <td style="text-align:left; min-width:10em;">'.$row['Data'].' -- '.$row['Hora_inicio'].'</td>
                    <td>'.$row['Nome_equipa_visitante'].'</td>
                    <td style="font-weight: bold">'.$row['Golos_visitantes'].'</td>
                    <td style="font-weight: bold">'.$row['Golos_visitados'].'</td>
                    <td>'.$row['Nome_equipa_visitada'].'</td> 
                    <td style="text-align:right; min-width:15em">
                        <div class = "nome_campo">
                        @ <a href="php_functions/field_details.php?field_id='.$row['Nome_campo'].'&back_torneio='.$torneio.'">'.$row['Nome_campo'].
                            '</a><span class = "info_campo">'.$row['Rua'].', '.$row['Numero'].' ('.$row['Cidade'].') <br>['.$row['GPS'].
                            ']</span>
                        </div>
                    </td>     
                 </tr>';
            }
            $_SESSION['jornada_details'] =$_SESSION['jornada_details'].
                '        </tbody>
                    </table>'; 
            
          
    }
    else{
        
    }

    header('Location: tournament_details.php?Nome_torneio='.$torneio);
    exit(); 
    $connection->close();
       
?>