<?php
session_start();
include '../BD/.conecta.php';
include 'funcoes.php';
include '../mensagemPadrao.php';

$nomeCliente = $_POST["nome"];
$cpf = $_POST["cpf"];
$email = $_POST['email'];
$telefone = $_POST["telefone"];
$endereco = $_POST["endereco"];
$atacado = $_POST["atacado"];
$tipoCliente = $_POST["tipoCliente"];
$cidade = $_POST["cidade"];

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

        $sqlInsert = "INSERT INTO  cliente (nomeCliente,cpf_cnpj,emailCliente,telefoneCliente,enderecoCliente,tipoCliente,cidade,dataCadastro)
        VALUES ('$nomeCliente', '$cpf', '$email', '$telefone', '$endereco',$tipoCliente,$cidade,NOW())";


        if ($conn->query($sqlInsert) === TRUE) {
            $_SESSION['msg'] = $mensagens["cadastro"];
            header("Location:usuario.php");
        } else {

            $_SESSION['msg'] = $mensagens["erroCadastro"];
            header("Location:usuario.php");
        }
    }
}
