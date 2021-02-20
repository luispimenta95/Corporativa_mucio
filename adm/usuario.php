<?php
session_start();
include '../conecta.php';
include '../mensagemPadrao.php';
include 'funcoes.php';

if (!isset($_SESSION["idAdministrador"])) {
    header("Location:../login.php");
}
mysqli_set_charset($conn, 'utf8');
$pagina = (isset($_GET['pagina'])) ? $_GET['pagina'] : 1;
$pagina_atual = "usuario.php";
//Selecionar todos os logs da tabela
$pesquisaUsuarios = "SELECT nomeCliente from cliente u order by u.nomeCliente";
$Usuarios = mysqli_query($conn, $pesquisaUsuarios);

//Contar o total de logs
$totalUsuarios = mysqli_num_rows($Usuarios);

//Seta a quantidade de logs por pagina
$quantidade_pg = 6;

//calcular o número de pagina necessárias para apresentar os logs
$num_pagina = ceil($totalUsuarios / $quantidade_pg);

//Calcular o inicio da visualizacao
$incio = ($quantidade_pg * $pagina) - $quantidade_pg;

//Selecionar os logs a serem apresentado na página
$pesquisa = "";
if (!isset($_POST['termo'])) {
    $pesquisaUsuarios = "select 
    idCliente,
    nomeCliente,
    cpf_cnpj,
    emailCliente,
    ativo , 
    atacado,
    enderecoCliente,
    telefoneCliente,
    dataCadastro 
    from 
    cliente c order by c.nomeCliente limit $incio, $quantidade_pg";
} else {
    $pesquisa = $_POST["termo"];

    $pesquisaUsuarios = "select 
    idCliente,
    nomeCliente,
    cpf_cnpj,
    emailCliente,
    ativo , 
    atacado,
    enderecoCliente,
    telefoneCliente,
    dataCadastro 
    from 
    cliente c WHERE c.nomeCliente LIKE '%" . $pesquisa . "%'";
}
if (!isset($_POST['termo'])) {
    $pesquisa = "todos";
    $listarTodos = "select 
    idCliente,
    nomeCliente,
    cpf_cnpj,
    emailCliente,
    ativo , 
    atacado,
    enderecoCliente,
    telefoneCliente,
    dataCadastro 
    from 
    cliente c order by c.nomeCliente";
}
if ($pesquisa == "todos") {
    $pesquisaUsuarios = $listarTodos;
}
//preciso fazer as pesquisas


$resultadoUsuarios = mysqli_query($conn, $pesquisaUsuarios);
$totalUsuarios = mysqli_num_rows($resultadoUsuarios);

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
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="../sair.php">
                    <i class="fa fa-sign-out"> Fazer logout</i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../sair.php">
                    <i class="fa fa-user"> <?php echo $_SESSION["nomeAdministrador"] ?></i>
                </a>
            </li>

        </ul>
    </nav>
    <form method="POST" action="usuario.php" class="search nav-form">
        <div class="input-group input-search">
            <input type="hidden" name="todos">
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit"> Listar todos</button>
            </span>
        </div>
    </form>
    <form method="POST" action="relatorioUsuario.php" class="search nav-form">
        </div>
        <input type="hidden" name="sql" value="<?php echo $pesquisaUsuarios ?>">

        <button type="submit" class="btn btn-primary btn-sm">Gerar relatório </button>
        </div>

    </form>
    <form method="POST" action="usuario.php" class="search nav-form">
        <div class="input-group input-search">
            <input type="text" class="form-control" name="termo" id="q" placeholder="Pesquisa por nome...">
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i>
                </button>
            </span>
        </div>
    </form>


    <?php



    if ($totalUsuarios == 0) {
        $pesquisaUsuarios = "select 
        idCliente,
        nomeCliente,
        cpf_cnpj,
        emailCliente,
        ativo , 
        enderecoCliente,
        atacado,
        telefoneCliente,
        dataCadastro 
        from 
        cliente c order by c.nomeCliente limit $incio, $quantidade_pg";
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

                <th>Nome</th>
                <th>CPF/CNPJ</th>
                <th>E-mail</th>
                <th>Tipo de cliente</th>
                <th>Situação do cliente</th>

                <th>Data de associação</th>
                <th>Editar</th>
            </tr>
        </thead>
        <tbody>
            <?php


            while ($row = mysqli_fetch_assoc($resultadoUsuarios)) { ?>

                <tr>

                    <th> <?php echo $row["nomeCliente"] ?> </th>
                    <th> <?php echo $row["cpf_cnpj"] ?> </th>
                    <th> <?php echo $row["emailCliente"] ?> </th>
                    <?php if ($row["atacado"] == 1) { ?>
                        <th> Atacado</th>
                    <?php } else { ?>
                        <th> Varejo</th>

                    <?php } ?>

                    <?php if ($row["ativo"] == 1) { ?>
                        <th> Ativo</th>
                    <?php } else { ?>
                        <th> Inativo</th>

                    <?php } ?>

                    <th>
                        <?php echo date('d/m/Y', strtotime($row["dataCadastro"])); ?>
                    </th>
                    <th>
                        <a href="#edicao<?php echo $row["idCliente"] ?>" data-toggle="modal"><button type='button' class='btn btn-primary btn-sm'><i class="fa fa-pencil"></i> </button></a>

                    </th>
                    <form action="updateCliente.php?id=<?php echo $row["idCliente"]; ?>" method="POST" class="form-group" enctype="multipart/form-data">

                        <div id="edicao<?php echo $row["idCliente"] ?>" class="modal fade" role="dialog" class="form-group">
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
                                        <h4 class="modal-title">Atualizar cliente</h4>
                                    </div>
                                    <div class="modal-body">

                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-2 col-form-label">Nome</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="nome" value="<?php echo $row['nomeCliente'] ?>" required>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-4 col-form-label">CPF/CNPJ: </label>
                                            <div class="col-sm-8">
                                                <input type="text" value="<?php echo $row['cpf_cnpj'] ?>" class="form-control" name="cpf" required>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                                            <div class="col-sm-10">
                                                <input type="email" class="form-control" name="email" value="<?php echo $row['emailCliente'] ?>" required>
                                            </div>
                                        </div>

                                        <div class="form-group row" required>
                                            <label for="inputEmail3" class="col-sm-6 col-form-label">Situação de cliente</label>
                                            <div class="col-sm-6">

                                                <?php
                                                if ($row["ativo"] == 1) { ?>

                                                    <label class="radio-inline">
                                                        <input type="radio" name="ativo" value="1" checked="checked" required><span class="label label-success">Ativo</span>
                                                    </label>

                                                    <br>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="ativo" value="0" required><span class="label label-danger">Inativo</span>
                                                    </label>

                                                <?php } else { ?>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="ativo" value="1" checked="checked" required><span class="label label-success">Ativo</span>
                                                    </label>

                                                    <br>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="ativo" value="0" checked="checked" required><span class="label label-danger">Inativo</span>
                                                    </label>
                                                <?php } ?>




                                            </div>
                                        </div>


                                        <div class="form-group row" required>
                                            <label for="inputEmail3" class="col-sm-6 col-form-label">Tipo de cliente</label>
                                            <div class="col-sm-6">

                                                <?php
                                                if ($row["atacado"] == 1) { ?>

                                                    <label class="radio-inline">
                                                        <input type="radio" name="atacado" value="1" checked="checked" required><span class="label label-success">Atacado</span>
                                                    </label>

                                                    <br>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="atacado" value="0" required><span class="label label-danger">Varejo</span>
                                                    </label>

                                                <?php } else { ?>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="atacado" value="1" checked="checked" required><span class="label label-success">Atacado</span>
                                                    </label>

                                                    <br>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="atacado" value="0" checked="checked" required><span class="label label-danger">Varejo</span>
                                                    </label>
                                                <?php } ?>




                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-2 col-form-label">Endereço</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" value="<?php echo $row['enderecoCliente'] ?>" name="endereco">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-2 col-form-label">Telefone</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="telefone" value="<?php echo $row['telefoneCliente'] ?>" required>
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

    <form action="inserirCliente.php" method="POST" class="form-group" enctype="multipart/form-data">

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
                        <h4 class="modal-title">Cadastrar Cliente</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Nome</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="nome" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">CPF/CNPJ: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="cpf" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="email" required>
                            </div>
                        </div>

                        <div class="form-group row" required>
                            <label for="inputEmail3" class="col-sm-6 col-form-label">Tipo de cliente</label>
                            <div class="col-sm-6">
                                <label class="radio-inline">
                                    <input type="radio" name="atacado" value="1" required><span class="label label-success">Atacado</span>
                                </label>

                                <br>
                                <label class="radio-inline">
                                    <input type="radio" name="atacado" value="0" required><span class="label label-danger">Varejo</span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Endereço</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="endereco">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Telefone</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="telefone" required>
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
    <a href="#cadastro" data-toggle="modal"><button type='button' class='btn btn-success'>Cadastrar cliente</button></a>

    <?php

    $result_log = "SELECT * from cliente";

    $Usuarios = mysqli_query($conn, $result_log);

    //Contar o total de logs
    $totalUsuarios = mysqli_num_rows($Usuarios);
    $limitador = 1;
    if ($totalUsuarios > $quantidade_pg && $totalUsuarios > 0) { ?>
        <nav class="text-center">
            <ul class="pagination">

                <li><a href="usuario.php?pagina=1"> Primeira página </a></li>


                <?php
                for ($i = $pagina - $limitador; $i <= $pagina - 1; $i++) {
                    if ($i >= 1) {
                ?>
                        <li><a href="usuario.php?pagina=<?php echo $i; ?>"> <?php echo $i; ?></a></li>


                <?php }
                }
                ?>
                <li class="active"> <span><?php echo $pagina; ?></span></li>

                <?php
                for ($i = $pagina + 1; $i <= $pagina + $limitador; $i++) {
                    if ($i <= $num_pagina) { ?>
                        <li><a href="usuario.php?pagina=<?php echo $i; ?>"> <?php echo $i; ?></a></li>

                <?php }
                }



                ?>
                <li><a href="usuario.php?pagina=<?php echo $num_pagina; ?>"> <span aria-hidden="true"> Ultima página </span></a></li>



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