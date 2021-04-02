<?php

// Incluindo o autoload do DOM PDF
require_once 'dompdf/autoload.inc.php';
include("../conecta.php");

mysqli_set_charset($conn, 'utf8');
$sql = $_POST['sql'];


$html = '<table';

$html = '<table class ="table"';
$html .= '<thead>';
$html .= '<tr>';

$html .= '<th>Nome do produto</th>';
$html .= '<th>CPF/CNPJ</th>';
$html .= '<th>E-mail</th>';
$html .= '<th>Telefone</th>';
$html .= '<th>Endereço</th>';
$html .= '<th>Tipo do cliente</th>';

$html .= '<th>Situação do cliente</th>';
$html .= '<th>Cidade para entregas</th>';

$html .= '<th>Data de associação</th>';



$html .= '</tr>';
$html .= '</thead>';
$html .= '<tbody>';


$result = $conn->query($sql);
$totalPedido = 0;
$numLinhas = 0;
$somaProduto = 0;


while ($row = $result->fetch_assoc()) {
    $numLinhas += 1;

    $html .= '<tr><td>' . $row['nomeCliente'] . "</td>";
    $html .= '<td>' . $row['cpf_cnpj'] . "</td>";
    $html .= '<td>' . $row['emailCliente'] . "</td>";
    $html .= '<td>' . $row['telefoneCliente'] . "</td>";
    $html .= '<td>' . $row['enderecoCliente'] . "</td>";
    $html .= '<td>' . $row['nomeTipoCliente'] . "</td>";


    if ($row["ativo"] == 1) {
        $html .= '<td> Ativo </td>';
    } else $html .= '<td> Inativo </td>';
    $html .= '<td>' . $row['nomeCidade'] . "</td>";

    $html .= '<td>' . date('d/m/Y', strtotime($row["dataCadastro"])) . "</td>";
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
$dia = date('d_m_Y_H_i', time());

//Criando o código HTML que será transformado em pdf
$dompdf->loadHtml(


    '<h1 style="text-align: center;">  Relatório</h1>
    <h4 style="text-align: right;">Total de clientes listados : ' . $numLinhas . '  
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
$dompdf->stream("relatorio_clientes_" . $dia . "", array(true));
