<?php

// Incluindo o autoload do DOM PDF
require_once 'dompdf/autoload.inc.php';
include("../conecta.php");

mysqli_set_charset($conn, 'utf8');
$sql = $_POST['sql'];
$pg_atual = $_POST['pg_atual'];
$total_pg = $_POST['total_pg'];

$html = '<table';

$html = '<table class ="table"';
$html .= '<thead>';
$html .= '<tr>';
$html .= '<th>Código do produto</th>';
$html .= '<th>Nome do produto</th>';
$html .= '<th>Preço unitário</th>';
$html .= '<th>Estoque</th>';
$html .= '<th>Situação do produto</th>';



$html .= '</tr>';
$html .= '</thead>';
$html .= '<tbody>';


$result = $conn->query($sql);
$totalPedido = 0;
$numLinhas = 0;
$somaProduto = 0;


while ($row = $result->fetch_assoc()) {
    $numLinhas += 1;

    $html .= '<tr><td>' . $row['codigo'] . "</td>";

    $html .= '<td>' . $row['nomeProduto'] . "</td>";

    $html .= '<td>R$ ' . number_format($row["preco"], 2, ",", ".") . "</td>";
    $html .= '<td>' . $row['estoque'] . "</td>";
    if ($row["ativo"] == 1) {
        $html .= '<td> Disponível </td>';
    } else $html .= '<td> Indisponível </td>';
}

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
$dia = date('d_m_Y', time());

//Criando o código HTML que será transformado em pdf
$dompdf->loadHtml(


    '<h1 style="text-align: center;">  Relatório</h1>
    <h4 style="text-align: right;">Total de produtos listados : ' . $numLinhas . '  
    </h4>  
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
$dompdf->stream("relatorio_produtos_" . $dia . "", array(true));
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>