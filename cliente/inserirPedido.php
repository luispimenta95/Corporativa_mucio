<?php
session_start();
include('../conecta.php');
include('../mensagemPadrao.php');

$idProduto = $_GET['id'];
$quantidade = $_POST['contador'];
$idCliente = $_SESSION['idCliente'];
$codPedido = $_SESSION['codPedido'];
$buscar = "SELECT * FROM produto WHERE idProduto = $idProduto";
$result = $conn->query($buscar);
$produto = $result->fetch_assoc();
$total =  $produto["preco"] * $quantidade;
$preco =  $produto["preco"];
$sqlInsert =
    "INSERT INTO  pedido(dataPedido, quantidade, preco, codPedido, cliente, produto)
VALUES (NOW(), '$quantidade', '$preco', '$codPedido', '$idCliente','$idProduto')";


if ($conn->query($sqlInsert) === TRUE) {
    $_SESSION['msg'] = $mensagens["envioPedido"];
    header("Location:home.php");
} else {

    $_SESSION['msg'] = $mensagens["erroPedido"];
    header("Location:home.php");
}
