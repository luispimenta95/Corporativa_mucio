<?php
session_start();

$_SESSION['sucesso'] =   "<div class='alert alert-success'>Cadastro realizado com sucesso ! </div>";
$_SESSION['semRetorno'] =   
$_SESSION['loginIncorreto'] = 
$_SESSION['loginVazio'] =   "<div class='alert alert-danger'>Login ou senha não informados,por favor tente novamente ! </div>";
$_SESSION['alteracaoSucesso'] = "<div class='alert alert-success'>Registro atualizado com sucesso ! </div>";
$_SESSION['logout'] = "<div class='alert alert-success'>Logout realizado com sucesso ! </div>";


switch ($_SESSION['cod_retorno']) {
    case 1:
         "<div class='alert alert-success'>Cadastro realizado com sucesso ! </div>";
        break;
    case 2:
         "<div class='alert alert-warning'>Nenhum registro encontrado,por favor tente novamente ! </div>";
        break;
    case 3:
         "<div class='alert alert-danger'>Login ou senha inválidos,por favor tente novamente! </div>";
        break;
           case 4:
         "<div class='alert alert-danger'>Login ou senha não informados,por favor tente novamente! </div>";
        break;

   case 5:
         "<div class='alert alert-success'>Registro atualizado com sucesso ! </div>";
        break;
           case 6:
         "<div class='alert alert-success'>Logout realizado com sucesso ! </div>";
        break;

}
?>