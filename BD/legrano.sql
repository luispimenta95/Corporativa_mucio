-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Mar-2021 às 22:42
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `legrano`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `idAdministrador` int(11) NOT NULL,
  `nomeAdministrador` varchar(255) DEFAULT NULL,
  `cpfAdministrador` varchar(11) DEFAULT NULL,
  `emailAdministrador` varchar(255) DEFAULT NULL,
  `senhaAdministrador` varchar(255) DEFAULT '12345',
  `ativo` tinyint(1) DEFAULT 1,
  `telefoneAdministrador` varchar(255) DEFAULT NULL,
  `dataCadastro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `administradorMaster` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`idAdministrador`, `nomeAdministrador`, `cpfAdministrador`, `emailAdministrador`, `senhaAdministrador`, `ativo`, `telefoneAdministrador`, `dataCadastro`, `administradorMaster`) VALUES
(1, 'Luis Felipe ', '02342288140', 'teste@administrador.com.br', '13151319', 1, '61998690313', '2021-03-27 17:43:48', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `idCidade` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `nomeCidade` varchar(50) DEFAULT NULL,
  `precoFrete` float DEFAULT NULL,
  `entrega` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`idCidade`, `estado`, `nomeCidade`, `precoFrete`, `entrega`) VALUES
(1, 7, 'Ceilândia', 5, 0),
(2, 7, 'Samambaia', 5, 0),
(3, 7, 'Taguatinga', 5, 0),
(4, 7, 'Plano Piloto', 5, 0),
(5, 7, 'Planaltina', 5, 0),
(6, 7, 'Águas Claras', 5, 0),
(7, 7, 'Recanto das Emas', 5, 0),
(8, 7, 'Gama', 5, 0),
(9, 7, 'Guará', 5, 0),
(10, 7, 'Santa Maria', 5, 0),
(11, 7, 'Sobradinho II', 5, 0),
(12, 7, ' São Sebastião', 5, 0),
(13, 7, 'Vicente Pires', 5, 0),
(14, 7, 'Itapoã', 5, 0),
(15, 7, 'Sobradinho', 5, 0),
(16, 7, 'Sudoeste/Octogonal', 5, 0),
(17, 7, 'Brazlândia', 8, 1),
(18, 7, 'Riacho Fundo II', 5, 0),
(19, 7, 'Paranoá', 5, 0),
(20, 7, 'Riacho Fundo', 5, 0),
(21, 7, 'SCIA', 5, 0),
(22, 7, 'Lago Norte', 5, 0),
(23, 7, 'Cruzeiro', 5, 0),
(24, 7, 'Lago Sul', 5, 0),
(25, 7, 'Jardim Botânico', 5, 0),
(26, 7, 'Núcleo Bandeirante', 5, 0),
(27, 7, 'Park Way', 5, 1),
(28, 7, 'Candangolândia', 5, 0),
(29, 7, 'Varjão', 5, 0),
(30, 7, 'Fercal', 5, 0),
(31, 7, 'SIA', 5, 0),
(32, 9, 'Formosa', 5, 0),
(33, 9, 'Planaltina-GO', 5, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nomeCliente` varchar(255) DEFAULT NULL,
  `cpf_cnpj` varchar(16) DEFAULT NULL,
  `emailCliente` varchar(255) DEFAULT NULL,
  `senhaCliente` varchar(255) DEFAULT '12345',
  `ativo` tinyint(1) DEFAULT 1,
  `telefoneCliente` varchar(255) DEFAULT NULL,
  `dataCadastro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `primeiroAcesso` tinyint(1) DEFAULT 1,
  `acessoLiberado` tinyint(1) DEFAULT 0,
  `tipoCliente` int(11) DEFAULT NULL,
  `enderecoCliente` varchar(200) DEFAULT NULL,
  `cidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nomeCliente`, `cpf_cnpj`, `emailCliente`, `senhaCliente`, `ativo`, `telefoneCliente`, `dataCadastro`, `primeiroAcesso`, `acessoLiberado`, `tipoCliente`, `enderecoCliente`, `cidade`) VALUES
(1, 'Cliente sócio', '09952848775', 'teste@socio.com.br', '12345', 1, '45484', '2021-03-27 17:19:30', 0, 1, 3, 'Endereço sócio', 27),
(2, 'Cliente atacado', '60280697104', 'teste@atacado.com.br', '12345', 1, '99669478', '2021-03-28 14:12:48', 0, 1, 3, 'Endereço atacado', 27),
(5, 'LUIS PIMENTA', '02342288104', 'felipearaujo95@hotmail.com', '881645', 1, '61998690313', '2021-03-28 13:37:21', 1, 0, 2, 'quadra 3  vila buritis ', 17),
(7, 'Teste adm', '40645647152', 'teste@adm.com.br', '13151319', 1, '61998690313', '2021-03-28 14:37:35', 0, 0, 2, 'teste', 17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL,
  `ufEstado` varchar(2) DEFAULT NULL,
  `nomeEstado` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`idEstado`, `ufEstado`, `nomeEstado`) VALUES
(1, 'AC', 'Acre'),
(2, 'AL', 'Alagoas'),
(3, 'AM', 'Amazonas'),
(4, 'AP', 'Amapá'),
(5, 'BA', 'Bahia'),
(6, 'CE', 'Ceará'),
(7, 'DF', 'Distrito Federal'),
(8, 'ES', 'Espírito Santo'),
(9, 'GO', 'Goiás'),
(10, 'MA', 'Maranhão'),
(11, 'MG', 'Minas Gerais'),
(12, 'MS', 'Mato Grosso do Sul'),
(13, 'MT', 'Mato Grosso'),
(14, 'PA', 'Pará'),
(15, 'PB', 'Paraíba'),
(16, 'PE', 'Pernambuco'),
(17, 'PI', 'Piauí'),
(18, 'PR', 'Paraná'),
(19, 'RJ', 'Rio de Janeiro'),
(20, 'RN', 'Rio Grande do Norte'),
(21, 'RO', 'Rondônia'),
(22, 'RR', 'Roraima'),
(23, 'RS', 'Rio Grande do Sul'),
(24, 'SC', 'Santa Catarina'),
(25, 'SE', 'Sergipe'),
(26, 'SP', 'São Paulo'),
(27, 'TO', 'Tocantins');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `dataPedido` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `quantidade` int(11) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `cliente` int(11) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `codPedido` varchar(10) DEFAULT NULL,
  `precoFrete` float NOT NULL,
  `pedidoFinalizado` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`idPedido`, `dataPedido`, `quantidade`, `preco`, `cliente`, `produto`, `codPedido`, `precoFrete`, `pedidoFinalizado`) VALUES
(4, '2021-03-14 16:16:00', 4, 9, 7, 1, 'bcfdeef', 5, 1),
(5, '2021-03-21 16:04:13', 8, 9, 7, 1, 'af145', 8, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `nomeProduto` varchar(255) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  `unidade` varchar(25) DEFAULT NULL,
  `precoAtacado` float DEFAULT NULL,
  `precoDelivery` float DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL,
  `dataCadastro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idProduto`, `nomeProduto`, `codigo`, `imagem`, `ativo`, `unidade`, `precoAtacado`, `precoDelivery`, `estoque`, `dataCadastro`) VALUES
(1, 'Abacate  	', 451, '6d32bc3fd63f75f2ae70f1213e238ae5.jpg', 1, 'kg', 9.8, 9, 14, '2021-03-28 17:51:23'),
(2, 'Abacaxi 	', 1865, 'semFoto.png', 1, 'un ', 11.2, 7.54, 14, '2021-03-27 18:19:13'),
(3, 'Abobora Barbara 	', 5450, 'semFoto.png', 1, 'kg', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(4, 'Abóbora Bola Amarela	', 5642, 'semFoto.png', 1, 'kg', 3.92, 7.54, 14, '2021-03-27 18:19:13'),
(5, 'Abóbora Bola verde	', 5642, 'semFoto.png', 1, 'kg', 3.92, 7.54, 14, '2021-03-27 18:19:13'),
(6, 'Abóbora Bola Verde Clara	', 5642, 'semFoto.png', 1, 'kg', 3.92, 7.54, 14, '2021-03-27 18:19:13'),
(7, 'Abobora Cabutia/Japonesa  	', 2448, 'semFoto.png', 1, 'Kg', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(8, 'Abobora Caipira 	', 5485, 'semFoto.png', 1, 'kg', 3.49, 7.54, 14, '2021-03-27 18:19:13'),
(9, 'Abobora Italia 	', 2446, 'semFoto.png', 1, '500g', 4, 7.54, 14, '2021-03-27 18:19:13'),
(10, 'Abóbora Italia granel	', 3072, 'semFoto.png', 1, 'Kg', 4.48, 7.54, 14, '2021-03-27 18:19:13'),
(11, 'Abobora Italia restaurante	', 3072, 'semFoto.png', 1, 'kg', 4.48, 7.54, 14, '2021-03-27 18:19:13'),
(12, 'Abóbora Japonesa Processada	', 5634, 'semFoto.png', 1, '500g', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(13, 'Abobora Madura	', 2449, 'semFoto.png', 1, 'kg', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(14, 'Abobora Madura restaurante	', 2449, 'semFoto.png', 1, 'kg', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(15, 'Abobora Menina 	', 2447, 'semFoto.png', 1, '500g', 4, 7.54, 14, '2021-03-27 18:19:13'),
(16, 'Abobora Menina (granel)	', 3073, 'semFoto.png', 1, 'kg', 14, 7.54, 14, '2021-03-27 18:19:13'),
(17, 'Abóbora mini moranga	', 4759, 'semFoto.png', 1, 'kg', 14, 7.54, 14, '2021-03-27 18:19:13'),
(18, 'Abobora Moranga	', 5486, 'semFoto.png', 1, 'Kg', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(19, 'Açafrao (granel) TF	', 1205, 'semFoto.png', 1, 'kg', 31.68, 7.54, 14, '2021-03-27 18:19:13'),
(20, 'Açafrao 100g	', 5223, 'semFoto.png', 1, '100g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(21, 'Açafrão em pó 	', 5646, 'semFoto.png', 1, '30g', 9.44, 7.54, 14, '2021-03-27 18:19:13'),
(22, 'Açafrão em pó ', 5647, 'b0591cce9ac43242d83ca2a4ff1017a0.jpg', 1, '50g', 15.2, 7.54, 14, '2021-03-28 17:58:47'),
(23, 'Acelga	', 2450, 'semFoto.png', 1, 'un', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(24, 'Acerola 500g	', 5433, 'semFoto.png', 1, '500g', 4.51, 7.54, 14, '2021-03-27 18:19:13'),
(25, 'Acerola congelada - P	', 3130, 'semFoto.png', 1, '500g', 0, 7.54, 14, '2021-03-27 18:19:13'),
(26, 'Agriao da água 300g	', 2451, 'semFoto.png', 1, '300g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(27, 'Agriao da terra 300g	', 2452, 'semFoto.png', 1, '300g', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(28, 'Alecrim 70g	', 5423, 'semFoto.png', 1, '70g', 2.1, 7.54, 14, '2021-03-27 18:19:13'),
(29, 'Alecrim desidratada 	', 5679, 'semFoto.png', 1, '20g', 4, 7.54, 14, '2021-03-27 18:19:13'),
(30, 'Alface Americana	', 2453, 'semFoto.png', 1, 'un', 2.9, 7.54, 14, '2021-03-27 18:19:13'),
(31, 'Alface baby Americana / Frizee Roxa	', 5487, 'semFoto.png', 1, 'bj', 3.36, 7.54, 14, '2021-03-27 18:19:13'),
(32, 'Alface baby Americana / Frizee Verde	', 5488, 'semFoto.png', 1, 'bj', 3.36, 7.54, 14, '2021-03-27 18:19:13'),
(33, 'Alface baby Frizee Roxa e Verde	', 5489, 'semFoto.png', 1, 'bj', 3.36, 7.54, 14, '2021-03-27 18:19:13'),
(34, 'Alface Baby Mix	', 5490, 'semFoto.png', 1, 'bdj', 3.36, 7.54, 14, '2021-03-27 18:19:13'),
(35, 'Alface Baby Mix americana e roxa	', 5601, 'semFoto.png', 1, 'bdj', 3.36, 7.54, 14, '2021-03-27 18:19:13'),
(36, 'Alface Crespa	', 2454, 'semFoto.png', 1, 'un', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(37, 'Alface Crespa Crocantela	', 5491, 'semFoto.png', 1, 'un ', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(38, 'Alface Frisee	', 2455, 'semFoto.png', 1, 'un ', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(39, 'Alface Lisa	', 2456, 'semFoto.png', 1, 'un ', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(40, 'Alface Mimosa	', 2457, 'semFoto.png', 1, 'un ', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(41, 'Alface Mimosa Roxa	', 5451, 'semFoto.png', 1, 'un ', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(42, 'Alface Romana	', 2458, 'semFoto.png', 1, 'un ', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(43, 'Alface Romana Crocante	', 5452, 'semFoto.png', 1, 'un ', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(44, 'Alface Romanela	', 5492, 'semFoto.png', 1, 'un ', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(45, 'Alface Roxa	', 2459, 'semFoto.png', 1, 'un ', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(46, 'Alface rubinela roxa	', 5581, 'semFoto.png', 1, 'un ', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(47, 'Alfavaca 70g	', 5453, 'semFoto.png', 1, '70g', 3.36, 7.54, 14, '2021-03-27 18:19:13'),
(48, 'Alho Cabeça Graudo	', 5649, 'semFoto.png', 1, '200g', 15.3, 7.54, 14, '2021-03-27 18:19:13'),
(49, 'Alho Cabeça Medio 	', 5651, 'semFoto.png', 1, '200g', 15.04, 7.54, 14, '2021-03-27 18:19:13'),
(50, 'Alho Cabeça Miudo	', 5653, 'semFoto.png', 1, '200g', 12, 7.54, 14, '2021-03-27 18:19:13'),
(51, 'Alho Debulhado Graudo 	', 5650, 'semFoto.png', 1, '200g', 15.3, 7.54, 14, '2021-03-27 18:19:13'),
(52, 'Alho Debulhado Médio 	', 5652, 'semFoto.png', 1, '200g', 15.3, 7.54, 14, '2021-03-27 18:19:13'),
(53, 'Alho Debulhado Miúdo 	', 5654, 'semFoto.png', 1, '200g', 12, 7.54, 14, '2021-03-27 18:19:13'),
(54, 'Alho descascado 150g	', 5327, 'semFoto.png', 1, '150g', 13.04, 7.54, 14, '2021-03-27 18:19:13'),
(55, 'Alho descascado 300g	', 5315, 'semFoto.png', 1, '300g', 24.15, 7.54, 14, '2021-03-27 18:19:13'),
(56, 'Alho Desidratado 20g	', 1625, 'semFoto.png', 1, '20g', 7.35, 7.54, 14, '2021-03-27 18:19:13'),
(57, 'Alho gourmet 150g	', 5595, 'semFoto.png', 1, '150g', 12.46, 7.54, 14, '2021-03-27 18:19:13'),
(58, 'Alho Porro 350g	', 2460, 'semFoto.png', 1, '350g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(59, 'Alho-porro bulbo 250g	', 5427, 'semFoto.png', 1, '250g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(60, 'Almeirao 300g	', 2461, 'semFoto.png', 1, '300g', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(61, 'Ameixa BDJ	', 4556, 'semFoto.png', 1, '500g', 7, 7.54, 14, '2021-03-27 18:19:13'),
(62, 'Ameixa granel	', 4561, 'semFoto.png', 1, 'kg', 0, 7.54, 14, '2021-03-27 18:19:13'),
(63, 'Amora 75g	', 5493, 'semFoto.png', 1, '75g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(64, 'Amora congelada 	', 4340, 'semFoto.png', 1, '160g', 8.7, 7.54, 14, '2021-03-27 18:19:13'),
(65, 'Arnica	', 5674, 'semFoto.png', 1, '70g', 3.08, 7.54, 14, '2021-03-27 18:19:13'),
(66, 'Atemoia 	', 5494, 'semFoto.png', 1, 'kg', 10.78, 7.54, 14, '2021-03-27 18:19:13'),
(67, 'Avocado 500g	', 5495, 'semFoto.png', 1, '500g', 5.95, 7.54, 14, '2021-03-27 18:19:13'),
(68, 'Avocado kg	', 5496, 'semFoto.png', 1, 'kg', 11.2, 7.54, 14, '2021-03-27 18:19:13'),
(69, 'Azedinha/vinagreira 100g	', 5449, 'semFoto.png', 1, '100g', 2.1, 7.54, 14, '2021-03-27 18:19:13'),
(70, 'Banana da Terra kg	', 5616, 'semFoto.png', 1, 'kg', 4.76, 7.54, 14, '2021-03-27 18:19:13'),
(71, 'Banana Maça (granel)	', 5429, 'semFoto.png', 1, 'kg', 6.16, 7.54, 14, '2021-03-27 18:19:13'),
(72, 'Banana Marmelo (granel)	', 5430, 'semFoto.png', 1, 'kg', 4.76, 7.54, 14, '2021-03-27 18:19:13'),
(73, 'Banana Nanica (granel)	', 5428, 'semFoto.png', 1, 'kg', 4.05, 7.54, 14, '2021-03-27 18:19:13'),
(74, 'Banana Ouro kg	', 5434, 'semFoto.png', 1, 'kg', 4.69, 7.54, 14, '2021-03-27 18:19:13'),
(75, 'Banana praçã	', 5578, 'semFoto.png', 1, 'kg', 4.76, 7.54, 14, '2021-03-27 18:19:13'),
(76, 'Banana Prata KG	', 4526, 'semFoto.png', 1, 'kg', 5.32, 7.54, 14, '2021-03-27 18:19:13'),
(77, 'Batata Asterix 1 kg	', 5225, 'semFoto.png', 1, 'kg', 9.1, 7.54, 14, '2021-03-27 18:19:13'),
(78, 'Batata Asterix 500g	', 5738, 'semFoto.png', 1, '500G', 5.53, 7.54, 14, '2021-03-27 18:19:13'),
(79, 'Batata Asterix Bolinha 1Kg	', 5497, 'semFoto.png', 1, '1kg', 8.25, 7.54, 14, '2021-03-27 18:19:13'),
(80, 'Batata Baroa 500g	', 2462, 'semFoto.png', 1, '500g', 10.5, 7.54, 14, '2021-03-27 18:19:13'),
(81, 'Batata Doce 500g	', 2463, 'semFoto.png', 1, '500g', 4, 7.54, 14, '2021-03-27 18:19:13'),
(82, 'Batata Doce Amarela 500G	', 5411, 'semFoto.png', 1, '500g', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(83, 'Batata Doce Branca 500g	', 5389, 'semFoto.png', 1, '500g', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(84, 'Batata Doce Granel	', 5360, 'semFoto.png', 1, 'kg', 7, 7.54, 14, '2021-03-27 18:19:13'),
(85, 'Batata Doce Laranja 500g	', 5374, 'semFoto.png', 1, '500g', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(86, 'Batata Doce Roxa 500g	', 5592, 'semFoto.png', 1, '500g', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(87, 'Batata Inglesa (granel)	', 5498, 'semFoto.png', 1, 'kg ', 7, 7.54, 14, '2021-03-27 18:19:13'),
(88, 'Batata Inglesa 1kg	', 3065, 'semFoto.png', 1, 'kg', 7.7, 7.54, 14, '2021-03-27 18:19:13'),
(89, 'Batata Inglesa 500g	', 4534, 'semFoto.png', 1, '500g', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(90, 'Batata Inglesa Bolinha 1kg	', 5262, 'semFoto.png', 1, 'kg', 6, 7.54, 14, '2021-03-27 18:19:13'),
(91, 'Batata Inglesa Bolinha 500g	', 5264, 'semFoto.png', 1, '500G', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(92, 'Batata Yakon 500g	', 2464, 'semFoto.png', 1, '500g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(93, 'Batata Yakon Restaurante*	', NULL, 'semFoto.png', 1, 'kg', 0, 7.54, 14, '2021-03-27 18:19:13'),
(94, 'Beldroega	', 5436, 'semFoto.png', 1, '300g', 2.1, 7.54, 14, '2021-03-27 18:19:13'),
(95, 'Berinjela (granel)	', 3066, 'semFoto.png', 1, 'kg', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(96, 'Berinjela 500g	', 2465, 'semFoto.png', 1, '500g', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(97, 'Berinjela Japonesa 500g	', 5500, 'semFoto.png', 1, '500g', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(98, 'Bertalha	', 5424, 'semFoto.png', 1, 'Und', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(99, 'Beterraba c/ Folha kg	', 1653, 'semFoto.png', 1, 'kg', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(100, 'Beterraba granel	', 3070, 'semFoto.png', 1, 'kg', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(101, 'Beterraba s/ Folha 500g	', 4742, 'semFoto.png', 1, '500g', 3.15, 7.54, 14, '2021-03-27 18:19:13'),
(102, 'Beterraba s/ Folha Kg	', 1653, 'semFoto.png', 1, 'kg', 6.3, 7.54, 14, '2021-03-27 18:19:13'),
(103, 'Biriba 1kg	', 5475, 'semFoto.png', 1, '1kg', 5.74, 7.54, 14, '2021-03-27 18:19:13'),
(104, 'Boldo 70g	', 5412, 'semFoto.png', 1, '70g', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(105, 'Brocolis Japones 400g (und)	', 5576, 'semFoto.png', 1, '400g', 6.3, 7.54, 14, '2021-03-27 18:19:13'),
(106, 'Brocolis Japones kg	', 2468, 'semFoto.png', 1, 'kg', 9.8, 7.54, 14, '2021-03-27 18:19:13'),
(107, 'Brocolis Ramoso / Comum	', 2467, 'semFoto.png', 1, '400g', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(108, 'Cafe moido 250g	', 3981, 'semFoto.png', 1, '250g', 15.2, 7.54, 14, '2021-03-27 18:19:13'),
(109, 'Cafe moido 500g	', 3982, 'semFoto.png', 1, '500g', 28.8, 7.54, 14, '2021-03-27 18:19:13'),
(110, 'Cafe Torrado Grao 250g	', 3983, 'semFoto.png', 1, '250g', 16.75, 7.54, 14, '2021-03-27 18:19:13'),
(111, 'Cafe Torrado Grao 500g	', 3984, 'semFoto.png', 1, '500g', 31.84, 7.54, 14, '2021-03-27 18:19:13'),
(112, 'Cagaita	', 5502, 'semFoto.png', 1, 'bdj', 3.78, 7.54, 14, '2021-03-27 18:19:13'),
(113, 'Cajamanga 500G	', 5437, 'semFoto.png', 1, '500g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(114, 'Caju	', 671, 'semFoto.png', 1, '500g', 8.4, 7.54, 14, '2021-03-27 18:19:13'),
(115, 'Cana Caiana sem Casca	', 5672, 'semFoto.png', 1, '400g', 3.7, 7.54, 14, '2021-03-27 18:19:13'),
(116, 'Capim cidreira	', NULL, 'semFoto.png', 1, '70g', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(117, 'Capim santo	', 5457, 'semFoto.png', 1, '70g', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(118, 'Capuchinha	', 5458, 'semFoto.png', 1, '50g', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(119, 'Caqui 	', 5483, 'semFoto.png', 1, 'Bdj', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(120, 'Caqui RAMA FORTE	', 5602, 'semFoto.png', 1, 'Bdj', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(121, 'Cara moela	', 5625, 'semFoto.png', 1, '500g', 7, 7.54, 14, '2021-03-27 18:19:13'),
(122, 'Carambola	', 5503, 'semFoto.png', 1, '500g', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(123, 'Carambola KG	', NULL, 'semFoto.png', 1, 'KG', 7, 7.54, 14, '2021-03-27 18:19:13'),
(124, 'Carqueja 100g	', 5626, 'semFoto.png', 1, '100g', 3.92, 7.54, 14, '2021-03-27 18:19:13'),
(125, 'Cebola Comum Embalada 1kg	', 3813, 'semFoto.png', 1, 'kg', 7.7, 7.54, 14, '2021-03-27 18:19:13'),
(126, 'Cebola Comum Embalada 500g	', 4750, 'semFoto.png', 1, '500g', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(127, 'Cebola Comum granel	', 1997, 'semFoto.png', 1, 'kg', 7, 7.54, 14, '2021-03-27 18:19:13'),
(128, 'Cebola MÇ	', 5460, 'semFoto.png', 1, 'mç', 7, 7.54, 14, '2021-03-27 18:19:13'),
(129, 'Cebola Roxa (granel)	', 5275, 'semFoto.png', 1, 'kg', 8, 7.54, 14, '2021-03-27 18:19:13'),
(130, 'Cebola Roxa 1kg	', 5274, 'semFoto.png', 1, 'kg', 8.4, 7.54, 14, '2021-03-27 18:19:13'),
(131, 'Cebola Roxa 500g	', 4846, 'semFoto.png', 1, '500g', 5, 7.54, 14, '2021-03-27 18:19:13'),
(132, 'Cebolete	', 5461, 'semFoto.png', 1, '100g', 2.1, 7.54, 14, '2021-03-27 18:19:13'),
(133, 'Cebolinha 100g	', 2469, 'semFoto.png', 1, '100g', 2.1, 7.54, 14, '2021-03-27 18:19:13'),
(134, 'Cebolinha Desidratada 	', 2445, 'semFoto.png', 1, '10g', 7, 7.54, 14, '2021-03-27 18:19:13'),
(135, 'Cebolinha/Alho desidratados	', 3040, 'semFoto.png', 1, '20g', 7, 7.54, 14, '2021-03-27 18:19:13'),
(136, 'Cenoura (granel)	', 3071, 'semFoto.png', 1, 'kg', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(137, 'Cenoura c/folha	', 2470, 'semFoto.png', 1, '1,200g', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(138, 'Cenoura s/ Folha 1Kg	', 2470, 'semFoto.png', 1, 'kg', 6.3, 7.54, 14, '2021-03-27 18:19:13'),
(139, 'Cenoura s/ Folha 500g	', 4477, 'semFoto.png', 1, '500g', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(140, 'Chalota 150g - seu menino	', 5076, 'semFoto.png', 1, '150g', 12.5, 7.54, 14, '2021-03-27 18:19:13'),
(141, 'Chalota Desidratada 20g - seu menino	', 1628, 'semFoto.png', 1, '20g', 7, 7.54, 14, '2021-03-27 18:19:13'),
(142, 'Chalota roseé round in natura 150g	', 5391, 'semFoto.png', 1, '150g', 12.46, 7.54, 14, '2021-03-27 18:19:13'),
(143, 'Chalota tailandesa 300g	', 5393, 'semFoto.png', 1, '300g', 23.4, 7.54, 14, '2021-03-27 18:19:13'),
(144, 'Cheiro Verde (coentro) 100g	', 2471, 'semFoto.png', 1, '100g', 2.1, 7.54, 14, '2021-03-27 18:19:13'),
(145, 'Cheiro Verde (salsa) 100g	', 5446, 'semFoto.png', 1, '100g', 2.1, 7.54, 14, '2021-03-27 18:19:13'),
(146, 'Chia 250g	', 5413, 'semFoto.png', 1, '250g', 6.72, 7.54, 14, '2021-03-27 18:19:13'),
(147, 'Chia kg	', 5504, 'semFoto.png', 1, 'Kg', 15.4, 7.54, 14, '2021-03-27 18:19:13'),
(148, 'Chicoria	', 2473, 'semFoto.png', 1, 'un', 2.1, 7.54, 14, '2021-03-27 18:19:13'),
(149, 'Chuchu (granel)	', 4915, 'semFoto.png', 1, 'kg', 9.1, 7.54, 14, '2021-03-27 18:19:13'),
(150, 'Chuchu 500g	', 2474, 'semFoto.png', 1, '500g', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(151, 'Chuchu mini	', 4755, 'semFoto.png', 1, '500g', 5.2, 7.54, 14, '2021-03-27 18:19:13'),
(152, 'Coco Verde	', 5438, 'semFoto.png', 1, 'und', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(153, 'Coentro 100g	', 2040, 'semFoto.png', 1, '100g', 2.1, 7.54, 14, '2021-03-27 18:19:13'),
(154, 'Cogumelo  funghi desidratado 100g	', 5226, 'semFoto.png', 1, '100g', 35, 7.54, 14, '2021-03-27 18:19:13'),
(155, 'Cogumelo Champignon em conserva 	', NULL, 'semFoto.png', 1, '100g', 0, 7.54, 14, '2021-03-27 18:19:13'),
(156, 'Cogumelo Champignon in natura 200G	', 547, 'semFoto.png', 1, '200g', 11.2, 7.54, 14, '2021-03-27 18:19:13'),
(157, 'Cogumelo shimeji Branco 200g	', 5464, 'semFoto.png', 1, '200g', 11.2, 7.54, 14, '2021-03-27 18:19:13'),
(158, 'Cogumelo Shimeji Branco Desidratado	', 535, 'semFoto.png', 1, '200g', 15, 7.54, 14, '2021-03-27 18:19:13'),
(159, 'Cogumelo Shimeji Branco Desidratado	', NULL, 'semFoto.png', 1, 'kg', 0, 7.54, 14, '2021-03-27 18:19:13'),
(160, 'Cogumelo Shimeji desidratado 30g	', 4927, 'semFoto.png', 1, '30g', 11.2, 7.54, 14, '2021-03-27 18:19:13'),
(161, 'Cogumelo shimeji Desidratado 500g	', NULL, 'semFoto.png', 1, '500g', 0, 7.54, 14, '2021-03-27 18:19:13'),
(162, 'Cogumelo shimeji italia 200g	', NULL, 'semFoto.png', 1, 'Bdj', 11.2, 7.54, 14, '2021-03-27 18:19:13'),
(163, 'Cogumelo shimeji Preto 200g	', NULL, 'semFoto.png', 1, '200g', 11.2, 7.54, 14, '2021-03-27 18:19:13'),
(164, 'Cogumelo shimeji Rosa 150g	', NULL, 'semFoto.png', 1, '150g', 11.2, 7.54, 14, '2021-03-27 18:19:13'),
(165, 'Cogumelo shimeji Salmao 200g	', 5462, 'semFoto.png', 1, '200g', 7.7, 7.54, 14, '2021-03-27 18:19:13'),
(166, 'Cogumelo Shimofuri 200g	', NULL, 'semFoto.png', 1, 'Bdj', 11.2, 7.54, 14, '2021-03-27 18:19:13'),
(167, 'Cogumelo Shitake 200G	', 5463, 'semFoto.png', 1, 'Bdj', 11.2, 7.54, 14, '2021-03-27 18:19:13'),
(168, 'Couve 350g	', 2475, 'semFoto.png', 1, '350g', 2.52, 7.54, 14, '2021-03-27 18:19:13'),
(169, 'Couve Mizuma 	', 5582, 'semFoto.png', 1, '350g', 3.53, 7.54, 14, '2021-03-27 18:19:13'),
(170, 'Couve-flor  400g	', 5577, 'semFoto.png', 1, 'um', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(171, 'Couve-flor KG	', 2476, 'semFoto.png', 1, 'kg', 7.42, 7.54, 14, '2021-03-27 18:19:13'),
(172, 'Erva cidreira	', 5465, 'semFoto.png', 1, '70g', 2.1, 7.54, 14, '2021-03-27 18:19:13'),
(173, 'Ervilha Torta 250g	', 2477, 'semFoto.png', 1, '250g', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(174, 'Espinafre 300g	', 2478, 'semFoto.png', 1, '300g', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(175, 'Feijao Azuki 1kg	', 5505, 'semFoto.png', 1, 'kg', 28.42, 7.54, 14, '2021-03-27 18:19:13'),
(176, 'Feijao Azuki 500g	', 5506, 'semFoto.png', 1, '500g', 14.7, 7.54, 14, '2021-03-27 18:19:13'),
(177, 'Feijao carioquinha 1kg	', 4542, 'semFoto.png', 1, 'kg', 18, 7.54, 14, '2021-03-27 18:19:13'),
(178, 'Feijao de corda 500g	', 5508, 'semFoto.png', 1, '500g', 12.6, 7.54, 14, '2021-03-27 18:19:13'),
(179, 'Feijao de corda debulhado 500g	', 5509, 'semFoto.png', 1, '500g', 12.6, 7.54, 14, '2021-03-27 18:19:13'),
(180, 'Feijao preto 1kg	', 5510, 'semFoto.png', 1, 'kg', 11.9, 7.54, 14, '2021-03-27 18:19:13'),
(181, 'Feijao rajadinho 1 kg	', 5584, 'semFoto.png', 1, '1 kg', 13.4, 7.54, 14, '2021-03-27 18:19:13'),
(182, 'Feijao verde debulhado 500g	', 5603, 'semFoto.png', 1, '500g', 6.3, 7.54, 14, '2021-03-27 18:19:13'),
(183, 'Feijao Verde feixe 500G	', 5511, 'semFoto.png', 1, '500g', 5.36, 7.54, 14, '2021-03-27 18:19:13'),
(184, 'Feijao vermelho 	', 4418, 'semFoto.png', 1, 'kg', 16, 7.54, 14, '2021-03-27 18:19:13'),
(185, 'Figo 	', 5590, 'semFoto.png', 1, '200g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(186, 'Folha de amora 70g	', 5585, 'semFoto.png', 1, '70g', 3.92, 7.54, 14, '2021-03-27 18:19:13'),
(187, 'Folha de Crajiru	', 5673, 'semFoto.png', 1, '70g', 3.92, 7.54, 14, '2021-03-27 18:19:13'),
(188, 'Folha de graviola 70g	', 5586, 'semFoto.png', 1, '70g', 3.92, 7.54, 14, '2021-03-27 18:19:13'),
(189, 'Folha de Louro Desidratada	', 5680, 'semFoto.png', 1, '5g', 3.88, 7.54, 14, '2021-03-27 18:19:13'),
(190, 'Folha de Vinagreira 100g	', 5512, 'semFoto.png', 1, '100g', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(191, 'Framboesa	', 5513, 'semFoto.png', 1, '150g', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(192, 'Framboesa congelada	', 5514, 'semFoto.png', 1, 'kg', 23.8, 7.54, 14, '2021-03-27 18:19:13'),
(193, 'Funcho	', 5415, 'semFoto.png', 1, '250g', 3.36, 7.54, 14, '2021-03-27 18:19:13'),
(194, 'Gengibre 200g	', 5515, 'semFoto.png', 1, '200g', 5.04, 7.54, 14, '2021-03-27 18:19:13'),
(195, 'Gengibre 500g	', 5516, 'semFoto.png', 1, '500g', 7, 7.54, 14, '2021-03-27 18:19:13'),
(196, 'Gengibre KG	', 4752, 'semFoto.png', 1, 'kg', 14, 7.54, 14, '2021-03-27 18:19:13'),
(197, 'Goiaba 500g 	', 5439, 'semFoto.png', 1, 'Bdj', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(198, 'Goiaba kg	', 5440, 'semFoto.png', 1, 'kg', 0, 7.54, 14, '2021-03-27 18:19:13'),
(199, 'Graviola	', 5517, 'semFoto.png', 1, 'kg', 6.37, 7.54, 14, '2021-03-27 18:19:13'),
(200, 'Hibisco	', 5466, 'semFoto.png', 1, 'Und', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(201, 'Hibisco caixa 	', NULL, 'semFoto.png', 1, '10 kg', 0, 7.54, 14, '2021-03-27 18:19:13'),
(202, 'Hortela 70g	', 2479, 'semFoto.png', 1, '70g', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(203, 'Inga de metro	', 5481, 'semFoto.png', 1, 'um', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(204, 'Inhame 1kg	', 2480, 'semFoto.png', 1, 'kg', 8.4, 7.54, 14, '2021-03-27 18:19:13'),
(205, 'Inhame 500g	', 5263, 'semFoto.png', 1, '500g', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(206, 'Inhame granel kg	', 4841, 'semFoto.png', 1, 'kg', 8.4, 7.54, 14, '2021-03-27 18:19:13'),
(207, 'Jabuticaba 300g	', 5518, 'semFoto.png', 1, 'und', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(208, 'Jaca Desidratada	', 3041, 'semFoto.png', 1, 'un', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(209, 'Jaca DURA	', 5519, 'semFoto.png', 1, 'kg', 1.61, 7.54, 14, '2021-03-27 18:19:13'),
(210, 'Jambo Amarelo	', 5521, 'semFoto.png', 1, '500g', 4.48, 7.54, 14, '2021-03-27 18:19:13'),
(211, 'Jamelao 200g	', NULL, 'semFoto.png', 1, '200g', 0, 7.54, 14, '2021-03-27 18:19:13'),
(212, 'Jilo 500g	', 2481, 'semFoto.png', 1, '500g', 3.15, 7.54, 14, '2021-03-27 18:19:13'),
(213, 'Jurubeba 100g	', 5522, 'semFoto.png', 1, '100g', 1.26, 7.54, 14, '2021-03-27 18:19:13'),
(214, 'Kiwi 	', 5523, 'semFoto.png', 1, 'Bdj', 7.28, 7.54, 14, '2021-03-27 18:19:13'),
(215, 'Laranja bahia	', 5524, 'semFoto.png', 1, 'kg', 4.16, 7.54, 14, '2021-03-27 18:19:13'),
(216, 'Laranja cristal 1kg	', 5583, 'semFoto.png', 1, 'kg', 5.82, 7.54, 14, '2021-03-27 18:19:13'),
(217, 'Laranja Kinkan 200g	', 5476, 'semFoto.png', 1, '200g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(218, 'Laranja lima embalada	', 5526, 'semFoto.png', 1, 'kg', 5.35, 7.54, 14, '2021-03-27 18:19:13'),
(219, 'Laranja pera	', 5528, 'semFoto.png', 1, 'kg', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(220, 'Legumes Processados	', 5631, 'semFoto.png', 1, '500g', 6.65, 7.54, 14, '2021-03-27 18:19:13'),
(221, 'Lichia 300g	', 5529, 'semFoto.png', 1, '300g', 8.4, 7.54, 14, '2021-03-27 18:19:13'),
(222, 'Lima da Persia kg	', 5530, 'semFoto.png', 1, 'Kg', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(223, 'Lima de bico kg	', 5604, 'semFoto.png', 1, 'Kg', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(224, 'Limao China (cravo) 1kg	', 5531, 'semFoto.png', 1, 'kg', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(225, 'Limao China (cravo) 500g	', 4753, 'semFoto.png', 1, '500g', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(226, 'Limão China (cravo) granel	', 5532, 'semFoto.png', 1, 'kg', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(227, 'Limao Doce 	', 5615, 'semFoto.png', 1, '500g', 3.57, 7.54, 14, '2021-03-27 18:19:13'),
(228, 'Limao Galego 500g	', 5533, 'semFoto.png', 1, '500g', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(229, 'Limao Siciliano granel	', 4945, 'semFoto.png', 1, 'kg', 6.3, 7.54, 14, '2021-03-27 18:19:13'),
(230, 'Limao Tahiti 1kg	', 1927, 'semFoto.png', 1, 'kg', 6.9, 7.54, 14, '2021-03-27 18:19:13'),
(231, 'Limao Tahiti 500g	', 2560, 'semFoto.png', 1, '500g', 3.8, 7.54, 14, '2021-03-27 18:19:13'),
(232, 'Maça importada 500g 	', 5535, 'semFoto.png', 1, '500g', 11.2, 7.54, 14, '2021-03-27 18:19:13'),
(233, 'Maça importada KG	', 5534, 'semFoto.png', 1, 'kg', 25.2, 7.54, 14, '2021-03-27 18:19:13'),
(234, 'Maça Nacional 500g 	', 5536, 'semFoto.png', 1, '500g', 11.2, 7.54, 14, '2021-03-27 18:19:13'),
(235, 'Maça Nacional KG	', 5537, 'semFoto.png', 1, 'kg', 12.6, 7.54, 14, '2021-03-27 18:19:13'),
(236, 'Mamao comum kg	', 5538, 'semFoto.png', 1, 'kg', 3.85, 7.54, 14, '2021-03-27 18:19:13'),
(237, 'Mamao Formosa	', NULL, 'semFoto.png', 1, 'kg', 5.39, 7.54, 14, '2021-03-27 18:19:13'),
(238, 'Mamao papaya kg	', 5539, 'semFoto.png', 1, 'KG', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(239, 'Mandioca c/ Casca kg	', 2482, 'semFoto.png', 1, 'kg', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(240, 'Mandioca descascada 500G	', 5407, 'semFoto.png', 1, '500G', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(241, 'Mandioca descascada 750G	', 5408, 'semFoto.png', 1, '750g', 7, 7.54, 14, '2021-03-27 18:19:13'),
(242, 'Mandioca descascada kg	', 5406, 'semFoto.png', 1, 'kg', 8, 7.54, 14, '2021-03-27 18:19:13'),
(243, 'Manga a granel kg	', 5542, 'semFoto.png', 1, 'kg', 9.1, 7.54, 14, '2021-03-27 18:19:13'),
(244, 'Manga comum 1 kg	', 5447, 'semFoto.png', 1, 'pct', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(245, 'Manga Espada	', 5541, 'semFoto.png', 1, 'kg', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(246, 'Manga Palmer	', 5448, 'semFoto.png', 1, 'kg', 3.5, 7.54, 14, '2021-03-27 18:19:13'),
(247, 'Manga Rosa 	', 5543, 'semFoto.png', 1, 'kg', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(248, 'Manga tommy 	', 5544, 'semFoto.png', 1, 'kg', 9.1, 7.54, 14, '2021-03-27 18:19:13'),
(249, 'Manjericao 70g	', 2483, 'semFoto.png', 1, '70g', 2.38, 7.54, 14, '2021-03-27 18:19:13'),
(250, 'Maracujá azedo	', 5645, 'semFoto.png', 1, '500g', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(251, 'Maracuja doce	', 5546, 'semFoto.png', 1, 'kg', 9.52, 7.54, 14, '2021-03-27 18:19:13'),
(252, 'Maracuja Melao	', 5422, 'semFoto.png', 1, 'kg', 7, 7.54, 14, '2021-03-27 18:19:13'),
(253, 'Maracuja Perola	', 5545, 'semFoto.png', 1, 'kg', 5.32, 7.54, 14, '2021-03-27 18:19:13'),
(254, 'Mastruz	', 5467, 'semFoto.png', 1, 'mç', 2.1, 7.54, 14, '2021-03-27 18:19:13'),
(255, 'Maxixe 500g	', 2484, 'semFoto.png', 1, '500g', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(256, 'Melancia	', 5548, 'semFoto.png', 1, 'kg', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(257, 'Melancia MINI KG	', 5558, 'semFoto.png', 1, 'kg', 5.32, 7.54, 14, '2021-03-27 18:19:13'),
(258, 'Melao Amarelo 	', 5549, 'semFoto.png', 1, 'kg', 7, 7.54, 14, '2021-03-27 18:19:13'),
(259, 'Melão Croa	', 1817, 'semFoto.png', 1, 'kg', 6.36, 7.54, 14, '2021-03-27 18:19:13'),
(260, 'Menta 70g 	', 5416, 'semFoto.png', 1, '70g', 2.41, 7.54, 14, '2021-03-27 18:19:13'),
(261, 'Menta kg 	', NULL, 'semFoto.png', 1, 'kg', 0, 7.54, 14, '2021-03-27 18:19:13'),
(262, 'Mexerica   1kg	', 5442, 'semFoto.png', 1, 'kg', 3.15, 7.54, 14, '2021-03-27 18:19:13'),
(263, 'Mexerica  granel	', 4865, 'semFoto.png', 1, 'kg', 3.15, 7.54, 14, '2021-03-27 18:19:13'),
(264, 'Mexerica Dekopon kg	', 5557, 'semFoto.png', 1, 'kg', 3.64, 7.54, 14, '2021-03-27 18:19:13'),
(265, 'Milho Verde 1kg	', 2485, 'semFoto.png', 1, 'kg', 7, 7.54, 14, '2021-03-27 18:19:13'),
(266, 'Milho Verde 500g	', 4599, 'semFoto.png', 1, '500g', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(267, 'Mirtilo 125g	', 5559, 'semFoto.png', 1, '125g', 14, 7.54, 14, '2021-03-27 18:19:13'),
(268, 'Mirtilo bdj	', 5560, 'semFoto.png', 1, 'bdj', 6.72, 7.54, 14, '2021-03-27 18:19:13'),
(269, 'Morango 250g	', 5062, 'semFoto.png', 1, '250g', 6.5, 7.54, 14, '2021-03-27 18:19:13'),
(270, 'Morango Congelado 	', 5171, 'semFoto.png', 1, '1kg', 0, 7.54, 14, '2021-03-27 18:19:13'),
(271, 'Mostarda	', 2486, 'semFoto.png', 1, 'mç', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(272, 'Nabiça	', 5398, 'semFoto.png', 1, 'mç', 2.94, 7.54, 14, '2021-03-27 18:19:13'),
(273, 'Nabo 500g	', 2487, 'semFoto.png', 1, '500g', 2.94, 7.54, 14, '2021-03-27 18:19:13'),
(274, 'Nabo Roxo 	', 2487, 'semFoto.png', 1, '500g', 2.94, 7.54, 14, '2021-03-27 18:19:13'),
(275, 'Nectarina	', 5561, 'semFoto.png', 1, 'Bdj', 7, 7.54, 14, '2021-03-27 18:19:13'),
(276, 'Nira	', 5468, 'semFoto.png', 1, '150g', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(277, 'Ora Pro Nobis 100g	', 5624, 'semFoto.png', 1, '100g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(278, 'Ora Pro Nobis 70g	', NULL, 'semFoto.png', 1, '70g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(279, 'Oregano 70g	', 5425, 'semFoto.png', 1, '70g', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(280, 'Ovo caipira duzia	', 5580, 'semFoto.png', 1, 'dz', 11.9, 7.54, 14, '2021-03-27 18:19:13'),
(281, 'Ovo Orgânico Caipira Ômega 3 	', 5477, 'semFoto.png', 1, 'dez', 16.07, 7.54, 14, '2021-03-27 18:19:13'),
(282, 'Ovo Orgânico Caipira Pequeno	', 5480, 'semFoto.png', 1, 'dz', 15.43, 7.54, 14, '2021-03-27 18:19:13'),
(283, 'Ovo Orgânico Caipira Selenio	', 5478, 'semFoto.png', 1, 'dez', 16.07, 7.54, 14, '2021-03-27 18:19:13'),
(284, 'Ovo Organico Caipira Vermelho 	', 5479, 'semFoto.png', 1, '18 und', 21.64, 7.54, 14, '2021-03-27 18:19:13'),
(285, 'Ovo organico duzia TF	', 2872, 'semFoto.png', 1, 'dz', 9.2, 7.54, 14, '2021-03-27 18:19:13'),
(286, 'Peixinho 70g	', 5469, 'semFoto.png', 1, '70g', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(287, 'Pepino Caipira 500g	', 5435, 'semFoto.png', 1, '500g', 4.5, 7.54, 14, '2021-03-27 18:19:13'),
(288, 'Pepino caipira kg granel	', 1615, 'semFoto.png', 1, 'kg', 8.4, 7.54, 14, '2021-03-27 18:19:13'),
(289, 'Pepino Holandes 300g	', 5562, 'semFoto.png', 1, '300g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(290, 'Pepino Holandes 500g	', 5470, 'semFoto.png', 1, '500g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(291, 'Pepino Japones (granel)	', 5563, 'semFoto.png', 1, 'kg', 6.3, 7.54, 14, '2021-03-27 18:19:13'),
(292, 'Pepino Japones 500g	', 2488, 'semFoto.png', 1, '500g', 5, 7.54, 14, '2021-03-27 18:19:13'),
(293, 'Pepino preto 500g	', 5443, 'semFoto.png', 1, '500g', 3.29, 7.54, 14, '2021-03-27 18:19:13'),
(294, 'Pera importada 	', 894, 'semFoto.png', 1, 'kg', 20.5, 7.54, 14, '2021-03-27 18:19:13'),
(295, 'Pera importada 500g 	', 2971, 'semFoto.png', 1, '500g', 11.2, 7.54, 14, '2021-03-27 18:19:13'),
(296, 'Pessego	', 4555, 'semFoto.png', 1, 'Bdj', 9.8, 7.54, 14, '2021-03-27 18:19:13'),
(297, 'Pessego a granel	', 4560, 'semFoto.png', 1, 'kg', 0, 7.54, 14, '2021-03-27 18:19:13'),
(298, 'Pimenta Biquinho Amarela	', 5564, 'semFoto.png', 1, '100g', 2.38, 7.54, 14, '2021-03-27 18:19:13'),
(299, 'Pimenta Biquinho Vermelho	', 5565, 'semFoto.png', 1, '100g', 2.38, 7.54, 14, '2021-03-27 18:19:13'),
(300, 'Pimenta Bode	', 5566, 'semFoto.png', 1, '100g', 2.38, 7.54, 14, '2021-03-27 18:19:13'),
(301, 'Pimenta Caiena	', 5567, 'semFoto.png', 1, 'pct', 2.38, 7.54, 14, '2021-03-27 18:19:13'),
(302, 'Pimenta de Cheiro	', 5568, 'semFoto.png', 1, '70g', 2.38, 7.54, 14, '2021-03-27 18:19:13'),
(303, 'Pimenta Dedo de Moça	', 5569, 'semFoto.png', 1, '100g', 2.38, 7.54, 14, '2021-03-27 18:19:13'),
(304, 'Pimenta Malagueta	', 5444, 'semFoto.png', 1, '35g', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(305, 'Pimenta rosa	', 5570, 'semFoto.png', 1, '20g', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(306, 'Pimenta Tabasco	', 5572, 'semFoto.png', 1, '100g', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(307, 'Pimentao Amarelo (granel)	', 5574, 'semFoto.png', 1, 'kg', 15.4, 7.54, 14, '2021-03-27 18:19:13'),
(308, 'Pimentão Colorido Roxo	', 5734, 'semFoto.png', 1, '300g', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(309, 'Pimentão Colorido 	', 5800, 'semFoto.png', 1, '300g', 6.3, 7.54, 14, '2021-03-27 18:19:13'),
(310, 'Pimentao mini colorido	', 4751, 'semFoto.png', 1, '200g', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(311, 'Pimentao Verde 300g	', 2489, 'semFoto.png', 1, '300g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(312, 'Pimentao verde a granel	', 5471, 'semFoto.png', 1, 'kg', 12.6, 7.54, 14, '2021-03-27 18:19:13'),
(313, 'Pimentão colorido 	', 5575, 'semFoto.png', 1, 'KG', 21, 7.54, 14, '2021-03-27 18:19:13'),
(314, 'Pimentas 75g	', 3488, 'semFoto.png', 1, '75g', 2.45, 7.54, 14, '2021-03-27 18:19:13'),
(315, 'Pimetao amarelo	', 5573, 'semFoto.png', 1, '300g', 5.84, 7.54, 14, '2021-03-27 18:19:13'),
(316, 'Pinha	', 5550, 'semFoto.png', 1, 'KG', 8.4, 7.54, 14, '2021-03-27 18:19:13'),
(317, 'Pitanga 150g	', 5605, 'semFoto.png', 1, '150g', 3.92, 7.54, 14, '2021-03-27 18:19:13'),
(318, 'Pitaya (granel)	', 5419, 'semFoto.png', 1, 'kg', 12.6, 7.54, 14, '2021-03-27 18:19:13'),
(319, 'Poejo	', 5420, 'semFoto.png', 1, '70g', 2.38, 7.54, 14, '2021-03-27 18:19:13'),
(320, 'Ponkan Granel	', 4948, 'semFoto.png', 1, 'kg', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(321, 'Quiabo (granel)	', 5551, 'semFoto.png', 1, 'kg', 9.8, 7.54, 14, '2021-03-27 18:19:13'),
(322, 'Quiabo 300g	', 2490, 'semFoto.png', 1, '300G', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(323, 'Rabanete (granel)	', 5606, 'semFoto.png', 1, 'kg', 5.85, 7.54, 14, '2021-03-27 18:19:13'),
(324, 'Rabanete c/ folha	', 5396, 'semFoto.png', 1, '600g', 2.94, 7.54, 14, '2021-03-27 18:19:13'),
(325, 'Rabanete s/ Folha 450g	', 2491, 'semFoto.png', 1, '450g', 2.94, 7.54, 14, '2021-03-27 18:19:13'),
(326, 'Radichio	', 5426, 'semFoto.png', 1, 'un', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(327, 'Repolho Roxo	', 5762, 'semFoto.png', 1, 'un ', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(328, 'Repolho Roxo kg	', 4787, 'semFoto.png', 1, 'kg', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(329, 'Repolho Roxo restaurante	', NULL, 'semFoto.png', 1, 'kg', 3.92, 7.54, 14, '2021-03-27 18:19:13'),
(330, 'Repolho Verde KG 	', 2492, 'semFoto.png', 1, 'kg', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(331, 'Repolho Verde Restaurante*	', NULL, 'semFoto.png', 1, 'kg', 3.92, 7.54, 14, '2021-03-27 18:19:13'),
(332, 'Repolho Verde UM	', 5660, 'semFoto.png', 1, 'un ', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(333, 'Rucula (250g)	', 2493, 'semFoto.png', 1, '250g', 2.52, 7.54, 14, '2021-03-27 18:19:13'),
(334, 'Salsa	', 2494, 'semFoto.png', 1, 'mç', 2.1, 7.54, 14, '2021-03-27 18:19:13'),
(335, 'Salsa Crespa	', 2494, 'semFoto.png', 1, 'und', 2.1, 7.54, 14, '2021-03-27 18:19:13'),
(336, 'Salsao 350g	', 5472, 'semFoto.png', 1, 'Und', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(337, 'Sálvia	', 5473, 'semFoto.png', 1, '70g', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(338, 'Seleta de beterraba/chuchu	', 5432, 'semFoto.png', 1, '500g', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(339, 'Seleta de legumes chu/bet/cen	', 5432, 'semFoto.png', 1, '500g', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(340, 'Seleta de Legumes abob/ chu	', 5432, 'semFoto.png', 1, '500g', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(341, 'Seleta de legumes chuchu/cenoura	', 5432, 'semFoto.png', 1, '500g', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(342, 'Semente de Coentro 20g	', 3043, 'semFoto.png', 1, '20g', 7, 7.54, 14, '2021-03-27 18:19:13'),
(343, 'Taioba 300g	', 2495, 'semFoto.png', 1, '300g', 2.8, 7.54, 14, '2021-03-27 18:19:13'),
(344, 'Tamarindo 300g	', 5552, 'semFoto.png', 1, '300g', 5.35, 7.54, 14, '2021-03-27 18:19:13'),
(345, 'Thingensai	', 5421, 'semFoto.png', 1, 'mç', 3.36, 7.54, 14, '2021-03-27 18:19:13'),
(346, 'Tomate Cereja (granel)	', 5553, 'semFoto.png', 1, 'kg', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(347, 'Tomate Cereja 500g	', 2496, 'semFoto.png', 1, '500g', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(348, 'Tomate Grape  (granel)	', 5607, 'semFoto.png', 1, 'kg', 12.6, 7.54, 14, '2021-03-27 18:19:13'),
(349, 'Tomate Grape 300g	', 2499, 'semFoto.png', 1, '300g', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(350, 'Tomate Grape Amarelo 300g	', 5399, 'semFoto.png', 1, '300g', 5.32, 7.54, 14, '2021-03-27 18:19:13'),
(351, 'Tomate Holandes 500g	', 5554, 'semFoto.png', 1, '500g', 3.33, 7.54, 14, '2021-03-27 18:19:13'),
(352, 'Tomate Holandes kg	', 5555, 'semFoto.png', 1, 'kg', 6.65, 7.54, 14, '2021-03-27 18:19:13'),
(353, 'Tomate Italiano (granel) 	', 1616, 'semFoto.png', 1, 'kg', 6, 7.54, 14, '2021-03-27 18:19:13'),
(354, 'Tomate Italiano 1kg	', 3067, 'semFoto.png', 1, 'kg', 8.4, 7.54, 14, '2021-03-27 18:19:13'),
(355, 'Tomate Italiano 500g	', 3601, 'semFoto.png', 1, '500g', 5.6, 7.54, 14, '2021-03-27 18:19:13'),
(356, 'Tomate Mini Cerejao 300g	', 5609, 'semFoto.png', 1, '300g', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(357, 'Tomate Mini Italiano 500g	', 4741, 'semFoto.png', 1, '500g', 5.95, 7.54, 14, '2021-03-27 18:19:13'),
(358, 'Tomate mini italiano granel	', 5612, 'semFoto.png', 1, 'kg', 11.9, 7.54, 14, '2021-03-27 18:19:13'),
(359, 'Tomate mini redondo	', 5610, 'semFoto.png', 1, '500g', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(360, 'Tomate Salada (M) 1 kg especial	', 5613, 'semFoto.png', 1, 'kg', 5.88, 7.54, 14, '2021-03-27 18:19:13'),
(361, 'Tomate salada (MESA) (granel) 	', 5402, 'semFoto.png', 1, 'kg', 7, 7.54, 14, '2021-03-27 18:19:13'),
(362, 'Tomate salada (MESA) 500g	', 2497, 'semFoto.png', 1, '500g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(363, 'Tomate salada (MESA)1kg	', 2498, 'semFoto.png', 1, 'kg', 7.7, 7.54, 14, '2021-03-27 18:19:13'),
(364, 'Tomilho 70g	', 5474, 'semFoto.png', 1, '70 g', 3.33, 7.54, 14, '2021-03-27 18:19:13'),
(365, 'Urucum	', 4666, 'semFoto.png', 1, '20g', 4, 7.54, 14, '2021-03-27 18:19:13'),
(366, 'Urucum em pó 	', 5805, 'semFoto.png', 1, '50g', 5.18, 7.54, 14, '2021-03-27 18:19:13'),
(367, 'Uva bdj	', 1017, 'semFoto.png', 1, 'Bdj', 7.7, 7.54, 14, '2021-03-27 18:19:13'),
(368, 'Uva Isabel	', 5556, 'semFoto.png', 1, 'Bdj', 7.7, 7.54, 14, '2021-03-27 18:19:13'),
(369, 'Uva Niagara	', NULL, 'semFoto.png', 1, 'Bdj', 0, 7.54, 14, '2021-03-27 18:19:13'),
(370, 'Vagem Comum Restaurante*	', 5611, 'semFoto.png', 1, 'kg', 9.8, 7.54, 14, '2021-03-27 18:19:13'),
(371, 'Vagem Macarrao (comum) 300g	', 2500, 'semFoto.png', 1, '300g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(372, 'Vagem Paulista (granel)	', 5608, 'semFoto.png', 1, 'kg', 9.8, 7.54, 14, '2021-03-27 18:19:13'),
(373, 'Vagem Paulista 300g	', 2501, 'semFoto.png', 1, '300g', 4.9, 7.54, 14, '2021-03-27 18:19:13'),
(374, 'Major Gomes	', 5023, 'semFoto.png', 1, '100g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(375, 'Couve picada 	', 5249, 'semFoto.png', 1, '150g', 4.2, 7.54, 14, '2021-03-27 18:19:13'),
(376, 'LUIS PIMENTA', 4522, '32df05c1de6c8be45493686639be49e7.png', 1, 'un', 5.87, 5.91, 54, '2021-03-28 18:03:58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipocliente`
--

CREATE TABLE `tipocliente` (
  `idTipoCliente` int(11) NOT NULL,
  `nomeTipoCliente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipocliente`
--

INSERT INTO `tipocliente` (`idTipoCliente`, `nomeTipoCliente`) VALUES
(1, 'Cliente atacado'),
(2, 'Cliente delivery'),
(3, 'Sócio Legrano');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`),
  ADD UNIQUE KEY `cpfAdministrador` (`cpfAdministrador`);

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`idCidade`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `cpf_cnpj` (`cpf_cnpj`),
  ADD KEY `cidade` (`cidade`),
  ADD KEY `tipoCliente` (`tipoCliente`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `cliente` (`cliente`),
  ADD KEY `produto` (`produto`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`);

--
-- Índices para tabela `tipocliente`
--
ALTER TABLE `tipocliente`
  ADD PRIMARY KEY (`idTipoCliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdministrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `idCidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=377;

--
-- AUTO_INCREMENT de tabela `tipocliente`
--
ALTER TABLE `tipocliente`
  MODIFY `idTipoCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`cidade`) REFERENCES `cidade` (`idCidade`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`tipoCliente`) REFERENCES `tipocliente` (`idTipoCliente`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`produto`) REFERENCES `produto` (`idProduto`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
