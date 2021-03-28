<?php
session_start();
include '../conecta.php';
include '../mensagemPadrao.php';

if (!isset($_SESSION["idAdministrador"])) {
    header("Location:../login.php");
}
mysqli_set_charset($conn, 'utf8');
$pagina = (isset($_GET['pagina'])) ? $_GET['pagina'] : 1;
$pagina_atual = "pedido.php";
//Selecionar todos os logs da tabela
$pesquisaPedidos = "SELECT * from pedido";
$Pedidos = mysqli_query($conn, $pesquisaPedidos);

//Contar o total de logs
$totalPedidos = mysqli_num_rows($Pedidos);

//Seta a quantidade de logs por pagina
$quantidade_pg = 30;

//calcular o número de pagina necessárias para apresentar os logs
$num_pagina = ceil($totalPedidos / $quantidade_pg);

//Calcular o inicio da visualizacao
$incio = ($quantidade_pg * $pagina) - $quantidade_pg;

//Selecionar os logs a serem apresentado na página
$pesquisa = "";
$nomeProduto = "";
$codPedido = "";
$dataIni = "";
$dataFim = "";
$buscar = "";
if (isset($_POST["todos"])) {
    $buscar = "todos";
    $buscaTodos = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido,precoFrete, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente
    ";
}

if (!isset($_POST['dataIni']) && !isset($_POST['dataFim'])) {
    $pesquisaPedidos = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido,precoFrete, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente";
} else {
    $dataIni = $_POST["dataIni"];
    $dataFim = $_POST["dataFim"];
    $filtroData = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido,precoFrete, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente and dataPedido between '$dataIni' and '$dataFim'

    ";
}
if (!isset($_POST['termo'])) {
    $pesquisaPedidos = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido,precoFrete, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente
    limit $incio, $quantidade_pg";
} else {
    $pesquisa = $_POST["termo"];

    $filtroClientes = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido,precoFrete, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente and nomeCliente  LIKE '%" . $pesquisa . "%'";
}

if (!isset($_POST['codigo'])) {
    $pesquisaPedidos = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido,precoFrete, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente
    limit $incio, $quantidade_pg";
} else {
    $codPedido = $_POST["codigo"];

    $filtroCodigo = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido,precoFrete, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente and codPedido=   . $codPedido . ";
}
if (!isset($_POST['produto'])) {
    $pesquisaPedidos = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido,precoFrete, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente
    limit $incio, $quantidade_pg";
} else {
    $nomeProduto = $_POST["produto"];

    $filtroProduto = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido,precoFrete, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente and nomeProduto  LIKE '%" . $nomeProduto . "%'";
}
if (!isset($_POST['codigo'])) {
    $pesquisaCodigo = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido,precoFrete, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente
    limit $incio, $quantidade_pg";
} else {
    $codPedido = $_POST["codigo"];

    $filtroCodigo = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido,precoFrete, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente and codPedido = '$codPedido'";
}

if ($dataIni != "" && $dataFim != "") {
    $pesquisaPedidos = $filtroData;
} else if ($nomeProduto != "") {

    $pesquisaPedidos = $filtroProduto;
} else if ($pesquisa != "") {
    $pesquisaPedidos = $filtroClientes;
} else if ($codPedido != "") {
    $pesquisaPedidos = $filtroCodigo;
} else if ($buscar == "todos") {
    $pesquisaPedidos = $buscaTodos;
}

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
                <a class="nav-link" href="pedido.php">Pedidos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="produto.php">Produtos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="usuario.php">Usuários</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="cidades.php">Cidades</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="../sair.php">
                    <i class="fa fa-sign-out"> Fazer logout</i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fa fa-user"> <?php echo $_SESSION["nomeAdministrador"] ?></i>
                </a>
            </li>

        </ul>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title">Filtrar pedidos </h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <form method="POST" action="pedido.php" class="search nav-form">
                                            <div class="input-group input-search">
                                                <input type="text" class="form-control" name="termo" id="q" placeholder="Pesquisa por nome do cliente">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <form method="POST" action="pedido.php" class="search nav-form">
                                            <div class="input-group input-search">
                                                <input type="text" class="form-control" name="produto" id="q" placeholder="Pesquisa por nome do produto">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <form method="POST" action="pedido.php" class="search nav-form">
                                            <div class="input-group input-search">
                                                <input type="text" class="form-control" name="codigo" id="q" placeholder="Pesquisa por código do pedido">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <div class="col">

                                            <label for="example-date-input" class="col-form-label">Data inicial</label>
                                            <form method="POST" action="pedido.php" class="search nav-form">

                                                <input class="form-control" max=<?php echo date('Y-m-d', strtotime(date("Y-m-d") . "-1 day")); ?> type="date" name="dataIni" id="example-date-input">
                                                <label for="example-date-input" class="col-form-label">Data Final</label>

                                                <input class="form-control" max=<?php echo date('Y-m-d', strtotime(date("Y-m-d") . "-1 day")); ?> type="date" name="dataFim" id="example-date-input">
                                                <button type="submit" class="btn btn-primary btn-sm">Filtrar por datas</button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12 text-right">
                                        <form method="POST" action="relatorioPedido.php" class="col-md-6 search nav-form">
                                    </div>
                                    <input type="hidden" name="sql" value="<?php echo $pesquisaPedidos ?>">
                                    <input type="hidden" name="pg_atual" value="<?php echo $pagina ?>">
                                    <input type="hidden" name="total_pg" value="<?php echo $num_pagina ?>">

                                    <button type="submit" class="btn btn-primary btn-sm">Gerar relatório </button>


                                    </form>

                                    <form method="POST" action="pedido.php" class="col-md-6 search nav-form">
                                        <div class="input-group input-search">
                                            <input type="hidden" name="todos">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="submit"> Listar todos</button>
                                            </span>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div> <!-- card-body.// -->
                </div>
                </article> <!-- card-group-item.// -->

            </div> <!-- card.// -->
        </div>
        <br><br>

        <h3 class="text-center"> Pedidos coorporativa </h3>
        <br><br>
        <div class="col-sm-12">




            <?php



            if ($totalPedidos == 0) {
                $pesquisaPedidos = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido,precoFrete, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente
    limit $incio, $quantidade_pg";

                $resultadoPedidos = mysqli_query($conn, $pesquisaPedidos);

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
                        <th>Preço dos produtos</th>
                        <th>Preço do frete</th>
                        <th>Preço total do pedido</th>

                        <th>Comprador</th>
                        <th>Data do pedido</th>

                    </tr>
                </thead>
                <tbody>
                    <?php
                    $totalPedido = 0;
                    $somaProduto = 0;

                    while ($row = mysqli_fetch_assoc($resultadoPedidos)) {
                        $somaProduto = $row["precoPedido"] * $row["quantidade"];
                    ?>

                        <tr>
                            <th> <?php echo $row["codPedido"] ?> </th>
                            <th> <?php echo $row["nomeProduto"] ?> </th>
                            <th>R$ <?php echo number_format($row["precoPedido"], 2, ",", "."); ?> </th>
                            <th> <?php echo $row["quantidade"] ?> </th>
                            <th>R$ <?php echo number_format($somaProduto, 2, ",", "."); ?> </th>
                            <?php $frete = $row["precoFrete"]; ?>
                            <th>R$ <?php echo number_format($frete, 2, ",", "."); ?> </th>
                            <th>R$ <?php echo number_format(($somaProduto + $frete), 2, ",", "."); ?> </th>

                            <th> <?php echo $row["nomeCliente"] ?> </th>
                            <th>
                                <?php echo date('d/m/Y', strtotime($row["dataPedido"])); ?>
                            </th>


                        <?php
                        $totalPedido += $somaProduto;
                    } ?>

                        <tr>
                            <td style="visibility:hidden" colspan="7">
                            </td>
                            <td> Total de pedidos listados : <?php
                                                                if ($totalPedidos == 0) {
                                                                    $pesquisaPedidos = "select idpedido,codPedido,quantidade, pe.preco precoPedido, dataPedido,precoFrete, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente
                limit $incio, $quantidade_pg";
                                                                    $resultadoPedidos = mysqli_query($conn, $pesquisaPedidos);
                                                                    $totalPedidos = mysqli_num_rows($resultadoPedidos);
                                                                }

                                                                echo $totalPedidos ?>


                            <td>
                                <?php
                                echo "Arrecadação total : R$ " .  number_format($totalPedido, 2, ",", ".");
                                ?>


                            </td>
                        </tr>




                        </tr>

                </tbody>
            </table>

            <form method="POST" action="relatorioPedido.php" class="search nav-form">
        </div>
        <input type="hidden" name="sql" value="<?php echo $pesquisaPedidos ?>">
        <input type="hidden" name="pg_atual" value="<?php echo $pagina ?>">
        <input type="hidden" name="total_pg" value="<?php echo $num_pagina ?>">


    </div>

    </form>

    <?php

    $result_log = "SELECT * from pedido";

    $Pedidos = mysqli_query($conn, $result_log);

    //Contar o total de logs
    $totalPedidos = mysqli_num_rows($Pedidos);
    $limitador = 1;
    if ($totalPedidos > $quantidade_pg && $totalPedidos > 0) { ?>
        <nav class="text-center">
            <ul class="pagination">

                <li><a href="pedido.php?pagina=1"> Primeira página </a></li>


                <?php
                for ($i = $pagina - $limitador; $i <= $pagina - 1; $i++) {
                    if ($i >= 1) {
                ?>
                        <li><a href="pedido.php?pagina=<?php echo $i; ?>"> <?php echo $i; ?></a></li>


                <?php }
                }
                ?>
                <li class="active"> <span><?php echo $pagina; ?></span></li>

                <?php
                for ($i = $pagina + 1; $i <= $pagina + $limitador; $i++) {
                    if ($i <= $num_pagina) { ?>
                        <li><a href="pedido.php?pagina=<?php echo $i; ?>"> <?php echo $i; ?></a></li>

                <?php }
                }



                ?>
                <li><a href="pedido.php?pagina=<?php echo $num_pagina; ?>"> <span aria-hidden="true"> Ultima página </span></a></li>



            <?php } ?>
            </ul>
        </nav>



        </div>


        </div>

        </div>
        </div>
        <!-- JavaScript (Opcional) -->
        <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>

</html>