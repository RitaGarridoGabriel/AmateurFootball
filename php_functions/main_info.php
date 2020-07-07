<?php

    function set_tournament_available(){          
        require_once "php_functions/connect.php";       
        $connection = @new mysqli($_SESSION['host'], $_SESSION['db_user'], $_SESSION['db_password'], $_SESSION['db_name']);
        
        mysqli_set_charset($connection,"utf8");
        if ($connection->connect_errno != 0)
        {
            throw new Exception(mysqli_connect_errno());
        }
        
        $result = $connection->query("SELECT equipas.Nome_torneio
                                    FROM equipas LEFT JOIN 
                                        (SELECT `equipas jogadores`.Nome_equipa, COUNT(*) 'conta' 
                                         FROM `equipas jogadores` 
                                         GROUP BY Nome_equipa) as disponibilidade 
                                    ON equipas.Nome_equipa LIKE disponibilidade.Nome_equipa 
                                    WHERE disponibilidade.conta<16
                                    GROUP BY equipas.Nome_torneio");

        $num_of_results = mysqli_num_rows($result);
        if ($num_of_results>0){
            $_SESSION['tournament_available'] ='<p>';
            for($i = 1; $i <= $num_of_results; $i++){
                $row = mysqli_fetch_assoc($result);
               
                if($i==$num_of_results){
                    $_SESSION['tournament_available'] = $_SESSION['tournament_available'].
                    '<a href="php_functions/tournament_details.php?Nome_torneio='.$row['Nome_torneio'].'" style="color:white; font-weight:bold;">'.$row['Nome_torneio'].'</a>';
                }else{
                    $_SESSION['tournament_available'] = $_SESSION['tournament_available'].
                    '<a href="php_functions/tournament_details.php?Nome_torneio='.$row['Nome_torneio'].'" style="color:white; font-weight:bold;">'.$row['Nome_torneio'].'</a>'.',';
                }
                
            }


            $_SESSION['tournament_available'] = $_SESSION['tournament_available'].'</p>';       
        }
    } 


    function set_tournament_list(){
        require_once "php_functions/connect.php";       
        $connection = @new mysqli($_SESSION['host'], $_SESSION['db_user'], $_SESSION['db_password'], $_SESSION['db_name']);
        
        mysqli_set_charset($connection,"utf8");
        if ($connection->connect_errno != 0) {
            throw new Exception(mysqli_connect_errno());
        }
        $_SESSION['tournaments_list']='';
        
        //Nome do torneio
        $result_torneios_decorrer = $connection->query("SELECT Nome_torneio, Data_inicio, Data_fim 
                                    FROM `torneios` 
                                    WHERE `torneios`.Data_inicio < NOW() AND `torneios`.Data_fim > NOW() 
                                    ORDER BY Nome_torneio");

        $result_torneios_passados = $connection->query("SELECT Nome_torneio, Data_inicio, Data_fim
                                    FROM `torneios` 
                                    WHERE `torneios`.Data_fim < NOW() 
                                    ORDER BY Nome_torneio");

        $num_of_torneios_decorrer = mysqli_num_rows($result_torneios_decorrer);
       
        $num_of_torneios_passados = mysqli_num_rows($result_torneios_passados);

        set_proximos_jogos_todos($connection);
        //Para cada torneio...
        if ($num_of_torneios_decorrer>0){
            $_SESSION['tournaments_list']=$_SESSION['tournaments_list'].
                '<section class="wrapper style1 special">
                    <h2 style="text-align:center;">Torneios a decorrer</h2> 
                    <div class="table-wrapper">';
           

            for($i = 1; $i <= $num_of_torneios_decorrer; $i++){
                $row= mysqli_fetch_assoc($result_torneios_decorrer);
                 $_SESSION['tournaments_list'] =$_SESSION['tournaments_list'].
                        '<li style="display:inline-block;">
                            <a id="'.$row['Nome_torneio'].'" href="#'.$row['Nome_torneio'].'">'.$row['Nome_torneio'].'</a>
                        </li>';


                $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].                
                    '<h2 name="'.$row['Nome_torneio'].'" style="text-align:left;padding-left:2em;"><td><a href="php_functions/tournament_details.php?Nome_torneio='.$row['Nome_torneio'].'">'.$row['Nome_torneio'].' ('.$row['Data_inicio'].' - '.$row['Data_fim'].')</a></h2>'; 

                //proximos jogos
                set_proximos_jogos_torneio($connection, $row['Nome_torneio']);
                //tabela classificativa
                set_tabela_classificativa($connection, $row['Nome_torneio']);
                //melhores maracadore
                set_melhores_marcadores($connection, $row['Nome_torneio']);

            }
            $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].
                    '</div>
               
            </section>';
        }
        if ($num_of_torneios_passados>0){

            $_SESSION['tournaments_list']=$_SESSION['tournaments_list'].
            '<section class="wrapper style2 special">               
                <h2 style="text-align:center;">Torneios terminados</h2> 
                <div class="table-wrapper">';

            for($i = 1; $i <= $num_of_torneios_passados; $i++){
                $row= mysqli_fetch_assoc($result_torneios_passados);
                $_SESSION['tournaments_list'] =$_SESSION['tournaments_list'].
                        '<li style="display:inline-block;">
                            <a id="'.$row['Nome_torneio'].'" href="#'.$row['Nome_torneio'].'">'.$row['Nome_torneio'].'</a>
                        </li>';

                $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].
                    '
                    <h2 name="'.$row['Nome_torneio'].'" style="text-align:left; padding-left:2em;"><a href="php_functions/tournament_details.php?Nome_torneio='.$row['Nome_torneio'].'">'.$row['Nome_torneio'].' ('.$row['Data_inicio'].' - '.$row['Data_fim'].')</a></h2>';
                //tabela classificativa
                set_tabela_classificativa($connection, $row['Nome_torneio']);
                //melhores maracadore
                set_melhores_marcadores($connection, $row['Nome_torneio']);
            }
            $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].
                '</div>
            </section>';
        }

    }



    function set_tabela_classificativa($connection, $torneio){
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

                //TABELA CLASSIFICATIVA FINAL
                $result_tabela_classificativa = $connection->query("SELECT Equipa, Pontos, Jogos_disputados, Vitorias, Empates, Derrotas, Golos, Golos_sofridos, Dif_golos, equipas.Estado
                                                                    FROM `aux`, equipas
                                                                    WHERE aux.Equipa=equipas.Nome_equipa
                                                                    ORDER BY Pontos DESC;");

                //$_SESSION['tournament_table']=''; 
                $num_of_results_tabela_classificativa = mysqli_num_rows($result_tabela_classificativa);
                
                if ($num_of_results_tabela_classificativa>0){
                     $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].
                        '<div class="container">
                            <header class="major">
                                <h3 style="text-align:left;">Tabela Classificativa</h3>                       
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
                        $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].
                        '<tr>
                            <td style="text-align:center;">'.$j.'</td>';
                            if($row_tabela_classificativa['Estado']==0){
                                $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].                
                              '<td><a href="php_functions/team_details.php?team_id='.$row_tabela_classificativa['Equipa'].'&Nome_torneio='.$torneio.'">'.$row_tabela_classificativa['Equipa'].'</a> <strong> (INCOMPLETA)</strong></td>';
                            }else{
                                 $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].
                              '<td><a href="php_functions/team_details.php?team_id='.$row_tabela_classificativa['Equipa'].'&Nome_torneio='.$torneio.'">'.$row_tabela_classificativa['Equipa'].'</a></td>';
                            }

                            $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].
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

                    $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].
                            '</tbody>
                            </table>
                        </div>
                      </div>';
                }
            }    
            $connection->query("DROP TABLE aux;");
        }
    }

    function set_melhores_marcadores($connection, $torneio){
        
        $result_melhores_marcadores = $connection->query( "SELECT utilizadores.Primeiro_nome, utilizadores.Ultimo_nome, jogadores_jogo.Nome_torneio, SUM(Golos_marcados) total, jogadores_jogo.CC, jogadores_jogo.Nome_equipa
                                                            FROM jogadores_jogo, utilizadores
                                                            WHERE jogadores_jogo.CC = utilizadores.CC AND jogadores_jogo.Nome_torneio LIKE '".$torneio."'
                                                            GROUP BY jogadores_jogo.CC
                                                            ORDER BY total DESC, utilizadores.Primeiro_nome");

        $num_of_melhores_marcadores = mysqli_num_rows($result_melhores_marcadores);
                
        
        if ($num_of_melhores_marcadores>0){
            $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].
                '<section id="two" class="wrapper style2 special">
                    <div class="container">
                        <header class="major">
                            <h3 style="text-align:left;">Melhores marcadores</h3>                       
                        </header>
                        <section class="profiles">      
                            <div class="row">';
            for($l = 1; $l <= $num_of_melhores_marcadores; $l++){
                $row_marcadores = mysqli_fetch_assoc($result_melhores_marcadores);

               $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].
                    '<section class="3u 6u(medium) 12u$(xsmall) profile">';

                if (isset($_SESSION['logged'])){
                     $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].
                            '<a href = "php_functions/registered_user_details.php?user_id='.$row_marcadores['CC'].'">
                                <img src="images/profile_placeholder.gif" alt="" />
                            </a>';
                }
                else{
                    $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].
                            '<img src="images/profile_placeholder.gif" alt="" />';
                }
                $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].
                        
                            '<h4"><strong>'.$l.'º</strong></h4>                                                       
                             <p>'.$row_marcadores['Primeiro_nome'].' '.$row_marcadores['Ultimo_nome'].'<br>'
                                .$row_marcadores['Nome_equipa'].'<br>'
                                .$row_marcadores['total'].' Golos</p>
                        
                    </section>';
                if($l==4) break;
            }
            $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].'
                    </div>
                </section>';
        
            $_SESSION['tournaments_list'] = $_SESSION['tournaments_list'].'</section>';
        }  
    }

    function set_proximos_jogos_todos($connection){
        $result_jogos_futuros = $connection->query("SELECT jogos.Data, jogos.Nome_torneio, jogos.Nome_equipa_visitante, jogos.Nome_equipa_visitada, COALESCE(jogos.Golos_visitantes,'-') 'Golos_visitantes', COALESCE(jogos.Golos_visitados, '-') 'Golos_visitados', slot.Nome_campo, campos.Rua, campos.Numero, campos.Cidade, campos.GPS, slot.Hora_inicio
                                    FROM `jogos`, slot, campos
                                    WHERE slot.id_slot=jogos.id_slot AND slot.Nome_campo LIKE campos.Nome_campo
                                    AND WEEK(jogos.Data) = WEEK(NOW())+1 AND YEAR(jogos.Data)=YEAR(NOW())
                                    ORDER BY jogos.Data, jogos.Nome_torneio");

        $num_of_jogos_futuros = mysqli_num_rows($result_jogos_futuros);    
        

        if ($num_of_jogos_futuros>0){   
                   
            $_SESSION['tournaments_list'] =$_SESSION['tournaments_list'].

            '<section class="wrapper style2 special">
                <h2 style="text-align:center;">Jogos da próxima semana</h2> 
                    <div class="table-wrapper">
                <div class="container">
                <table id="jogos_futuros_todos" style="width:auto; max-width:90%">
                    <tbody>';         

            for($i = 1; $i <= $num_of_jogos_futuros; $i++){
                $row_jogos_futuros = mysqli_fetch_assoc($result_jogos_futuros);
                
                $_SESSION['tournaments_list'] =$_SESSION['tournaments_list'].
                '<tr>
                    <td style="text-align:left; min-width:10em;"><a href="php_functions/tournament_details.php?Nome_torneio='.$row_jogos_futuros['Nome_torneio'].'">'.$row_jogos_futuros['Nome_torneio'].'</a></td>
                    <td style="text-align:left; min-width:10em;">'.$row_jogos_futuros['Data'].' -- '.$row_jogos_futuros['Hora_inicio'].'</td>
                    <td><a href="php_functions/team_details.php?team_id='.$row_jogos_futuros['Nome_equipa_visitante'].'">'.$row_jogos_futuros['Nome_equipa_visitante'].'</a></td>
                    <td style="font-weight: bold">'.$row_jogos_futuros['Golos_visitantes'].'</td>
                    <td style="font-weight: bold">'.$row_jogos_futuros['Golos_visitados'].'</td>
                    <td><a href="php_functions/team_details.php?team_id='.$row_jogos_futuros['Nome_equipa_visitada'].'">'.$row_jogos_futuros['Nome_equipa_visitada'].'</a></td>  

                    <td style="text-align:right; min-width:15em">
                        <div class = "nome_campo">
                        @ <a href="php_functions/field_details.php?field_id='.$row_jogos_futuros['Nome_campo'].'">'.$row_jogos_futuros['Nome_campo'].
                            '</a><span class = "info_campo">'.$row_jogos_futuros['Rua'].', '.$row_jogos_futuros['Numero'].' ('.$row_jogos_futuros['Cidade'].') <br>['.$row_jogos_futuros['GPS'].
                            ']</span>
                        </div>
                    </td>
                 </tr>'; 

            }
            $_SESSION['tournaments_list'] =$_SESSION['tournaments_list'].
                '        </tbody>
                    </table>
            </div>
            </section>'; 
            
        }
    
    }
    function set_proximos_jogos_torneio($connection, $torneio){
        $result_jogos_futuros = $connection->query("SELECT jogos.Data, jogos.Nome_equipa_visitante, jogos.Nome_equipa_visitada, COALESCE(jogos.Golos_visitantes,'-') 'Golos_visitantes', COALESCE(jogos.Golos_visitados, '-') 'Golos_visitados', slot.Nome_campo, campos.Rua, campos.Numero, campos.Cidade, campos.GPS, slot.Hora_inicio
                        FROM `jogos`, slot, campos
                        WHERE Nome_torneio LIKE '$torneio' AND slot.id_slot=jogos.id_slot AND slot.Nome_campo LIKE campos.Nome_campo
                        AND jogos.Data > NOW() 
                        AND jogos.Data < NOW()+INTERVAL 7 DAY
                        ORDER BY jogos.Data");

        $num_of_jogos_futuros = mysqli_num_rows($result_jogos_futuros);    
        

        if ($num_of_jogos_futuros>0){   
                   
            $_SESSION['tournaments_list'] =$_SESSION['tournaments_list'].
            '<div class="container">
                <header class="major">
                    <h3 style="text-align:left;">Próxima semana</h3>                     
                </header>
                <table id="jogos_futuros" style="width:auto; max-width:90%">
                    <tbody>';         

            for($i = 1; $i <= $num_of_jogos_futuros; $i++){
                $row_jogos_futuros = mysqli_fetch_assoc($result_jogos_futuros);
                
                $_SESSION['tournaments_list'] =$_SESSION['tournaments_list'].
                '<tr>
                    <td style="text-align:left; min-width:10em;">'.$row_jogos_futuros['Data'].' -- '.$row_jogos_futuros['Hora_inicio'].'</td>
                    <td><a href="php_functions/team_details.php?team_id='.$row_jogos_futuros['Nome_equipa_visitante'].'&Nome_torneio='.$torneio.'">'.$row_jogos_futuros['Nome_equipa_visitante'].'</a></td>
                    <td style="font-weight: bold">'.$row_jogos_futuros['Golos_visitantes'].'</td>
                    <td style="font-weight: bold">'.$row_jogos_futuros['Golos_visitados'].'</td>
                    <td><a href="php_functions/team_details.php?team_id='.$row_jogos_futuros['Nome_equipa_visitada'].'&Nome_torneio='.$torneio.'">'.$row_jogos_futuros['Nome_equipa_visitada'].'</a></td>  

                    <td style="text-align:right; min-width:15em">
                        <div class = "nome_campo">
                        @ <a href="php_functions/field_details.php?field_id='.$row_jogos_futuros['Nome_campo'].'">'.$row_jogos_futuros['Nome_campo'].
                            '</a><span class = "info_campo">'.$row_jogos_futuros['Rua'].', '.$row_jogos_futuros['Numero'].' ('.$row_jogos_futuros['Cidade'].') <br>['.$row_jogos_futuros['GPS'].
                            ']</span>
                        </div>
                    </td>
                 </tr>'; 

            }
            $_SESSION['tournaments_list'] =$_SESSION['tournaments_list'].
                '        </tbody>
                    </table>
            </div>'; 
            
        }
    
    }
?>