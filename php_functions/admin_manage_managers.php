<?php
    session_start();

    require_once "connect.php";
    
    $connection = @new mysqli($host, $db_user, $db_password, $db_name);
    mysqli_set_charset($connection,"utf8");
    if ($connection->connect_errno != 0)
    {
        throw new Exception(mysqli_connect_errno());
    }  

    if(isset($_GET['order'])){
        $order=$_GET['order'];  
    }   
    else{
        $order="";
    }   
    echo $order.'<br>';


    $torneio=$_GET['torneio'];    
    //se nao for colocado nome no campo de procura
    if(strcmp($torneio, '')==0){
        //seleccionar todos os utilizadores e o respectivo torneio no qual sao gestores
        $query="SELECT utilizadores.CC, utilizadores.Username, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome, COALESCE(gest.Nome_torneio, '-') 'Torneio'
                FROM utilizadores LEFT JOIN (
                        SELECT `gestores_torneio torneios`.CC, `gestores_torneio torneios`.Nome_torneio
                        FROM `gestores_torneio torneios`) as gest
                ON utilizadores.CC = gest.CC";

        if(strcmp($order, "Username")==0){
            $query=$query." ORDER BY utilizadores.Username, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
        }
        else if(strcmp($order, "PNome")==0){
            $query=$query." ORDER BY utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
        }
        else if(strcmp($order, "Nome_torneio")==0){
            $query=$query." ORDER BY Torneio DESC, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
        }
        else{
            $query=$query." ORDER BY Torneio DESC, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome";
        }
        $result = $connection->query($query);

        $num_of_results = mysqli_num_rows($result);
        if ($num_of_results>0){
            $_SESSION['search_manager_result'] = 
            '  
            <script>  see(event, \'tournament_management\');
            </script> 
            <div class="table-wrapper">
                <table id="futebol_users" style="max-width:90%;">
                    <thead>
                        <tr>                           
                            <th><a href= "php_functions/admin_manage_managers.php?order=Username&torneio='.$torneio.'">Nome de Utilizador</a></th>        
                            <th><a href= "php_functions/admin_manage_managers.php?order=PNome&torneio='.$torneio.'">Nome</a></th> 
                            <th><a href= "php_functions/admin_manage_managers.php?order=Nome_torneio&torneio='.$torneio.'">Torneio</a></th>
                        </tr>
                    </thead>
                    <tbody>';            

            for ($i = 1; $i <= $num_of_results; $i++) {
                                
                $row = mysqli_fetch_assoc($result);

                $_SESSION['search_manager_result'] = $_SESSION['search_manager_result'].                
                '<tr>               
                    <td>'.$row['Username'].'</td>
                    <td>'.$row['Primeiro_nome'].' '.$row['Ultimo_nome'].'</td>
                    <td>'.$row['Torneio'].'</td>';
            }

            $_SESSION['search_manager_result'] = $_SESSION['search_manager_result'].
                        '</tbody>
                    </table>
                </div>';      
        
            header('Location: ../admin_page.php');
            exit();   
        }
        else
        {
            $_SESSION['search_result'] ='<script>  see(event, \'tournament_management\');</script> <h2><b>Sem resultados</b></h2>';
            
            header('Location: ../admin_page.php');
            exit();
        }

    }
    else{
        //seleccionar todos os gestores do $torneio
        $query="SELECT utilizadores.CC, utilizadores.Username, utilizadores.Primeiro_nome, utilizadores.Ultimo_nome, gest.Nome_torneio 
            FROM utilizadores, `gestores_torneio torneios` as gest 
            WHERE gest.CC =utilizadores.CC AND gest.Nome_torneio ='$torneio'";

        if(strcmp($order, "Username")==0){
            $query=$query." ORDER BY utilizadores.Username";
        }
        else if(strcmp($order, "PNome")==0){
            $query=$query." ORDER BY utilizadores.Primeiro_nome";
        }
        else if(strcmp($order, "Nome_torneio")==0){
            $query=$query." ORDER BY gest.Nome_torneio";
        }
        else{
            $query=$query." ORDER BY utilizadores.Username";
        }
        
        $result = $connection->query($query);
        
        $num_of_results = mysqli_num_rows($result);

            
        if($num_of_results>0){

            $_SESSION['search_manager_result'] = 
            '<script>  see(event, \'tournament_management\');</script> 
            <div style="max-width:90%; text-align:end; padding-bottom:1em">
                <a href="php_functions/admin_functions.php?f=list_users_promote_as_managers&torneio='.$torneio.'" class="button" >Adicionar Gestor</a>
            </div>
            <div class="table-wrapper">
                <table id="futebol_users" style="max-width:90%;">
                    <thead>
                        <tr>                           
                            <th><a href= "php_functions/admin_manage_managers.php?order=Username&torneio='.$torneio.'">Nome de Utilizador</a></th>        
                            <th><a href= "php_functions/admin_manage_managers.php?order=PNome&torneio='.$torneio.'">Nome</a></th>
                            <th><a href= "php_functions/admin_manage_managers.php?order=Nome_torneio&torneio='.$torneio.'">Torneio</a></th>';
            if($num_of_results>1){
                $_SESSION['search_manager_result'] = $_SESSION['search_manager_result'].'<th>Tirar privilégio</th>';
            }

            $_SESSION['search_manager_result'] = $_SESSION['search_manager_result'].
                    '    </tr>
                    </thead>
                    <tbody>';
            

            for ($i = 1; $i <= $num_of_results; $i++) {
                                
                $row = mysqli_fetch_assoc($result);

                $_SESSION['search_manager_result'] = $_SESSION['search_manager_result'].                
                '<tr>               
                    <td>'.$row['Username'].'</td>
                    <td>'.$row['Primeiro_nome'].' '.$row['Ultimo_nome'].'</td>
                    <td>'.$row['Nome_torneio'].'</td>';

                 if($num_of_results>1){
                    $_SESSION['search_manager_result'] = $_SESSION['search_manager_result'].
                    '<td style="text-align:center">
                        <input type="checkbox" name="privilegios_gestor" id="tirar;'.$row['Nome_torneio'].';'.$row['CC'].'">
                        <label for="tirar;'.$row['Nome_torneio'].';'.$row['CC'].'"></label>                        
                    </td>';                    
                 }
            }

            $_SESSION['search_manager_result'] = $_SESSION['search_manager_result'].
                        '</tbody>
                    </table>';
            if($num_of_results>1){
                $_SESSION['search_manager_result'] = $_SESSION['search_manager_result'].
                '<div style="max-width:90%">
                        <a onclick="demote_managers()" class="button" style="float:right">Guardar</a>
                        <a href="php_functions/admin_manage_managers.php" class="button" style="float:left">Voltar</a>
                    </div>';
            }                  
                    
            $_SESSION['search_manager_result'] = $_SESSION['search_manager_result'].'</div>';      
            
            header('Location: ../admin_page.php');
            exit();   
        }
        else
        {
            $_SESSION['search_manager_result'] ='<script>  see(event, \'tournament_management\');</script> <h2><b>Sem resultados</b></h2>';
            
            header('Location: ../admin_page.php');
            exit();
        }
    }
    $connection->close();
       
?>