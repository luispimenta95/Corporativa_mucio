<?php
session_start();
$idCliente = $_SESSION["idCliente"];

include '../conecta.php';
include '../mensagemPadrao.php';

if (!isset($_SESSION["idCliente"])) {
    header("Location:../loginCliente.php");
}
if ($_SESSION["primeiroAcesso"] == 1) {
    header("Location:primeiroAcesso.php");
}
mysqli_set_charset($conn, 'utf8');
$pagina = (isset($_GET['pagina'])) ? $_GET['pagina'] : 1;
$pagina_atual = "home.php";
//Selecionar todos os logs da tabela
$pesquisaProdutos = "SELECT nomeProduto from produto p order by p.nomeProduto";
$Produtos = mysqli_query($conn, $pesquisaProdutos);

//Contar o total de logs
$totalProdutos = mysqli_num_rows($Produtos);

//Seta a quantidade de logs por pagina
$quantidade_pg = 30;

//calcular o número de pagina necessárias para apresentar os logs
$num_pagina = ceil($totalProdutos / $quantidade_pg);

//Calcular o inicio da visualizacao
$incio = ($quantidade_pg * $pagina) - $quantidade_pg;

//Selecionar os logs a serem apresentado na página
$pesquisa = "";
if (!isset($_POST['termo'])) {
    $pesquisaProdutos = "select 
    idProduto,
    nomeProduto,
    codigo,
    imagem,
    ativo , 
    dataCadastro,
    unidade,
    preco,
    estoque,
    dataCadastro 
    from 
    produto p order by p.nomeProduto limit $incio, $quantidade_pg";
} else {
    $pesquisa = $_POST["termo"];

    $pesquisaProdutos = "select idProduto, nomeProduto, codigo, imagem, ativo, dataCadastro, unidade, preco, estoque 
    from produto p WHERE p.nomeProduto LIKE '%" . $pesquisa . "%'";
}
//preciso fazer as pesquisas


$resultadoProdutos = mysqli_query($conn, $pesquisaProdutos);
$totalProdutos = mysqli_num_rows($resultadoProdutos);
$pesquisaPedidos = "select idpedido,codPedido,sum(quantidade) as quantidade, pe.preco precoPedido,
nomeProduto from pedido pe, produto pr, cliente c where 
idProduto = produto and idCliente = cliente";
$resultadoPedidos = mysqli_query($conn, $pesquisaPedidos);
$totalPedidos = mysqli_num_rows($resultadoPedidos);

?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <!-- Meta tags Obrigatórias -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Coorporativa Orgânica</title>
    <link rel="shortcut icon" href="../imagens/google.png" type="image/x-icon" />

</head>

<body>


    <nav class="navbar navbar-expand-sm bg-light">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="home.php">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="historico.php">Pedidos</a>
            </li>

        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-user"> <?php echo $_SESSION["nomeCliente"] ?></i>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <form method="POST" action="editarDados.php">
                        <input type="hidden" name="idCliente" value="<?php echo $idCliente ?>">

                        <button type="submit" class="btn btn-default"> <i class="fa fa-pencil">Editar dados</i> </button>
                        </button>

                    </form>
                    <a class="dropdown-item" href="../sairCliente.php">
                        <i class="fa fa-sign-out"> Fazer logout</i>
                    </a>


            </li>

        </ul>
    </nav>
    <?php if (isset($_SESSION['msg'])) {
        echo $_SESSION['msg'];
        unset($_SESSION['msg']);
    } ?>
    <div class="col-sm-12">
        <!--Exemplo -->

        <?php if ($totalPedidos > 0) { ?>
            <h4 class="mb-3 text-center">Confira seu historico de pedidos</h4>

        <?php } else { ?>
            <h4 class="mb-3 text-center">Carrinho vazio ! </h4>
        <?php } ?>
    </div> <!-- card.// -->


    <div class="row">

    </div>



    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>

</html>