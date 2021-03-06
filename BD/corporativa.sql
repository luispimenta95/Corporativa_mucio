-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Mar-2021 às 18:41
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
-- Banco de dados: `corporativa`
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
(1, 'Usuário Master', '12345678909', 'mucio.ezio@gmail.com', '12345', 1, NULL, '2021-02-13 21:21:11', 1);

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
  `enderecoCliente` varchar(200) NOT NULL DEFAULT 'Não informado',
  `telefoneCliente` varchar(255) DEFAULT NULL,
  `dataCadastro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `atacado` tinyint(1) DEFAULT 0,
  `primeiroAcesso` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nomeCliente`, `cpf_cnpj`, `emailCliente`, `senhaCliente`, `ativo`, `enderecoCliente`, `telefoneCliente`, `dataCadastro`, `atacado`, `primeiroAcesso`) VALUES
(1, 'fulaninho da feira', '12345678900', 'fulano@email', '12345', 1, 'Não informado', '1234567890', '2021-03-06 15:04:21', 0, 1),
(25, 'LUIS PIMENTA', '02342288140', 'felipearaujo95@hotmail.com', '13151319', 1, 'Rua Pará', '61998690313', '2021-03-06 17:01:37', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `dataPedido` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `quantidade` int(11) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `codPedido` varchar(11) NOT NULL,
  `cliente` int(11) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `pedidoFinalizado` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`idPedido`, `dataPedido`, `quantidade`, `preco`, `codPedido`, `cliente`, `produto`, `pedidoFinalizado`) VALUES
(14, '2021-03-06 14:04:46', 4, 11.2, 'c51df', 1, 2, 0),
(16, '2021-03-06 14:37:22', 7, 9.8, 'cbe8f', 1, 1, 1),
(17, '2021-03-06 14:44:20', 45, 3.49, '85cc7', 1, 8, 1),
(18, '2021-03-06 17:06:47', 5, 9.8, 'd397f', 25, 1, 0),
(19, '2021-03-06 17:07:00', 4, 11.2, 'd397f', 25, 2, 0);

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
  `preco` float DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL,
  `dataCadastro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idProduto`, `nomeProduto`, `codigo`, `imagem`, `ativo`, `unidade`, `preco`, `estoque`, `dataCadastro`) VALUES
(1, 'Abacate  	', 451, '0576b761a2c2b955978fadc545426d71.jpg', 1, 'kg', 9.8, 0, '2021-02-14 14:32:57'),
(2, 'Abacaxi 	', 1865, 'semFoto.png', 1, 'un ', 11.2, 0, '2021-02-14 13:54:44'),
(3, 'Abobora Barbara 	', 5450, 'semFoto.png', 0, 'kg', 4.58, 0, '2021-02-16 18:18:04'),
(4, 'Abóbora Bola Amarela	', 5642, 'semFoto.png', 1, 'kg', 3.92, 0, '2021-02-14 13:54:44'),
(5, 'Abóbora Bola verde	', 5642, 'semFoto.png', 1, 'kg', 3.92, 0, '2021-02-14 13:54:44'),
(6, 'Abóbora Bola Verde Clara	', 5642, 'semFoto.png', 1, 'kg', 3.92, 0, '2021-02-14 13:54:44'),
(7, 'Abobora Cabutia/Japonesa  	', 2448, 'semFoto.png', 1, 'Kg', 4.2, 0, '2021-02-14 13:54:44'),
(8, 'Abobora Caipira 	', 5485, 'semFoto.png', 1, 'kg', 3.49, 0, '2021-02-14 13:54:44'),
(9, 'Abobora Italia 	', 2446, 'semFoto.png', 1, '500g', 4, 0, '2021-02-14 13:54:44'),
(10, 'Abóbora Italia granel	', 3072, 'semFoto.png', 1, 'Kg', 4.48, 0, '2021-02-14 13:54:44'),
(11, 'Abobora Italia restaurante	', 3072, 'semFoto.png', 1, 'kg', 4.48, 0, '2021-02-14 13:54:44'),
(12, 'Abóbora Japonesa Processada	', 5634, 'semFoto.png', 1, '500g', 5.6, 0, '2021-02-14 13:54:44'),
(13, 'Abobora Madura	', 2449, 'semFoto.png', 1, 'kg', 3.5, 0, '2021-02-14 13:54:44'),
(14, 'Abobora Madura restaurante	', 2449, 'semFoto.png', 1, 'kg', 3.5, 0, '2021-02-14 13:54:44'),
(15, 'Abobora Menina 	', 2447, 'semFoto.png', 1, '500g', 4, 0, '2021-02-14 13:54:44'),
(16, 'Abobora Menina (granel)	', 3073, 'semFoto.png', 1, 'kg', 14, 0, '2021-02-14 13:54:44'),
(17, 'Abóbora mini moranga	', 4759, 'semFoto.png', 1, 'kg', 14, 0, '2021-02-14 13:54:44'),
(18, 'Abobora Moranga	', 5486, 'semFoto.png', 1, 'Kg', 4.2, 0, '2021-02-14 13:54:44'),
(19, 'Açafrao (granel) TF	', 1205, 'semFoto.png', 1, 'kg', 31.68, 0, '2021-02-14 13:54:44'),
(20, 'Açafrao 100g	', 5223, 'semFoto.png', 1, '100g', 4.2, 0, '2021-02-14 13:54:44'),
(21, 'Açafrão em pó 	', 5646, 'semFoto.png', 1, '30g', 9.44, 0, '2021-02-14 13:54:44'),
(22, 'Açafrão em pó 	', 5647, 'semFoto.png', 1, '50g', 15.2, 0, '2021-02-14 13:54:44'),
(23, 'Acelga	', 2450, 'semFoto.png', 1, 'un', 3.5, 0, '2021-02-14 13:54:44'),
(24, 'Acerola 500g	', 5433, 'semFoto.png', 1, '500g', 4.51, 0, '2021-02-14 13:54:44'),
(25, 'Acerola congelada - P	', 3130, 'semFoto.png', 1, '500g', 0, 0, '2021-02-14 13:54:44'),
(26, 'Agriao da água 300g	', 2451, 'semFoto.png', 1, '300g', 4.2, 0, '2021-02-14 13:54:44'),
(27, 'Agriao da terra 300g	', 2452, 'semFoto.png', 1, '300g', 3.5, 0, '2021-02-14 13:54:44'),
(28, 'Alecrim 70g	', 5423, 'semFoto.png', 1, '70g', 2.1, 0, '2021-02-14 13:54:44'),
(29, 'Alecrim desidratada 	', 5679, 'semFoto.png', 1, '20g', 4, 0, '2021-02-14 13:54:44'),
(30, 'Alface Americana	', 2453, 'semFoto.png', 1, 'un', 2.9, 0, '2021-02-14 13:54:44'),
(31, 'Alface baby Americana / Frizee Roxa	', 5487, 'semFoto.png', 1, 'bj', 3.36, 0, '2021-02-14 13:54:44'),
(32, 'Alface baby Americana / Frizee Verde	', 5488, 'semFoto.png', 1, 'bj', 3.36, 0, '2021-02-14 13:54:44'),
(33, 'Alface baby Frizee Roxa e Verde	', 5489, 'semFoto.png', 1, 'bj', 3.36, 0, '2021-02-14 13:54:44'),
(34, 'Alface Baby Mix	', 5490, 'semFoto.png', 1, 'bdj', 3.36, 0, '2021-02-14 13:54:44'),
(35, 'Alface Baby Mix americana e roxa	', 5601, 'semFoto.png', 1, 'bdj', 3.36, 0, '2021-02-14 13:54:44'),
(36, 'Alface Crespa	', 2454, 'semFoto.png', 1, 'un', 2.45, 0, '2021-02-14 13:54:44'),
(37, 'Alface Crespa Crocantela	', 5491, 'semFoto.png', 1, 'un ', 2.45, 0, '2021-02-14 13:54:44'),
(38, 'Alface Frisee	', 2455, 'semFoto.png', 1, 'un ', 2.45, 0, '2021-02-14 13:54:44'),
(39, 'Alface Lisa	', 2456, 'semFoto.png', 1, 'un ', 2.45, 0, '2021-02-14 13:54:44'),
(40, 'Alface Mimosa	', 2457, 'semFoto.png', 1, 'un ', 2.45, 0, '2021-02-14 13:54:44'),
(41, 'Alface Mimosa Roxa	', 5451, 'semFoto.png', 1, 'un ', 2.45, 0, '2021-02-14 13:54:44'),
(42, 'Alface Romana	', 2458, 'semFoto.png', 1, 'un ', 2.45, 0, '2021-02-14 13:54:44'),
(43, 'Alface Romana Crocante	', 5452, 'semFoto.png', 1, 'un ', 2.45, 0, '2021-02-14 13:54:44'),
(44, 'Alface Romanela	', 5492, 'semFoto.png', 1, 'un ', 2.45, 0, '2021-02-14 13:54:44'),
(45, 'Alface Roxa	', 2459, 'semFoto.png', 1, 'un ', 2.45, 0, '2021-02-14 13:54:44'),
(46, 'Alface rubinela roxa	', 5581, 'semFoto.png', 1, 'un ', 2.45, 0, '2021-02-14 13:54:44'),
(47, 'Alfavaca 70g	', 5453, 'semFoto.png', 1, '70g', 3.36, 0, '2021-02-14 13:54:44'),
(48, 'Alho Cabeça Graudo	', 5649, 'semFoto.png', 1, '200g', 15.3, 0, '2021-02-14 13:54:44'),
(49, 'Alho Cabeça Medio 	', 5651, 'semFoto.png', 1, '200g', 15.04, 0, '2021-02-14 13:54:44'),
(50, 'Alho Cabeça Miudo	', 5653, 'semFoto.png', 1, '200g', 12, 0, '2021-02-14 13:54:44'),
(51, 'Alho Debulhado Graudo 	', 5650, 'semFoto.png', 1, '200g', 15.3, 0, '2021-02-14 13:54:44'),
(52, 'Alho Debulhado Médio 	', 5652, 'semFoto.png', 1, '200g', 15.3, 0, '2021-02-14 13:54:44'),
(53, 'Alho Debulhado Miúdo 	', 5654, 'semFoto.png', 1, '200g', 12, 0, '2021-02-14 13:54:44'),
(54, 'Alho descascado 150g	', 5327, 'semFoto.png', 1, '150g', 13.04, 0, '2021-02-14 13:54:44'),
(55, 'Alho descascado 300g	', 5315, 'semFoto.png', 1, '300g', 24.15, 0, '2021-02-14 13:54:44'),
(56, 'Alho Desidratado 20g	', 1625, 'semFoto.png', 1, '20g', 7.35, 0, '2021-02-14 13:54:44'),
(57, 'Alho gourmet 150g	', 5595, 'semFoto.png', 1, '150g', 12.46, 0, '2021-02-14 13:54:44'),
(58, 'Alho Porro 350g	', 2460, 'semFoto.png', 1, '350g', 4.2, 0, '2021-02-14 13:54:44'),
(59, 'Alho-porro bulbo 250g	', 5427, 'semFoto.png', 1, '250g', 4.2, 0, '2021-02-14 13:54:44'),
(60, 'Almeirao 300g	', 2461, 'semFoto.png', 1, '300g', 2.8, 0, '2021-02-14 13:54:44'),
(61, 'Ameixa BDJ	', 4556, 'semFoto.png', 1, '500g', 7, 0, '2021-02-14 13:54:44'),
(62, 'Ameixa granel	', 4561, 'semFoto.png', 1, 'kg', 0, 0, '2021-02-14 13:54:44'),
(63, 'Amora 75g	', 5493, 'semFoto.png', 1, '75g', 4.2, 0, '2021-02-14 13:54:44'),
(64, 'Amora congelada 	', 4340, 'semFoto.png', 1, '160g', 8.7, 0, '2021-02-14 13:54:44'),
(65, 'Arnica	', 5674, 'semFoto.png', 1, '70g', 3.08, 0, '2021-02-14 13:54:44'),
(66, 'Atemoia 	', 5494, 'semFoto.png', 1, 'kg', 10.78, 0, '2021-02-14 13:54:44'),
(67, 'Avocado 500g	', 5495, 'semFoto.png', 1, '500g', 5.95, 0, '2021-02-14 13:54:44'),
(68, 'Avocado kg	', 5496, 'semFoto.png', 1, 'kg', 11.2, 0, '2021-02-14 13:54:44'),
(69, 'Azedinha/vinagreira 100g	', 5449, 'semFoto.png', 1, '100g', 2.1, 0, '2021-02-14 13:54:44'),
(70, 'Banana da Terra kg	', 5616, 'semFoto.png', 1, 'kg', 4.76, 0, '2021-02-14 13:54:44'),
(71, 'Banana Maça (granel)	', 5429, 'semFoto.png', 1, 'kg', 6.16, 0, '2021-02-14 13:54:44'),
(72, 'Banana Marmelo (granel)	', 5430, 'semFoto.png', 1, 'kg', 4.76, 0, '2021-02-14 13:54:44'),
(73, 'Banana Nanica (granel)	', 5428, 'semFoto.png', 1, 'kg', 4.05, 0, '2021-02-14 13:54:44'),
(74, 'Banana Ouro kg	', 5434, 'semFoto.png', 1, 'kg', 4.69, 0, '2021-02-14 13:54:44'),
(75, 'Banana praçã	', 5578, 'semFoto.png', 1, 'kg', 4.76, 0, '2021-02-14 13:54:44'),
(76, 'Banana Prata KG	', 4526, 'semFoto.png', 1, 'kg', 5.32, 0, '2021-02-14 13:54:44'),
(77, 'Batata Asterix 1 kg	', 5225, 'semFoto.png', 1, 'kg', 9.1, 0, '2021-02-14 13:54:44'),
(78, 'Batata Asterix 500g	', 5738, 'semFoto.png', 1, '500G', 5.53, 0, '2021-02-14 13:54:44'),
(79, 'Batata Asterix Bolinha 1Kg	', 5497, 'semFoto.png', 1, '1kg', 8.25, 0, '2021-02-14 13:54:44'),
(80, 'Batata Baroa 500g	', 2462, 'semFoto.png', 1, '500g', 10.5, 0, '2021-02-14 13:54:44'),
(81, 'Batata Doce 500g	', 2463, 'semFoto.png', 1, '500g', 4, 0, '2021-02-14 13:54:44'),
(82, 'Batata Doce Amarela 500G	', 5411, 'semFoto.png', 1, '500g', 3.5, 0, '2021-02-14 13:54:44'),
(83, 'Batata Doce Branca 500g	', 5389, 'semFoto.png', 1, '500g', 3.5, 0, '2021-02-14 13:54:44'),
(84, 'Batata Doce Granel	', 5360, 'semFoto.png', 1, 'kg', 7, 0, '2021-02-14 13:54:44'),
(85, 'Batata Doce Laranja 500g	', 5374, 'semFoto.png', 1, '500g', 3.5, 0, '2021-02-14 13:54:44'),
(86, 'Batata Doce Roxa 500g	', 5592, 'semFoto.png', 1, '500g', 3.5, 0, '2021-02-14 13:54:44'),
(87, 'Batata Inglesa (granel)	', 5498, 'semFoto.png', 1, 'kg ', 7, 0, '2021-02-14 13:54:44'),
(88, 'Batata Inglesa 1kg	', 3065, 'semFoto.png', 1, 'kg', 7.7, 0, '2021-02-14 13:54:44'),
(89, 'Batata Inglesa 500g	', 4534, 'semFoto.png', 1, '500g', 3.5, 0, '2021-02-14 13:54:44'),
(90, 'Batata Inglesa Bolinha 1kg	', 5262, 'semFoto.png', 1, 'kg', 6, 0, '2021-02-14 13:54:44'),
(91, 'Batata Inglesa Bolinha 500g	', 5264, 'semFoto.png', 1, '500G', 3.5, 0, '2021-02-14 13:54:44'),
(92, 'Batata Yakon 500g	', 2464, 'semFoto.png', 1, '500g', 4.2, 0, '2021-02-14 13:54:44'),
(93, 'Batata Yakon Restaurante*	', NULL, 'semFoto.png', 1, 'kg', 0, 0, '2021-02-14 13:54:44'),
(94, 'Beldroega	', 5436, 'semFoto.png', 1, '300g', 2.1, 0, '2021-02-14 13:54:44'),
(95, 'Berinjela (granel)	', 3066, 'semFoto.png', 1, 'kg', 5.6, 0, '2021-02-14 13:54:44'),
(96, 'Berinjela 500g	', 2465, 'semFoto.png', 1, '500g', 4.9, 0, '2021-02-14 13:54:44'),
(97, 'Berinjela Japonesa 500g	', 5500, 'semFoto.png', 1, '500g', 3.5, 0, '2021-02-14 13:54:44'),
(98, 'Bertalha	', 5424, 'semFoto.png', 1, 'Und', 2.8, 0, '2021-02-14 13:54:44'),
(99, 'Beterraba c/ Folha kg	', 1653, 'semFoto.png', 1, 'kg', 5.6, 0, '2021-02-14 13:54:44'),
(100, 'Beterraba granel	', 3070, 'semFoto.png', 1, 'kg', 5.6, 0, '2021-02-14 13:54:44'),
(101, 'Beterraba s/ Folha 500g	', 4742, 'semFoto.png', 1, '500g', 3.15, 0, '2021-02-14 13:54:44'),
(102, 'Beterraba s/ Folha Kg	', 1653, 'semFoto.png', 1, 'kg', 6.3, 0, '2021-02-14 13:54:44'),
(103, 'Biriba 1kg	', 5475, 'semFoto.png', 1, '1kg', 5.74, 0, '2021-02-14 13:54:44'),
(104, 'Boldo 70g	', 5412, 'semFoto.png', 1, '70g', 3.5, 0, '2021-02-14 13:54:44'),
(105, 'Brocolis Japones 400g (und)	', 5576, 'semFoto.png', 1, '400g', 6.3, 0, '2021-02-14 13:54:44'),
(106, 'Brocolis Japones kg	', 2468, 'semFoto.png', 1, 'kg', 9.8, 0, '2021-02-14 13:54:44'),
(107, 'Brocolis Ramoso / Comum	', 2467, 'semFoto.png', 1, '400g', 5.6, 0, '2021-02-14 13:54:44'),
(108, 'Cafe moido 250g	', 3981, 'semFoto.png', 1, '250g', 15.2, 0, '2021-02-14 13:54:44'),
(109, 'Cafe moido 500g	', 3982, 'semFoto.png', 1, '500g', 28.8, 0, '2021-02-14 13:54:44'),
(110, 'Cafe Torrado Grao 250g	', 3983, 'semFoto.png', 1, '250g', 16.75, 0, '2021-02-14 13:54:44'),
(111, 'Cafe Torrado Grao 500g	', 3984, 'semFoto.png', 1, '500g', 31.84, 0, '2021-02-14 13:54:44'),
(112, 'Cagaita	', 5502, 'semFoto.png', 1, 'bdj', 3.78, 0, '2021-02-14 13:54:44'),
(113, 'Cajamanga 500G	', 5437, 'semFoto.png', 1, '500g', 4.2, 0, '2021-02-14 13:54:44'),
(114, 'Caju	', 671, 'semFoto.png', 1, '500g', 8.4, 0, '2021-02-14 13:54:44'),
(115, 'Cana Caiana sem Casca	', 5672, 'semFoto.png', 1, '400g', 3.7, 0, '2021-02-14 13:54:44'),
(116, 'Capim cidreira	', NULL, 'semFoto.png', 1, '70g', 2.8, 0, '2021-02-14 13:54:44'),
(117, 'Capim santo	', 5457, 'semFoto.png', 1, '70g', 2.8, 0, '2021-02-14 13:54:44'),
(118, 'Capuchinha	', 5458, 'semFoto.png', 1, '50g', 5.6, 0, '2021-02-14 13:54:44'),
(119, 'Caqui 	', 5483, 'semFoto.png', 1, 'Bdj', 5.6, 0, '2021-02-14 13:54:44'),
(120, 'Caqui RAMA FORTE	', 5602, 'semFoto.png', 1, 'Bdj', 5.6, 0, '2021-02-14 13:54:44'),
(121, 'Cara moela	', 5625, 'semFoto.png', 1, '500g', 7, 0, '2021-02-14 13:54:44'),
(122, 'Carambola	', 5503, 'semFoto.png', 1, '500g', 3.5, 0, '2021-02-14 13:54:44'),
(123, 'Carambola KG	', NULL, 'semFoto.png', 1, 'KG', 7, 0, '2021-02-14 13:54:44'),
(124, 'Carqueja 100g	', 5626, 'semFoto.png', 1, '100g', 3.92, 0, '2021-02-14 13:54:44'),
(125, 'Cebola Comum Embalada 1kg	', 3813, 'semFoto.png', 1, 'kg', 7.7, 0, '2021-02-14 13:54:44'),
(126, 'Cebola Comum Embalada 500g	', 4750, 'semFoto.png', 1, '500g', 4.9, 0, '2021-02-14 13:54:44'),
(127, 'Cebola Comum granel	', 1997, 'semFoto.png', 1, 'kg', 7, 0, '2021-02-14 13:54:44'),
(128, 'Cebola MÇ	', 5460, 'semFoto.png', 1, 'mç', 7, 0, '2021-02-14 13:54:44'),
(129, 'Cebola Roxa (granel)	', 5275, 'semFoto.png', 1, 'kg', 8, 0, '2021-02-14 13:54:44'),
(130, 'Cebola Roxa 1kg	', 5274, 'semFoto.png', 1, 'kg', 8.4, 0, '2021-02-14 13:54:44'),
(131, 'Cebola Roxa 500g	', 4846, 'semFoto.png', 1, '500g', 5, 0, '2021-02-14 13:54:44'),
(132, 'Cebolete	', 5461, 'semFoto.png', 1, '100g', 2.1, 0, '2021-02-14 13:54:44'),
(133, 'Cebolinha 100g	', 2469, 'semFoto.png', 1, '100g', 2.1, 0, '2021-02-14 13:54:44'),
(134, 'Cebolinha Desidratada 	', 2445, 'semFoto.png', 1, '10g', 7, 0, '2021-02-14 13:54:44'),
(135, 'Cebolinha/Alho desidratados	', 3040, 'semFoto.png', 1, '20g', 7, 0, '2021-02-14 13:54:44'),
(136, 'Cenoura (granel)	', 3071, 'semFoto.png', 1, 'kg', 5.6, 0, '2021-02-14 13:54:44'),
(137, 'Cenoura c/folha	', 2470, 'semFoto.png', 1, '1,200g', 5.6, 0, '2021-02-14 13:54:44'),
(138, 'Cenoura s/ Folha 1Kg	', 2470, 'semFoto.png', 1, 'kg', 6.3, 0, '2021-02-14 13:54:44'),
(139, 'Cenoura s/ Folha 500g	', 4477, 'semFoto.png', 1, '500g', 3.5, 0, '2021-02-14 13:54:44'),
(140, 'Chalota 150g - seu menino	', 5076, 'semFoto.png', 1, '150g', 12.5, 0, '2021-02-14 13:54:44'),
(141, 'Chalota Desidratada 20g - seu menino	', 1628, 'semFoto.png', 1, '20g', 7, 0, '2021-02-14 13:54:44'),
(142, 'Chalota roseé round in natura 150g	', 5391, 'semFoto.png', 1, '150g', 12.46, 0, '2021-02-14 13:54:44'),
(143, 'Chalota tailandesa 300g	', 5393, 'semFoto.png', 1, '300g', 23.4, 0, '2021-02-14 13:54:44'),
(144, 'Cheiro Verde (coentro) 100g	', 2471, 'semFoto.png', 1, '100g', 2.1, 0, '2021-02-14 13:54:44'),
(145, 'Cheiro Verde (salsa) 100g	', 5446, 'semFoto.png', 1, '100g', 2.1, 0, '2021-02-14 13:54:44'),
(146, 'Chia 250g	', 5413, 'semFoto.png', 1, '250g', 6.72, 0, '2021-02-14 13:54:44'),
(147, 'Chia kg	', 5504, 'semFoto.png', 1, 'Kg', 15.4, 0, '2021-02-14 13:54:44'),
(148, 'Chicoria	', 2473, 'semFoto.png', 1, 'un', 2.1, 0, '2021-02-14 13:54:44'),
(149, 'Chuchu (granel)	', 4915, 'semFoto.png', 1, 'kg', 9.1, 0, '2021-02-14 13:54:44'),
(150, 'Chuchu 500g	', 2474, 'semFoto.png', 1, '500g', 4.9, 0, '2021-02-14 13:54:44'),
(151, 'Chuchu mini	', 4755, 'semFoto.png', 1, '500g', 5.2, 0, '2021-02-14 13:54:44'),
(152, 'Coco Verde	', 5438, 'semFoto.png', 1, 'und', 4.2, 0, '2021-02-14 13:54:44'),
(153, 'Coentro 100g	', 2040, 'semFoto.png', 1, '100g', 2.1, 0, '2021-02-14 13:54:44'),
(154, 'Cogumelo  funghi desidratado 100g	', 5226, 'semFoto.png', 1, '100g', 35, 0, '2021-02-14 13:54:44'),
(155, 'Cogumelo Champignon em conserva 	', NULL, 'semFoto.png', 1, '100g', 0, 0, '2021-02-14 13:54:44'),
(156, 'Cogumelo Champignon in natura 200G	', 547, 'semFoto.png', 1, '200g', 11.2, 0, '2021-02-14 13:54:44'),
(157, 'Cogumelo shimeji Branco 200g	', 5464, 'semFoto.png', 1, '200g', 11.2, 0, '2021-02-14 13:54:44'),
(158, 'Cogumelo Shimeji Branco Desidratado	', 535, 'semFoto.png', 1, '200g', 15, 0, '2021-02-14 13:54:44'),
(159, 'Cogumelo Shimeji Branco Desidratado	', NULL, 'semFoto.png', 1, 'kg', 0, 0, '2021-02-14 13:54:44'),
(160, 'Cogumelo Shimeji desidratado 30g	', 4927, 'semFoto.png', 1, '30g', 11.2, 0, '2021-02-14 13:54:44'),
(161, 'Cogumelo shimeji Desidratado 500g	', NULL, 'semFoto.png', 1, '500g', 0, 0, '2021-02-14 13:54:44'),
(162, 'Cogumelo shimeji italia 200g	', NULL, 'semFoto.png', 1, 'Bdj', 11.2, 0, '2021-02-14 13:54:44'),
(163, 'Cogumelo shimeji Preto 200g	', NULL, 'semFoto.png', 1, '200g', 11.2, 0, '2021-02-14 13:54:44'),
(164, 'Cogumelo shimeji Rosa 150g	', NULL, 'semFoto.png', 1, '150g', 11.2, 0, '2021-02-14 13:54:44'),
(165, 'Cogumelo shimeji Salmao 200g	', 5462, 'semFoto.png', 1, '200g', 7.7, 0, '2021-02-14 13:54:44'),
(166, 'Cogumelo Shimofuri 200g	', NULL, 'semFoto.png', 1, 'Bdj', 11.2, 0, '2021-02-14 13:54:44'),
(167, 'Cogumelo Shitake 200G	', 5463, 'semFoto.png', 1, 'Bdj', 11.2, 0, '2021-02-14 13:54:44'),
(168, 'Couve 350g	', 2475, 'semFoto.png', 1, '350g', 2.52, 0, '2021-02-14 13:54:44'),
(169, 'Couve Mizuma 	', 5582, 'semFoto.png', 1, '350g', 3.53, 0, '2021-02-14 13:54:44'),
(170, 'Couve-flor  400g	', 5577, 'semFoto.png', 1, 'um', 5.6, 0, '2021-02-14 13:54:44'),
(171, 'Couve-flor KG	', 2476, 'semFoto.png', 1, 'kg', 7.42, 0, '2021-02-14 13:54:44'),
(172, 'Erva cidreira	', 5465, 'semFoto.png', 1, '70g', 2.1, 0, '2021-02-14 13:54:44'),
(173, 'Ervilha Torta 250g	', 2477, 'semFoto.png', 1, '250g', 4.9, 0, '2021-02-14 13:54:44'),
(174, 'Espinafre 300g	', 2478, 'semFoto.png', 1, '300g', 3.5, 0, '2021-02-14 13:54:44'),
(175, 'Feijao Azuki 1kg	', 5505, 'semFoto.png', 1, 'kg', 28.42, 0, '2021-02-14 13:54:44'),
(176, 'Feijao Azuki 500g	', 5506, 'semFoto.png', 1, '500g', 14.7, 0, '2021-02-14 13:54:44'),
(177, 'Feijao carioquinha 1kg	', 4542, 'semFoto.png', 1, 'kg', 18, 0, '2021-02-14 13:54:44'),
(178, 'Feijao de corda 500g	', 5508, 'semFoto.png', 1, '500g', 12.6, 0, '2021-02-14 13:54:44'),
(179, 'Feijao de corda debulhado 500g	', 5509, 'semFoto.png', 1, '500g', 12.6, 0, '2021-02-14 13:54:44'),
(180, 'Feijao preto 1kg	', 5510, 'semFoto.png', 1, 'kg', 11.9, 0, '2021-02-14 13:54:44'),
(181, 'Feijao rajadinho 1 kg	', 5584, 'semFoto.png', 1, '1 kg', 13.4, 0, '2021-02-14 13:54:44'),
(182, 'Feijao verde debulhado 500g	', 5603, 'semFoto.png', 1, '500g', 6.3, 0, '2021-02-14 13:54:44'),
(183, 'Feijao Verde feixe 500G	', 5511, 'semFoto.png', 1, '500g', 5.36, 0, '2021-02-14 13:54:44'),
(184, 'Feijao vermelho 	', 4418, 'semFoto.png', 1, 'kg', 16, 0, '2021-02-14 13:54:44'),
(185, 'Figo 	', 5590, 'semFoto.png', 1, '200g', 4.2, 0, '2021-02-14 13:54:44'),
(186, 'Folha de amora 70g	', 5585, 'semFoto.png', 1, '70g', 3.92, 0, '2021-02-14 13:54:44'),
(187, 'Folha de Crajiru	', 5673, 'semFoto.png', 1, '70g', 3.92, 0, '2021-02-14 13:54:44'),
(188, 'Folha de graviola 70g	', 5586, 'semFoto.png', 1, '70g', 3.92, 0, '2021-02-14 13:54:44'),
(189, 'Folha de Louro Desidratada	', 5680, 'semFoto.png', 1, '5g', 3.88, 0, '2021-02-14 13:54:44'),
(190, 'Folha de Vinagreira 100g	', 5512, 'semFoto.png', 1, '100g', 2.8, 0, '2021-02-14 13:54:44'),
(191, 'Framboesa	', 5513, 'semFoto.png', 1, '150g', 5.6, 0, '2021-02-14 13:54:44'),
(192, 'Framboesa congelada	', 5514, 'semFoto.png', 1, 'kg', 23.8, 0, '2021-02-14 13:54:44'),
(193, 'Funcho	', 5415, 'semFoto.png', 1, '250g', 3.36, 0, '2021-02-14 13:54:44'),
(194, 'Gengibre 200g	', 5515, 'semFoto.png', 1, '200g', 5.04, 0, '2021-02-14 13:54:44'),
(195, 'Gengibre 500g	', 5516, 'semFoto.png', 1, '500g', 7, 0, '2021-02-14 13:54:44'),
(196, 'Gengibre KG	', 4752, 'semFoto.png', 1, 'kg', 14, 0, '2021-02-14 13:54:44'),
(197, 'Goiaba 500g 	', 5439, 'semFoto.png', 1, 'Bdj', 5.6, 0, '2021-02-14 13:54:44'),
(198, 'Goiaba kg	', 5440, 'semFoto.png', 1, 'kg', 0, 0, '2021-02-14 13:54:44'),
(199, 'Graviola	', 5517, 'semFoto.png', 1, 'kg', 6.37, 0, '2021-02-14 13:54:44'),
(200, 'Hibisco	', 5466, 'semFoto.png', 1, 'Und', 4.2, 0, '2021-02-14 13:54:44'),
(201, 'Hibisco caixa 	', NULL, 'semFoto.png', 1, '10 kg', 0, 0, '2021-02-14 13:54:44'),
(202, 'Hortela 70g	', 2479, 'semFoto.png', 1, '70g', 2.45, 0, '2021-02-14 13:54:44'),
(203, 'Inga de metro	', 5481, 'semFoto.png', 1, 'um', 4.2, 0, '2021-02-14 13:54:44'),
(204, 'Inhame 1kg	', 2480, 'semFoto.png', 1, 'kg', 8.4, 0, '2021-02-14 13:54:44'),
(205, 'Inhame 500g	', 5263, 'semFoto.png', 1, '500g', 4.9, 0, '2021-02-14 13:54:44'),
(206, 'Inhame granel kg	', 4841, 'semFoto.png', 1, 'kg', 8.4, 0, '2021-02-14 13:54:44'),
(207, 'Jabuticaba 300g	', 5518, 'semFoto.png', 1, 'und', 3.5, 0, '2021-02-14 13:54:44'),
(208, 'Jaca Desidratada	', 3041, 'semFoto.png', 1, 'un', 5.6, 0, '2021-02-14 13:54:44'),
(209, 'Jaca DURA	', 5519, 'semFoto.png', 1, 'kg', 1.61, 0, '2021-02-14 13:54:44'),
(210, 'Jambo Amarelo	', 5521, 'semFoto.png', 1, '500g', 4.48, 0, '2021-02-14 13:54:44'),
(211, 'Jamelao 200g	', NULL, 'semFoto.png', 1, '200g', 0, 0, '2021-02-14 13:54:44'),
(212, 'Jilo 500g	', 2481, 'semFoto.png', 1, '500g', 3.15, 0, '2021-02-14 13:54:44'),
(213, 'Jurubeba 100g	', 5522, 'semFoto.png', 1, '100g', 1.26, 0, '2021-02-14 13:54:44'),
(214, 'Kiwi 	', 5523, 'semFoto.png', 1, 'Bdj', 7.28, 0, '2021-02-14 13:54:44'),
(215, 'Laranja bahia	', 5524, 'semFoto.png', 1, 'kg', 4.16, 0, '2021-02-14 13:54:44'),
(216, 'Laranja cristal 1kg	', 5583, 'semFoto.png', 1, 'kg', 5.82, 0, '2021-02-14 13:54:44'),
(217, 'Laranja Kinkan 200g	', 5476, 'semFoto.png', 1, '200g', 4.2, 0, '2021-02-14 13:54:44'),
(218, 'Laranja lima embalada	', 5526, 'semFoto.png', 1, 'kg', 5.35, 0, '2021-02-14 13:54:44'),
(219, 'Laranja pera	', 5528, 'semFoto.png', 1, 'kg', 5.6, 0, '2021-02-14 13:54:44'),
(220, 'Legumes Processados	', 5631, 'semFoto.png', 1, '500g', 6.65, 0, '2021-02-14 13:54:44'),
(221, 'Lichia 300g	', 5529, 'semFoto.png', 1, '300g', 8.4, 0, '2021-02-14 13:54:44'),
(222, 'Lima da Persia kg	', 5530, 'semFoto.png', 1, 'Kg', 5.6, 0, '2021-02-14 13:54:44'),
(223, 'Lima de bico kg	', 5604, 'semFoto.png', 1, 'Kg', 5.6, 0, '2021-02-14 13:54:44'),
(224, 'Limao China (cravo) 1kg	', 5531, 'semFoto.png', 1, 'kg', 4.9, 0, '2021-02-14 13:54:44'),
(225, 'Limao China (cravo) 500g	', 4753, 'semFoto.png', 1, '500g', 2.45, 0, '2021-02-14 13:54:44'),
(226, 'Limão China (cravo) granel	', 5532, 'semFoto.png', 1, 'kg', 4.2, 0, '2021-02-14 13:54:44'),
(227, 'Limao Doce 	', 5615, 'semFoto.png', 1, '500g', 3.57, 0, '2021-02-14 13:54:44'),
(228, 'Limao Galego 500g	', 5533, 'semFoto.png', 1, '500g', 2.8, 0, '2021-02-14 13:54:44'),
(229, 'Limao Siciliano granel	', 4945, 'semFoto.png', 1, 'kg', 6.3, 0, '2021-02-14 13:54:44'),
(230, 'Limao Tahiti 1kg	', 1927, 'semFoto.png', 1, 'kg', 6.9, 0, '2021-02-14 13:54:44'),
(231, 'Limao Tahiti 500g	', 2560, 'semFoto.png', 1, '500g', 3.8, 0, '2021-02-14 13:54:44'),
(232, 'Maça importada 500g 	', 5535, 'semFoto.png', 1, '500g', 11.2, 0, '2021-02-14 13:54:44'),
(233, 'Maça importada KG	', 5534, 'semFoto.png', 1, 'kg', 25.2, 0, '2021-02-14 13:54:44'),
(234, 'Maça Nacional 500g 	', 5536, 'semFoto.png', 1, '500g', 11.2, 0, '2021-02-14 13:54:44'),
(235, 'Maça Nacional KG	', 5537, 'semFoto.png', 1, 'kg', 12.6, 0, '2021-02-14 13:54:44'),
(236, 'Mamao comum kg	', 5538, 'semFoto.png', 1, 'kg', 3.85, 0, '2021-02-14 13:54:44'),
(237, 'Mamao Formosa	', NULL, 'semFoto.png', 1, 'kg', 5.39, 0, '2021-02-14 13:54:44'),
(238, 'Mamao papaya kg	', 5539, 'semFoto.png', 1, 'KG', 4.9, 0, '2021-02-14 13:54:44'),
(239, 'Mandioca c/ Casca kg	', 2482, 'semFoto.png', 1, 'kg', 4.2, 0, '2021-02-14 13:54:44'),
(240, 'Mandioca descascada 500G	', 5407, 'semFoto.png', 1, '500G', 4.9, 0, '2021-02-14 13:54:44'),
(241, 'Mandioca descascada 750G	', 5408, 'semFoto.png', 1, '750g', 7, 0, '2021-02-14 13:54:44'),
(242, 'Mandioca descascada kg	', 5406, 'semFoto.png', 1, 'kg', 8, 0, '2021-02-14 13:54:44'),
(243, 'Manga a granel kg	', 5542, 'semFoto.png', 1, 'kg', 9.1, 0, '2021-02-14 13:54:44'),
(244, 'Manga comum 1 kg	', 5447, 'semFoto.png', 1, 'pct', 4.2, 0, '2021-02-14 13:54:44'),
(245, 'Manga Espada	', 5541, 'semFoto.png', 1, 'kg', 4.2, 0, '2021-02-14 13:54:44'),
(246, 'Manga Palmer	', 5448, 'semFoto.png', 1, 'kg', 3.5, 0, '2021-02-14 13:54:44'),
(247, 'Manga Rosa 	', 5543, 'semFoto.png', 1, 'kg', 4.2, 0, '2021-02-14 13:54:44'),
(248, 'Manga tommy 	', 5544, 'semFoto.png', 1, 'kg', 9.1, 0, '2021-02-14 13:54:44'),
(249, 'Manjericao 70g	', 2483, 'semFoto.png', 1, '70g', 2.38, 0, '2021-02-14 13:54:44'),
(250, 'Maracujá azedo	', 5645, 'semFoto.png', 1, '500g', 5.6, 0, '2021-02-14 13:54:44'),
(251, 'Maracuja doce	', 5546, 'semFoto.png', 1, 'kg', 9.52, 0, '2021-02-14 13:54:44'),
(252, 'Maracuja Melao	', 5422, 'semFoto.png', 1, 'kg', 7, 0, '2021-02-14 13:54:44'),
(253, 'Maracuja Perola	', 5545, 'semFoto.png', 1, 'kg', 5.32, 0, '2021-02-14 13:54:44'),
(254, 'Mastruz	', 5467, 'semFoto.png', 1, 'mç', 2.1, 0, '2021-02-14 13:54:44'),
(255, 'Maxixe 500g	', 2484, 'semFoto.png', 1, '500g', 2.8, 0, '2021-02-14 13:54:44'),
(256, 'Melancia	', 5548, 'semFoto.png', 1, 'kg', 4.2, 0, '2021-02-14 13:54:44'),
(257, 'Melancia MINI KG	', 5558, 'semFoto.png', 1, 'kg', 5.32, 0, '2021-02-14 13:54:44'),
(258, 'Melao Amarelo 	', 5549, 'semFoto.png', 1, 'kg', 7, 0, '2021-02-14 13:54:44'),
(259, 'Melão Croa	', 1817, 'semFoto.png', 1, 'kg', 6.36, 0, '2021-02-14 13:54:44'),
(260, 'Menta 70g 	', 5416, 'semFoto.png', 1, '70g', 2.41, 0, '2021-02-14 13:54:44'),
(261, 'Menta kg 	', NULL, 'semFoto.png', 1, 'kg', 0, 0, '2021-02-14 13:54:44'),
(262, 'Mexerica   1kg	', 5442, 'semFoto.png', 1, 'kg', 3.15, 0, '2021-02-14 13:54:44'),
(263, 'Mexerica  granel	', 4865, 'semFoto.png', 1, 'kg', 3.15, 0, '2021-02-14 13:54:44'),
(264, 'Mexerica Dekopon kg	', 5557, 'semFoto.png', 1, 'kg', 3.64, 0, '2021-02-14 13:54:44'),
(265, 'Milho Verde 1kg	', 2485, 'semFoto.png', 1, 'kg', 7, 0, '2021-02-14 13:54:44'),
(266, 'Milho Verde 500g	', 4599, 'semFoto.png', 1, '500g', 2.8, 0, '2021-02-14 13:54:44'),
(267, 'Mirtilo 125g	', 5559, 'semFoto.png', 1, '125g', 14, 0, '2021-02-14 13:54:44'),
(268, 'Mirtilo bdj	', 5560, 'semFoto.png', 1, 'bdj', 6.72, 0, '2021-02-14 13:54:44'),
(269, 'Morango 250g	', 5062, 'semFoto.png', 1, '250g', 6.5, 0, '2021-02-14 13:54:44'),
(270, 'Morango Congelado 	', 5171, 'semFoto.png', 1, '1kg', 0, 0, '2021-02-14 13:54:44'),
(271, 'Mostarda	', 2486, 'semFoto.png', 1, 'mç', 2.8, 0, '2021-02-14 13:54:44'),
(272, 'Nabiça	', 5398, 'semFoto.png', 1, 'mç', 2.94, 0, '2021-02-14 13:54:44'),
(273, 'Nabo 500g	', 2487, 'semFoto.png', 1, '500g', 2.94, 0, '2021-02-14 13:54:44'),
(274, 'Nabo Roxo 	', 2487, 'semFoto.png', 1, '500g', 2.94, 0, '2021-02-14 13:54:44'),
(275, 'Nectarina	', 5561, 'semFoto.png', 1, 'Bdj', 7, 0, '2021-02-14 13:54:44'),
(276, 'Nira	', 5468, 'semFoto.png', 1, '150g', 2.8, 0, '2021-02-14 13:54:44'),
(277, 'Ora Pro Nobis 100g	', 5624, 'semFoto.png', 1, '100g', 4.2, 0, '2021-02-14 13:54:44'),
(278, 'Ora Pro Nobis 70g	', NULL, 'semFoto.png', 1, '70g', 4.2, 0, '2021-02-14 13:54:44'),
(279, 'Oregano 70g	', 5425, 'semFoto.png', 1, '70g', 2.45, 0, '2021-02-14 13:54:44'),
(280, 'Ovo caipira duzia	', 5580, 'semFoto.png', 1, 'dz', 11.9, 0, '2021-02-14 13:54:44'),
(281, 'Ovo Orgânico Caipira Ômega 3 	', 5477, 'semFoto.png', 1, 'dez', 16.07, 0, '2021-02-14 13:54:44'),
(282, 'Ovo Orgânico Caipira Pequeno	', 5480, 'semFoto.png', 1, 'dz', 15.43, 0, '2021-02-14 13:54:44'),
(283, 'Ovo Orgânico Caipira Selenio	', 5478, 'semFoto.png', 1, 'dez', 16.07, 0, '2021-02-14 13:54:44'),
(284, 'Ovo Organico Caipira Vermelho 	', 5479, 'semFoto.png', 1, '18 und', 21.64, 0, '2021-02-14 13:54:44'),
(285, 'Ovo organico duzia TF	', 2872, 'semFoto.png', 1, 'dz', 9.2, 0, '2021-02-14 13:54:44'),
(286, 'Peixinho 70g	', 5469, 'semFoto.png', 1, '70g', 2.8, 0, '2021-02-14 13:54:44'),
(287, 'Pepino Caipira 500g	', 5435, 'semFoto.png', 1, '500g', 4.5, 0, '2021-02-14 13:54:44'),
(288, 'Pepino caipira kg granel	', 1615, 'semFoto.png', 1, 'kg', 8.4, 0, '2021-02-14 13:54:44'),
(289, 'Pepino Holandes 300g	', 5562, 'semFoto.png', 1, '300g', 4.2, 0, '2021-02-14 13:54:44'),
(290, 'Pepino Holandes 500g	', 5470, 'semFoto.png', 1, '500g', 4.2, 0, '2021-02-14 13:54:44'),
(291, 'Pepino Japones (granel)	', 5563, 'semFoto.png', 1, 'kg', 6.3, 0, '2021-02-14 13:54:44'),
(292, 'Pepino Japones 500g	', 2488, 'semFoto.png', 1, '500g', 5, 0, '2021-02-14 13:54:44'),
(293, 'Pepino preto 500g	', 5443, 'semFoto.png', 1, '500g', 3.29, 0, '2021-02-14 13:54:44'),
(294, 'Pera importada 	', 894, 'semFoto.png', 1, 'kg', 20.5, 0, '2021-02-14 13:54:44'),
(295, 'Pera importada 500g 	', 2971, 'semFoto.png', 1, '500g', 11.2, 0, '2021-02-14 13:54:44'),
(296, 'Pessego	', 4555, 'semFoto.png', 1, 'Bdj', 9.8, 0, '2021-02-14 13:54:44'),
(297, 'Pessego a granel	', 4560, 'semFoto.png', 1, 'kg', 0, 0, '2021-02-14 13:54:44'),
(298, 'Pimenta Biquinho Amarela	', 5564, 'semFoto.png', 1, '100g', 2.38, 0, '2021-02-14 13:54:44'),
(299, 'Pimenta Biquinho Vermelho	', 5565, 'semFoto.png', 1, '100g', 2.38, 0, '2021-02-14 13:54:44'),
(300, 'Pimenta Bode	', 5566, 'semFoto.png', 1, '100g', 2.38, 0, '2021-02-14 13:54:44'),
(301, 'Pimenta Caiena	', 5567, 'semFoto.png', 1, 'pct', 2.38, 0, '2021-02-14 13:54:44'),
(302, 'Pimenta de Cheiro	', 5568, 'semFoto.png', 1, '70g', 2.38, 0, '2021-02-14 13:54:44'),
(303, 'Pimenta Dedo de Moça	', 5569, 'semFoto.png', 1, '100g', 2.38, 0, '2021-02-14 13:54:44'),
(304, 'Pimenta Malagueta	', 5444, 'semFoto.png', 1, '35g', 2.45, 0, '2021-02-14 13:54:44'),
(305, 'Pimenta rosa	', 5570, 'semFoto.png', 1, '20g', 5.6, 0, '2021-02-14 13:54:44'),
(306, 'Pimenta Tabasco	', 5572, 'semFoto.png', 1, '100g', 2.45, 0, '2021-02-14 13:54:44'),
(307, 'Pimentao Amarelo (granel)	', 5574, 'semFoto.png', 1, 'kg', 15.4, 0, '2021-02-14 13:54:44'),
(308, 'Pimentão Colorido Roxo	', 5734, 'semFoto.png', 1, '300g', 5.6, 0, '2021-02-14 13:54:44'),
(309, 'Pimentão Colorido 	', 5800, 'semFoto.png', 1, '300g', 6.3, 0, '2021-02-14 13:54:44'),
(310, 'Pimentao mini colorido	', 4751, 'semFoto.png', 1, '200g', 5.6, 0, '2021-02-14 13:54:44'),
(311, 'Pimentao Verde 300g	', 2489, 'semFoto.png', 1, '300g', 4.2, 0, '2021-02-14 13:54:44'),
(312, 'Pimentao verde a granel	', 5471, 'semFoto.png', 1, 'kg', 12.6, 0, '2021-02-14 13:54:44'),
(313, 'Pimentão colorido 	', 5575, 'semFoto.png', 1, 'KG', 21, 0, '2021-02-14 13:54:44'),
(314, 'Pimentas 75g	', 3488, 'semFoto.png', 1, '75g', 2.45, 0, '2021-02-14 13:54:44'),
(315, 'Pimetao amarelo	', 5573, 'semFoto.png', 1, '300g', 5.84, 0, '2021-02-14 13:54:44'),
(316, 'Pinha	', 5550, 'semFoto.png', 1, 'KG', 8.4, 0, '2021-02-14 13:54:44'),
(317, 'Pitanga 150g	', 5605, 'semFoto.png', 1, '150g', 3.92, 0, '2021-02-14 13:54:44'),
(318, 'Pitaya (granel)	', 5419, 'semFoto.png', 1, 'kg', 12.6, 0, '2021-02-14 13:54:44'),
(319, 'Poejo	', 5420, 'semFoto.png', 1, '70g', 2.38, 0, '2021-02-14 13:54:44'),
(320, 'Ponkan Granel	', 4948, 'semFoto.png', 1, 'kg', 5.6, 0, '2021-02-14 13:54:44'),
(321, 'Quiabo (granel)	', 5551, 'semFoto.png', 1, 'kg', 9.8, 0, '2021-02-14 13:54:44'),
(322, 'Quiabo 300g	', 2490, 'semFoto.png', 1, '300G', 4.2, 0, '2021-02-14 13:54:44'),
(323, 'Rabanete (granel)	', 5606, 'semFoto.png', 1, 'kg', 5.85, 0, '2021-02-14 13:54:44'),
(324, 'Rabanete c/ folha	', 5396, 'semFoto.png', 1, '600g', 2.94, 0, '2021-02-14 13:54:44'),
(325, 'Rabanete s/ Folha 450g	', 2491, 'semFoto.png', 1, '450g', 2.94, 0, '2021-02-14 13:54:44'),
(326, 'Radichio	', 5426, 'semFoto.png', 1, 'un', 2.8, 0, '2021-02-14 13:54:44'),
(327, 'Repolho Roxo	', 5762, 'semFoto.png', 1, 'un ', 4.2, 0, '2021-02-14 13:54:44'),
(328, 'Repolho Roxo kg	', 4787, 'semFoto.png', 1, 'kg', 4.2, 0, '2021-02-14 13:54:44'),
(329, 'Repolho Roxo restaurante	', NULL, 'semFoto.png', 1, 'kg', 3.92, 0, '2021-02-14 13:54:44'),
(330, 'Repolho Verde KG 	', 2492, 'semFoto.png', 1, 'kg', 4.2, 0, '2021-02-14 13:54:44'),
(331, 'Repolho Verde Restaurante*	', NULL, 'semFoto.png', 1, 'kg', 3.92, 0, '2021-02-14 13:54:44'),
(332, 'Repolho Verde UM	', 5660, 'semFoto.png', 1, 'un ', 4.2, 0, '2021-02-14 13:54:44'),
(333, 'Rucula (250g)	', 2493, 'semFoto.png', 1, '250g', 2.52, 0, '2021-02-14 13:54:44'),
(334, 'Salsa	', 2494, 'semFoto.png', 1, 'mç', 2.1, 0, '2021-02-14 13:54:44'),
(335, 'Salsa Crespa	', 2494, 'semFoto.png', 1, 'und', 2.1, 0, '2021-02-14 13:54:44'),
(336, 'Salsao 350g	', 5472, 'semFoto.png', 1, 'Und', 4.9, 0, '2021-02-14 13:54:44'),
(337, 'Sálvia	', 5473, 'semFoto.png', 1, '70g', 2.8, 0, '2021-02-14 13:54:44'),
(338, 'Seleta de beterraba/chuchu	', 5432, 'semFoto.png', 1, '500g', 4.9, 0, '2021-02-14 13:54:44'),
(339, 'Seleta de legumes chu/bet/cen	', 5432, 'semFoto.png', 1, '500g', 4.9, 0, '2021-02-14 13:54:44'),
(340, 'Seleta de Legumes abob/ chu	', 5432, 'semFoto.png', 1, '500g', 4.9, 0, '2021-02-14 13:54:44'),
(341, 'Seleta de legumes chuchu/cenoura	', 5432, 'semFoto.png', 1, '500g', 4.9, 0, '2021-02-14 13:54:44'),
(342, 'Semente de Coentro 20g	', 3043, 'semFoto.png', 1, '20g', 7, 0, '2021-02-14 13:54:44'),
(343, 'Taioba 300g	', 2495, 'semFoto.png', 1, '300g', 2.8, 0, '2021-02-14 13:54:44'),
(344, 'Tamarindo 300g	', 5552, 'semFoto.png', 1, '300g', 5.35, 0, '2021-02-14 13:54:44'),
(345, 'Thingensai	', 5421, 'semFoto.png', 1, 'mç', 3.36, 0, '2021-02-14 13:54:44'),
(346, 'Tomate Cereja (granel)	', 5553, 'semFoto.png', 1, 'kg', 5.6, 0, '2021-02-14 13:54:44'),
(347, 'Tomate Cereja 500g	', 2496, 'semFoto.png', 1, '500g', 4.9, 0, '2021-02-14 13:54:44'),
(348, 'Tomate Grape  (granel)	', 5607, 'semFoto.png', 1, 'kg', 12.6, 0, '2021-02-14 13:54:44'),
(349, 'Tomate Grape 300g	', 2499, 'semFoto.png', 1, '300g', 5.6, 0, '2021-02-14 13:54:44'),
(350, 'Tomate Grape Amarelo 300g	', 5399, 'semFoto.png', 1, '300g', 5.32, 0, '2021-02-14 13:54:44'),
(351, 'Tomate Holandes 500g	', 5554, 'semFoto.png', 1, '500g', 3.33, 0, '2021-02-14 13:54:44'),
(352, 'Tomate Holandes kg	', 5555, 'semFoto.png', 1, 'kg', 6.65, 0, '2021-02-14 13:54:44'),
(353, 'Tomate Italiano (granel) 	', 1616, 'semFoto.png', 1, 'kg', 6, 0, '2021-02-14 13:54:44'),
(354, 'Tomate Italiano 1kg	', 3067, 'semFoto.png', 1, 'kg', 8.4, 0, '2021-02-14 13:54:44'),
(355, 'Tomate Italiano 500g	', 3601, 'semFoto.png', 1, '500g', 5.6, 0, '2021-02-14 13:54:44'),
(356, 'Tomate Mini Cerejao 300g	', 5609, 'semFoto.png', 1, '300g', 4.9, 0, '2021-02-14 13:54:44'),
(357, 'Tomate Mini Italiano 500g	', 4741, 'semFoto.png', 1, '500g', 5.95, 0, '2021-02-14 13:54:44'),
(358, 'Tomate mini italiano granel	', 5612, 'semFoto.png', 1, 'kg', 11.9, 0, '2021-02-14 13:54:44'),
(359, 'Tomate mini redondo	', 5610, 'semFoto.png', 1, '500g', 4.9, 0, '2021-02-14 13:54:44'),
(360, 'Tomate Salada (M) 1 kg especial	', 5613, 'semFoto.png', 1, 'kg', 5.88, 0, '2021-02-14 13:54:44'),
(361, 'Tomate salada (MESA) (granel) 	', 5402, 'semFoto.png', 1, 'kg', 7, 0, '2021-02-14 13:54:44'),
(362, 'Tomate salada (MESA) 500g	', 2497, 'semFoto.png', 1, '500g', 4.2, 0, '2021-02-14 13:54:44'),
(363, 'Tomate salada (MESA)1kg	', 2498, 'semFoto.png', 1, 'kg', 7.7, 0, '2021-02-14 13:54:44'),
(364, 'Tomilho 70g	', 5474, 'semFoto.png', 1, '70 g', 3.33, 0, '2021-02-14 13:54:44'),
(365, 'Urucum	', 4666, 'semFoto.png', 1, '20g', 4, 0, '2021-02-14 13:54:44'),
(366, 'Urucum em pó 	', 5805, 'semFoto.png', 1, '50g', 5.18, 0, '2021-02-14 13:54:44'),
(367, 'Uva bdj	', 1017, 'semFoto.png', 1, 'Bdj', 7.7, 0, '2021-02-14 13:54:44'),
(368, 'Uva Isabel	', 5556, 'semFoto.png', 1, 'Bdj', 7.7, 0, '2021-02-14 13:54:44'),
(369, 'Uva Niagara	', NULL, 'semFoto.png', 1, 'Bdj', 0, 0, '2021-02-14 13:54:44'),
(370, 'Vagem Comum Restaurante*	', 5611, 'semFoto.png', 1, 'kg', 9.8, 0, '2021-02-14 13:54:44'),
(371, 'Vagem Macarrao (comum) 300g	', 2500, 'semFoto.png', 1, '300g', 4.2, 0, '2021-02-14 13:54:44'),
(372, 'Vagem Paulista (granel)	', 5608, 'semFoto.png', 1, 'kg', 9.8, 0, '2021-02-14 13:54:44'),
(373, 'Vagem Paulista 300g	', 2501, 'semFoto.png', 1, '300g', 4.9, 0, '2021-02-14 13:54:44'),
(374, 'Major Gomes	', 5023, 'semFoto.png', 1, '100g', 4.2, 0, '2021-02-14 13:54:44'),
(375, 'Couve picada 	', 5249, 'semFoto.png', 1, '150g', 4.2, 0, '2021-02-14 13:54:44'),
(376, 'LUIS PIMENTA', 24530, '81ad94d30d454b9cc3641072d14f83c4.png', 0, 'Unidade', 20.9, 5, '2021-02-14 14:55:09');

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
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `cpf_cnpj` (`cpf_cnpj`);

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
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdministrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=377;

--
-- Restrições para despejos de tabelas
--

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
