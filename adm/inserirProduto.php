<?php
session_start();
include '../conecta.php';
include '../mensagemPadrao.php';

$idProduto = $_GET["id"];
$nomeProduto = $_POST["nome"];
$preco = $_POST["preco"];
$codigo = $_POST["codigo"];
$estoque = $_POST["quantidade"];
$variacao = $_POST["variacao"];
$preco = str_replace(",", ".", $preco);
$preco = str_replace("R$", "", $preco);

$logoProduto;

if (isset($_FILES['arquivo'])) {
    $nome = $_FILES['arquivo']['name'];
    $extensao = strtolower(substr($_FILES['arquivo']['name'], -4)); //pega a extensao do arquivo
    $novo_nome =  md5(time()) . $extensao; //define o nome do arquivo
    $diretorio = "upload/"; //define o diretorio para onde enviaremos o arquivo
    $_UP['pasta'] = 'Imagens_produto/';



    if (move_uploaded_file($_FILES['arquivo']['tmp_name'], $_UP['pasta'] . $novo_nome)) {
        $logoProduto = $novo_nome;
        $sqlInsert = "INSERT INTO produto (nomeProduto,preco,codigo,estoque,unidade,imagem,dataCadastro)
        VALUES ('$nomeProduto','$preco','$codigo','$estoque','$variacao','$logoProduto',NOW())";
    }

    if ($conn->query($sqlInsert) === TRUE) {
        $_SESSION['msg'] = $mensagens["cadastro"];

        header("Location:produto.php");
    } else         $_SESSION['msg'] = $mensagens["erroCadastro"];
}
