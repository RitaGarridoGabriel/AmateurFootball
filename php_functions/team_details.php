<?php
	session_start();

    require_once "connect.php";
    
    $connection = @new mysqli($host, $db_user, $db_password, $db_name);
    mysqli_set_charset($connection,"utf8");
	if ($connection->connect_errno != 0)
	{
		throw new Exception(mysqli_connect_errno());
	}        
        
	$team = $_GET['team_id'];	
    if(isset($_GET['Nome_torneio'])){
        $torneio = $_GET['Nome_torneio'];
    }
    //selecciona o numero de golos marcados, posicao, numero de falhas, prioridade de conv de cada jogador da equipa
	$query = "SELECT utilizadores.CC, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome, golos.Golos_marcados, golos.Posicao, jogadores.Prioridade_conv, jogadores.Numero_falhas
              FROM `equipas jogadores`, jogadores, utilizadores, 
                (SELECT CC, SUM(Golos_marcados) Golos_marcados, Posicao
                FROM `jogadores_jogo`
                GROUP BY CC) as golos
              WHERE utilizadores.CC = `equipas jogadores`.CC AND utilizadores.CC = jogadores.CC
              AND golos.CC = utilizadores.CC AND `equipas jogadores`.Nome_equipa = '".$team."'";

    if(isset($_GET['order'])){
        if(strcmp($_GET['order'], 'PNome')==0){
            $query=$query."ORDER BY utilizadores.Primeiro_nome, utilizadores.Ultimo_nome ";
        }
        else if(strcmp($_GET['order'], 'Posicao')==0){
            $query=$query."ORDER BY golos.Posicao, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
        }
        else if(strcmp($_GET['order'], 'Golos')==0){
            $query=$query."ORDER BY golos.Golos_marcados DESC, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
        }
        else if(strcmp($_GET['order'], 'Prioridade')==0){
            $query=$query."ORDER BY jogadores.Prioridade_conv DESC, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
        }
        else if(strcmp($_GET['order'], 'NFalhas')==0){
            $query=$query."ORDER BY jogadores.Numero_falhas DESC, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
        }
        else{
             $query=$query."ORDER BY utilizadores.Primeiro_nome, utilizadores.Ultimo_nome ";
        }
    }     

    $result = $connection->query($query);

    $num_of_results = mysqli_num_rows($result);
 
	if($num_of_results>0){

        $_SESSION['team_details'] = 
        '<script>
            document.getElementById("app_contents").style.display = "none"; 
            document.getElementById("banner").style.display = "none"; 
        </script>
        <div id="team_details" class="registered" style="padding-left:15em;padding-top:2em;padding-bottom:2em">
            <h2>'.$team.' - Detalhes</h2>';

        //jogos desta equipa
        $query2 = "SELECT jogos.Data, jogos.Nome_equipa_visitante, jogos.Nome_equipa_visitada, COALESCE(jogos.Golos_visitantes, '-') 'Golos_visitantes', COALESCE(jogos.Golos_visitados, '-') 'Golos_visitados', slot.Nome_campo, jogos.Nome_torneio
              FROM jogos, slot
              WHERE slot.id_slot = jogos.id_slot AND jogos.Nome_equipa_visitante = '".$team."' OR jogos.Nome_equipa_visitada LIKE '".$team."'
              ORDER BY jogos.Data";    

        $result2 = $connection->query($query2);

        $num_of_results2 = mysqli_num_rows($result2);
     
        if($num_of_results2>0){ 
            $_SESSION['team_details'] = $_SESSION['team_details'].'
                <div class="container">
                <header class="major">
                    <h3 style="text-align:left;">Jogos</h3>                     
                </header>
                <table id="jogos_equipa" style="width:auto; max-width:90%">
                    <tbody>';

            for($j = 1; $j <= $num_of_results2; $j++){
                $row2 = mysqli_fetch_assoc($result2);
                
                $_SESSION['team_details'] =$_SESSION['team_details'].
                '<tr>
                    <td style="text-align:left; min-width:10em;">'.$row2['Data'].'</td>
                    <td><a href="php_functions/team_details.php?team_id='.$row2['Nome_equipa_visitante'].'&Nome_torneio='.$row2['Nome_torneio'].'">'.$row2['Nome_equipa_visitante'].'</a></td>
                    <td style="font-weight: bold">'.$row2['Golos_visitantes'].'</td>
                    <td style="font-weight: bold">'.$row2['Golos_visitados'].'</td>
                    <td><a href="php_functions/team_details.php?team_id='.$row2['Nome_equipa_visitada'].'&Nome_torneio='.$row2['Nome_torneio'].'">'.$row2['Nome_equipa_visitada'].'</a></td>  
                    <td style="text-align:right; min-width:15em">@ '.$row2['Nome_campo'].'</td>       
                 </tr>'; 

            }
            $_SESSION['team_details'] =$_SESSION['team_details'].
                '        </tbody>
                    </table>
            </div>';       
        }     


        //lista de jogadores
        $_SESSION['team_details'] = $_SESSION['team_details'].
                '<div class="table-wrapper">
                    <table style="max-width:90%;">
                        <thead>
                            <tr>       
                                <th style="display:none">Nº Identificação</th>      
                                <th><a href="php_functions/team_details.php?team_id='.$team.'&order=PNome">Jogador</a></th>
                                <th><a href="php_functions/team_details.php?team_id='.$team.'&order=Posicao">Posição</a></th>
                                <th style="text-align:center;"><a href="php_functions/team_details.php?team_id='.$team.'&order=Golos">Golos marcados</a></th>
                                <th style="text-align:center;"><a href="php_functions/team_details.php?team_id='.$team.'&order=Prioridade">Prioridade de convocatória</a></th> 
                                <th style="text-align:center;"><a href="php_functions/team_details.php?team_id='.$team.'&order=NFalhas">Número de falhas</a></th>                                 
                            </tr>
                        </thead>
                        <tbody>';

        for ($i = 1; $i <= $num_of_results; $i++) {
							
            $row = mysqli_fetch_assoc($result);  
            if(isset($_SESSION['logged'])){
                if ($_SESSION['logged'] == true){
                    $_SESSION['team_details'] = $_SESSION['team_details'].                
                    '<tr>
                        <td style="display:none">'.$row['CC'].'</td>
                        <td><a href="php_functions/registered_user_details.php?user_id='.$row['CC'].'">'.$row['Primeiro_nome'].' '.$row['Ultimo_nome'].'</a></td> 
                        <td>'.$row['Posicao'].'</td>';
                }

            }else{
                $_SESSION['team_details'] = $_SESSION['team_details'].                
                '<tr>
                    <td style="display:none">'.$row['CC'].'</td>
                    <td>'.$row['Primeiro_nome'].' '.$row['Ultimo_nome'].'</td> ';
            }    

            $_SESSION['team_details'] = $_SESSION['team_details'].                
                '   <td>'.$row['Posicao'].'</td>
                    <td style="text-align:center;">'.$row['Golos_marcados'].'</td>
                    <td style="text-align:center;">'.$row['Prioridade_conv'].'</td>
                    <td style="text-align:center;">'.$row['Numero_falhas'].'</td>';   	
        }

        $_SESSION['team_details'] = $_SESSION['team_details'].
                    '</tr>
                    </tbody>
                </table>
            </div>';

        if(isset($_GET['Nome_torneio'])){
            $_SESSION['team_details'] = $_SESSION['team_details'].    
                 '<a href="php_functions/tournament_details.php?Nome_torneio='.$torneio.'" class="button">Voltar</a>
                </div>'; 
        }
        else{
            $_SESSION['team_details'] = $_SESSION['team_details'].
            '<a href="index.php" class="button">Voltar</a>
            </div>';
        }

         
        header('Location: ../index.php');
        exit();   
    }
    else{
        //se ainda nao houver jogos associados a esta equipa mostra lista de jogadores
        $query = "SELECT utilizadores.CC, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome, jogadores.Prioridade_conv, jogadores.Numero_falhas, `posicoes desejadas`.Posicao
              FROM `equipas jogadores`, jogadores, utilizadores, `posicoes desejadas`
              WHERE utilizadores.CC = `equipas jogadores`.CC AND utilizadores.CC = jogadores.CC
              AND utilizadores.CC = `posicoes desejadas`.CC AND `equipas jogadores`.Nome_equipa = '".$team."'";

        if(isset($_GET['order'])){
            if(strcmp($_GET['order'], 'PNome')==0){
                $query=$query."ORDER BY utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
            }
            else if(strcmp($_GET['order'], 'Posicao')==0){
                $query=$query."ORDER BY golos.Posicao, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
            }
            else if(strcmp($_GET['order'], 'Golos')==0){
                $query=$query."ORDER BY golos.Golos_marcados DESC, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
            }
            else if(strcmp($_GET['order'], 'Prioridade')==0){
                $query=$query."ORDER BY jogadores.Prioridade_conv DESC, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
            }
            else if(strcmp($_GET['order'], 'NFalhas')==0){
                $query=$query."ORDER BY jogadores.Numero_falhas DESC, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
            }            
            else{
                $query=$query."ORDER BY utilizadores.Primeiro_nome, utilizadores.Ultimo_nome ";
            }
        }
        $result = $connection->query($query);

        $num_of_results = mysqli_num_rows($result);
     
        if($num_of_results>0){ 
            $_SESSION['team_details'] = 
                '<script>
                    document.getElementById("app_contents").style.display = "none"; 
                    document.getElementById("banner").style.display = "none"; 
                </script>
                <div id="team_details" class="registered" style="padding-left:15em;padding-top:2em;padding-bottom:2em">
                    <h2>'.$team.' - Detalhes</h2>
                        <div class="table-wrapper">
                            <table style="max-width:90%;">
                                <thead>
                                    <tr>       
                                        <th style="display:none">Nº Identificação</th>      
                                        <th><a href="php_functions/team_details.php?team_id='.$team.'&order=PNome">Jogador</a></th>
                                        <th><a href="php_functions/team_details.php?team_id='.$team.'&order=Posicao">Posição</a></th>
                                        <th style="text-align:center;"><a href="php_functions/team_details.php?team_id='.$team.'&order=Golos">Golos marcados</a></th>
                                        <th style="text-align:center;"><a href="php_functions/team_details.php?team_id='.$team.'&order=Prioridade">Prioridade de convocatória</a></th> 
                                        <th style="text-align:center;"><a href="php_functions/team_details.php?team_id='.$team.'&order=NFalhas">Número de falhas</a></th>                                 
                                    </tr>
                                </thead>
                                <tbody>';
        
            for ($i = 1; $i <= $num_of_results; $i++) {
                                
                $row = mysqli_fetch_assoc($result);             

                $_SESSION['team_details'] = $_SESSION['team_details'].                
                '<tr>
                    <td style="display:none">'.$row['CC'].'</td>
                    <td">'.$row['Primeiro_nome'].' '.$row['Ultimo_nome'].'</td> 
                    <td>'.$row['Posicao'].'</td>
                    <td style="text-align:center;">-</td>
                    <td style="text-align:center;">'.$row['Prioridade_conv'].'</td>
                    <td style="text-align:center;">'.$row['Numero_falhas'].'</td>';
            }
        }

        $_SESSION['team_details'] = $_SESSION['team_details'].
                    '</tr>
                    </tbody>
                </table>
            </div>
            <a href="index.php" class="button">Voltar</a>
        </div>';      
        
        header('Location: ../index.php');
        exit(); 
    }
    $connection->close();
       
?>