<?php
session_start();
include '../BD/.conecta.php';
include '../mensagemPadrao.php';

$idCategoria = $_GET["id"];
$nomeCategoria = $_POST["nomeCategoria"];
$sqlUpdate = "UPDATE categoria set nomeCategoria  = '$nomeCategoria' where idCategoria = $idCategoria";
if ($conn->query($sqlUpdate) === TRUE) {
    $_SESSION['msg'] = $mensagens["edicao"];

    header("Location:categorias.php");
} else {

    $_SESSION['msg'] = $mensagens["erroEdicao"];
    header("Location:categorias.php");
}
