<?php
$conn = new MySQLi('localhost', 'root', '', 'corporativa');
if($conn->connect_error){
   echo "Desconectado! Erro: " . $conn->connect_error;
}


?>
