<?php
session_start();
include 'conecta.php';
include 'mensagemPadrao.php';

$usuario = $_POST["usuario"];
$senha = $_POST["senha"];



$sql = "SELECT nomeCliente,idCliente,primeiroAcesso FROM cliente WHERE LPAD(cpf_cnpj,11,'0') = '$usuario' 
and senhaCliente = '$senha'";
// echo $sql;
$result = $conn->query($sql);
$rowcount = mysqli_num_rows($result);

if ($rowcount > 0) {
	$acesso = $result->fetch_assoc();
	$_SESSION['nomeCliente'] = $acesso["nomeCliente"];
	$_SESSION['idCliente'] = $acesso["idCliente"];
	$_SESSION['primeiroAcesso'] = $acesso["primeiroAcesso"];




	$_SESSION["logado"] = true;
	$_SESSION["senha"] = $senha;
	$_SESSION["codPedido"] = substr(md5(time()), 0, 5);

	if ($acesso["primeiroAcesso"] == 1) {
		header("Location:cliente/primeiroAcesso.php");
	} else if ($acesso["primeiroAcesso"] == 0) {
		header("Location:cliente/home.php");
	}
} else {
	$_SESSION['msg'] = $mensagens["loginIncorreto"];

	header("Location:loginCliente.php");
}
