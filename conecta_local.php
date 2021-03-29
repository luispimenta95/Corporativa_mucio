<?php
$conn = new MySQLi('localhost', 'root', '', 'legrano');
if ($conn->connect_error) {
   echo "Desconectado! Erro: " . $conn->connect_error;
}
