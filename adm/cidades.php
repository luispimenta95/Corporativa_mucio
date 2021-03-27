<?php
session_start();
include '../conecta.php';
include '../mensagemPadrao.php';

if (!isset($_SESSION["idAdministrador"])) {
    header("Location:../login.php");
}
mysqli_set_charset($conn, 'utf8');
$pagina = (isset($_GET['pagina'])) ? $_GET['pagina'] : 1;
$pagina_atual = "cidades.php";
//Selecionar todos os logs da tabela
$pesquisaCidades = "SELECT nomeProduto from produto p order by p.nomeProduto";
$Cidades = mysqli_query($conn, $pesquisaCidades);

//Contar o total de logs
$totalCidades = mysqli_num_rows($Cidades);

//Seta a quantidade de logs por pagina
$quantidade_pg = 30;

//calcular o número de pagina necessárias para apresentar os logs
$num_pagina = ceil($totalCidades / $quantidade_pg);

//Calcular o inicio da visualizacao
$incio = ($quantidade_pg * $pagina) - $quantidade_pg;

//Selecionar os logs a serem apresentado na página
$pesquisa = "";
if (isset($_POST['todos'])) {
    $pesquisa = "todos";
    $listaTodos = "SELECT idCidade , nomeCidade,precoFrete , ufEstado FROM cidade c INNER JOIN estado e on c.estado = e.idEstado";
}
if (!isset($_POST['termo'])) {
    $pesquisaCidades = "SELECT idCidade , nomeCidade,precoFrete , ufEstado FROM cidade c INNER JOIN estado e on c.estado = e.idEstado 
       limit $incio, $quantidade_pg";
} else {
    $pesquisa = $_POST["termo"];

    $pesquisaCidades = "SELECT idCidade , nomeCidade,precoFrete , ufEstado FROM cidade c INNER JOIN estado e on c.estado = e.idEstado
        WHERE c.nomeCidade LIKE '%" . $pesquisa . "%'";
}
if ($pesquisa == "todos") {
    $pesquisaCidades = $listaTodos;
}


$resultadoCidades = mysqli_query($conn, $pesquisaCidades);
$totalCidades = mysqli_num_rows($resultadoCidades);

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
                <a class="nav-link" href="cidades.php">Cidades</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="usuario.php">Usuários</a>
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
    <div class="col-sm-12">
        <div class="card">
            <article class="card-group-item">
                <header class="card-header">
                    <h6 class="title">Filtrar Cidades </h6>
                </header>
                <div class="filter-content">
                    <div class="card-body">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <form method="POST" action="cidades.php" class="search nav-form">
                                    <div class="input-group input-search">
                                        <input type="text" class="form-control" name="termo" id="q" placeholder="Pesquisa por nome...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                        </span>
                                    </div>
                                </form>
                            </div>


                            <div class="form-group col-md-12 text-right">
                                <form method="POST" action="relatoriocidades.php" class="search nav-form">
                            </div>

                            <input type="hidden" name="sql" value="<?php echo $pesquisaCidades ?>">
                            <input type="hidden" name="pg_atual" value="<?php echo $pagina ?>">
                            <input type="hidden" name="total_pg" value="<?php echo $num_pagina ?>">




                            </form>

                            <form method="POST" action="cidades.php" class="col-md-6 search nav-form">
                                <div class="input-group input-search">
                                    <input type="hidden" name="todos">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="submit"> Listar todos</button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div> <!-- card-body.// -->
                </div>
            </article> <!-- card-group-item.// -->

        </div> <!-- card.// -->
    </div>
    <br><br>

    <h3 class="text-center"> Cidades coorporativa </h3>
    <br><br>

    <?php



    if ($totalCidades == 0) {
        $pesquisaUsuarios = "SELECT idCidade , nomeCidade,precoFrete , ufEstado FROM cidade c INNER JOIN estado e on c.estado = e.idEstado 
        limit $incio, $quantidade_pg";
        $resultadoUsuarios = mysqli_query($conn, $pesquisaUsuarios);

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
                <th>Cidade</th>
                <th> Estado</th>
                <th> Preço frete</th>
                <th> Editar</th>


            </tr>
            </tr>
        </thead>
        <tbody>
            <?php


            while ($row = mysqli_fetch_assoc($resultadoCidades)) { ?>

                <tr>
                    <th> <?php echo $row["nomeCidade"] ?> </th>
                    <th> <?php echo $row["ufEstado"] ?> </th>

                    <th> R$ <?php echo number_format($row["precoFrete"], 2, ",", "."); ?> </th>



                    <th>
                        <a href="#edicao<?php echo $row["idCidade"] ?>" data-toggle="modal"><button type='button' class='btn btn-primary btn-sm'><i class="fa fa-pencil"></i> </button></a>

                    </th>
                    <form action="updateFrete.php?id=<?php echo $row["idCidade"]; ?>" method="POST" class="form-group">

                        <div id="edicao<?php echo $row["idCidade"] ?>" class="modal fade" role="dialog" class="form-group">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <?php
                                        if (isset($_SESSION['msg'])) {
                                            echo $_SESSION['msg'];
                                            unset(
                                                $_SESSION['msg']

                                            );
                                        }
                                        ?>
                                        <h4 class="modal-title">Atualizar produto</h4>
                                    </div>
                                    <div class="modal-body">

                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-2 col-form-label">Nome</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="nome" value="<?php echo $row["nomeCidade"] ?>" readonly>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-2 col-form-label">Preço frete</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="precoFrete" value="R$ <?php echo number_format($row["precoFrete"], 2, ",", "."); ?>" required>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class=" btn btn-primary">Realizar alterações</button>

                                        <button type="submit" class=" btn btn-danger" data-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </form>

                <?php } ?>
                </tr>

        </tbody>
    </table>



    <?php

    $result_log = "SELECT * from cidade";

    $Usuarios = mysqli_query($conn, $result_log);

    //Contar o total de logs
    $totalUsuarios = mysqli_num_rows($Usuarios);
    $limitador = 1;
    if ($totalUsuarios > $quantidade_pg && $totalUsuarios > 0) { ?>
        <nav class="text-center">
            <ul class="pagination">

                <li><a href="cidades.php?pagina=1"> Primeira página </a></li>


                <?php
                for ($i = $pagina - $limitador; $i <= $pagina - 1; $i++) {
                    if ($i >= 1) {
                ?>
                        <li><a href="cidades.php?pagina=<?php echo $i; ?>"> <?php echo $i; ?></a></li>


                <?php }
                }
                ?>
                <li class="active"> <span><?php echo $pagina; ?></span></li>

                <?php
                for ($i = $pagina + 1; $i <= $pagina + $limitador; $i++) {
                    if ($i <= $num_pagina) { ?>
                        <li><a href="cidades.php?pagina=<?php echo $i; ?>"> <?php echo $i; ?></a></li>

                <?php }
                }



                ?>
                <li><a href="cidades.php?pagina=<?php echo $num_pagina; ?>"> <span aria-hidden="true"> Ultima página </span></a></li>



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