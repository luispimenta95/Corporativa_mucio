<?php
session_start();

include '../conecta.php';
include '../adm/funcoes.php';
include '../mensagemPadrao.php';

$cpf = $_POST["cpf"];
$senha = $_POST["senha"];
$nome = $_POST["nome"];
$endereco = $_POST["endereco"];
$telefone = $_POST["telefone"];
$email = $_POST["email"];
if ($senha == "") {
    $sqlUpdate = "UPDATE cliente SET nomeCliente = '$nome',  cpf_cnpj = '$cpf',
    emailCliente = '$email', telefoneCliente = '$telefone',enderecoCliente = '$endereco'  
  where idCliente=$_SESSION[idCliente]";
    if ($conn->query($sqlUpdate) === TRUE) {
        $_SESSION['msg'] = $mensagens["edicao"];

        header("Location:home.php");
    } else {

        $_SESSION['msg'] = $mensagens["erroEdicao"];
        header("Location:home.php");
    }
} else {
    $sqlUpdate = "UPDATE cliente SET nomeCliente = '$nome',  cpf_cnpj = '$cpf',
    emailCliente = '$email', telefoneCliente = '$telefone',
    enderecoCliente = '$endereco',senhaCliente = '$senha'  
  where idCliente=$_SESSION[idCliente]";
    if ($conn->query($sqlUpdate) === TRUE) {
        $_SESSION['msg'] = $mensagens["edicao"];

        header("Location:home.php");
    } else {

        $_SESSION['msg'] = $mensagens["erroEdicao"];
        header("Location:home.php");

        echo $sqlUpdate . "<br>" . $conn->error;
    }
}
