<?php
session_start();
include '../conecta.php';
include '../mensagemPadrao.php';

if (!isset($_SESSION["idAdministrador"])) {
    header("Location:../login.php");
}
mysqli_set_charset($conn, 'utf8');
$pagina = (isset($_GET['pagina'])) ? $_GET['pagina'] : 1;
$pagina_atual = "produto.php";
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
if (isset($_POST['todos'])) {
    $pesquisa = "todos";
    $listaTodos = "select 
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
    produto p order by p.nomeProduto";
}
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
if ($pesquisa == "todos") {
    $pesquisaProdutos = $listaTodos;
}


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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Olá, mundo!</title>
</head>

<body>
    <h1>Bem vindo <?php echo $_SESSION["nomeAdministrador"] ?>!</h1>
    <a href="../sair.php">Logout</a>

    <form method="POST" action="produto.php" class="search nav-form">
        <div class="input-group input-search">
            <input type="text" class="form-control" name="termo" id="q" placeholder="Pesquisa por nome...">
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
            </span>
        </div>
    </form>
    <form method="POST" action="relatorioProduto.php" class="search nav-form">
        </div>
        <input type="hidden" name="sql" value="<?php echo $pesquisaProdutos ?>">
        <input type="hidden" name="pg_atual" value="<?php echo $pagina ?>">
        <input type="hidden" name="total_pg" value="<?php echo $num_pagina ?>">
        <button type="submit" class="btn btn-primary btn-sm">Gerar relatório </button>
        </div>

    </form>
    <form method="POST" action="produto.php" class="search nav-form">
        <div class="input-group input-search">
            <input type="hidden" name="todos">
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit"> Listar todos</button>
            </span>
        </div>
    </form>

    <?php



    if ($totalProdutos == 0) {
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
        $resultadoProdutos = mysqli_query($conn, $pesquisaProdutos);
        $totalProdutos = mysqli_num_rows($resultadoProdutos);
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
                <th>Imagem</th>
                <th> Código</th>
                <th> Produto</th>
                <th> Preço</th>
                <th> Quantidade em estoque</th>

                <th> Situação</th>
                <th> Editar</th>


            </tr>
            </tr>
        </thead>
        <tbody>
            <?php


            while ($row = mysqli_fetch_assoc($resultadoProdutos)) { ?>

                <tr>
                    <th>
                        <img class="img-fluid img-thumbnail" src="Imagens_produto/<?php echo $row['imagem']; ?>" alt="Imagem de capa da empresa">

                    </th>
                    <th> <?php echo $row["codigo"] ?> </th>

                    <th> <?php echo $row["nomeProduto"] ?> </th>
                    <th> R$ <?php echo number_format($row["preco"], 2, ",", "."); ?> </th>

                    <th> <?php echo $row["estoque"] ?> </th>
                    <?php if ($row["ativo"] == 1) { ?>
                        <th> Produto disponível</th>
                    <?php } else { ?>
                        <th> Produto indisponível</th>

                    <?php } ?>

                    <th>
                        <a href="#edicao<?php echo $row["idProduto"] ?>" data-toggle="modal"><button type='button' class='btn btn-primary btn-sm'><i class="fa fa-pencil"></i> </button></a>

                    </th>
                    <form action="updateProduto.php?id=<?php echo $row["idProduto"]; ?>" method="POST" class="form-group" enctype="multipart/form-data">

                        <div id="edicao<?php echo $row["idProduto"] ?>" class="modal fade" role="dialog" class="form-group">
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
                                                <input type="text" class="form-control" name="nome" value="<?php echo $row["nomeProduto"] ?>" required>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-2 col-form-label">Código: </label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="codigo" value="<?php echo $row["codigo"] ?>" required>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-2 col-form-label">Preço</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="preco" value="R$ <?php echo number_format($row["preco"], 2, ",", "."); ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-3 col-form-label">Quantidade: </label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="quantidade" value="<?php echo $row["estoque"] ?>" required>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-3 col-form-label">Variação: </label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="variacao" value="<?php echo $row["unidade"] ?>" required>
                                            </div>
                                        </div>

                                        <div class="form-group row" required>
                                            <label for="inputEmail3" class="col-sm-6 col-form-label">Situação do produto</label>
                                            <div class="col-sm-6">
                                                <label class="radio-inline">
                                                    <input type="radio" name="situacao" value="1" required><span class="label label-success">Disponível</span>
                                                </label>

                                                <br>
                                                <label class="radio-inline">
                                                    <input type="radio" name="situacao" value="0" required><span class="label label-danger">Indisponível</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-3 col-form-label">Alterar foto: </label>
                                            <div class="col-sm-9">
                                                <input type="file" id="exampleInputEmail1" name="arquivo">
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

    <form action="inserirProduto.php" method="POST" class="form-group" enctype="multipart/form-data">

        <div id="cadastro" class="modal fade" role="dialog" class="form-group">
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
                        <h4 class="modal-title">Cadastrar produto</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Nome</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="nome" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Código: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="codigo" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Preço</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="preco" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Estoque: </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="quantidade" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Variação: </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="variacao" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Inserir foto: </label>
                            <div class="col-sm-9">
                                <input type="file" id="exampleInputEmail1" name="arquivo" required>
                            </div>
                        </div>




                    </div>
                    <div class="modal-footer">
                        <button type="submit" class=" btn btn-primary">Inserir registro</button>

                        <button type="submit" class=" btn btn-danger" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>

            </div>
        </div>

    </form>
    <a href="#cadastro" data-toggle="modal"><button type='button' class='btn btn-success'>Cadastrar produto</button></a>

    <?php

    $result_log = "SELECT * from produto";

    $Produtos = mysqli_query($conn, $result_log);

    //Contar o total de logs
    $totalProdutos = mysqli_num_rows($Produtos);
    $limitador = 1;
    if ($totalProdutos > $quantidade_pg && $totalProdutos > 0) { ?>
        <nav class="text-center">
            <ul class="pagination">

                <li><a href="produto.php?pagina=1"> Primeira página </a></li>


                <?php
                for ($i = $pagina - $limitador; $i <= $pagina - 1; $i++) {
                    if ($i >= 1) {
                ?>
                        <li><a href="produto.php?pagina=<?php echo $i; ?>"> <?php echo $i; ?></a></li>


                <?php }
                }
                ?>
                <li class="active"> <span><?php echo $pagina; ?></span></li>

                <?php
                for ($i = $pagina + 1; $i <= $pagina + $limitador; $i++) {
                    if ($i <= $num_pagina) { ?>
                        <li><a href="produto.php?pagina=<?php echo $i; ?>"> <?php echo $i; ?></a></li>

                <?php }
                }



                ?>
                <li><a href="produto.php?pagina=<?php echo $num_pagina; ?>"> <span aria-hidden="true"> Ultima página </span></a></li>



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