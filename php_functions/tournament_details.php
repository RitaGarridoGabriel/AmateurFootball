<?php
    session_start();
    require_once "connect.php";
    $_SESSION['host']=$host;
    $_SESSION['db_user']=$db_user;
    $_SESSION['db_password']=$db_password; 
    $_SESSION['db_name']=$db_name;
    $connection = @new mysqli($host, $db_user, $db_password, $db_name);
    mysqli_set_charset($connection,"utf8");
    if ($connection->connect_errno != 0) {
        throw new Exception(mysqli_connect_errno());
    }
    $torneio=$_GET['Nome_torneio'];
    //Nome do torneio
    $_SESSION['tournament_details']= 
            '<script>
                document.getElementById("app_contents").style.display = "none"; 
                document.getElementById("banner").style.display = "none"; 
            </script> 
            <div id="tournament_details" style="padding-left:0em;padding-top:2em;padding-bottom:2em">'; 

    $result_torneios_decorrer = $connection->query("SELECT Nome_torneio 
                                    FROM `torneios` 
                                    WHERE `torneios`.Data_inicio < NOW() AND `torneios`.Data_fim > NOW() 
                                    AND Nome_torneio LIKE '".$torneio."';");

    $num_of_results_torneios_decorrer = mysqli_num_rows($result_torneios_decorrer);

    $result_torneios_agendados = $connection->query("SELECT Nome_torneio 
                                    FROM `torneios` 
                                    WHERE `torneios`.Data_inicio > NOW() AND Nome_torneio LIKE '".$torneio."';");

    $num_of_results_torneios_agendados = mysqli_num_rows($result_torneios_agendados);

    $result_torneios_passados = $connection->query("SELECT Nome_torneio 
                                    FROM `torneios` 
                                    WHERE `torneios`.Data_fim < NOW() AND Nome_torneio LIKE '".$torneio."';");

    $num_of_results_torneios_passados = mysqli_num_rows($result_torneios_passados);

    if($num_of_results_torneios_decorrer>0){
        $_SESSION['tournament_details']= $_SESSION['tournament_details'].
            '<div class="container">
                <header class="major">
                    <h2><a href="#">'.$torneio.'</a> - A DECORRER</h2>
                </header>
            </div>';
    }
    if($num_of_results_torneios_agendados>0){
        $_SESSION['tournament_details']= $_SESSION['tournament_details'].
            '<div class="container">
                <header class="major">
                    <h2><a href="#">'.$torneio.'</a> - POR INICIAR</h2>
                </header>
            </div>';
    }
    if($num_of_results_torneios_passados>0){
        $_SESSION['tournament_details']= $_SESSION['tournament_details'].
            '<div class="container">
                <header class="major">
                    <h2><a href="#">'.$torneio.'</a> - TERMINADO</h2>
                </header>
            </div>';
    }


    if($num_of_results_torneios_agendados>0){
        $result_jogos_agendados = $connection->query("SELECT Nome_equipa, Estado
                        FROM `equipas` 
                        WHERE Nome_torneio LIKE '$torneio'");

        $num_of_equipas_agendados = mysqli_num_rows($result_jogos_agendados);    
        $_SESSION['tournament_agendados'] ='';

        if ($num_of_equipas_agendados>0){          
            echo $num_of_equipas_agendados.'<br>';
            for($i = 1; $i <= $num_of_equipas_agendados; $i++){
                $row_equipas_agendados = mysqli_fetch_assoc($result_jogos_agendados);
                $team=$row_equipas_agendados['Nome_equipa'];
                echo $team.'<br>';

                $_SESSION['tournament_agendados'] =$_SESSION['tournament_agendados'].
                    '<div class="container">
                        <header class="major">';
                if($row_equipas_agendados['Estado']==0){
                    $_SESSION['tournament_agendados'] =$_SESSION['tournament_agendados'].
                      '<h3 style="text-align:left;">'.$team.' -INCOMPLETA</h3>                     
                        </header>'; 
                }
                else{
                    $_SESSION['tournament_agendados'] =$_SESSION['tournament_agendados'].
                      '<h3 style="text-align:left;">'.$team.' - COMPLETA</h3>                     
                        </header>';
                }
                $query = "SELECT utilizadores.CC, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome, `posicoes desejadas`.Posicao
                      FROM utilizadores, `posicoes desejadas`, `equipas jogadores`
                      WHERE utilizadores.CC LIKE `posicoes desejadas`.CC AND 
                      `equipas jogadores`.CC=utilizadores.CC AND `equipas jogadores`.Nome_equipa LIKE '".$team."'";

                if(isset($_GET['order'])){
                    if(strcmp($_GET['order'], 'PNome')==0){
                        $query=$query."ORDER BY utilizadores.Primeiro_nome, utilizadores.Ultimo_nome ";
                    }
                    else if(strcmp($_GET['order'], 'Posicao')==0){
                        $query=$query."ORDER BY `posicoes desejadas`.Posicao, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
                    }
                    else{
                         $query=$query."ORDER BY utilizadores.Primeiro_nome, utilizadores.Ultimo_nome ";
                    }
                }

                $result = $connection->query($query);

                $num_of_results = mysqli_num_rows($result);
                if($num_of_results>0){ 
                    $_SESSION['tournament_agendados'] = $_SESSION['tournament_agendados'].
                        '<table style="max-width:90%;">
                            <thead>
                                <tr>       
                                    <th style="display:none">Nº Identificação</th>      
                                    <th><a href="php_functions/tournament_details.php?Nome_torneio='.$torneio.'&order=PNome">Jogador</a></th>
                                    <th><a href="php_functions/tournament_details.php?Nome_torneio='.$torneio.'&order=Posicao">Posição</a></th>
                                </tr>
                            </thead>
                            <tbody>';
                
                    for ($j = 1; $j <= $num_of_results; $j++) {
                                        
                        $row = mysqli_fetch_assoc($result);             

                        $_SESSION['tournament_agendados'] = $_SESSION['tournament_agendados'].                
                        '<tr>
                            <td style="display:none">'.$row['CC'].'</td>
                            <td><a  href="php_functions/registered_user_details.php?user_id='.$row['CC'].'&back_torneio='.$torneio.'">'.$row['Primeiro_nome'].' '.$row['Ultimo_nome'].'</a></td> 
                            <td>'.$row['Posicao'].'</td>';
                    }
                    
                }
                $_SESSION['tournament_agendados'] = $_SESSION['tournament_agendados'].
                            '</tr>
                            </tbody>
                        </table>
                    </div>';
                
            }
            $_SESSION['tournament_details']=$_SESSION['tournament_details']. $_SESSION['tournament_agendados'];
            
        }

    }

    //TABELA CLASSIFICATIVA
    if($num_of_results_torneios_decorrer>0 OR $num_of_results_torneios_passados>0 ){
        //JORNADAS
        $result_jornadas = $connection->query("SELECT MAX(`jogos`.Jornada) N_jornadas
                        FROM `jogos` 
                        WHERE Nome_torneio = '$torneio'");
        
        $num_of_results_jornadas = mysqli_num_rows($result_jornadas);  
        $_SESSION['tournament_jornadas'] ='';  
        if ($num_of_results_jornadas>0){     
           
            $_SESSION['tournament_jornadas'] =$_SESSION['tournament_jornadas'].
            '<div class="container">
                <header class="major">
                    <h3 style="text-align:left;">Calendário</h3>                     
                </header>
                <nav id="nav_jornada">
                    <ul style="list-style:none; text-align: left;">'; 

            $row_jornadas = mysqli_fetch_assoc($result_jornadas);
            $num_of_jornadas=$row_jornadas['N_jornadas'];

            for($i = 1; $i <= $num_of_jornadas; $i++){

                $_SESSION['tournament_jornadas'] =$_SESSION['tournament_jornadas'].
                        '<li style="display:inline-block;">
                            <a id="jornada_'.$i.'" href="php_functions/jornada_details.php?Jornada='.$i.'&Nome_torneio='.$torneio.'">Jornada '.$i.'</a>
                        </li>';

                        
            }
            if(isset($_SESSION['jornada_details'])){
                $_SESSION['tournament_jornadas'] =$_SESSION['tournament_jornadas'].$_SESSION['jornada_details'];
                unset($_SESSION['jornada_details']);
            }
            $_SESSION['tournament_jornadas'] =$_SESSION['tournament_jornadas'].
                    '</ul>
                </nav>
            </div>'; 

            $_SESSION['tournament_details']=$_SESSION['tournament_details'].$_SESSION['tournament_jornadas'];
        }
        //CALCULO DA TABELA CLASSIFICATIVA           
        $query_create_table=("CREATE TABLE `futebolamador`.`aux` ( 
            `Equipa`           VARCHAR(100) NOT NULL , 
            `Pontos`           INT(11) NOT NULL , 
            `Jogos_disputados` INT(11) NOT NULL , 
            `Vitorias`         INT(11) NOT NULL , 
            `Empates`          INT(11) NOT NULL , 
            `Derrotas`         INT(11) NOT NULL , 
            `Golos`            INT(11) NOT NULL , 
            `Golos_sofridos`   INT(11) NOT NULL , 
            `Dif_golos`        INT NOT NULL 
               ) ENGINE=MyISAM DEFAULT CHARSET=utf8;");

        if($connection->query($query_create_table)){        
            //SELECT equipas do $torneio
            $result_nomes_equipas = $connection->query("SELECT Nome_equipa
                        FROM `equipas` 
                        WHERE Nome_torneio LIKE '".$torneio.
                        "' ORDER BY Nome_equipa");
            $num_of_equipas = mysqli_num_rows($result_nomes_equipas);        
                    
            //Para cada equipa calcular as estatisticas
            if ($num_of_equipas>0){           
                for($i = 1; $i <= $num_of_equipas; $i++){
                    $row_equipas = mysqli_fetch_assoc($result_nomes_equipas);
                    $query_statistics = "SELECT (derr.derrotas + vit.vitorias + emp.empates) 'Jogos', 
                              vit.vitorias 'Vitorias', emp.empates 'Empates', derr.derrotas 'Derrotas', 
                              (vit.golos_marcados+derr.golos_marcados+emp.golos_marcados) 'Golos marcados', 
                              (vit.golos_sofridos+derr.golos_sofridos+emp.golos_sofridos) 'Golos sofridos', 
                              ((vit.golos_marcados+derr.golos_marcados+emp.golos_marcados)-(vit.golos_sofridos+derr.golos_sofridos+emp.golos_sofridos)) 'Diferenca', (vit.vitorias*3+emp.empates) 'Pontos'
                                    FROM 
                                    (SELECT COUNT(*) vitorias, COALESCE(SUM(GREATEST(Golos_visitantes, Golos_visitados)),0) golos_marcados, 
                                                               COALESCE(SUM(LEAST(Golos_visitantes, Golos_visitados)),0) golos_sofridos
                                     FROM jogos 
                                     WHERE Nome_torneio LIKE '".$torneio."' 
                                     AND (Nome_equipa_visitante LIKE '".$row_equipas['Nome_equipa']."' AND Golos_visitantes > Golos_visitados 
                                     OR  Nome_equipa_visitada LIKE '".$row_equipas['Nome_equipa']."' AND Golos_visitantes < Golos_visitados))as vit,
        
                                    (SELECT COUNT(*) derrotas, COALESCE(SUM(LEAST(Golos_visitantes, Golos_visitados)),0) golos_marcados, 
                                                               COALESCE(SUM(GREATEST(Golos_visitantes, Golos_visitados)),0) golos_sofridos
                                     FROM jogos
                                     WHERE Nome_torneio LIKE '".$torneio."' 
                                     AND (Nome_equipa_visitante LIKE '".$row_equipas['Nome_equipa']."' AND Golos_visitantes < Golos_visitados
                                     OR  Nome_equipa_visitada LIKE '".$row_equipas['Nome_equipa']."' AND Golos_visitantes > Golos_visitados))as derr,
                                    
                                    (SELECT COUNT(*) empates, COALESCE(SUM(Golos_visitados),0) golos_marcados, 
                                                              COALESCE(SUM(Golos_visitados),0) golos_sofridos
                                     FROM jogos 
                                     WHERE Nome_torneio LIKE '".$torneio."' 
                                     AND (Nome_equipa_visitante LIKE '".$row_equipas['Nome_equipa']."' AND Golos_visitantes = Golos_visitados
                                     OR  Nome_equipa_visitada LIKE '".$row_equipas['Nome_equipa']."' AND Golos_visitantes = Golos_visitados))as emp";

                    $result_statistics=$connection->query($query_statistics);

                    $num_of_statistics = mysqli_num_rows($result_statistics);        
                
                    //Colocar a informacao de cada equipa na tabela auxiliar
                    if ($num_of_statistics>0){   
                        $row_statistics = mysqli_fetch_assoc($result_statistics);
                        $connection->query("
                            INSERT INTO `aux` VALUES
                            ('".$row_equipas['Nome_equipa']."','".$row_statistics['Pontos']."','".$row_statistics['Jogos']."','".$row_statistics['Vitorias']."','".$row_statistics['Empates']."','".$row_statistics['Derrotas']."','".$row_statistics['Golos marcados']."','".$row_statistics['Golos sofridos']."','".$row_statistics['Diferenca']
                            ."');");
                    }        
                }
                $result_tabela_classificativa = $connection->query("SELECT Equipa, Pontos, Jogos_disputados, Vitorias, Empates, Derrotas, Golos, Golos_sofridos, Dif_golos, equipas.Estado
                                                                    FROM `aux`, equipas
                                                                    WHERE aux.Equipa=equipas.Nome_equipa
                                                                    ORDER BY Pontos DESC;");

                $_SESSION['tournament_table']=''; 
                $num_of_results_tabela_classificativa = mysqli_num_rows($result_tabela_classificativa);
                
                if ($num_of_results_tabela_classificativa>0){
                     $_SESSION['tournament_table']=  $_SESSION['tournament_table'].
                        '<div class="container">
                            <header class="major">
                                <h3 style="text-align:left;">Tabela classificativa</h3>                     
                            </header>
                            <div class="table-wrapper">
                                <table>
                                    <thead>
                                        <tr>                                
                                            <th style="text-align:center;">RANKING</th>
                                            <th style="text-align:center;">EQUIPA</th>
                                            <th style="text-align:center;">PONTOS</th>
                                            <th style="text-align:center;">JOGOS DISPUTADOS</th>
                                            <th style="text-align:center;">VITÓRIAS</th>
                                            <th style="text-align:center;">EMPATES</th>
                                            <th style="text-align:center;">DERROTAS</th>
                                            <th style="text-align:center;">GOLOS</th>                             
                                            <th style="text-align:center;">GOLOS SOFRIDOS</th>
                                            <th style="text-align:center;">DIF. GOLOS</th>                                    
                                        </tr>
                                    </thead>
                                    <tbody>';
        
                     for($j = 1; $j <= $num_of_results_tabela_classificativa; $j++){

                        $row_tabela_classificativa = mysqli_fetch_assoc($result_tabela_classificativa);
                        $_SESSION['tournament_table']=  $_SESSION['tournament_table'].
                        '<tr>
                            <td style="text-align:center;">'.$j.'</td>';
                            if($row_tabela_classificativa['Estado']==0){
                                $_SESSION['tournament_table']=  $_SESSION['tournament_table'].                
                              '<td><a href="php_functions/team_details.php?team_id='.$row_tabela_classificativa['Equipa'].'&Nome_torneio='.$torneio.'">'.$row_tabela_classificativa['Equipa'].'</a> <strong> (INCOMPLETA)</strong></td>';
                            }else{
                                 $_SESSION['tournament_table']=  $_SESSION['tournament_table'].
                              '<td><a href="php_functions/team_details.php?team_id='.$row_tabela_classificativa['Equipa'].'&Nome_torneio='.$torneio.'">'.$row_tabela_classificativa['Equipa'].'</a></td>';
                            }

                            $_SESSION['tournament_table']=  $_SESSION['tournament_table'].
                          ' <th style="text-align:center; font-size:1.1em;">'.$row_tabela_classificativa['Pontos'].'</th>
                            <th style="text-align:center">'.$row_tabela_classificativa['Jogos_disputados'].'</th>
                            <th style="text-align:center">'.$row_tabela_classificativa['Vitorias'].'</th>
                            <th style="text-align:center">'.$row_tabela_classificativa['Empates'].'</th>
                            <th style="text-align:center">'.$row_tabela_classificativa['Derrotas'].'</th>
                            <th style="text-align:center">'.$row_tabela_classificativa['Golos'].'</th>
                            <th style="text-align:center">'.$row_tabela_classificativa['Golos_sofridos'].'</th>
                            <th style="text-align:center">'.$row_tabela_classificativa['Dif_golos'].'</th>
                        </tr>';
                     }

                    $_SESSION['tournament_table']=$_SESSION['tournament_table'].
                            '</tbody>
                            </table>
                        </div>
                      </div>';
                    $_SESSION['tournament_details']=$_SESSION['tournament_details']. $_SESSION['tournament_table'];
                }
            }    
            $connection->query("DROP TABLE aux;");
        }
    }

    //MELHORES MARCADORES DO TORNNEIO
    if($num_of_results_torneios_decorrer>0 OR $num_of_results_torneios_passados>0 ){
        $result_melhores_marcadores = $connection->query( "SELECT utilizadores.Primeiro_nome, utilizadores.Ultimo_nome, jogadores_jogo.Nome_torneio, SUM(Golos_marcados) total, jogadores_jogo.CC, jogadores_jogo.Nome_equipa
                                                            FROM jogadores_jogo, utilizadores
                                                            WHERE jogadores_jogo.CC = utilizadores.CC AND jogadores_jogo.Nome_torneio LIKE '".$torneio."'
                                                            GROUP BY jogadores_jogo.CC
                                                            ORDER BY total DESC, utilizadores.Primeiro_nome");

        $num_of_melhores_marcadores = mysqli_num_rows($result_melhores_marcadores);
                
        $_SESSION['tournament_best']='';
        if ($num_of_melhores_marcadores>0){
            $_SESSION['tournament_best']=  $_SESSION['tournament_best'].
                '<section id="two" class="wrapper style2 special">
                    <div class="container">
                        <header class="major">
                            <h3 style="text-align:left;">Melhores marcadores</h3>                       
                        </header>
                        <section class="profiles">      
                            <div class="row">';
            for($l = 1; $l <= $num_of_melhores_marcadores; $l++){
                $row_marcadores = mysqli_fetch_assoc($result_melhores_marcadores);

                $_SESSION['tournament_best']=  $_SESSION['tournament_best'].

                    '<section class="3u 6u(medium) 12u$(xsmall) profile">';

                if (isset($_SESSION['logged'])){
                     $_SESSION['tournament_best']=  $_SESSION['tournament_best'].
                            '<a href = "php_functions/registered_user_details.php?user_id='.$row_marcadores['CC'].'">
                                <img src="images/profile_placeholder.gif" alt="" />
                            </a>';
                }
                else{
                    $_SESSION['tournament_best']=  $_SESSION['tournament_best'].
                            '<img src="images/profile_placeholder.gif" alt="" />';
                }
                $_SESSION['tournament_best']=  $_SESSION['tournament_best'].
                        
                            '<h4"><strong>'.$l.'º</strong></h4>                                                       
                             <p>'.$row_marcadores['Primeiro_nome'].' '.$row_marcadores['Ultimo_nome'].'<br>'
                                .$row_marcadores['Nome_equipa'].'<br>'
                                .$row_marcadores['total'].' Golos</p>
                        
                    </section>';
                if($l==4) break;
            }
            $_SESSION['tournament_best']=  $_SESSION['tournament_best']. '
                    </div>
                </section>';
        
            /*FIM DE TODOS OS CONTEUDOS DE UM TORNEIO*/
            $_SESSION['tournament_best']= $_SESSION['tournament_best'].'</section>';
            $_SESSION['tournament_details']=$_SESSION['tournament_details']. $_SESSION['tournament_best'];
        }  
    }
    
    $_SESSION['tournament_details'] =$_SESSION['tournament_details']. 
    '<a href="index.php" class="button" style="margin-left:2em;">Voltar</a>';
    header('Location: ../index.php');
    $connection->close();


?>