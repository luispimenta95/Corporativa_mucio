<?php
session_start();

use PHPMailer\PHPMailer\PHPMailer;

require '../vendor/autoload.php';
require_once '../adm/dompdf/autoload.inc.php';
include("../BD/.conecta.php");
include '../mensagemPadrao.php';


/*$sqlUpdate = "UPDATE pedido SET pedidoFinalizado = 1 WHERE codPedido = '$_SESSION[codPedido]'";

if ($conn->query($sqlUpdate) === TRUE) {
    $_SESSION['msg'] = $mensagens["finalizarPedido"];
    unset($_SESSION['codPedido']);

    header("Location:home.php");
} else {

    $_SESSION['msg'] = $mensagens["erroFinalizarPedido"];
    header("Location:home.php");
}
*/


mysqli_set_charset($conn, 'utf8');
$sqlPesquisa = "select idPedido, 
codPedido,
sum(quantidade) as quantidade, 
pe.preco precoPedido,
pe.pedidoFinalizado, 
nomeProduto, 
nomeCliente,
precoFrete 
from pedido pe, 
produto pr, 
cliente c 
where idProduto = produto and idCliente = cliente and codPedido = '$_SESSION[codPedido]' GROUP BY produto";
$html = '<table';
$html .= '<thead>';
$html .= '<tr>';
$html .= '<th>Nome do produto</th>';
$html .= '<th>Preço unitário</th>';
$html .= '<th>Quantidade</th>';
$html .= '<th>Valor total</th>';




$html .= '</tr>';
$html .= '</thead>';
$html .= '<tbody>';


$result = $conn->query($sqlPesquisa);
$totalPedido = 0;
$numLinhas = 0;
$somaProduto = 0;
$nomeCliente;
//teste

while ($row = $result->fetch_assoc()) {
    //$somaProduto = $row["precoPedido"] * $row["quantidade"];
    //$totalPedido += $somaProduto;
    $numLinhas += 1;
    $somaProduto = $row["precoPedido"] * $row["quantidade"];
    $totalPedido += $somaProduto;
    $nomeCliente = $row["nomeCliente"];
    $codPedido = $row["codPedido"];
    $frete = $row["precoFrete"];
    $html .= '<tr><td>' . $row['nomeProduto'] . "</td>";
    $html .= '<td>' . number_format($row["precoPedido"], 2, ",", ".") . "</td>";
    $html .= '<td>' . $row['quantidade'] . "</td>";
    $html .= '<td>' . number_format($somaProduto, 2, ",", ".") . "</td>";
}

$html .= '</tr>';
$html .= '<tr>';
$html .= '</tr>';
$html .= '</tbody>';
$html .= '</table';
//Criando a instancia do Dom PDF.
//Criando o namespace para evitar erros
use Dompdf\Dompdf;

// Instanciando a classe do Dom DPF
$dompdf = new Dompdf();
date_default_timezone_set('America/Sao_Paulo');
// CRIA UMA VARIAVEL E ARMAZENA A HORA ATUAL DO FUSO-HORÀRIO DEFINIDO (BRASÍLIA)
$dataHora = date('d/m/Y H:i', time());
$dia = date('d_m_Y_H_i', time());

//Criando o código HTML que será transformado em pdf
$dompdf->loadHtml(


    '<h3 style="text-align: center;">  Relatório para simples conferência de pedido </h3>
    <h4 style="text-align: right;">Cliente : ' . $nomeCliente . ' 

    <h4 style="text-align: right;">Total de produtos comprados : ' . $numLinhas . '  
    </h4>  
    
    ' . $html . '
    <h4 style="text-align: right;"> Preço do frete : R$'  .  number_format($frete, 2, ",", ".") . '<br>
    <h4 style="text-align: right;"> Custo dos produtos : R$'  .  number_format($totalPedido, 2, ",", ".") . '<br>
    <h4 style="text-align: right;"> Custo final do pedido : R$'  .  number_format(($totalPedido + $frete), 2, ",", ".") . '<br>
    <br>Relatório  gerado em : ' . $dataHora . '</h4>  </footer>'
);

//Define o tipo de papel de impressão (opcional)
//tamanho (A4, A3, A2, etc)
//oritenação do papel:'portrait' (em pé) ou 'landscape' (deitado)
$dompdf->setPaper('A4', 'portatil');

// Vai renderizar o HTML como PDF
$dompdf->render();

// Saída do pdf para a renderização do navegador.
//Coloca o nome que deseja que seja renderizado.
$filePDF = $dompdf->stream("relatorio_" . $dia . "", array(

    "Attachment" => false
));



$mail = new PHPMailer;
$mail->isSMTP();
$mail->SMTPDebug = false;
$mail->Host = 'smtp.hostinger.com';
$mail->Port = 587;
$mail->SMTPAuth = true;
$mail->Username = 'pedidosclientes@legrano.com.br';
$mail->Password = 'Organicos0607';
$mail->setFrom('pedidosclientes@legrano.com.br', 'Pedidos legrano');
$mail->addAddress('pedidosclientes@legrano.com.br', 'Pedidos legrano');
$mail->Subject = 'Novo pedido de ' . $nomeCliente;
$mail->Body = 'Em anexo o pedido ' . $codPedido . ' do cliente ' . $nomeCliente;
$mail->AddAttachment($filePDF);      // attachment

//$mail->addAttachment('test.txt');
if (!$mail->send()) {
    echo 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    echo 'The email message was sent.';
}
