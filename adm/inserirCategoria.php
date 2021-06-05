<?php
session_start();
include '../BD/.conecta.php';
include 'funcoes.php';
include '../mensagemPadrao.php';

$nomeCategoria = $_POST["nomeCategoria"];



$sqlInsert = "INSERT INTO  categoria (nomeCategoria) VALUES ('$nomeCategoria')";


if ($conn->query($sqlInsert) === TRUE) {
    $_SESSION['msg'] = $mensagens["cadastro"];
    header("Location:categorias.php");
} else {

    $_SESSION['msg'] = $mensagens["erroCadastro"];
    header("Location:categorias.php");
}
