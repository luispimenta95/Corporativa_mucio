<?php
session_start();
include("mensagemPadrao.php");
$btnLogin = filter_input(INPUT_POST, 'btnLogin', FILTER_SANITIZE_STRING);
if($btnLogin){
	$usuario = filter_input(INPUT_POST, 'usuario', FILTER_SANITIZE_STRING);
	$senha = filter_input(INPUT_POST, 'senha', FILTER_SANITIZE_STRING);
	//echo "$usuario - $senha";
	if((!empty($usuario)) AND (!empty($senha))){
		//Gerar a senha criptografa
		//echo password_hash($senha, PASSWORD_DEFAULT);
		//Pesquisar o usuário no BD
		
			if($usuario =="teste" && $senha =="123"){
				$_SESSION['nome'] = $usuario;

				header("Location: adm/home.php");
			}else{
				$_SESSION['codRetorno'] = 3;
				header("Location: login.php");
			}
		
	}
	else{
		$_SESSION['codRetorno'] =4;
		header("Location: login.php");
	}
}