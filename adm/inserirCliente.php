<?php
session_start();
include '../conecta.php';
include '../mensagemPadrao.php';

$nomeCliente = $_POST["nome"];
$cpf = $_POST["cpf"];
$email = $_POST['email'];
$telefone = $_POST["telefone"];
$endereco = $_POST["endereco"];
$atacado = $_POST["atacado"];

$sqlInsert = "INSERT INTO  cliente (nomeCliente,cpf_cnpj,emailCliente,telefoneCliente,enderecoCliente,atacado,dataCadastro)
VALUES ('$nomeCliente', '$cpf', '$email', '$telefone', '$endereco', '$atacado',NOW())";



if ($conn->query($sqlInsert) === TRUE) {
    $_SESSION['msg'] = $mensagens["cadastro"];
    header("Location:usuario.php");

    header("Location:usuario.php");
} else {

    $_SESSION['msg'] = $mensagens["erroCadastro"];
    header("Location:usuario.php");
}
