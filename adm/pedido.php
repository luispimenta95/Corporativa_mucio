<?php
session_start();
include '../conecta.php';
include '../mensagemPadrao.php';

if (!isset($_SESSION["idAdministrador"])) {
    header("Location:../login.php");
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
$nomeProduto = "";
$codPedido = "";
$dataIni = "";
$dataFim = "";

if (!isset($_POST['dataIni']) && !isset($_POST['dataFim'])) {
    $pesquisaProdutos = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente";
} else {
    $dataIni = $_POST["dataIni"];
    $dataFim = $_POST["dataFim"];
    $filtroData = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente and dataPedido >= '" . $dataIni . " ' and dataPedido <= '" . $dataFim . "'
    ";
}
if (!isset($_POST['termo'])) {
    $pesquisaProdutos = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente
    limit $incio, $quantidade_pg";
} else {
    $pesquisa = $_POST["termo"];

    $filtroClientes = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente and nomeCliente  LIKE '%" . $pesquisa . "%'";
}

if (!isset($_POST['codigo'])) {
    $pesquisaProdutos = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente
    limit $incio, $quantidade_pg";
} else {
    $codPedido = $_POST["codigo"];

    $filtroCodigo = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente and codPedido=   . $codPedido . ";
}
if (!isset($_POST['produto'])) {
    $pesquisaProdutos = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente
    limit $incio, $quantidade_pg";
} else {
    $nomeProduto = $_POST["produto"];

    $filtroProduto = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente and nomeProduto  LIKE '%" . $nomeProduto . "%'";
}
if (!isset($_POST['codigo'])) {
    $pesquisaCodigo = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente
    limit $incio, $quantidade_pg";
} else {
    $codPedido = $_POST["codigo"];

    $filtroCodigo = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente and codPedido = $codPedido";
}

if ($dataIni != "" && $dataFim != "") {
    $pesquisaProdutos = $filtroData;
} else if ($nomeProduto != "") {

    $pesquisaProdutos = $filtroProduto;
} else if ($pesquisa != "") {
    $pesquisaProdutos = $filtroClientes;
} else if ($codPedido != "") {
    $pesquisaProdutos = $filtroCodigo;
}
/*
preciso fazer os filtros:
Filtro por nome de cliente - OK
Filtro por data de pedido - Implementar
Filtro por nome de produto - Implementar
Filtro por código de pedido - Implementar
*/

$resultadoProdutos = mysqli_query($conn, $pesquisaProdutos);
$totalProdutos = mysqli_num_rows($resultadoProdutos);

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


    <h1>Bem vindo <?php echo $_SESSION["nomeAdministrador"] ?>!</h1>
    <a href="../sair.php">Logout</a>

    <form method="POST" action="pedido.php" class="search nav-form">
        <div class="input-group input-search">
            <input type="text" class="form-control" name="termo" id="q" placeholder="Pesquisa por nome do cliente">
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i>
                </button>
            </span>
        </div>
    </form>

    <form method="POST" action="pedido.php" class="search nav-form">
        <div class="input-group input-search">
            <input type="text" class="form-control" name="produto" id="q" placeholder="Pesquisa por nome do produto">
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i>
                </button>
            </span>
        </div>
    </form>
    <form method="POST" action="pedido.php" class="search nav-form">
        <div class="input-group input-search">
            <input type="text" class="form-control" name="codigo" id="q" placeholder="Pesquisa por código do pedido">
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i>
                </button>
            </span>
        </div>
    </form>


    <form method="POST" action="pedido.php" class="search nav-form">
        <div class="form-group">
            <label for="example-date-input" class="col-2 col-form-label">Data inicial</label>
            <div class="col-6">
                <input class="form-control" type="date" name="dataIni" id="example-date-input">
            </div>
            <label for="example-date-input" class="col-2 col-form-label">Data final</label>
            <div class="col-6">

                <input class="form-control" type="date" name="dataFim" max=<?php echo date('Y-m-d'); ?> id="example-date-input">
            </div>
            <button type="submit" class="btn btn-primary btn-sm">Small button</button>
        </div>

    </form>

    <?php



    if ($totalProdutos == 0) {
        $pesquisaProdutos = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente
        limit $incio, $quantidade_pg";

        $resultadoProdutos = mysqli_query($conn, $pesquisaProdutos);

        $_SESSION["msg"] = $mensagens["semRegistro"];
    }
    if (isset($_SESSION['msg'])) {
        echo $_SESSION['msg'];
        unset($_SESSION['msg']);
    }


    ?>
    <table class="table table-bordered">

        <thead>
            <tr>
                <th>Código</th>
                <th>Nome</th>
                <th>Preço Unitário</th>
                <th>Quantidade</th>
                <th>Preço total</th>
                <th>Comprador</th>
                <th>Data do pedido</th>

            </tr>
        </thead>
        <tbody>
            <?php
            $totalPedido = 0;
            $somaProduto = 0;

            while ($row = mysqli_fetch_assoc($resultadoProdutos)) {
                $somaProduto = $row["precoPedido"] * $row["quantidade"];
            ?>

                <tr>
                    <th> <?php echo $row["codPedido"] ?> </th>
                    <th> <?php echo $row["nomeProduto"] ?> </th>
                    <th>R$ <?php echo number_format($row["precoPedido"], 2, ",", "."); ?> </th>
                    <th> <?php echo $row["quantidade"] ?> </th>
                    <th>R$ <?php echo number_format($somaProduto, 2, ",", "."); ?> </th>
                    <th> <?php echo $row["nomeCliente"] ?> </th>
                    <th>
                        <?php echo date('d/m/Y', strtotime($row["dataPedido"])); ?>
                    </th>


                <?php
                $totalPedido += $somaProduto;
            } ?>

                <tr>
                    <td> Total de pedidos realizados : <?php
                                                        if ($totalProdutos == 0) {
                                                            $pesquisaProdutos = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente
                        limit $incio, $quantidade_pg";
                                                            $resultadoProdutos = mysqli_query($conn, $pesquisaProdutos);
                                                            $totalProdutos = mysqli_num_rows($resultadoProdutos);
                                                        }

                                                        echo $totalProdutos ?> </td>
                    <td>
                        <?php
                        echo "Arrecadação total : R$ " .  number_format($totalPedido, 2, ",", ".");
                        ?>


                    </td>
                </tr>




                </tr>

        </tbody>
    </table>


    <?php

    $result_log = "SELECT * from pedido";

    $Produtos = mysqli_query($conn, $result_log);

    //Contar o total de logs
    $totalProdutos = mysqli_num_rows($Produtos);
    $limitador = 1;
    if ($totalProdutos > $quantidade_pg && $totalProdutos > 0) { ?>
        <nav class="text-center">
            <ul class="pagination">

                <li><a href="home.php?pagina=1"> Primeira página </a></li>


                <?php
                for ($i = $pagina - $limitador; $i <= $pagina - 1; $i++) {
                    if ($i >= 1) {
                ?>
                        <li><a href="home.php?pagina=<?php echo $i; ?>"> <?php echo $i; ?></a></li>


                <?php }
                }
                ?>
                <li class="active"> <span><?php echo $pagina; ?></span></li>

                <?php
                for ($i = $pagina + 1; $i <= $pagina + $limitador; $i++) {
                    if ($i <= $num_pagina) { ?>
                        <li><a href="home.php?pagina=<?php echo $i; ?>"> <?php echo $i; ?></a></li>

                <?php }
                }



                ?>
                <li><a href="home.php?pagina=<?php echo $num_pagina; ?>"> <span aria-hidden="true"> Ultima página </span></a></li>



            <?php } ?>
            </ul>
        </nav>


        <!-- JavaScript (Opcional) -->
        <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>

</html>