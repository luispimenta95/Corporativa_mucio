<?php
	session_start();
	$btnLogin = filter_input(INPUT_POST, 'btnLogin', FILTER_SANITIZE_STRING);
	$usuario = filter_input(INPUT_POST, 'usuario', FILTER_SANITIZE_STRING);
	$senha = filter_input(INPUT_POST, 'senha', FILTER_SANITIZE_STRING);
	if($usuario){
			$_SESSION['msg'] = "<div class='alert alert-success'>O nome $usuario foi digitado !</div>";
			header("Location:home.php");
		}
	else{
			$_SESSION['msg'] = "<div class='alert alert-danger'>Nada foi informado !</div>";
			header("Location:home.php");
		
	}
	
?>