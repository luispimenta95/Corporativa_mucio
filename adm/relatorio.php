<?php
// Incluindo o autoload do DOM PDF
require_once 'dompdf/autoload.inc.php';
include("../conecta.php");

mysqli_set_charset($conn, 'utf8');
$sql = $_POST['sql'];
$html = '<table';

$html = '<table  border="1"';
$html .= '<thead>';
$html .= '<tr>';
$html .= '<th>Nome do produto</th>';



$html .= '</tr>';
$html .= '</thead>';
$html .= '<tbody>';


$result = $conn->query($sql);


while ($row = $result->fetch_assoc()) {

    $html .= '<tr><td>' . $row['nomeProduto'] . "</td>";
}



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
$dia = date('d_m_Y', time());

//Criando o código HTML que será transformado em pdf
$dompdf->loadHtml(


    '<h1 style="text-align: center;">  Relatório</h1>
    ' . $html . '

    <h4 style="text-align: right;">Relatório  gerado em : ' . $dataHora . '
 </h4>  </footer>'
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
