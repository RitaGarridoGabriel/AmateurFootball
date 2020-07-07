<?php

    if(isset($_GET['f'])){
        if(strcmp($_GET['f'], 'read_notification')==0){
            read_notification()();
        }
        else if(strcmp($_GET['f'], 'set_notifications')==0){
            set_notifications();
        }
        
    }

    function read_notification(){
        /*READ NOTIFICATIONS*/
        session_start();
        require_once "connect.php";
        $connection = @new mysqli($host, $db_user, $db_password, $db_name);
        mysqli_set_charset($connection,"utf8");
        if ($connection->connect_errno != 0)
        {
            throw new Exception(mysqli_connect_errno());
        }

        $cc=$_SESSION['cc'];   
        $id_notificacao=$_GET['message_id'];

        /*find message*/
        $result = $connection->query("SELECT utilizadores.Username, notificacoes.Data, notificacoes.Texto
                                    FROM notificacoes, notifica, utilizadores
                                    WHERE notifica.id_notificacao=notificacoes.id_notificacao 
                                        AND utilizadores.CC=notifica.CC_autor
                                        AND notificacoes.id_notificacao='$id_notificacao'");
        
        $num_of_results = mysqli_num_rows($result);

        if($num_of_results>0){

            $row = mysqli_fetch_assoc($result);
            //Split date and time
            list($date, $hour)=explode(" ", $row['Data']);

            //Mark as read
            $connection->query("UPDATE notifica SET Lida = '1' WHERE notifica.id_notificacao='$id_notificacao'");
            
            //Print message details
            $_SESSION['notification_read'] = 

            '<div id="notification_read" class="management">
                <h2>Detalhes da Mensagem </h2>
                <table style="max-width:50%;">
                    <td><b>De:</b> '.$row['Username'].'</td>
                    <td><b>Data:</b> '.$date.'</td>
                    <td><b>Hora:</b> '.$hour.'</td>
                </table>
                <p><b>Mensagem:</b> '.$row['Texto'].'</p>
            </div>
            <a href="php_functions/notifications.php?f=set_notifications" class="button">Voltar</a>';
             
            if($_SESSION['admin']==1){
                header('Location: ../admin_page.php');
            }
            else{
                header('Location: ../user_page.php');
            }
            
            exit();        
        }
        else{

            $_SESSION['notification_read'] ='
            <h2><b>A mensagem não foi encontrada!</b></h2>';
            //echo $_SESSION['notifications'];
            if($_SESSION['admin']==1){
               header('Location: ../admin_page.php');
            }
            else{
               header('Location: ../user_page.php');
            }
            exit();
        }
        $connection->close();
    }
    
    function set_notifications(){
        session_start();
        require_once "connect.php";
        $connection = @new mysqli($host, $db_user, $db_password, $db_name);
        mysqli_set_charset($connection,"utf8");
        if ($connection->connect_errno != 0)
        {
            throw new Exception(mysqli_connect_errno());
        }
                    
        $cc=$_SESSION['cc'];
       
        //Recebidas
        $result = $connection->query("SELECT utilizadores.Username, notificacoes.Data, notificacoes.Texto, notifica.Lida, notificacoes.id_notificacao
                                    FROM notificacoes, notifica, utilizadores
                                    WHERE notifica.id_notificacao=notificacoes.id_notificacao 
                                        AND
                                         utilizadores.CC=notifica.CC_autor
                                        AND notifica.CC ='$cc'
                                    ORDER BY notifica.Lida");

        $num_of_results = mysqli_num_rows($result);

        if($num_of_results>0){


            $_SESSION['notifications'] = 
            '
            <div class="12u$" style="padding-top: 2em;">
                <div id="notifications" class="management">
                    <div class="table-wrapper">
                        <table id="futebol_notificacoes" style="max-width:50%;">
                            <thead>
                                <tr>
                                    <th style="display:none">Id</th>       
                                    <th>Data de envio</th> 
                                    <th>De</th>       
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>';

             for ($i = 1; $i <= $num_of_results; $i++){
                                
                $row = mysqli_fetch_assoc($result);
                
                $de = $row['Username'];
                $data = $row['Data'];              

                $_SESSION['notifications'] = $_SESSION['notifications'].                
                '<tr>
                    <td style="display:none">'.$row['id_notificacao'].'</td>
                    <td>'.$data.'</td>
                    <td>'.$de.'</td>';

                if($row['Lida']==1){
                    $_SESSION['notifications'] = $_SESSION['notifications'].       '    
                        <td style="text-align:center"> 
                            <a class="icon fa-envelope-open" onclick="read_message(this)" style="cursor:pointer;"></a>
                        </td>        
                    </tr>'; 
                }
                else{
                    $_SESSION['notifications'] = $_SESSION['notifications'].       '    
                       <td style="text-align:center"> 
                            <a class="icon fa-envelope" onclick="read_message(this)" style="cursor:pointer"></a>
                        </td>    
                    </tr>'; 
                }
            }

            $_SESSION['notifications'] = $_SESSION['notifications'].
                        '</tbody>
                    </table>
                </div>
            </div></div>'; 
            if($_SESSION['admin']==1){
                header('Location: ../admin_page.php');
            }
            else{
                header('Location: ../user_page.php');
            }
            
            exit();        
        }
        else{

            $_SESSION['notifications'] ='
            <h2><b>Sem notificações</b></h2>';
            //echo $_SESSION['notifications'];
            if($_SESSION['admin']==1){
                header('Location: ../admin_page.php');
            }
            else{
                header('Location: ../user_page.php');
            }
            exit();
        }
        $connection->close();

    }
?>