<?php

session_start();
unset($_SESSION['nome']);

$_SESSION['msg'] = "<div class='alert alert-success'>Deslogado com sucesso!</div>";
header("Location: login.php");