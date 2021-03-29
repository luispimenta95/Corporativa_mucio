<?php
$conn = new MySQLi('localhost', 'u774307099_pimenta', 'Mp13151319', 'u774307099_legrano');
if ($conn->connect_error) {
   echo "Desconectado! Erro: " . $conn->connect_error;
}
