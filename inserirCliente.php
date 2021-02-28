<?php
session_start();
include 'conecta.php';
include 'adm/funcoes.php';
include 'mensagemPadrao.php';

$nomeCliente = $_POST["nome"];
$cpf = $_POST["cpf"];
$email = $_POST['email'];
$telefone = $_POST["telefone"];
$endereco = $_POST["endereco"];
$senha = substr(time(), 0, 5);
$pesquisaUsuarios = "SELECT cpf_cnpj from cliente u  where u.cpf_cnpj= $cpf";
$Usuarios = mysqli_query($conn, $pesquisaUsuarios);
if (!validaCPF($cpf)) {

    $_SESSION['msg'] = $mensagens["cpfInvalido"];
    header("Location:loginCliente.php");
} else {

    //Contar o total de logs
    $totalUsuarios = mysqli_num_rows($Usuarios);
    if ($totalUsuarios > 0) {
        $_SESSION['msg'] = $mensagens["cpfDuplicado"];
        header("Location:loginCliente.php");
    } else {

        $sqlInsert = "INSERT INTO  cliente (nomeCliente,cpf_cnpj,emailCliente,telefoneCliente,enderecoCliente,senhaCliente,atacado,dataCadastro)
        VALUES ('$nomeCliente', '$cpf', '$email', '$telefone', '$endereco', '$senha,0,NOW())";



        if ($conn->query($sqlInsert) === TRUE) {
            $_SESSION['msg'] = $mensagens["cadastroHost"];
            header("Location:loginCliente.php");
        } else {

            $_SESSION['msg'] = $mensagens["erroCadastro"];
            header("Location:loginCliente.php");
        }
    }
}
