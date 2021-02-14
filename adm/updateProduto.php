<?php
session_start();
include '../conecta.php';
include '../mensagemPadrao.php';

$idProduto = $_GET["id"];
$nomeProduto = $_POST["nome"];
$preco = $_POST["preco"];
$estoque = $_POST["quantidade"];
$codigo = $_POST["codigo"];
$variacao = $_POST["variacao"];
$situacao = $_POST["situacao"];
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
        $sqlUpdate = "UPDATE produto SET nomeProduto = '$nomeProduto', preco = '$preco' , estoque = '$estoque',
            codigo = '$codigo', unidade = '$variacao', ativo = '$situacao', imagem = '$logoProduto' 
          where idProduto=$idProduto";
    } else {
        $sqlUpdate = "UPDATE produto SET nomeProduto = '$nomeProduto', preco = '$preco' , estoque = '$estoque',
        codigo = '$codigo', unidade = '$variacao', ativo = '$situacao' 
      where idProduto=$idProduto";
    }

    if ($conn->query($sqlUpdate) === TRUE) {
        $_SESSION['msg'] = $mensagens["edicao"];

        header("Location:produto.php");
    } else         $_SESSION['msg'] = $mensagens["erroEdicao"];
}
