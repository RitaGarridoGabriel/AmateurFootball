<?php
    
    function start(){

        session_start();
        require_once "connect.php";
        $_SESSION['host']=$host;
        $_SESSION['db_user']=$db_user;
        $_SESSION['db_password']=$db_password; 
        $_SESSION['db_name']=$db_name;
        $connection = @new mysqli($host, $db_user, $db_password, $db_name);
        mysqli_set_charset($connection,"utf8");
        if ($connection->connect_errno != 0)
        {
            throw new Exception(mysqli_connect_errno());
        } 

        
        if (!isset($_SESSION['logged']))
        {
            header('Location: index.php');
            exit();
        } 

    }

    function set_nav(){
        if(isset($_SESSION['logged'])){
            if($_SESSION['admin']==1){
                $_SESSION['nav'] = 
                '<li><a href="php_functions/notifications.php?f=set_notifications">Página de Gestão</a></li>
                <li><a href="#">Torneios</a></li>
                <li><a href="#">Equipas</a></li>';
            }
            else{
                 $_SESSION['nav'] = 
                '<li><a href="#">Torneios</a></li>
                <li><a href="#">Equipas</a></li>';
            }
        }
        else{
            $_SESSION['nav'] = 
            '<li><a href="informations.html">Informações</a></li>
            <li><a href="login.php" class="button special">Iniciar Sessão</a></li>';
        }
    } 
?>