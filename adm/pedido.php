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
if (!isset($_POST['termo'])) {
    $pesquisaProdutos = "select idpedido,codPedido,quantidade, pr.preco precoUnitario, 
    (pr.preco * quantidade) totalProduto, nomeProduto, nomeCliente from pedido pe, produto pr,
     cliente c where idProduto = produto and idCliente = cliente limit $incio, $quantidade_pg";
} else {
    $pesquisa = $_POST["termo"];

    $pesquisaProdutos = "select idpedido,codPedido,quantidade, pr.preco precoUnitario, (pr.preco * quantidade) totalProduto, nomeProduto, nomeCliente from pedido pe, produto pr, cliente c where idProduto = produto and idCliente = cliente and nomeCliente  LIKE '%" . $pesquisa . "%'";
}
//preciso fazer as pesquisas


$resultadoProdutos = mysqli_query($conn, $pesquisaProdutos);
$totalProdutos = mysqli_num_rows($resultadoProdutos);

?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <!-- Meta tags Obrigatórias -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Olá, mundo!</title>
</head>

<body>
    <h1>Bem vindo <?php echo $_SESSION["nomeAdministrador"] ?>!</h1>
    <a href="../sair.php">Logout</a>

    <form method="POST" action="home.php" class="search nav-form">
        <div class="input-group input-search">
            <input type="text" class="form-control" name="termo" id="q" placeholder="Pesquisa por nome...">
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
            </span>
        </div>
    </form>


    <?php



    if ($totalProdutos == 0) {
        $pesquisaProdutos = "select idpedido,codPedido,quantidade, pr.preco precoUnitario, 
        (pr.preco * quantidade) totalProduto, nomeProduto, nomeCliente from pedido pe, produto pr,
         cliente c where idProduto = produto and idCliente = cliente limit $incio, $quantidade_pg";

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
            </tr>
        </thead>
        <tbody>
            <?php


            while ($row = mysqli_fetch_assoc($resultadoProdutos)) { ?>

                <tr>
                    <th> <?php echo $row["codPedido"] ?> </th>
                    <th> <?php echo $row["nomeProduto"] ?> </th>
                    <th>R$ <?php echo number_format($row["precoUnitario"], 2, ",", "."); ?> </th>
                    <th> <?php echo $row["quantidade"] ?> </th>
                    <th>R$ <?php echo number_format($row["totalProduto"], 2, ",", "."); ?> </th>
                    <th> <?php echo $row["nomeCliente"] ?> </th>



                <?php } ?>

                <tr>
                    <td>
                        <?php
                        $pesquisaTotal = "select 1, sum(preco * quantidade) total from pedido group by 1 ";
                        $resultadoTotal = mysqli_query($conn, $pesquisaTotal);

                        $precoFinal = mysqli_fetch_assoc($resultadoTotal);
                        echo  number_format($precoFinal["total"], 2, ",", ".");
                        ?>


                    </td>
                </tr>




                </tr>

        </tbody>
    </table>

    <a href="#cadastro" data-toggle="modal"><button type='button' class='btn btn-success'>Cadastrar empresa</button></a>

    <?php

    $result_log = "SELECT * from produto";

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