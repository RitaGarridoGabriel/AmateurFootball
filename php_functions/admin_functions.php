<?php

    if(isset($_GET['f'])){
        if(strcmp($_GET['f'], 'set_admin_tournament_selection')==0){
            set_admin_tournament_selection()();
        }
        else if(strcmp($_GET['f'], 'demote_managers')==0){
            demote_managers();
        }
        else if(strcmp($_GET['f'], 'promote_managers')==0){
            promote_managers();
        }
        else if(strcmp($_GET['f'], 'list_users_promote_as_managers')==0){
            list_users_promote_as_managers();
        } 
        else if(strcmp($_GET['f'], 'remove_user')==0){
            remove_user();
        }        
    }

    function set_admin_tournament_selection(){        
        require_once "connect.php";       
        $connection = @new mysqli($_SESSION['host'], $_SESSION['db_user'], $_SESSION['db_password'], $_SESSION['db_name']);
        mysqli_set_charset($connection,"utf8");
        if ($connection->connect_errno != 0)
        {
            throw new Exception(mysqli_connect_errno());
        }   
        $result = $connection->query("SELECT Nome_torneio 
                                    FROM `gestores_torneio torneios` 
                                    GROUP BY Nome_torneio
                                    ORDER BY Nome_torneio");

        $num_of_results = mysqli_num_rows($result);
        if ($num_of_results>0){

            $_SESSION['tournament_selection']='
                <form action="php_functions/admin_manage_managers.php?order=">
                    <section class="search">                                            
                        <select name="torneio" id="category">
                            <option value="">Escolha Torneio</option>';

            for($i = 1; $i <= $num_of_results; $i++){
                $row = mysqli_fetch_assoc($result);

                $_SESSION['tournament_selection']=$_SESSION['tournament_selection'].'
                <option value="'.$row['Nome_torneio'].'">'.$row['Nome_torneio'].'</option>';

            }


            $_SESSION['tournament_selection']=$_SESSION['tournament_selection'].
                        '</select>
                        <input type="submit" value="Procurar" class="special" >
                    </section>
                </form>';         
        }
    } 

    function demote_managers(){
        session_start();

        require_once "connect.php";
        
        $connection = @new mysqli($host, $db_user, $db_password, $db_name);
        mysqli_set_charset($connection,"utf8");
        if ($connection->connect_errno != 0)
        {
            throw new Exception(mysqli_connect_errno());
        }        
            
        $info=$_GET['info'];    
        $users=explode("|", $info);

       
        foreach($users as $user){
            list($torneio, $utilizador_cc)=explode(";", $user);
            //verificar se so ha um gestor
            $numero_gestores = $connection->query("SELECT * 
                                                FROM `gestores_torneio torneios`
                                                WHERE `gestores_torneio torneios`.Nome_torneio='$torneio'");

            if(mysqli_num_rows($numero_gestores)==1){
                $_SESSION['demote_manager'] ="<script type='text/javascript'>alert('Não pode remover todos os gestores! O último gestor não foi removido!');</script>";
                header('Location: admin_manage_managers.php');
                $connection->close();
                exit();
            }

            //remover da tabela de gestores_torneio torneios                                
            $remove1 = $connection->query("DELETE 
                                    FROM `gestores_torneio torneios`
                                    WHERE `gestores_torneio torneios`.CC ="."'$utilizador_cc'"." 
                                    AND `gestores_torneio torneios`.Nome_torneio LIKE ("."'$torneio'".")");

            //remover da tabela de gestores se nao gerir mais nenuhum torneio
            $check = $connection->query("SELECT * 
                                            FROM `gestores_torneio torneios`
                                            WHERE `gestores_torneio torneios`.CC="."'$utilizador_cc'");
            
            $num_of_results = mysqli_num_rows($check);
            if($num_of_results==0){
                $remove2 = $connection->query("DELETE 
                                        FROM `gestores_torneio`
                                        WHERE `gestores_torneio`.CC="."'$utilizador_cc'");
            }
            else{
                $remove2=1;
            }
            if($remove1 != 1 OR $remove2!=1){
                $_SESSION['demote_manager'] ="<script type='text/javascript'>alert('Erro ao despromover gestor!');</script>";
                header('Location: admin_manage_managers.php');
                $connection->close();
                exit();
            }
        }

        $_SESSION['demote_manager'] ="<script type='text/javascript'>alert('Gestores despromovidos com sucesso!');</script>"; 

        header('Location: admin_manage_managers.php');
        $connection->close();
    }

    function list_users_promote_as_managers(){
        session_start();

        require_once "connect.php";
        
        $connection = @new mysqli($host, $db_user, $db_password, $db_name);
        mysqli_set_charset($connection,"utf8");
        if ($connection->connect_errno != 0)
        {
            throw new Exception(mysqli_connect_errno());
        }        
        $torneio=$_GET['torneio'];
        if(isset($_GET['order'])){
            $order=$_GET['order'];  
        }   
        else{
            $order="";
        }

        //utilizadores que nao sao gestores do $torneio              
        $query=("SELECT CC, Username, Primeiro_nome, Ultimo_nome, Email
                FROM utilizadores
                WHERE utilizadores.CC NOT IN
                    (SELECT `gestores_torneio torneios`.CC
                    FROM `gestores_torneio torneios`
                    WHERE `gestores_torneio torneios`.Nome_torneio='$torneio')");

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
            $_SESSION['list_users'] = 
            '  
            <script>  see(event, \'tournament_management\');
            </script> 
            <div class="table-wrapper">
                <table id="futebol_users" style="max-width:90%;">
                    <thead>
                        <tr>       
                            <th style="display:none">Nº Identificação</th> 
                            <th style="display:none">Torneio</th>   
                            <th><a href="php_functions/admin_functions.php?f=list_users_promote_as_managers&torneio='.$torneio.'&order=Username">Nome de Utilizador</a></th>        
                            <th><a href="php_functions/admin_functions.php?f=list_users_promote_as_managers&torneio='.$torneio.'&order=PNome">Nome</a></th>
                            <th><a href="php_functions/admin_functions.php?f=list_users_promote_as_managers&torneio='.$torneio.'&order=Email">Email</a></th>
                            <th>Gestor?</th>
                        </tr>
                    </thead>
                    <tbody>';
            

            for ($i = 1; $i <= $num_of_results; $i++){  

                $row = mysqli_fetch_assoc($result);                     

                $_SESSION['list_users'] = $_SESSION['list_users'].                
                '<tr>
                    <td style="display:none">'.$row['CC'].'</td> 
                    <td style="display:none">'.$_GET['torneio'].'</td> 
                    <td>'.$row['Username'].'</td>
                    <td>'.$row['Primeiro_nome'].' '.$row['Ultimo_nome'].'</td>
                    <td>'.$row['Email'].'</td>
                    <td style="text-align:center">
                        <input type="checkbox" name="privilegios_gestor" id="dar;'.$row['CC'].'">
                            <label for="dar;'.$row['CC'].'"></label>  
                    </td>       
                 </tr>';             
            }

            $_SESSION['list_users'] = $_SESSION['list_users'].
                        '</tbody>
                    </table>
                    </div>
                    <div style="max-width:90%">
                            <a onclick="promote_managers(\''.$torneio.'\')" class="button" style="float:right">Guardar</a>
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
        $connection->close();
    }

    function promote_managers(){
        session_start();

        require_once "connect.php";
        
        $connection = @new mysqli($host, $db_user, $db_password, $db_name);
        mysqli_set_charset($connection,"utf8");
        if ($connection->connect_errno != 0)
        {
            throw new Exception(mysqli_connect_errno());
        }        
            
        $info=$_GET['info'];    
        list($torneio, $users_list)=explode("|", $info);
        $users=explode(";", $users_list);
        $ok=1;
        foreach($users as $user){

            //adicionar a tabela de gestores_torneio torneios
            $result1 = $connection->query("INSERT INTO `gestores_torneio torneios`
                                            VALUES('$user', '$torneio')");
            //adicionar a tabela de gestores_torneio se ainda nao estiver la
            $result2 = $connection->query("INSERT IGNORE INTO `gestores_torneio`
                                            VALUES('$user')");         
            if($result1!=1 OR $result2!=1){
                $ok=0;
            }                       
        }
        if($ok==1){
            $_SESSION['promote_manager'] ="<script type='text/javascript'>alert('Gestores promovidos com sucesso!');</script>"; 
        }
        else{
            $_SESSION['promote_manager'] ="<script type='text/javascript'>alert('Gestores não foram promovidos!');</script>"; 
        }


        header('Location: admin_manage_managers.php');
        exit();
        $connection->close();
    }

    function remove_user(){
        session_start();
    
        if (!isset($_SESSION['logged']))
        {
            header('Location: ../index.php');
            exit();
        }

        require_once "connect.php";
            
        $connection = @new mysqli($host, $db_user, $db_password, $db_name);
        mysqli_set_charset($connection,"utf8");
        if ($connection->connect_errno != 0)
        {
            throw new Exception(mysqli_connect_errno());
        }        
        
        if (isset($_POST['input']))
            $input = $_POST['input'];
        else
            $input = '';    
        $user = $_GET['user_id'];
        //remover de todas as tabelas onde existe
        //utilizadores
        $query ="UPDATE `utilizadores` SET `Banido` = '1' WHERE `utilizadores`.`CC`="."'$user'"; 

        $result = $connection->query($query);
        if($result == 1){
            $_SESSION['remove_result'] ="<script type='text/javascript'>alert('Utilizador banido com sucesso!');</script>"; 
        }
        else{
            $_SESSION['remove_result'] ="<script type='text/javascript'>alert('Erro ao banir utilizador!');</script>";
        }

        
        header('Location: admin_manage_users.php');
        exit();
    }
?>