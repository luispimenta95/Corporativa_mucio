<?php
// Incluindo o autoload do DOM PDF
require_once 'dompdf/autoload.inc.php';
include("../.conecta.php");

mysqli_set_charset($conn, 'utf8');
$sql = $_POST['sql'];
$html = '<table';

$html = '<table';
$html .= '<thead>';
$html .= '<tr>';
$html .= '<th>Código do pedido</th>';
$html .= '<th>Nome do produto</th>';
$html .= '<th>Preço unitário</th>';
$html .= '<th>Quantidade</th>';
$html .= '<th>Valor dos produtos</th>';
$html .= '<th>Valor dos frete</th>';
$html .= '<th>Valor do pedido</th>';
$html .= '<th>Comprador</th>';
$html .= '<th>Data do pedido</th>';



$html .= '</tr>';
$html .= '</thead>';
$html .= '<tbody>';


$result = $conn->query($sql);
$totalPedido = 0;
$numLinhas = 0;
$somaProduto = 0;


while ($row = $result->fetch_assoc()) {
    $somaProduto = $row["precoPedido"] * $row["quantidade"];
    $totalPedido += $somaProduto;
    $numLinhas += 1;


    $html .= '<tr><td>' . $row['codPedido'] . "</td>";
    $html .= '<td>' . $row['nomeProduto'] . "</td>";
    $html .= '<td>' . number_format($row["precoPedido"], 2, ",", ".") . "</td>";
    $html .= '<td>' . $row['quantidade'] . "</td>";
    $html .= '<td>' . number_format($somaProduto, 2, ",", ".") . "</td>";
    $frete = $row["precoFrete"];
    $html .= '<td>' . number_format($frete, 2, ",", ".") . "</td>";
    $html .= '<td>' . number_format(($somaProduto + $frete), 2, ",", ".") . "</td>";

    $html .= '<td>' . $row['nomeCliente'] . "</td>";
    $html .= '<td>' . date('d/m/Y', strtotime($row["dataPedido"])) . "</td>";
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


    '<h1 style="text-align: center;">  Relatório</h1>
    <h4 style="text-align: right;">Total de pedidos listados : ' . $numLinhas . '  
    </h4>  
    
    ' . $html . '

    <h4 style="text-align: right;"> Arrecadação total : R$'  .  number_format($totalPedido, 2, ",", ".") . '<br><br> 
    Relatório  gerado em : ' . $dataHora . '</h4>  </footer>'
);

//Define o tipo de papel de impressão (opcional)
//tamanho (A4, A3, A2, etc)
//oritenação do papel:'portrait' (em pé) ou 'landscape' (deitado)
$dompdf->setPaper('A4', 'portatil');

// Vai renderizar o HTML como PDF
$dompdf->render();

// Saída do pdf para a renderização do navegador.
//Coloca o nome que deseja que seja renderizado.
$dompdf->stream("relatorio_" . $dia . "", array(true));
