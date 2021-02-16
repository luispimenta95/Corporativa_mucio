<?php
session_start();
include '../conecta.php';
include 'funcoes.php';

include '../mensagemPadrao.php';
$idCliente = $_GET["id"];
$situacao = $_POST['ativo'];
$nomeCliente = $_POST["nome"];
$cpf = $_POST["cpf"];
$email = $_POST['email'];
$telefone = $_POST["telefone"];
$endereco = $_POST["endereco"];
$atacado = $_POST["atacado"];
$pesquisaUsuarios = "SELECT cpf_cnpj from cliente u  where u.cpf_cnpj= $cpf";
$Usuarios = mysqli_query($conn, $pesquisaUsuarios);
if (!validaCPF($cpf)) {
    $_SESSION['msg'] = $mensagens["cpfInvalido"];
    header("Location:usuario.php");
} else {

    //Contar o total de logs
    $totalUsuarios = mysqli_num_rows($Usuarios);
    if ($totalUsuarios > 0) {
        $_SESSION['msg'] = $mensagens["cpfDuplicado"];
        header("Location:usuario.php");
    } else {

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
    }
}
