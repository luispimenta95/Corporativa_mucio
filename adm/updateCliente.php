<?php
session_start();
include '../conecta.php';
include '../mensagemPadrao.php';
$idCliente = $_GET["id"];
$situacao = $_POST['ativo'];
$nomeCliente = $_POST["nome"];
$cpf = $_POST["cpf"];
$email = $_POST['email'];
$telefone = $_POST["telefone"];
$endereco = $_POST["endereco"];
$atacado = $_POST["atacado"];
$sqlUpdate = "UPDATE Cliente SET nomeCliente = '$nomeCliente', atacado = '$atacado' , cpf_cnpj = '$cpf',
            emailCliente = '$email', telefoneCliente = '$telefone', ativo = '$situacao',enderecoCliente = '$endereco'  
          where idCliente=$idCliente";

if ($conn->query($sqlUpdate) === TRUE) {
    $_SESSION['msg'] = $mensagens["edicao"];

    header("Location:usuario.php");
} else {

    $_SESSION['msg'] = $mensagens["erroEdicao"];
    header("Location:usuario.php");
}
