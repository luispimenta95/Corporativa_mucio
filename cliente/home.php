<?php
session_start();
include '../conecta.php';
include '../mensagemPadrao.php';
include '../adm/funcoes.php';

if (!isset($_SESSION["idCliente"])) {
    header("Location:../loginCliente.php");
}
mysqli_set_charset($conn, 'utf8');
$pagina = (isset($_GET['pagina'])) ? $_GET['pagina'] : 1;
$pagina_atual = "home.php";
//Selecionar todos os logs da tabela
$pesquisaUsuarios = "SELECT nomeCliente from cliente u order by u.nomeCliente";
$Usuarios = mysqli_query($conn, $pesquisaUsuarios);

//Contar o total de logs
$totalUsuarios = mysqli_num_rows($Usuarios);

//Seta a quantidade de logs por pagina
$quantidade_pg = 30;

//calcular o número de pagina necessárias para apresentar os logs
$num_pagina = ceil($totalUsuarios / $quantidade_pg);

//Calcular o inicio da visualizacao
$incio = ($quantidade_pg * $pagina) - $quantidade_pg;

//Selecionar os logs a serem apresentado na página
$pesquisa = "";
if (!isset($_POST['termo'])) {
    $pesquisaUsuarios = "select 
    idCliente,
    nomeCliente,
    cpf_cnpj,
    emailCliente,
    ativo , 
    atacado,
    enderecoCliente,
    telefoneCliente,
    dataCadastro 
    from 
    cliente c order by c.nomeCliente limit $incio, $quantidade_pg";
} else {
    $pesquisa = $_POST["termo"];

    $pesquisaUsuarios = "select 
    idCliente,
    nomeCliente,
    cpf_cnpj,
    emailCliente,
    ativo , 
    atacado,
    enderecoCliente,
    telefoneCliente,
    dataCadastro 
    from 
    cliente c WHERE c.nomeCliente LIKE '%" . $pesquisa . "%'";
}
//preciso fazer as pesquisas


$resultadoUsuarios = mysqli_query($conn, $pesquisaUsuarios);
$totalUsuarios = mysqli_num_rows($resultadoUsuarios);

?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <!-- Meta tags Obrigatórias -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Olá, mundo!</title>
</head>

<body>


    <h1>Bem vindo <?php echo $_SESSION["nomeCliente"] ?>!</h1>
    <a href="../sairCliente.php">Logout</a>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>

</html>