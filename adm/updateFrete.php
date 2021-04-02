<?php
session_start();
include '../BD/.conecta.php';
include '../mensagemPadrao.php';

$idCidade = $_GET["id"];
$precoFrete = $_POST["precoFrete"];
$entrega = $_POST["entrega"];
$precoFrete = str_replace(",", ".", $precoFrete);
$precoFrete = str_replace("R$", "", $precoFrete);
$sqlUpdate = "UPDATE cidade set precoFrete = $precoFrete , entrega = $entrega where idCidade = $idCidade";
if ($conn->query($sqlUpdate) === TRUE) {
    $_SESSION['msg'] = $mensagens["edicao"];

    header("Location:cidades.php");
} else {

    $_SESSION['msg'] = $mensagens["erroEdicao"];
    header("Location:cidades.php");
}
