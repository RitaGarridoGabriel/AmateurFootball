-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Nov-2019 às 18:46
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `futebolamador`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `campos`
--

CREATE TABLE `campos` (
  `Nome_campo` varchar(100) NOT NULL,
  `GPS` varchar(100) DEFAULT NULL,
  `Rua` varchar(100) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `Custo` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `campos`
--

INSERT INTO `campos` (`Nome_campo`, `GPS`, `Rua`, `Numero`, `Cidade`, `Custo`) VALUES
('Campo de Santa Cruz', '40.210715, -8.416967', 'R. Lourenço de Almeida Azevedo', 19, 'Coimbra', 3),
('Campo da Arregaça', '40.200714, -8.413804', 'R. Fonte do Bpo.', 136, 'Coimbra', 3),
('N10_Campo1', '40.249055, -8.439406', 'Estrada Nacional 1 - Pedrulha', 0, 'Coimbra', 3),
('N10_Campo2', '40.248846, -8.439424', 'Rua Vale Paraiso', 0, 'Coimbra', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `capitaes`
--

CREATE TABLE `capitaes` (
  `CC` varchar(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `capitaes`
--

INSERT INTO `capitaes` (`CC`) VALUES
('123056822as5'),
('123066822as5'),
('123456822as5'),
('123456822as6'),
('123456842as5'),
('123466822as5'),
('126056822as5'),
('133456822ds5'),
('133496822ds5');

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipas`
--

CREATE TABLE `equipas` (
  `Nome_equipa` varchar(100) NOT NULL,
  `Estado` tinyint(1) DEFAULT NULL,
  `Nome_torneio` varchar(100) NOT NULL,
  `CC` varchar(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `equipas`
--

INSERT INTO `equipas` (`Nome_equipa`, `Estado`, `Nome_torneio`, `CC`) VALUES
('Equipa F_A', 1, 'Torneio Feminino', '123456822as6'),
('Equipa F_B', 1, 'Torneio Feminino', '123456822as5'),
('Equipa 2_A', 0, 'Torneio_2', '123456842as5'),
('Equipa 3_A', 1, 'Torneio_3', '123466822as5'),
('Equipa 3_B', 1, 'Torneio_3', '133456822ds5'),
('Equipa F_C', 1, 'Torneio Feminino', '123056822as5'),
('Equipa F_D', 1, 'Torneio Feminino', '126056822as5'),
('Equipa 3_C', 1, 'Torneio_3', '133496822ds5'),
('Equipa 3_D', 1, 'Torneio_3', '123066822as5'),
('Equipa 2_B', 0, 'Torneio_2', '193234513ds5');

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipas jogadores`
--

CREATE TABLE `equipas jogadores` (
  `Nome_equipa` varchar(100) NOT NULL,
  `CC` varchar(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `equipas jogadores`
--

INSERT INTO `equipas jogadores` (`Nome_equipa`, `CC`) VALUES
('Equipa 2_A', '123456842as5'),
('Equipa 2_A', '193456822ds5'),
('Equipa 2_A', '195664513ds5'),
('Equipa 2_B', '193234513ds5'),
('Equipa 2_B', '193874322ds5'),
('Equipa 3_A', '123406380er5'),
('Equipa 3_A', '123456828io5'),
('Equipa 3_A', '123466822as5'),
('Equipa 3_A', '130478822as5'),
('Equipa 3_A', '183007642er5'),
('Equipa 3_A', '183758032ao5'),
('Equipa 3_A', '184358022as5'),
('Equipa 3_A', '193234563ds5'),
('Equipa 3_A', '193344322ds5'),
('Equipa 3_A', '193424322ds5'),
('Equipa 3_A', '193452312ds5'),
('Equipa 3_A', '193452322ds5'),
('Equipa 3_A', '195612513ds5'),
('Equipa 3_A', '195661513ds5'),
('Equipa 3_A', '195663613ds5'),
('Equipa 3_A', '198916832ds5'),
('Equipa 3_B', '123456858io5'),
('Equipa 3_B', '123476380er5'),
('Equipa 3_B', '130778822as5'),
('Equipa 3_B', '133456822ds5'),
('Equipa 3_B', '143344322ds5'),
('Equipa 3_B', '183778032ao5'),
('Equipa 3_B', '193264513ds5'),
('Equipa 3_B', '193424322gs5'),
('Equipa 3_B', '193424542ds5'),
('Equipa 3_B', '193452312hs5'),
('Equipa 3_B', '193452352ds5'),
('Equipa 3_B', '193534563ds5'),
('Equipa 3_B', '195212513ds5'),
('Equipa 3_B', '195661513us5'),
('Equipa 3_B', '195663613rs5'),
('Equipa 3_B', '198916832qs5'),
('Equipa 3_C', '123496858io5'),
('Equipa 3_C', '123976380er5'),
('Equipa 3_C', '130778829as5'),
('Equipa 3_C', '133496822ds5'),
('Equipa 3_C', '143349322ds5'),
('Equipa 3_C', '183779032ao5'),
('Equipa 3_C', '193424922gs5'),
('Equipa 3_C', '193452352ds9'),
('Equipa 3_C', '193452912hs5'),
('Equipa 3_C', '193534963ds5'),
('Equipa 3_C', '193924542ds5'),
('Equipa 3_C', '193964513ds5'),
('Equipa 3_C', '195292513ds5'),
('Equipa 3_C', '195661913us5'),
('Equipa 3_C', '195693613rs5'),
('Equipa 3_C', '198996832qs5'),
('Equipa 3_D', '100424322ds5'),
('Equipa 3_D', '103007642er5'),
('Equipa 3_D', '103344322ds5'),
('Equipa 3_D', '103406380er5'),
('Equipa 3_D', '120456828io5'),
('Equipa 3_D', '123066822as5'),
('Equipa 3_D', '130470822as5'),
('Equipa 3_D', '183708032ao5'),
('Equipa 3_D', '184358022as0'),
('Equipa 3_D', '190234563ds5'),
('Equipa 3_D', '190612513ds5'),
('Equipa 3_D', '193002322ds5'),
('Equipa 3_D', '193052312ds5'),
('Equipa 3_D', '195660013ds5'),
('Equipa 3_D', '195660613ds5'),
('Equipa 3_D', '198916802ds5'),
('Equipa F_A', '123456822as6'),
('Equipa F_A', '123478682as6'),
('Equipa F_A', '125456822as5'),
('Equipa F_A', '134456822as5'),
('Equipa F_A', '183456852er5'),
('Equipa F_A', '183756852as5'),
('Equipa F_A', '184456822as5'),
('Equipa F_A', '185456822as5'),
('Equipa F_A', '193445822as5'),
('Equipa F_A', '193452324as5'),
('Equipa F_A', '193456822as5'),
('Equipa F_A', '193456852as5'),
('Equipa F_A', '193456852er5'),
('Equipa F_A', '193459852er5'),
('Equipa F_A', '193756852as5'),
('Equipa F_A', '198916832ds5'),
('Equipa F_B', '113467852er5'),
('Equipa F_B', '123456822as5'),
('Equipa F_B', '123456852er5'),
('Equipa F_B', '123678682as6'),
('Equipa F_B', '134456452as5'),
('Equipa F_B', '183755652as5'),
('Equipa F_B', '184656822as5'),
('Equipa F_B', '185476822as5'),
('Equipa F_B', '193447622as5'),
('Equipa F_B', '193454322ds5'),
('Equipa F_B', '193454342ds5'),
('Equipa F_B', '193459852eh5'),
('Equipa F_B', '193482324as5'),
('Equipa F_B', '193654322ds5'),
('Equipa F_B', '193756892as5'),
('Equipa F_B', '198936822ds5'),
('Equipa F_C', '113007842er5'),
('Equipa F_C', '123056822as5'),
('Equipa F_C', '123406850er5'),
('Equipa F_C', '123608682as6'),
('Equipa F_C', '134056452as5'),
('Equipa F_C', '180476822as5'),
('Equipa F_C', '183755052ao5'),
('Equipa F_C', '184056022as5'),
('Equipa F_C', '190059852eh5'),
('Equipa F_C', '193054322ds5'),
('Equipa F_C', '193440622as5'),
('Equipa F_C', '193450342ds5'),
('Equipa F_C', '193480324as5'),
('Equipa F_C', '193654022ds5'),
('Equipa F_C', '193756092as5'),
('Equipa F_C', '198936022ds5'),
('Equipa F_D', '113007642er5'),
('Equipa F_D', '123406350er5'),
('Equipa F_D', '126056822as5'),
('Equipa F_D', '130476822as5'),
('Equipa F_D', '163480324as5'),
('Equipa F_D', '163608682as6'),
('Equipa F_D', '183755032ao5'),
('Equipa F_D', '184356022as5'),
('Equipa F_D', '190659852eh5'),
('Equipa F_D', '193054362ds5'),
('Equipa F_D', '193440662as5'),
('Equipa F_D', '193460342ds5'),
('Equipa F_D', '193654022ds6'),
('Equipa F_D', '196756092as5'),
('Equipa F_D', '198636022ds5'),
('Equipa F_D', '634056452as5');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gestores_torneio`
--

CREATE TABLE `gestores_torneio` (
  `CC` varchar(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `gestores_torneio`
--

INSERT INTO `gestores_torneio` (`CC`) VALUES
('123456822as5'),
('123456822as6'),
('123456842as5'),
('123466822as5'),
('125456822as5'),
('183755052ao5'),
('193234513ds5'),
('193456822ds5');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gestores_torneio torneios`
--

CREATE TABLE `gestores_torneio torneios` (
  `CC` varchar(12) NOT NULL,
  `Nome_torneio` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `gestores_torneio torneios`
--

INSERT INTO `gestores_torneio torneios` (`CC`, `Nome_torneio`) VALUES
('123456822as5', 'Torneio Feminino'),
('123456822as5', 'Torneio_2'),
('123456822as6', 'Torneio_2'),
('123456842as5', 'Torneio Feminino'),
('123466822as5', 'Torneio_3'),
('125456822as5', 'Torneio_2'),
('183755052ao5', 'Torneio_3'),
('193456822ds5', 'Torneio_3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogadores`
--

CREATE TABLE `jogadores` (
  `CC` varchar(12) NOT NULL,
  `Prioridade_conv` int(11) DEFAULT NULL,
  `Numero_falhas` int(11) DEFAULT NULL,
  `Saldo` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jogadores`
--

INSERT INTO `jogadores` (`CC`, `Prioridade_conv`, `Numero_falhas`, `Saldo`) VALUES
('123456822as6', 0, 0, 0),
('125456822as5', 0, 0, 0),
('193456822as5', 0, 0, 0),
('193456852as5', 0, 0, 0),
('193445822as5', 0, 0, 0),
('134456822as5', 0, 0, 0),
('193452324as5', 0, 0, 0),
('193456852er5', 0, 0, 0),
('123478682as6', 0, 0, 0),
('193459852er5', 0, 0, 0),
('193756852as5', 0, 0, 0),
('185456822as5', 0, 0, 0),
('184456822as5', 0, 0, 0),
('183756852as5', 0, 0, 0),
('183456852er5', 0, 0, 0),
('193467852er5', 0, 0, 0),
('123456822as5', 0, 0, 0),
('198936822ds5', 0, 0, 0),
('193454322ds5', 0, 0, 0),
('193447622as5', 0, 0, 0),
('134456452as5', 0, 0, 0),
('193482324as5', 0, 0, 0),
('193654322ds5', 0, 0, 0),
('193454342ds5', 0, 0, 0),
('123678682as6', 0, 0, 0),
('193756892as5', 0, 0, 0),
('193459852eh5', 0, 0, 0),
('185476822as5', 0, 0, 0),
('184656822as5', 0, 0, 0),
('183755652as5', 0, 0, 0),
('123456852er5', 0, 0, 0),
('113467852er5', 0, 0, 0),
('198936022ds5', 0, 0, 0),
('123056822as5', 0, 0, 0),
('193440622as5', 0, 0, 0),
('134056452as5', 0, 0, 0),
('193480324as5', 0, 0, 0),
('193054322ds5', 0, 0, 0),
('193654022ds5', 0, 0, 0),
('193450342ds5', 0, 0, 0),
('123608682as6', 0, 0, 0),
('193756092as5', 0, 0, 0),
('190059852eh5', 0, 0, 0),
('113007842er5', 0, 0, 0),
('184056022as5', 0, 0, 0),
('183755052ao5', 0, 0, 0),
('123406850er5', 0, 0, 0),
('180476822as5', 0, 0, 0),
('123456842as5', 0, 0, 0),
('193456822ds5', 0, 0, 0),
('123466822as5', 0, 0, 0),
('193234563ds5', 0, 0, 0),
('123456828io5', 0, 0, 0),
('193452322ds5', 0, 0, 0),
('193424322ds5', 0, 0, 0),
('193452312ds5', 0, 0, 0),
('198916832ds5', 0, 0, 0),
('195663613ds5', 0, 0, 0),
('195661513ds5', 0, 0, 0),
('195612513ds5', 0, 0, 0),
('193344322ds5', 0, 0, 0),
('183007642er5', 0, 0, 0),
('184358022as5', 0, 0, 0),
('183758032ao5', 0, 0, 0),
('123406380er5', 0, 0, 0),
('130478822as5', 0, 0, 0),
('193534563ds5', 0, 0, 0),
('123456858io5', 0, 0, 0),
('193452352ds5', 0, 0, 0),
('193424322gs5', 0, 0, 0),
('193452312hs5', 0, 0, 0),
('195661513us5', 0, 0, 0),
('198916832qs5', 0, 0, 0),
('195663613rs5', 0, 0, 0),
('133456822ds5', 0, 0, 0),
('195212513ds5', 0, 0, 0),
('143344322ds5', 0, 0, 0),
('193424542ds5', 0, 0, 0),
('193264513ds5', 0, 0, 0),
('183778032ao5', 0, 0, 0),
('123476380er5', 0, 0, 0),
('130778822as5', 0, 0, 0),
('193534963ds5', 0, 0, 0),
('123496858io5', 0, 0, 0),
('193452352ds9', 0, 0, 0),
('193424922gs5', 0, 0, 0),
('193452912hs5', 0, 0, 0),
('195661913us5', 0, 0, 0),
('198996832qs5', 0, 0, 0),
('195693613rs5', 0, 0, 0),
('133496822ds5', 0, 0, 0),
('195292513ds5', 0, 0, 0),
('143349322ds5', 0, 0, 0),
('193924542ds5', 0, 0, 0),
('193964513ds5', 0, 0, 0),
('183779032ao5', 0, 0, 0),
('123976380er5', 0, 0, 0),
('130778829as5', 0, 0, 0),
('190234563ds5', 0, 0, 0),
('193002322ds5', 0, 0, 0),
('100424322ds5', 0, 0, 0),
('193052312ds5', 0, 0, 0),
('195660013ds5', 0, 0, 0),
('198916802ds5', 0, 0, 0),
('195660613ds5', 0, 0, 0),
('123066822as5', 0, 0, 0),
('190612513ds5', 0, 0, 0),
('103344322ds5', 0, 0, 0),
('103007642er5', 0, 0, 0),
('184358022as0', 0, 0, 0),
('183708032ao5', 0, 0, 0),
('103406380er5', 0, 0, 0),
('130470822as5', 0, 0, 0),
('120456828io5', 0, 0, 0),
('198636022ds5', 0, 0, 0),
('126056822as5', 0, 0, 0),
('193440662as5', 0, 0, 0),
('634056452as5', 0, 0, 0),
('163480324as5', 0, 0, 0),
('193054362ds5', 0, 0, 0),
('193654022ds6', 0, 0, 0),
('193460342ds5', 0, 0, 0),
('163608682as6', 0, 0, 0),
('196756092as5', 0, 0, 0),
('190659852eh5', 0, 0, 0),
('113007642er5', 0, 0, 0),
('184356022as5', 0, 0, 0),
('183755032ao5', 0, 0, 0),
('123406350er5', 0, 0, 0),
('130476822as5', 0, 0, 0),
('195664513ds5', 0, 0, 20),
('193874322ds5', 0, 0, 20),
('193234513ds5', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogadores_jogo`
--

CREATE TABLE `jogadores_jogo` (
  `id_jogo` int(11) NOT NULL,
  `Nome_torneio` varchar(100) NOT NULL,
  `CC` varchar(12) NOT NULL,
  `Nome_equipa` varchar(100) NOT NULL,
  `Posicao` varchar(100) DEFAULT NULL,
  `Suplente` tinyint(1) DEFAULT NULL,
  `Golos_marcados` int(11) DEFAULT NULL,
  `Pediu_subs` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jogadores_jogo`
--

INSERT INTO `jogadores_jogo` (`id_jogo`, `Nome_torneio`, `CC`, `Nome_equipa`, `Posicao`, `Suplente`, `Golos_marcados`, `Pediu_subs`) VALUES
(1, 'Torneio Feminino', '125456822as5', 'Equipa F_A', 'Guarda-redes', 0, 0, 0),
(1, 'Torneio Feminino', '193456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(1, 'Torneio Feminino', '193456852as5', 'Equipa F_A', 'Médio', 0, 0, 0),
(1, 'Torneio Feminino', '123456822as6', 'Equipa F_A', 'Médio', 0, 1, 0),
(1, 'Torneio Feminino', '193445822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(1, 'Torneio Feminino', '134456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(1, 'Torneio Feminino', '193452324as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(1, 'Torneio Feminino', '193456852er5', 'Equipa F_A', 'Médio', 0, 0, 0),
(1, 'Torneio Feminino', '123478682as6', 'Equipa F_A', 'Avançado', 0, 0, 0),
(1, 'Torneio Feminino', '193459852er5', 'Equipa F_A', 'Avançado', 0, 0, 0),
(1, 'Torneio Feminino', '193756852as5', 'Equipa F_A', 'Ponta de lança', 0, 0, 0),
(1, 'Torneio Feminino', '185456822as5', 'Equipa F_A', 'Guarda-redes', 1, 0, 0),
(1, 'Torneio Feminino', '184456822as5', 'Equipa F_A', 'Defesa', 1, 0, 0),
(1, 'Torneio Feminino', '183756852as5', 'Equipa F_A', 'Ponta de lança', 1, 0, 0),
(1, 'Torneio Feminino', '183456852er5', 'Equipa F_A', 'Médio', 1, 0, 0),
(1, 'Torneio Feminino', '193467852er5', 'Equipa F_A', 'Avançado', 1, 0, 0),
(1, 'Torneio Feminino', '123456822as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(1, 'Torneio Feminino', '198936822ds5', 'Equipa F_B', 'Guarda-redes', 0, 0, 0),
(1, 'Torneio Feminino', '193454322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(1, 'Torneio Feminino', '193447622as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(1, 'Torneio Feminino', '134456452as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(1, 'Torneio Feminino', '193482324as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(1, 'Torneio Feminino', '193654322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(1, 'Torneio Feminino', '193454342ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(1, 'Torneio Feminino', '123678682as6', 'Equipa F_B', 'Avançado', 0, 0, 0),
(1, 'Torneio Feminino', '193756892as5', 'Equipa F_B', 'Ponta de lança', 0, 0, 0),
(1, 'Torneio Feminino', '193459852eh5', 'Equipa F_B', 'Avançado', 0, 0, 0),
(1, 'Torneio Feminino', '185476822as5', 'Equipa F_B', 'Guarda-redes', 1, 0, 0),
(1, 'Torneio Feminino', '184656822as5', 'Equipa F_B', 'Defesa', 1, 0, 0),
(1, 'Torneio Feminino', '183755652as5', 'Equipa F_B', 'Ponta de lança', 1, 0, 0),
(1, 'Torneio Feminino', '123456852er5', 'Equipa F_B', 'Médio', 1, 0, 0),
(1, 'Torneio Feminino', '113467852er5', 'Equipa F_B', 'Avançado', 1, 0, 0),
(2, 'Torneio Feminino', '123056822as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(2, 'Torneio Feminino', '193440622as5', 'Equipa F_C', 'Defesa', 0, 2, 0),
(2, 'Torneio Feminino', '134056452as5', 'Equipa F_C', 'Defesa', 0, 3, 0),
(2, 'Torneio Feminino', '193480324as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(2, 'Torneio Feminino', '193054322ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(2, 'Torneio Feminino', '193654022ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(2, 'Torneio Feminino', '193450342ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(2, 'Torneio Feminino', '123608682as6', 'Equipa F_C', 'Avançado', 0, 0, 0),
(2, 'Torneio Feminino', '193756092as5', 'Equipa F_C', 'Ponta de lança', 0, 0, 0),
(2, 'Torneio Feminino', '190059852eh5', 'Equipa F_C', 'Avançado', 0, 0, 0),
(2, 'Torneio Feminino', '113007842er5', 'Equipa F_C', 'Guarda-redes', 1, 0, 0),
(2, 'Torneio Feminino', '184056022as5', 'Equipa F_C', 'Defesa', 1, 0, 0),
(2, 'Torneio Feminino', '183755052ao5', 'Equipa F_C', 'Ponta de lança', 1, 0, 0),
(2, 'Torneio Feminino', '198936022ds5', 'Equipa F_C', 'Guarda-redes', 0, 0, 0),
(2, 'Torneio Feminino', '123406850er5', 'Equipa F_C', 'Médio', 1, 0, 0),
(2, 'Torneio Feminino', '180476822as5', 'Equipa F_C', 'Avançado', 1, 0, 0),
(2, 'Torneio Feminino', '198636022ds5', 'Equipa F_D', 'Guarda-redes', 0, 0, 0),
(2, 'Torneio Feminino', '126056822as5', 'Equipa F_D', 'Defesa', 0, 2, 0),
(2, 'Torneio Feminino', '193440662as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(2, 'Torneio Feminino', '634056452as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(2, 'Torneio Feminino', '163480324as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(2, 'Torneio Feminino', '193054362ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(2, 'Torneio Feminino', '193654022ds6', 'Equipa F_D', 'Médio', 0, 0, 0),
(2, 'Torneio Feminino', '193460342ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(2, 'Torneio Feminino', '163608682as6', 'Equipa F_D', 'Avançado', 0, 0, 0),
(2, 'Torneio Feminino', '196756092as5', 'Equipa F_D', 'Ponta de lança', 0, 0, 0),
(2, 'Torneio Feminino', '190659852eh5', 'Equipa F_D', 'Avançado', 0, 0, 0),
(2, 'Torneio Feminino', '113007642er5', 'Equipa F_D', 'Guarda-redes', 1, 0, 0),
(2, 'Torneio Feminino', '184356022as5', 'Equipa F_D', 'Defesa', 1, 0, 0),
(2, 'Torneio Feminino', '183755032ao5', 'Equipa F_D', 'Ponta de lança', 1, 0, 0),
(2, 'Torneio Feminino', '123406350er5', 'Equipa F_D', 'Médio', 1, 0, 0),
(2, 'Torneio Feminino', '130476822as5', 'Equipa F_D', 'Avançado', 1, 0, 0),
(3, 'Torneio Feminino', '125456822as5', 'Equipa F_A', 'Guarda-redes', 0, 0, 0),
(3, 'Torneio Feminino', '193456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(3, 'Torneio Feminino', '193456852as5', 'Equipa F_A', 'Médio', 0, 0, 0),
(3, 'Torneio Feminino', '123456822as6', 'Equipa F_A', 'Médio', 0, 0, 0),
(3, 'Torneio Feminino', '193445822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(3, 'Torneio Feminino', '134456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(3, 'Torneio Feminino', '193452324as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(3, 'Torneio Feminino', '193456852er5', 'Equipa F_A', 'Médio', 0, 0, 0),
(3, 'Torneio Feminino', '123478682as6', 'Equipa F_A', 'Avançado', 0, 0, 0),
(3, 'Torneio Feminino', '193459852er5', 'Equipa F_A', 'Avançado', 0, 0, 0),
(3, 'Torneio Feminino', '193756852as5', 'Equipa F_A', 'Ponta de lança', 0, 0, 0),
(3, 'Torneio Feminino', '185456822as5', 'Equipa F_A', 'Guarda-redes', 1, 0, 0),
(3, 'Torneio Feminino', '184456822as5', 'Equipa F_A', 'Defesa', 1, 0, 0),
(3, 'Torneio Feminino', '183756852as5', 'Equipa F_A', 'Ponta de lança', 1, 0, 0),
(3, 'Torneio Feminino', '183456852er5', 'Equipa F_A', 'Médio', 1, 0, 0),
(3, 'Torneio Feminino', '193467852er5', 'Equipa F_A', 'Avançado', 1, 0, 0),
(3, 'Torneio Feminino', '198936022ds5', 'Equipa F_C', 'Guarda-redes', 0, 0, 0),
(3, 'Torneio Feminino', '123056822as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(3, 'Torneio Feminino', '193440622as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(3, 'Torneio Feminino', '134056452as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(3, 'Torneio Feminino', '193480324as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(3, 'Torneio Feminino', '193054322ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(3, 'Torneio Feminino', '193654022ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(3, 'Torneio Feminino', '193450342ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(3, 'Torneio Feminino', '123608682as6', 'Equipa F_C', 'Avançado', 0, 0, 0),
(3, 'Torneio Feminino', '193756092as5', 'Equipa F_C', 'Ponta de lança', 0, 0, 0),
(3, 'Torneio Feminino', '190059852eh5', 'Equipa F_C', 'Avançado', 0, 0, 0),
(3, 'Torneio Feminino', '113007842er5', 'Equipa F_C', 'Guarda-redes', 1, 0, 0),
(3, 'Torneio Feminino', '184056022as5', 'Equipa F_C', 'Defesa', 1, 0, 0),
(3, 'Torneio Feminino', '183755052ao5', 'Equipa F_C', 'Ponta de lança', 1, 0, 0),
(3, 'Torneio Feminino', '123406850er5', 'Equipa F_C', 'Médio', 1, 0, 0),
(3, 'Torneio Feminino', '180476822as5', 'Equipa F_C', 'Avançado', 1, 0, 0),
(4, 'Torneio Feminino', '123456822as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(4, 'Torneio Feminino', '198936822ds5', 'Equipa F_B', 'Guarda-redes', 0, 0, 0),
(4, 'Torneio Feminino', '193454322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(4, 'Torneio Feminino', '193447622as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(4, 'Torneio Feminino', '134456452as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(4, 'Torneio Feminino', '193482324as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(4, 'Torneio Feminino', '193654322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(4, 'Torneio Feminino', '193454342ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(4, 'Torneio Feminino', '123678682as6', 'Equipa F_B', 'Avançado', 0, 0, 0),
(4, 'Torneio Feminino', '193756892as5', 'Equipa F_B', 'Ponta de lança', 0, 1, 0),
(4, 'Torneio Feminino', '193459852eh5', 'Equipa F_B', 'Avançado', 0, 0, 0),
(4, 'Torneio Feminino', '185476822as5', 'Equipa F_B', 'Guarda-redes', 1, 0, 0),
(4, 'Torneio Feminino', '184656822as5', 'Equipa F_B', 'Defesa', 1, 0, 0),
(4, 'Torneio Feminino', '183755652as5', 'Equipa F_B', 'Ponta de lança', 1, 0, 0),
(4, 'Torneio Feminino', '123456852er5', 'Equipa F_B', 'Médio', 1, 0, 0),
(4, 'Torneio Feminino', '113467852er5', 'Equipa F_B', 'Avançado', 1, 0, 0),
(4, 'Torneio Feminino', '198636022ds5', 'Equipa F_D', 'Guarda-redes', 0, 0, 0),
(4, 'Torneio Feminino', '126056822as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(4, 'Torneio Feminino', '193440662as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(4, 'Torneio Feminino', '634056452as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(4, 'Torneio Feminino', '163480324as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(4, 'Torneio Feminino', '193054362ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(4, 'Torneio Feminino', '193654022ds6', 'Equipa F_D', 'Médio', 0, 0, 0),
(4, 'Torneio Feminino', '193460342ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(4, 'Torneio Feminino', '163608682as6', 'Equipa F_D', 'Avançado', 0, 0, 0),
(4, 'Torneio Feminino', '196756092as5', 'Equipa F_D', 'Ponta de lança', 0, 0, 0),
(4, 'Torneio Feminino', '190659852eh5', 'Equipa F_D', 'Avançado', 0, 0, 0),
(4, 'Torneio Feminino', '113007642er5', 'Equipa F_D', 'Guarda-redes', 1, 0, 0),
(4, 'Torneio Feminino', '184356022as5', 'Equipa F_D', 'Defesa', 1, 0, 0),
(4, 'Torneio Feminino', '183755032ao5', 'Equipa F_D', 'Ponta de lança', 1, 0, 0),
(4, 'Torneio Feminino', '123406350er5', 'Equipa F_D', 'Médio', 1, 0, 0),
(4, 'Torneio Feminino', '130476822as5', 'Equipa F_D', 'Avançado', 1, 0, 0),
(5, 'Torneio Feminino', '125456822as5', 'Equipa F_A', 'Guarda-redes', 0, 0, 0),
(5, 'Torneio Feminino', '193456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(5, 'Torneio Feminino', '193456852as5', 'Equipa F_A', 'Médio', 0, 0, 0),
(5, 'Torneio Feminino', '123456822as6', 'Equipa F_A', 'Médio', 0, 0, 0),
(5, 'Torneio Feminino', '193445822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(5, 'Torneio Feminino', '134456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(5, 'Torneio Feminino', '193452324as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(5, 'Torneio Feminino', '193456852er5', 'Equipa F_A', 'Médio', 0, 0, 0),
(5, 'Torneio Feminino', '123478682as6', 'Equipa F_A', 'Avançado', 0, 0, 0),
(5, 'Torneio Feminino', '193459852er5', 'Equipa F_A', 'Avançado', 0, 0, 0),
(5, 'Torneio Feminino', '193756852as5', 'Equipa F_A', 'Ponta de lança', 0, 0, 0),
(5, 'Torneio Feminino', '185456822as5', 'Equipa F_A', 'Guarda-redes', 1, 0, 0),
(5, 'Torneio Feminino', '184456822as5', 'Equipa F_A', 'Defesa', 1, 0, 0),
(5, 'Torneio Feminino', '183756852as5', 'Equipa F_A', 'Ponta de lança', 1, 0, 0),
(5, 'Torneio Feminino', '183456852er5', 'Equipa F_A', 'Médio', 1, 0, 0),
(5, 'Torneio Feminino', '193467852er5', 'Equipa F_A', 'Avançado', 1, 0, 0),
(5, 'Torneio Feminino', '198636022ds5', 'Equipa F_D', 'Guarda-redes', 0, 0, 0),
(5, 'Torneio Feminino', '126056822as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(5, 'Torneio Feminino', '193440662as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(5, 'Torneio Feminino', '634056452as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(5, 'Torneio Feminino', '163480324as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(5, 'Torneio Feminino', '193054362ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(5, 'Torneio Feminino', '193654022ds6', 'Equipa F_D', 'Médio', 0, 0, 0),
(5, 'Torneio Feminino', '193460342ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(5, 'Torneio Feminino', '163608682as6', 'Equipa F_D', 'Avançado', 0, 0, 0),
(5, 'Torneio Feminino', '196756092as5', 'Equipa F_D', 'Ponta de lança', 0, 0, 0),
(5, 'Torneio Feminino', '190659852eh5', 'Equipa F_D', 'Avançado', 0, 0, 0),
(5, 'Torneio Feminino', '113007642er5', 'Equipa F_D', 'Guarda-redes', 1, 0, 0),
(5, 'Torneio Feminino', '184356022as5', 'Equipa F_D', 'Defesa', 1, 0, 0),
(5, 'Torneio Feminino', '183755032ao5', 'Equipa F_D', 'Ponta de lança', 1, 0, 0),
(5, 'Torneio Feminino', '123406350er5', 'Equipa F_D', 'Médio', 1, 0, 0),
(5, 'Torneio Feminino', '130476822as5', 'Equipa F_D', 'Avançado', 1, 0, 0),
(6, 'Torneio Feminino', '123456822as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(6, 'Torneio Feminino', '198936822ds5', 'Equipa F_B', 'Guarda-redes', 0, 0, 0),
(6, 'Torneio Feminino', '193454322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(6, 'Torneio Feminino', '193447622as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(6, 'Torneio Feminino', '134456452as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(6, 'Torneio Feminino', '193482324as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(6, 'Torneio Feminino', '193654322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(6, 'Torneio Feminino', '193454342ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(6, 'Torneio Feminino', '123678682as6', 'Equipa F_B', 'Avançado', 0, 0, 0),
(6, 'Torneio Feminino', '193756892as5', 'Equipa F_B', 'Ponta de lança', 0, 0, 0),
(6, 'Torneio Feminino', '193459852eh5', 'Equipa F_B', 'Avançado', 0, 0, 0),
(6, 'Torneio Feminino', '185476822as5', 'Equipa F_B', 'Guarda-redes', 1, 0, 0),
(6, 'Torneio Feminino', '184656822as5', 'Equipa F_B', 'Defesa', 1, 0, 0),
(6, 'Torneio Feminino', '183755652as5', 'Equipa F_B', 'Ponta de lança', 1, 0, 0),
(6, 'Torneio Feminino', '123456852er5', 'Equipa F_B', 'Médio', 1, 0, 0),
(6, 'Torneio Feminino', '113467852er5', 'Equipa F_B', 'Avançado', 1, 0, 0),
(6, 'Torneio Feminino', '198936022ds5', 'Equipa F_C', 'Guarda-redes', 0, 0, 0),
(6, 'Torneio Feminino', '123056822as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(6, 'Torneio Feminino', '193440622as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(6, 'Torneio Feminino', '134056452as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(6, 'Torneio Feminino', '193480324as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(6, 'Torneio Feminino', '193054322ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(6, 'Torneio Feminino', '193654022ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(6, 'Torneio Feminino', '193450342ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(6, 'Torneio Feminino', '123608682as6', 'Equipa F_C', 'Avançado', 0, 0, 0),
(6, 'Torneio Feminino', '193756092as5', 'Equipa F_C', 'Ponta de lança', 0, 2, 0),
(6, 'Torneio Feminino', '190059852eh5', 'Equipa F_C', 'Avançado', 0, 0, 0),
(6, 'Torneio Feminino', '113007842er5', 'Equipa F_C', 'Guarda-redes', 1, 0, 0),
(6, 'Torneio Feminino', '184056022as5', 'Equipa F_C', 'Defesa', 1, 0, 0),
(6, 'Torneio Feminino', '183755052ao5', 'Equipa F_C', 'Ponta de lança', 1, 0, 0),
(6, 'Torneio Feminino', '123406850er5', 'Equipa F_C', 'Médio', 1, 0, 0),
(6, 'Torneio Feminino', '180476822as5', 'Equipa F_C', 'Avançado', 1, 0, 0),
(7, 'Torneio Feminino', '125456822as5', 'Equipa F_A', 'Guarda-redes', 0, 0, 0),
(7, 'Torneio Feminino', '193456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(7, 'Torneio Feminino', '193456852as5', 'Equipa F_A', 'Médio', 0, 0, 0),
(7, 'Torneio Feminino', '123456822as6', 'Equipa F_A', 'Médio', 0, 0, 0),
(7, 'Torneio Feminino', '193445822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(7, 'Torneio Feminino', '134456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(7, 'Torneio Feminino', '193452324as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(7, 'Torneio Feminino', '193456852er5', 'Equipa F_A', 'Médio', 0, 0, 0),
(7, 'Torneio Feminino', '123478682as6', 'Equipa F_A', 'Avançado', 0, 0, 0),
(7, 'Torneio Feminino', '193459852er5', 'Equipa F_A', 'Avançado', 0, 0, 0),
(7, 'Torneio Feminino', '193756852as5', 'Equipa F_A', 'Ponta de lança', 0, 0, 0),
(7, 'Torneio Feminino', '185456822as5', 'Equipa F_A', 'Guarda-redes', 1, 0, 0),
(7, 'Torneio Feminino', '184456822as5', 'Equipa F_A', 'Defesa', 1, 0, 0),
(7, 'Torneio Feminino', '183756852as5', 'Equipa F_A', 'Ponta de lança', 1, 0, 0),
(7, 'Torneio Feminino', '183456852er5', 'Equipa F_A', 'Médio', 1, 0, 0),
(7, 'Torneio Feminino', '193467852er5', 'Equipa F_A', 'Avançado', 1, 0, 0),
(7, 'Torneio Feminino', '123456822as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(7, 'Torneio Feminino', '198936822ds5', 'Equipa F_B', 'Guarda-redes', 0, 0, 0),
(7, 'Torneio Feminino', '193454322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(7, 'Torneio Feminino', '193447622as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(7, 'Torneio Feminino', '134456452as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(7, 'Torneio Feminino', '193482324as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(7, 'Torneio Feminino', '193654322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(7, 'Torneio Feminino', '193454342ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(7, 'Torneio Feminino', '123678682as6', 'Equipa F_B', 'Avançado', 0, 2, 0),
(7, 'Torneio Feminino', '193756892as5', 'Equipa F_B', 'Ponta de lança', 0, 0, 0),
(7, 'Torneio Feminino', '193459852eh5', 'Equipa F_B', 'Avançado', 0, 1, 0),
(7, 'Torneio Feminino', '185476822as5', 'Equipa F_B', 'Guarda-redes', 1, 0, 0),
(7, 'Torneio Feminino', '184656822as5', 'Equipa F_B', 'Defesa', 1, 0, 0),
(7, 'Torneio Feminino', '183755652as5', 'Equipa F_B', 'Ponta de lança', 1, 0, 0),
(7, 'Torneio Feminino', '123456852er5', 'Equipa F_B', 'Médio', 1, 0, 0),
(7, 'Torneio Feminino', '113467852er5', 'Equipa F_B', 'Avançado', 1, 0, 0),
(8, 'Torneio Feminino', '198936022ds5', 'Equipa F_C', 'Guarda-redes', 0, 0, 0),
(8, 'Torneio Feminino', '123056822as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(8, 'Torneio Feminino', '193440622as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(8, 'Torneio Feminino', '134056452as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(8, 'Torneio Feminino', '193480324as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(8, 'Torneio Feminino', '193054322ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(8, 'Torneio Feminino', '193654022ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(8, 'Torneio Feminino', '193450342ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(8, 'Torneio Feminino', '123608682as6', 'Equipa F_C', 'Avançado', 0, 0, 0),
(8, 'Torneio Feminino', '193756092as5', 'Equipa F_C', 'Ponta de lança', 0, 0, 0),
(8, 'Torneio Feminino', '190059852eh5', 'Equipa F_C', 'Avançado', 0, 0, 0),
(8, 'Torneio Feminino', '113007842er5', 'Equipa F_C', 'Guarda-redes', 1, 0, 0),
(8, 'Torneio Feminino', '184056022as5', 'Equipa F_C', 'Defesa', 1, 0, 0),
(8, 'Torneio Feminino', '183755052ao5', 'Equipa F_C', 'Ponta de lança', 1, 0, 0),
(8, 'Torneio Feminino', '123406850er5', 'Equipa F_C', 'Médio', 1, 0, 0),
(8, 'Torneio Feminino', '180476822as5', 'Equipa F_C', 'Avançado', 1, 0, 0),
(8, 'Torneio Feminino', '198636022ds5', 'Equipa F_D', 'Guarda-redes', 0, 0, 0),
(8, 'Torneio Feminino', '126056822as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(8, 'Torneio Feminino', '193440662as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(8, 'Torneio Feminino', '634056452as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(8, 'Torneio Feminino', '163480324as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(8, 'Torneio Feminino', '193054362ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(8, 'Torneio Feminino', '193654022ds6', 'Equipa F_D', 'Médio', 0, 0, 0),
(8, 'Torneio Feminino', '193460342ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(8, 'Torneio Feminino', '163608682as6', 'Equipa F_D', 'Avançado', 0, 0, 0),
(8, 'Torneio Feminino', '196756092as5', 'Equipa F_D', 'Ponta de lança', 0, 0, 0),
(8, 'Torneio Feminino', '190659852eh5', 'Equipa F_D', 'Avançado', 0, 0, 0),
(8, 'Torneio Feminino', '113007642er5', 'Equipa F_D', 'Guarda-redes', 1, 0, 0),
(8, 'Torneio Feminino', '184356022as5', 'Equipa F_D', 'Defesa', 1, 0, 0),
(8, 'Torneio Feminino', '183755032ao5', 'Equipa F_D', 'Ponta de lança', 1, 0, 0),
(8, 'Torneio Feminino', '123406350er5', 'Equipa F_D', 'Médio', 1, 0, 0),
(8, 'Torneio Feminino', '130476822as5', 'Equipa F_D', 'Avançado', 1, 0, 0),
(9, 'Torneio Feminino', '125456822as5', 'Equipa F_A', 'Guarda-redes', 0, 0, 0),
(9, 'Torneio Feminino', '193456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(9, 'Torneio Feminino', '193456852as5', 'Equipa F_A', 'Médio', 0, 0, 0),
(9, 'Torneio Feminino', '123456822as6', 'Equipa F_A', 'Médio', 0, 0, 0),
(9, 'Torneio Feminino', '193445822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(9, 'Torneio Feminino', '134456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(9, 'Torneio Feminino', '193452324as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(9, 'Torneio Feminino', '193456852er5', 'Equipa F_A', 'Médio', 0, 0, 0),
(9, 'Torneio Feminino', '123478682as6', 'Equipa F_A', 'Avançado', 0, 0, 0),
(9, 'Torneio Feminino', '193459852er5', 'Equipa F_A', 'Avançado', 0, 0, 0),
(9, 'Torneio Feminino', '193756852as5', 'Equipa F_A', 'Ponta de lança', 0, 0, 0),
(9, 'Torneio Feminino', '185456822as5', 'Equipa F_A', 'Guarda-redes', 1, 0, 0),
(9, 'Torneio Feminino', '184456822as5', 'Equipa F_A', 'Defesa', 1, 0, 0),
(9, 'Torneio Feminino', '183756852as5', 'Equipa F_A', 'Ponta de lança', 1, 0, 0),
(9, 'Torneio Feminino', '183456852er5', 'Equipa F_A', 'Médio', 1, 1, 0),
(9, 'Torneio Feminino', '193467852er5', 'Equipa F_A', 'Avançado', 1, 1, 0),
(9, 'Torneio Feminino', '198936022ds5', 'Equipa F_C', 'Guarda-redes', 0, 0, 0),
(9, 'Torneio Feminino', '123056822as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(9, 'Torneio Feminino', '193440622as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(9, 'Torneio Feminino', '134056452as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(9, 'Torneio Feminino', '193480324as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(9, 'Torneio Feminino', '193054322ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(9, 'Torneio Feminino', '193654022ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(9, 'Torneio Feminino', '193450342ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(9, 'Torneio Feminino', '123608682as6', 'Equipa F_C', 'Avançado', 0, 0, 0),
(9, 'Torneio Feminino', '193756092as5', 'Equipa F_C', 'Ponta de lança', 0, 0, 0),
(9, 'Torneio Feminino', '190059852eh5', 'Equipa F_C', 'Avançado', 0, 0, 0),
(9, 'Torneio Feminino', '113007842er5', 'Equipa F_C', 'Guarda-redes', 1, 0, 0),
(9, 'Torneio Feminino', '184056022as5', 'Equipa F_C', 'Defesa', 1, 0, 0),
(9, 'Torneio Feminino', '183755052ao5', 'Equipa F_C', 'Ponta de lança', 1, 0, 0),
(9, 'Torneio Feminino', '123406850er5', 'Equipa F_C', 'Médio', 1, 0, 0),
(9, 'Torneio Feminino', '180476822as5', 'Equipa F_C', 'Avançado', 1, 0, 0),
(10, 'Torneio Feminino', '198636022ds5', 'Equipa F_D', 'Guarda-redes', 0, 0, 0),
(10, 'Torneio Feminino', '126056822as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(10, 'Torneio Feminino', '193440662as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(10, 'Torneio Feminino', '634056452as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(10, 'Torneio Feminino', '163480324as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(10, 'Torneio Feminino', '193054362ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(10, 'Torneio Feminino', '193654022ds6', 'Equipa F_D', 'Médio', 0, 0, 0),
(10, 'Torneio Feminino', '193460342ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(10, 'Torneio Feminino', '163608682as6', 'Equipa F_D', 'Avançado', 0, 0, 0),
(10, 'Torneio Feminino', '196756092as5', 'Equipa F_D', 'Ponta de lança', 0, 0, 0),
(10, 'Torneio Feminino', '190659852eh5', 'Equipa F_D', 'Avançado', 0, 0, 0),
(10, 'Torneio Feminino', '113007642er5', 'Equipa F_D', 'Guarda-redes', 1, 0, 0),
(10, 'Torneio Feminino', '184356022as5', 'Equipa F_D', 'Defesa', 1, 0, 0),
(10, 'Torneio Feminino', '183755032ao5', 'Equipa F_D', 'Ponta de lança', 1, 0, 0),
(10, 'Torneio Feminino', '123406350er5', 'Equipa F_D', 'Médio', 1, 0, 0),
(10, 'Torneio Feminino', '130476822as5', 'Equipa F_D', 'Avançado', 1, 0, 0),
(10, 'Torneio Feminino', '123456822as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(10, 'Torneio Feminino', '198936822ds5', 'Equipa F_B', 'Guarda-redes', 0, 0, 0),
(10, 'Torneio Feminino', '193454322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(10, 'Torneio Feminino', '193447622as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(10, 'Torneio Feminino', '134456452as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(10, 'Torneio Feminino', '193482324as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(10, 'Torneio Feminino', '193654322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(10, 'Torneio Feminino', '193454342ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(10, 'Torneio Feminino', '123678682as6', 'Equipa F_B', 'Avançado', 0, 1, 0),
(10, 'Torneio Feminino', '193756892as5', 'Equipa F_B', 'Ponta de lança', 0, 0, 0),
(10, 'Torneio Feminino', '193459852eh5', 'Equipa F_B', 'Avançado', 0, 0, 0),
(10, 'Torneio Feminino', '185476822as5', 'Equipa F_B', 'Guarda-redes', 1, 0, 0),
(10, 'Torneio Feminino', '184656822as5', 'Equipa F_B', 'Defesa', 1, 0, 0),
(10, 'Torneio Feminino', '183755652as5', 'Equipa F_B', 'Ponta de lança', 1, 0, 0),
(10, 'Torneio Feminino', '123456852er5', 'Equipa F_B', 'Médio', 1, 0, 0),
(10, 'Torneio Feminino', '113467852er5', 'Equipa F_B', 'Avançado', 1, 0, 0),
(11, 'Torneio Feminino', '198636022ds5', 'Equipa F_D', 'Guarda-redes', 0, 0, 0),
(11, 'Torneio Feminino', '126056822as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(11, 'Torneio Feminino', '193440662as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(11, 'Torneio Feminino', '634056452as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(11, 'Torneio Feminino', '163480324as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(11, 'Torneio Feminino', '193054362ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(11, 'Torneio Feminino', '193654022ds6', 'Equipa F_D', 'Médio', 0, 0, 0),
(11, 'Torneio Feminino', '193460342ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(11, 'Torneio Feminino', '163608682as6', 'Equipa F_D', 'Avançado', 0, 0, 0),
(11, 'Torneio Feminino', '196756092as5', 'Equipa F_D', 'Ponta de lança', 0, 0, 0),
(11, 'Torneio Feminino', '190659852eh5', 'Equipa F_D', 'Avançado', 0, 0, 0),
(11, 'Torneio Feminino', '113007642er5', 'Equipa F_D', 'Guarda-redes', 1, 0, 0),
(11, 'Torneio Feminino', '184356022as5', 'Equipa F_D', 'Defesa', 1, 0, 0),
(11, 'Torneio Feminino', '183755032ao5', 'Equipa F_D', 'Ponta de lança', 1, 0, 0),
(11, 'Torneio Feminino', '123406350er5', 'Equipa F_D', 'Médio', 1, 2, 0),
(11, 'Torneio Feminino', '130476822as5', 'Equipa F_D', 'Avançado', 1, 0, 0),
(11, 'Torneio Feminino', '125456822as5', 'Equipa F_A', 'Guarda-redes', 0, 0, 0),
(11, 'Torneio Feminino', '193456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(11, 'Torneio Feminino', '193456852as5', 'Equipa F_A', 'Médio', 0, 0, 0),
(11, 'Torneio Feminino', '123456822as6', 'Equipa F_A', 'Médio', 0, 0, 0),
(11, 'Torneio Feminino', '193445822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(11, 'Torneio Feminino', '134456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(11, 'Torneio Feminino', '193452324as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(11, 'Torneio Feminino', '193456852er5', 'Equipa F_A', 'Médio', 0, 0, 0),
(11, 'Torneio Feminino', '123478682as6', 'Equipa F_A', 'Avançado', 0, 0, 0),
(11, 'Torneio Feminino', '193459852er5', 'Equipa F_A', 'Avançado', 0, 0, 0),
(11, 'Torneio Feminino', '193756852as5', 'Equipa F_A', 'Ponta de lança', 0, 0, 0),
(11, 'Torneio Feminino', '185456822as5', 'Equipa F_A', 'Guarda-redes', 1, 0, 0),
(11, 'Torneio Feminino', '184456822as5', 'Equipa F_A', 'Defesa', 1, 0, 0),
(11, 'Torneio Feminino', '183756852as5', 'Equipa F_A', 'Ponta de lança', 1, 0, 0),
(11, 'Torneio Feminino', '183456852er5', 'Equipa F_A', 'Médio', 1, 0, 0),
(11, 'Torneio Feminino', '193467852er5', 'Equipa F_A', 'Avançado', 1, 0, 0),
(12, 'Torneio Feminino', '198936022ds5', 'Equipa F_C', 'Guarda-redes', 0, 0, 0),
(12, 'Torneio Feminino', '123056822as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(12, 'Torneio Feminino', '193440622as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(12, 'Torneio Feminino', '134056452as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(12, 'Torneio Feminino', '193480324as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(12, 'Torneio Feminino', '193054322ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(12, 'Torneio Feminino', '193654022ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(12, 'Torneio Feminino', '193450342ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(12, 'Torneio Feminino', '123608682as6', 'Equipa F_C', 'Avançado', 0, 0, 0),
(12, 'Torneio Feminino', '193756092as5', 'Equipa F_C', 'Ponta de lança', 0, 0, 0),
(12, 'Torneio Feminino', '190059852eh5', 'Equipa F_C', 'Avançado', 0, 0, 0),
(12, 'Torneio Feminino', '113007842er5', 'Equipa F_C', 'Guarda-redes', 1, 0, 0),
(12, 'Torneio Feminino', '184056022as5', 'Equipa F_C', 'Defesa', 1, 0, 0),
(12, 'Torneio Feminino', '183755052ao5', 'Equipa F_C', 'Ponta de lança', 1, 0, 0),
(12, 'Torneio Feminino', '123406850er5', 'Equipa F_C', 'Médio', 1, 0, 0),
(12, 'Torneio Feminino', '180476822as5', 'Equipa F_C', 'Avançado', 1, 0, 0),
(12, 'Torneio Feminino', '123456822as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(12, 'Torneio Feminino', '198936822ds5', 'Equipa F_B', 'Guarda-redes', 0, 0, 0),
(12, 'Torneio Feminino', '193454322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(12, 'Torneio Feminino', '193447622as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(12, 'Torneio Feminino', '134456452as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(12, 'Torneio Feminino', '193482324as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(12, 'Torneio Feminino', '193654322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(12, 'Torneio Feminino', '193454342ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(12, 'Torneio Feminino', '123678682as6', 'Equipa F_B', 'Avançado', 0, 0, 0),
(12, 'Torneio Feminino', '193756892as5', 'Equipa F_B', 'Ponta de lança', 0, 0, 0),
(12, 'Torneio Feminino', '193459852eh5', 'Equipa F_B', 'Avançado', 0, 1, 0),
(12, 'Torneio Feminino', '185476822as5', 'Equipa F_B', 'Guarda-redes', 1, 0, 0),
(12, 'Torneio Feminino', '184656822as5', 'Equipa F_B', 'Defesa', 1, 0, 0),
(12, 'Torneio Feminino', '183755652as5', 'Equipa F_B', 'Ponta de lança', 1, 0, 0),
(12, 'Torneio Feminino', '123456852er5', 'Equipa F_B', 'Médio', 1, 0, 0),
(12, 'Torneio Feminino', '113467852er5', 'Equipa F_B', 'Avançado', 1, 0, 0),
(13, 'Torneio Feminino', '125456822as5', 'Equipa F_A', 'Guarda-redes', 0, 0, 0),
(13, 'Torneio Feminino', '193456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(13, 'Torneio Feminino', '193456852as5', 'Equipa F_A', 'Médio', 0, 0, 0),
(13, 'Torneio Feminino', '123456822as6', 'Equipa F_A', 'Médio', 0, 0, 0),
(13, 'Torneio Feminino', '193445822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(13, 'Torneio Feminino', '134456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(13, 'Torneio Feminino', '193452324as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(13, 'Torneio Feminino', '193456852er5', 'Equipa F_A', 'Médio', 0, 0, 0),
(13, 'Torneio Feminino', '123478682as6', 'Equipa F_A', 'Avançado', 0, 2, 0),
(13, 'Torneio Feminino', '193459852er5', 'Equipa F_A', 'Avançado', 0, 1, 0),
(13, 'Torneio Feminino', '193756852as5', 'Equipa F_A', 'Ponta de lança', 0, 2, 0),
(13, 'Torneio Feminino', '185456822as5', 'Equipa F_A', 'Guarda-redes', 1, 0, 0),
(13, 'Torneio Feminino', '184456822as5', 'Equipa F_A', 'Defesa', 1, 0, 0),
(13, 'Torneio Feminino', '183756852as5', 'Equipa F_A', 'Ponta de lança', 1, 0, 0),
(13, 'Torneio Feminino', '183456852er5', 'Equipa F_A', 'Médio', 1, 0, 0),
(13, 'Torneio Feminino', '193467852er5', 'Equipa F_A', 'Avançado', 1, 0, 0),
(13, 'Torneio Feminino', '123456822as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(13, 'Torneio Feminino', '198936822ds5', 'Equipa F_B', 'Guarda-redes', 0, 0, 0),
(13, 'Torneio Feminino', '193454322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(13, 'Torneio Feminino', '193447622as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(13, 'Torneio Feminino', '134456452as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(13, 'Torneio Feminino', '193482324as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(13, 'Torneio Feminino', '193654322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(13, 'Torneio Feminino', '193454342ds5', 'Equipa F_B', 'Médio', 0, 1, 0),
(13, 'Torneio Feminino', '123678682as6', 'Equipa F_B', 'Avançado', 0, 2, 0),
(13, 'Torneio Feminino', '193756892as5', 'Equipa F_B', 'Ponta de lança', 0, 1, 0),
(13, 'Torneio Feminino', '193459852eh5', 'Equipa F_B', 'Avançado', 0, 1, 0),
(13, 'Torneio Feminino', '185476822as5', 'Equipa F_B', 'Guarda-redes', 1, 0, 0),
(13, 'Torneio Feminino', '184656822as5', 'Equipa F_B', 'Defesa', 1, 0, 0),
(13, 'Torneio Feminino', '183755652as5', 'Equipa F_B', 'Ponta de lança', 1, 0, 0),
(13, 'Torneio Feminino', '123456852er5', 'Equipa F_B', 'Médio', 1, 0, 0),
(13, 'Torneio Feminino', '113467852er5', 'Equipa F_B', 'Avançado', 1, 0, 0),
(15, 'Torneio Feminino', '125456822as5', 'Equipa F_A', 'Guarda-redes', 0, 0, 0),
(15, 'Torneio Feminino', '193456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(15, 'Torneio Feminino', '193456852as5', 'Equipa F_A', 'Médio', 0, 0, 0),
(15, 'Torneio Feminino', '123456822as6', 'Equipa F_A', 'Médio', 0, 0, 0),
(15, 'Torneio Feminino', '193445822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(15, 'Torneio Feminino', '134456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(15, 'Torneio Feminino', '193452324as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(15, 'Torneio Feminino', '193456852er5', 'Equipa F_A', 'Médio', 0, 0, 0),
(15, 'Torneio Feminino', '123478682as6', 'Equipa F_A', 'Avançado', 0, 0, 0),
(15, 'Torneio Feminino', '193459852er5', 'Equipa F_A', 'Avançado', 0, 0, 0),
(15, 'Torneio Feminino', '193756852as5', 'Equipa F_A', 'Ponta de lança', 0, 0, 0),
(15, 'Torneio Feminino', '185456822as5', 'Equipa F_A', 'Guarda-redes', 1, 0, 0),
(15, 'Torneio Feminino', '184456822as5', 'Equipa F_A', 'Defesa', 1, 0, 0),
(15, 'Torneio Feminino', '183756852as5', 'Equipa F_A', 'Ponta de lança', 1, 0, 0),
(15, 'Torneio Feminino', '183456852er5', 'Equipa F_A', 'Médio', 1, 0, 0),
(15, 'Torneio Feminino', '193467852er5', 'Equipa F_A', 'Avançado', 1, 0, 0),
(15, 'Torneio Feminino', '198936022ds5', 'Equipa F_C', 'Guarda-redes', 0, 0, 0),
(15, 'Torneio Feminino', '123056822as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(15, 'Torneio Feminino', '193440622as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(15, 'Torneio Feminino', '134056452as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(15, 'Torneio Feminino', '193480324as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(15, 'Torneio Feminino', '193054322ds5', 'Equipa F_C', 'Médio', 0, 2, 0),
(15, 'Torneio Feminino', '193654022ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(15, 'Torneio Feminino', '193450342ds5', 'Equipa F_C', 'Médio', 0, 1, 0),
(15, 'Torneio Feminino', '123608682as6', 'Equipa F_C', 'Avançado', 0, 1, 0),
(15, 'Torneio Feminino', '193756092as5', 'Equipa F_C', 'Ponta de lança', 0, 0, 0),
(15, 'Torneio Feminino', '190059852eh5', 'Equipa F_C', 'Avançado', 0, 0, 0),
(15, 'Torneio Feminino', '113007842er5', 'Equipa F_C', 'Guarda-redes', 1, 0, 0),
(15, 'Torneio Feminino', '184056022as5', 'Equipa F_C', 'Defesa', 1, 0, 0),
(15, 'Torneio Feminino', '183755052ao5', 'Equipa F_C', 'Ponta de lança', 1, 0, 0),
(15, 'Torneio Feminino', '123406850er5', 'Equipa F_C', 'Médio', 1, 0, 0),
(15, 'Torneio Feminino', '180476822as5', 'Equipa F_C', 'Avançado', 1, 0, 0),
(14, 'Torneio Feminino', '198936022ds5', 'Equipa F_C', 'Guarda-redes', 0, 0, 0),
(14, 'Torneio Feminino', '123056822as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(14, 'Torneio Feminino', '193440622as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(14, 'Torneio Feminino', '134056452as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(14, 'Torneio Feminino', '193480324as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(14, 'Torneio Feminino', '193054322ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(14, 'Torneio Feminino', '193654022ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(14, 'Torneio Feminino', '193450342ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(14, 'Torneio Feminino', '123608682as6', 'Equipa F_C', 'Avançado', 0, 0, 0),
(14, 'Torneio Feminino', '193756092as5', 'Equipa F_C', 'Ponta de lança', 0, 0, 0),
(14, 'Torneio Feminino', '190059852eh5', 'Equipa F_C', 'Avançado', 0, 0, 0),
(14, 'Torneio Feminino', '113007842er5', 'Equipa F_C', 'Guarda-redes', 1, 0, 0),
(14, 'Torneio Feminino', '184056022as5', 'Equipa F_C', 'Defesa', 1, 0, 0),
(14, 'Torneio Feminino', '183755052ao5', 'Equipa F_C', 'Ponta de lança', 1, 0, 0),
(14, 'Torneio Feminino', '123406850er5', 'Equipa F_C', 'Médio', 1, 0, 0),
(14, 'Torneio Feminino', '180476822as5', 'Equipa F_C', 'Avançado', 1, 0, 0),
(14, 'Torneio Feminino', '198636022ds5', 'Equipa F_D', 'Guarda-redes', 0, 0, 0),
(14, 'Torneio Feminino', '126056822as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(14, 'Torneio Feminino', '193440662as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(14, 'Torneio Feminino', '634056452as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(14, 'Torneio Feminino', '163480324as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(14, 'Torneio Feminino', '193054362ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(14, 'Torneio Feminino', '193654022ds6', 'Equipa F_D', 'Médio', 0, 0, 0),
(14, 'Torneio Feminino', '193460342ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(14, 'Torneio Feminino', '163608682as6', 'Equipa F_D', 'Avançado', 0, 0, 0),
(14, 'Torneio Feminino', '196756092as5', 'Equipa F_D', 'Ponta de lança', 0, 0, 0),
(14, 'Torneio Feminino', '190659852eh5', 'Equipa F_D', 'Avançado', 0, 0, 0),
(14, 'Torneio Feminino', '113007642er5', 'Equipa F_D', 'Guarda-redes', 1, 0, 0),
(14, 'Torneio Feminino', '184356022as5', 'Equipa F_D', 'Defesa', 1, 0, 0),
(14, 'Torneio Feminino', '183755032ao5', 'Equipa F_D', 'Ponta de lança', 1, 0, 0),
(14, 'Torneio Feminino', '123406350er5', 'Equipa F_D', 'Médio', 1, 0, 0),
(14, 'Torneio Feminino', '130476822as5', 'Equipa F_D', 'Avançado', 1, 0, 0),
(16, 'Torneio Feminino', '198636022ds5', 'Equipa F_D', 'Guarda-redes', 0, 0, 0),
(16, 'Torneio Feminino', '126056822as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(16, 'Torneio Feminino', '193440662as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(16, 'Torneio Feminino', '634056452as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(16, 'Torneio Feminino', '163480324as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(16, 'Torneio Feminino', '193054362ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(16, 'Torneio Feminino', '193654022ds6', 'Equipa F_D', 'Médio', 0, 0, 0),
(16, 'Torneio Feminino', '193460342ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(16, 'Torneio Feminino', '163608682as6', 'Equipa F_D', 'Avançado', 0, 0, 0),
(16, 'Torneio Feminino', '196756092as5', 'Equipa F_D', 'Ponta de lança', 0, 0, 0),
(16, 'Torneio Feminino', '190659852eh5', 'Equipa F_D', 'Avançado', 0, 0, 0),
(16, 'Torneio Feminino', '113007642er5', 'Equipa F_D', 'Guarda-redes', 1, 0, 0),
(16, 'Torneio Feminino', '184356022as5', 'Equipa F_D', 'Defesa', 1, 0, 0),
(16, 'Torneio Feminino', '183755032ao5', 'Equipa F_D', 'Ponta de lança', 1, 0, 0),
(16, 'Torneio Feminino', '123406350er5', 'Equipa F_D', 'Médio', 1, 0, 0),
(16, 'Torneio Feminino', '130476822as5', 'Equipa F_D', 'Avançado', 1, 0, 0),
(16, 'Torneio Feminino', '123456822as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(16, 'Torneio Feminino', '198936822ds5', 'Equipa F_B', 'Guarda-redes', 0, 0, 0),
(16, 'Torneio Feminino', '193454322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(16, 'Torneio Feminino', '193447622as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(16, 'Torneio Feminino', '134456452as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(16, 'Torneio Feminino', '193482324as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(16, 'Torneio Feminino', '193654322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(16, 'Torneio Feminino', '193454342ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(16, 'Torneio Feminino', '123678682as6', 'Equipa F_B', 'Avançado', 0, 3, 0),
(16, 'Torneio Feminino', '193756892as5', 'Equipa F_B', 'Ponta de lança', 0, 0, 0),
(16, 'Torneio Feminino', '193459852eh5', 'Equipa F_B', 'Avançado', 0, 0, 0),
(16, 'Torneio Feminino', '185476822as5', 'Equipa F_B', 'Guarda-redes', 1, 0, 0),
(16, 'Torneio Feminino', '184656822as5', 'Equipa F_B', 'Defesa', 1, 0, 0),
(16, 'Torneio Feminino', '183755652as5', 'Equipa F_B', 'Ponta de lança', 1, 0, 0),
(16, 'Torneio Feminino', '123456852er5', 'Equipa F_B', 'Médio', 1, 0, 0),
(16, 'Torneio Feminino', '113467852er5', 'Equipa F_B', 'Avançado', 1, 0, 0),
(17, 'Torneio Feminino', '198636022ds5', 'Equipa F_D', 'Guarda-redes', 0, 0, 0),
(17, 'Torneio Feminino', '126056822as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(17, 'Torneio Feminino', '193440662as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(17, 'Torneio Feminino', '634056452as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(17, 'Torneio Feminino', '163480324as5', 'Equipa F_D', 'Defesa', 0, 0, 0),
(17, 'Torneio Feminino', '193054362ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(17, 'Torneio Feminino', '193654022ds6', 'Equipa F_D', 'Médio', 0, 0, 0),
(17, 'Torneio Feminino', '193460342ds5', 'Equipa F_D', 'Médio', 0, 0, 0),
(17, 'Torneio Feminino', '163608682as6', 'Equipa F_D', 'Avançado', 0, 0, 0),
(17, 'Torneio Feminino', '196756092as5', 'Equipa F_D', 'Ponta de lança', 0, 0, 0),
(17, 'Torneio Feminino', '190659852eh5', 'Equipa F_D', 'Avançado', 0, 1, 0),
(17, 'Torneio Feminino', '113007642er5', 'Equipa F_D', 'Guarda-redes', 1, 0, 0),
(17, 'Torneio Feminino', '184356022as5', 'Equipa F_D', 'Defesa', 1, 0, 0),
(17, 'Torneio Feminino', '183755032ao5', 'Equipa F_D', 'Ponta de lança', 1, 0, 0),
(17, 'Torneio Feminino', '123406350er5', 'Equipa F_D', 'Médio', 1, 0, 0),
(17, 'Torneio Feminino', '130476822as5', 'Equipa F_D', 'Avançado', 1, 0, 0),
(17, 'Torneio Feminino', '125456822as5', 'Equipa F_A', 'Guarda-redes', 0, 0, 0),
(17, 'Torneio Feminino', '193456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(17, 'Torneio Feminino', '193456852as5', 'Equipa F_A', 'Médio', 0, 0, 0),
(17, 'Torneio Feminino', '123456822as6', 'Equipa F_A', 'Médio', 0, 0, 0),
(17, 'Torneio Feminino', '193445822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(17, 'Torneio Feminino', '134456822as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(17, 'Torneio Feminino', '193452324as5', 'Equipa F_A', 'Defesa', 0, 0, 0),
(17, 'Torneio Feminino', '193456852er5', 'Equipa F_A', 'Médio', 0, 0, 0),
(17, 'Torneio Feminino', '123478682as6', 'Equipa F_A', 'Avançado', 0, 0, 0),
(17, 'Torneio Feminino', '193459852er5', 'Equipa F_A', 'Avançado', 0, 0, 0),
(17, 'Torneio Feminino', '193756852as5', 'Equipa F_A', 'Ponta de lança', 0, 0, 0),
(17, 'Torneio Feminino', '185456822as5', 'Equipa F_A', 'Guarda-redes', 1, 0, 0),
(17, 'Torneio Feminino', '184456822as5', 'Equipa F_A', 'Defesa', 1, 0, 0),
(17, 'Torneio Feminino', '183756852as5', 'Equipa F_A', 'Ponta de lança', 1, 0, 0),
(17, 'Torneio Feminino', '183456852er5', 'Equipa F_A', 'Médio', 1, 0, 0),
(17, 'Torneio Feminino', '193467852er5', 'Equipa F_A', 'Avançado', 1, 0, 0),
(18, 'Torneio Feminino', '198936022ds5', 'Equipa F_C', 'Guarda-redes', 0, 0, 0),
(18, 'Torneio Feminino', '123056822as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(18, 'Torneio Feminino', '193440622as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(18, 'Torneio Feminino', '134056452as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(18, 'Torneio Feminino', '193480324as5', 'Equipa F_C', 'Defesa', 0, 0, 0),
(18, 'Torneio Feminino', '193054322ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(18, 'Torneio Feminino', '193654022ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(18, 'Torneio Feminino', '193450342ds5', 'Equipa F_C', 'Médio', 0, 0, 0),
(18, 'Torneio Feminino', '123608682as6', 'Equipa F_C', 'Avançado', 0, 0, 0),
(18, 'Torneio Feminino', '193756092as5', 'Equipa F_C', 'Ponta de lança', 0, 0, 0),
(18, 'Torneio Feminino', '190059852eh5', 'Equipa F_C', 'Avançado', 0, 0, 0),
(18, 'Torneio Feminino', '113007842er5', 'Equipa F_C', 'Guarda-redes', 1, 0, 0),
(18, 'Torneio Feminino', '184056022as5', 'Equipa F_C', 'Defesa', 1, 0, 0),
(18, 'Torneio Feminino', '183755052ao5', 'Equipa F_C', 'Ponta de lança', 1, 0, 0),
(18, 'Torneio Feminino', '123406850er5', 'Equipa F_C', 'Médio', 1, 0, 0),
(18, 'Torneio Feminino', '180476822as5', 'Equipa F_C', 'Avançado', 1, 0, 0),
(18, 'Torneio Feminino', '123456822as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(18, 'Torneio Feminino', '198936822ds5', 'Equipa F_B', 'Guarda-redes', 0, 0, 0),
(18, 'Torneio Feminino', '193454322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(18, 'Torneio Feminino', '193447622as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(18, 'Torneio Feminino', '134456452as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(18, 'Torneio Feminino', '193482324as5', 'Equipa F_B', 'Defesa', 0, 0, 0),
(18, 'Torneio Feminino', '193654322ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(18, 'Torneio Feminino', '193454342ds5', 'Equipa F_B', 'Médio', 0, 0, 0),
(18, 'Torneio Feminino', '123678682as6', 'Equipa F_B', 'Avançado', 0, 0, 0),
(18, 'Torneio Feminino', '193756892as5', 'Equipa F_B', 'Ponta de lança', 0, 0, 0),
(18, 'Torneio Feminino', '193459852eh5', 'Equipa F_B', 'Avançado', 0, 0, 0),
(18, 'Torneio Feminino', '185476822as5', 'Equipa F_B', 'Guarda-redes', 1, 0, 0),
(18, 'Torneio Feminino', '184656822as5', 'Equipa F_B', 'Defesa', 1, 0, 0),
(18, 'Torneio Feminino', '183755652as5', 'Equipa F_B', 'Ponta de lança', 1, 0, 0),
(18, 'Torneio Feminino', '123456852er5', 'Equipa F_B', 'Médio', 1, 0, 0),
(18, 'Torneio Feminino', '113467852er5', 'Equipa F_B', 'Avançado', 1, 0, 0),
(1, 'Torneio_3', '193234563ds5', 'Equipa 3_A', 'Guarda-redes', 0, 0, 0),
(1, 'Torneio_3', '123456828io5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(1, 'Torneio_3', '193452322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(1, 'Torneio_3', '193424322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(1, 'Torneio_3', '193452312ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(1, 'Torneio_3', '195661513ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(1, 'Torneio_3', '198916832ds5', 'Equipa 3_A', 'Médio', 0, 1, 0),
(1, 'Torneio_3', '195663613ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(1, 'Torneio_3', '123466822as5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(1, 'Torneio_3', '195612513ds5', 'Equipa 3_A', 'Ponta de lança', 0, 0, 0),
(1, 'Torneio_3', '193344322ds5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(1, 'Torneio_3', '183007642er5', 'Equipa 3_A', 'Guarda-redes', 1, 0, 0),
(1, 'Torneio_3', '184358022as5', 'Equipa 3_A', 'Defesa', 1, 0, 0),
(1, 'Torneio_3', '183758032ao5', 'Equipa 3_A', 'Ponta de lança', 1, 0, 0),
(1, 'Torneio_3', '123406380er5', 'Equipa 3_A', 'Médio', 1, 0, 0),
(1, 'Torneio_3', '130478822as5', 'Equipa 3_A', 'Avançado', 1, 0, 0),
(1, 'Torneio_3', '193534563ds5', 'Equipa 3_B', 'Guarda-redes', 0, 0, 0),
(1, 'Torneio_3', '123456858io5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(1, 'Torneio_3', '193452352ds5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(1, 'Torneio_3', '193424322gs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(1, 'Torneio_3', '193452312hs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(1, 'Torneio_3', '195661513us5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(1, 'Torneio_3', '198916832qs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(1, 'Torneio_3', '195663613rs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(1, 'Torneio_3', '133456822ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(1, 'Torneio_3', '195212513ds5', 'Equipa 3_B', 'Ponta de lança', 0, 1, 0),
(1, 'Torneio_3', '143344322ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(1, 'Torneio_3', '193424542ds5', 'Equipa 3_B', 'Guarda-redes', 1, 0, 0),
(1, 'Torneio_3', '193264513ds5', 'Equipa 3_B', 'Defesa', 1, 0, 0),
(1, 'Torneio_3', '183778032ao5', 'Equipa 3_B', 'Ponta de lança', 1, 0, 0),
(1, 'Torneio_3', '123476380er5', 'Equipa 3_B', 'Médio', 1, 0, 0),
(1, 'Torneio_3', '130778822as5', 'Equipa 3_B', 'Avançado', 1, 0, 0),
(7, 'Torneio_3', '193234563ds5', 'Equipa 3_A', 'Guarda-redes', 0, 0, 0),
(7, 'Torneio_3', '123456828io5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(7, 'Torneio_3', '193452322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(7, 'Torneio_3', '193424322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(7, 'Torneio_3', '193452312ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(7, 'Torneio_3', '195661513ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(7, 'Torneio_3', '198916832ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(7, 'Torneio_3', '195663613ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(7, 'Torneio_3', '123466822as5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(7, 'Torneio_3', '195612513ds5', 'Equipa 3_A', 'Ponta de lança', 0, 0, 0),
(7, 'Torneio_3', '193344322ds5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(7, 'Torneio_3', '183007642er5', 'Equipa 3_A', 'Guarda-redes', 1, 0, 0),
(7, 'Torneio_3', '184358022as5', 'Equipa 3_A', 'Defesa', 1, 0, 0),
(7, 'Torneio_3', '183758032ao5', 'Equipa 3_A', 'Ponta de lança', 1, 0, 0),
(7, 'Torneio_3', '123406380er5', 'Equipa 3_A', 'Médio', 1, 0, 0),
(7, 'Torneio_3', '130478822as5', 'Equipa 3_A', 'Avançado', 1, 0, 0),
(7, 'Torneio_3', '193534563ds5', 'Equipa 3_B', 'Guarda-redes', 0, 0, 0),
(7, 'Torneio_3', '123456858io5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(7, 'Torneio_3', '193452352ds5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(7, 'Torneio_3', '193424322gs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(7, 'Torneio_3', '193452312hs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(7, 'Torneio_3', '195661513us5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(7, 'Torneio_3', '198916832qs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(7, 'Torneio_3', '195663613rs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(7, 'Torneio_3', '133456822ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(7, 'Torneio_3', '195212513ds5', 'Equipa 3_B', 'Ponta de lança', 0, 0, 0),
(7, 'Torneio_3', '143344322ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(7, 'Torneio_3', '193424542ds5', 'Equipa 3_B', 'Guarda-redes', 1, 0, 0),
(7, 'Torneio_3', '193264513ds5', 'Equipa 3_B', 'Defesa', 1, 0, 0),
(7, 'Torneio_3', '183778032ao5', 'Equipa 3_B', 'Ponta de lança', 1, 0, 0),
(7, 'Torneio_3', '123476380er5', 'Equipa 3_B', 'Médio', 1, 0, 0),
(7, 'Torneio_3', '130778822as5', 'Equipa 3_B', 'Avançado', 1, 0, 0),
(13, 'Torneio_3', '193234563ds5', 'Equipa 3_A', 'Guarda-redes', 0, 0, 0),
(13, 'Torneio_3', '123456828io5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(13, 'Torneio_3', '193452322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(13, 'Torneio_3', '193424322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(13, 'Torneio_3', '193452312ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(13, 'Torneio_3', '195661513ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(13, 'Torneio_3', '198916832ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(13, 'Torneio_3', '195663613ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(13, 'Torneio_3', '123466822as5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(13, 'Torneio_3', '195612513ds5', 'Equipa 3_A', 'Ponta de lança', 0, 0, 0),
(13, 'Torneio_3', '193344322ds5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(13, 'Torneio_3', '183007642er5', 'Equipa 3_A', 'Guarda-redes', 1, 0, 0),
(13, 'Torneio_3', '184358022as5', 'Equipa 3_A', 'Defesa', 1, 0, 0),
(13, 'Torneio_3', '183758032ao5', 'Equipa 3_A', 'Ponta de lança', 1, 0, 0),
(13, 'Torneio_3', '123406380er5', 'Equipa 3_A', 'Médio', 1, 0, 0),
(13, 'Torneio_3', '130478822as5', 'Equipa 3_A', 'Avançado', 1, 0, 0),
(13, 'Torneio_3', '193534563ds5', 'Equipa 3_B', 'Guarda-redes', 0, 0, 0),
(13, 'Torneio_3', '123456858io5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(13, 'Torneio_3', '193452352ds5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(13, 'Torneio_3', '193424322gs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(13, 'Torneio_3', '193452312hs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(13, 'Torneio_3', '195661513us5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(13, 'Torneio_3', '198916832qs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(13, 'Torneio_3', '195663613rs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(13, 'Torneio_3', '133456822ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(13, 'Torneio_3', '195212513ds5', 'Equipa 3_B', 'Ponta de lança', 0, 0, 0),
(13, 'Torneio_3', '143344322ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(13, 'Torneio_3', '193424542ds5', 'Equipa 3_B', 'Guarda-redes', 1, 0, 0),
(13, 'Torneio_3', '193264513ds5', 'Equipa 3_B', 'Defesa', 1, 0, 0),
(13, 'Torneio_3', '183778032ao5', 'Equipa 3_B', 'Ponta de lança', 1, 0, 0),
(13, 'Torneio_3', '123476380er5', 'Equipa 3_B', 'Médio', 1, 0, 0),
(13, 'Torneio_3', '130778822as5', 'Equipa 3_B', 'Avançado', 1, 0, 0),
(2, 'Torneio_3', '193534963ds5', 'Equipa 3_C', 'Guarda-redes', 0, 0, 0),
(2, 'Torneio_3', '123496858io5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(2, 'Torneio_3', '193452352ds9', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(2, 'Torneio_3', '193424922gs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(2, 'Torneio_3', '193452912hs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(2, 'Torneio_3', '195661913us5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(2, 'Torneio_3', '198996832qs5', 'Equipa 3_C', 'Médio', 0, 1, 0),
(2, 'Torneio_3', '195693613rs5', 'Equipa 3_C', 'Médio', 0, 1, 0);
INSERT INTO `jogadores_jogo` (`id_jogo`, `Nome_torneio`, `CC`, `Nome_equipa`, `Posicao`, `Suplente`, `Golos_marcados`, `Pediu_subs`) VALUES
(2, 'Torneio_3', '133496822ds5', 'Equipa 3_C', 'Avançado', 0, 1, 0),
(2, 'Torneio_3', '195292513ds5', 'Equipa 3_C', 'Ponta de lança', 0, 0, 0),
(2, 'Torneio_3', '143349322ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(2, 'Torneio_3', '193924542ds5', 'Equipa 3_C', 'Guarda-redes', 1, 0, 0),
(2, 'Torneio_3', '193964513ds5', 'Equipa 3_C', 'Defesa', 1, 0, 0),
(2, 'Torneio_3', '183779032ao5', 'Equipa 3_C', 'Ponta de lança', 1, 0, 0),
(2, 'Torneio_3', '123976380er5', 'Equipa 3_C', 'Médio', 1, 0, 0),
(2, 'Torneio_3', '130778829as5', 'Equipa 3_C', 'Avançado', 1, 0, 0),
(2, 'Torneio_3', '190234563ds5', 'Equipa 3_D', 'Guarda-redes', 0, 0, 0),
(2, 'Torneio_3', '193002322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(2, 'Torneio_3', '100424322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(2, 'Torneio_3', '193052312ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(2, 'Torneio_3', '195660013ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(2, 'Torneio_3', '120456828io5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(2, 'Torneio_3', '198916802ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(2, 'Torneio_3', '195660613ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(2, 'Torneio_3', '123066822as5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(2, 'Torneio_3', '190612513ds5', 'Equipa 3_D', 'Ponta de lança', 0, 0, 0),
(2, 'Torneio_3', '103344322ds5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(2, 'Torneio_3', '103007642er5', 'Equipa 3_D', 'Guarda-redes', 1, 0, 0),
(2, 'Torneio_3', '184358022as0', 'Equipa 3_D', 'Defesa', 1, 0, 0),
(2, 'Torneio_3', '183708032ao5', 'Equipa 3_D', 'Ponta de lança', 1, 0, 0),
(2, 'Torneio_3', '103406380er5', 'Equipa 3_D', 'Médio', 1, 0, 0),
(2, 'Torneio_3', '130470822as5', 'Equipa 3_D', 'Avançado', 1, 0, 0),
(3, 'Torneio_3', '193534963ds5', 'Equipa 3_C', 'Guarda-redes', 0, 0, 0),
(3, 'Torneio_3', '123496858io5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(3, 'Torneio_3', '193452352ds9', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(3, 'Torneio_3', '193424922gs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(3, 'Torneio_3', '193452912hs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(3, 'Torneio_3', '195661913us5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(3, 'Torneio_3', '198996832qs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(3, 'Torneio_3', '195693613rs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(3, 'Torneio_3', '133496822ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(3, 'Torneio_3', '195292513ds5', 'Equipa 3_C', 'Ponta de lança', 0, 0, 0),
(3, 'Torneio_3', '143349322ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(3, 'Torneio_3', '193924542ds5', 'Equipa 3_C', 'Guarda-redes', 1, 0, 0),
(3, 'Torneio_3', '193964513ds5', 'Equipa 3_C', 'Defesa', 1, 0, 0),
(3, 'Torneio_3', '183779032ao5', 'Equipa 3_C', 'Ponta de lança', 1, 0, 0),
(3, 'Torneio_3', '123976380er5', 'Equipa 3_C', 'Médio', 1, 0, 0),
(3, 'Torneio_3', '130778829as5', 'Equipa 3_C', 'Avançado', 1, 0, 0),
(3, 'Torneio_3', '193234563ds5', 'Equipa 3_A', 'Guarda-redes', 0, 0, 0),
(3, 'Torneio_3', '123456828io5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(3, 'Torneio_3', '193452322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(3, 'Torneio_3', '193424322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(3, 'Torneio_3', '193452312ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(3, 'Torneio_3', '195661513ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(3, 'Torneio_3', '198916832ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(3, 'Torneio_3', '195663613ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(3, 'Torneio_3', '123466822as5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(3, 'Torneio_3', '195612513ds5', 'Equipa 3_A', 'Ponta de lança', 0, 0, 0),
(3, 'Torneio_3', '193344322ds5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(3, 'Torneio_3', '183007642er5', 'Equipa 3_A', 'Guarda-redes', 1, 0, 0),
(3, 'Torneio_3', '184358022as5', 'Equipa 3_A', 'Defesa', 1, 0, 0),
(3, 'Torneio_3', '183758032ao5', 'Equipa 3_A', 'Ponta de lança', 1, 0, 0),
(3, 'Torneio_3', '123406380er5', 'Equipa 3_A', 'Médio', 1, 0, 0),
(3, 'Torneio_3', '130478822as5', 'Equipa 3_A', 'Avançado', 1, 0, 0),
(4, 'Torneio_3', '193534563ds5', 'Equipa 3_B', 'Guarda-redes', 0, 0, 0),
(4, 'Torneio_3', '123456858io5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(4, 'Torneio_3', '193452352ds5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(4, 'Torneio_3', '193424322gs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(4, 'Torneio_3', '193452312hs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(4, 'Torneio_3', '195661513us5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(4, 'Torneio_3', '198916832qs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(4, 'Torneio_3', '195663613rs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(4, 'Torneio_3', '133456822ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(4, 'Torneio_3', '195212513ds5', 'Equipa 3_B', 'Ponta de lança', 0, 1, 0),
(4, 'Torneio_3', '143344322ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(4, 'Torneio_3', '193424542ds5', 'Equipa 3_B', 'Guarda-redes', 1, 0, 0),
(4, 'Torneio_3', '193264513ds5', 'Equipa 3_B', 'Defesa', 1, 0, 0),
(4, 'Torneio_3', '183778032ao5', 'Equipa 3_B', 'Ponta de lança', 1, 0, 0),
(4, 'Torneio_3', '123476380er5', 'Equipa 3_B', 'Médio', 1, 0, 0),
(4, 'Torneio_3', '130778822as5', 'Equipa 3_B', 'Avançado', 1, 0, 0),
(4, 'Torneio_3', '190234563ds5', 'Equipa 3_D', 'Guarda-redes', 0, 0, 0),
(4, 'Torneio_3', '193002322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(4, 'Torneio_3', '100424322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(4, 'Torneio_3', '193052312ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(4, 'Torneio_3', '195660013ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(4, 'Torneio_3', '120456828io5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(4, 'Torneio_3', '198916802ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(4, 'Torneio_3', '195660613ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(4, 'Torneio_3', '123066822as5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(4, 'Torneio_3', '190612513ds5', 'Equipa 3_D', 'Ponta de lança', 0, 0, 0),
(4, 'Torneio_3', '103344322ds5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(4, 'Torneio_3', '103007642er5', 'Equipa 3_D', 'Guarda-redes', 1, 0, 0),
(4, 'Torneio_3', '184358022as0', 'Equipa 3_D', 'Defesa', 1, 0, 0),
(4, 'Torneio_3', '183708032ao5', 'Equipa 3_D', 'Ponta de lança', 1, 0, 0),
(4, 'Torneio_3', '103406380er5', 'Equipa 3_D', 'Médio', 1, 0, 0),
(4, 'Torneio_3', '130470822as5', 'Equipa 3_D', 'Avançado', 1, 0, 0),
(5, 'Torneio_3', '193234563ds5', 'Equipa 3_A', 'Guarda-redes', 0, 0, 0),
(5, 'Torneio_3', '123456828io5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(5, 'Torneio_3', '193452322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(5, 'Torneio_3', '193424322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(5, 'Torneio_3', '193452312ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(5, 'Torneio_3', '195661513ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(5, 'Torneio_3', '198916832ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(5, 'Torneio_3', '195663613ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(5, 'Torneio_3', '123466822as5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(5, 'Torneio_3', '195612513ds5', 'Equipa 3_A', 'Ponta de lança', 0, 0, 0),
(5, 'Torneio_3', '193344322ds5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(5, 'Torneio_3', '183007642er5', 'Equipa 3_A', 'Guarda-redes', 1, 0, 0),
(5, 'Torneio_3', '184358022as5', 'Equipa 3_A', 'Defesa', 1, 0, 0),
(5, 'Torneio_3', '183758032ao5', 'Equipa 3_A', 'Ponta de lança', 1, 0, 0),
(5, 'Torneio_3', '123406380er5', 'Equipa 3_A', 'Médio', 1, 0, 0),
(5, 'Torneio_3', '130478822as5', 'Equipa 3_A', 'Avançado', 1, 0, 0),
(5, 'Torneio_3', '190234563ds5', 'Equipa 3_D', 'Guarda-redes', 0, 0, 0),
(5, 'Torneio_3', '193002322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(5, 'Torneio_3', '100424322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(5, 'Torneio_3', '193052312ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(5, 'Torneio_3', '195660013ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(5, 'Torneio_3', '120456828io5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(5, 'Torneio_3', '198916802ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(5, 'Torneio_3', '195660613ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(5, 'Torneio_3', '123066822as5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(5, 'Torneio_3', '190612513ds5', 'Equipa 3_D', 'Ponta de lança', 0, 0, 0),
(5, 'Torneio_3', '103344322ds5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(5, 'Torneio_3', '103007642er5', 'Equipa 3_D', 'Guarda-redes', 1, 0, 0),
(5, 'Torneio_3', '184358022as0', 'Equipa 3_D', 'Defesa', 1, 0, 0),
(5, 'Torneio_3', '183708032ao5', 'Equipa 3_D', 'Ponta de lança', 1, 0, 0),
(5, 'Torneio_3', '103406380er5', 'Equipa 3_D', 'Médio', 1, 0, 0),
(5, 'Torneio_3', '130470822as5', 'Equipa 3_D', 'Avançado', 1, 0, 0),
(6, 'Torneio_3', '193534563ds5', 'Equipa 3_B', 'Guarda-redes', 0, 0, 0),
(6, 'Torneio_3', '123456858io5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(6, 'Torneio_3', '193452352ds5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(6, 'Torneio_3', '193424322gs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(6, 'Torneio_3', '193452312hs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(6, 'Torneio_3', '195661513us5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(6, 'Torneio_3', '198916832qs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(6, 'Torneio_3', '195663613rs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(6, 'Torneio_3', '133456822ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(6, 'Torneio_3', '195212513ds5', 'Equipa 3_B', 'Ponta de lança', 0, 0, 0),
(6, 'Torneio_3', '143344322ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(6, 'Torneio_3', '193424542ds5', 'Equipa 3_B', 'Guarda-redes', 1, 0, 0),
(6, 'Torneio_3', '193264513ds5', 'Equipa 3_B', 'Defesa', 1, 0, 0),
(6, 'Torneio_3', '183778032ao5', 'Equipa 3_B', 'Ponta de lança', 1, 0, 0),
(6, 'Torneio_3', '123476380er5', 'Equipa 3_B', 'Médio', 1, 0, 0),
(6, 'Torneio_3', '130778822as5', 'Equipa 3_B', 'Avançado', 1, 0, 0),
(6, 'Torneio_3', '193534963ds5', 'Equipa 3_C', 'Guarda-redes', 0, 0, 0),
(6, 'Torneio_3', '123496858io5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(6, 'Torneio_3', '193452352ds9', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(6, 'Torneio_3', '193424922gs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(6, 'Torneio_3', '193452912hs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(6, 'Torneio_3', '195661913us5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(6, 'Torneio_3', '198996832qs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(6, 'Torneio_3', '195693613rs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(6, 'Torneio_3', '133496822ds5', 'Equipa 3_C', 'Avançado', 0, 2, 0),
(6, 'Torneio_3', '195292513ds5', 'Equipa 3_C', 'Ponta de lança', 0, 0, 0),
(6, 'Torneio_3', '143349322ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(6, 'Torneio_3', '193924542ds5', 'Equipa 3_C', 'Guarda-redes', 1, 0, 0),
(6, 'Torneio_3', '193964513ds5', 'Equipa 3_C', 'Defesa', 1, 0, 0),
(6, 'Torneio_3', '183779032ao5', 'Equipa 3_C', 'Ponta de lança', 1, 0, 0),
(6, 'Torneio_3', '123976380er5', 'Equipa 3_C', 'Médio', 1, 0, 0),
(6, 'Torneio_3', '130778829as5', 'Equipa 3_C', 'Avançado', 1, 0, 0),
(8, 'Torneio_3', '190234563ds5', 'Equipa 3_D', 'Guarda-redes', 0, 0, 0),
(8, 'Torneio_3', '193002322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(8, 'Torneio_3', '100424322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(8, 'Torneio_3', '193052312ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(8, 'Torneio_3', '195660013ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(8, 'Torneio_3', '120456828io5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(8, 'Torneio_3', '198916802ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(8, 'Torneio_3', '195660613ds5', 'Equipa 3_D', 'Médio', 0, 1, 0),
(8, 'Torneio_3', '123066822as5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(8, 'Torneio_3', '190612513ds5', 'Equipa 3_D', 'Ponta de lança', 0, 0, 0),
(8, 'Torneio_3', '103344322ds5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(8, 'Torneio_3', '103007642er5', 'Equipa 3_D', 'Guarda-redes', 1, 0, 0),
(8, 'Torneio_3', '184358022as0', 'Equipa 3_D', 'Defesa', 1, 0, 0),
(8, 'Torneio_3', '183708032ao5', 'Equipa 3_D', 'Ponta de lança', 1, 0, 0),
(8, 'Torneio_3', '103406380er5', 'Equipa 3_D', 'Médio', 1, 0, 0),
(8, 'Torneio_3', '130470822as5', 'Equipa 3_D', 'Avançado', 1, 0, 0),
(8, 'Torneio_3', '193534963ds5', 'Equipa 3_C', 'Guarda-redes', 0, 0, 0),
(8, 'Torneio_3', '123496858io5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(8, 'Torneio_3', '193452352ds9', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(8, 'Torneio_3', '193424922gs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(8, 'Torneio_3', '193452912hs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(8, 'Torneio_3', '195661913us5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(8, 'Torneio_3', '198996832qs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(8, 'Torneio_3', '195693613rs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(8, 'Torneio_3', '133496822ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(8, 'Torneio_3', '195292513ds5', 'Equipa 3_C', 'Ponta de lança', 0, 0, 0),
(8, 'Torneio_3', '143349322ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(8, 'Torneio_3', '193924542ds5', 'Equipa 3_C', 'Guarda-redes', 1, 0, 0),
(8, 'Torneio_3', '193964513ds5', 'Equipa 3_C', 'Defesa', 1, 0, 0),
(8, 'Torneio_3', '183779032ao5', 'Equipa 3_C', 'Ponta de lança', 1, 0, 0),
(8, 'Torneio_3', '123976380er5', 'Equipa 3_C', 'Médio', 1, 0, 0),
(8, 'Torneio_3', '130778829as5', 'Equipa 3_C', 'Avançado', 1, 0, 0),
(9, 'Torneio_3', '193234563ds5', 'Equipa 3_A', 'Guarda-redes', 0, 0, 0),
(9, 'Torneio_3', '123456828io5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(9, 'Torneio_3', '193452322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(9, 'Torneio_3', '193424322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(9, 'Torneio_3', '193452312ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(9, 'Torneio_3', '195661513ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(9, 'Torneio_3', '198916832ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(9, 'Torneio_3', '195663613ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(9, 'Torneio_3', '123466822as5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(9, 'Torneio_3', '195612513ds5', 'Equipa 3_A', 'Ponta de lança', 0, 0, 0),
(9, 'Torneio_3', '193344322ds5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(9, 'Torneio_3', '183007642er5', 'Equipa 3_A', 'Guarda-redes', 1, 0, 0),
(9, 'Torneio_3', '184358022as5', 'Equipa 3_A', 'Defesa', 1, 0, 0),
(9, 'Torneio_3', '183758032ao5', 'Equipa 3_A', 'Ponta de lança', 1, 1, 0),
(9, 'Torneio_3', '123406380er5', 'Equipa 3_A', 'Médio', 1, 0, 0),
(9, 'Torneio_3', '130478822as5', 'Equipa 3_A', 'Avançado', 1, 0, 0),
(9, 'Torneio_3', '193534963ds5', 'Equipa 3_C', 'Guarda-redes', 0, 0, 0),
(9, 'Torneio_3', '123496858io5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(9, 'Torneio_3', '193452352ds9', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(9, 'Torneio_3', '193424922gs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(9, 'Torneio_3', '193452912hs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(9, 'Torneio_3', '195661913us5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(9, 'Torneio_3', '198996832qs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(9, 'Torneio_3', '195693613rs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(9, 'Torneio_3', '133496822ds5', 'Equipa 3_C', 'Avançado', 0, 1, 0),
(9, 'Torneio_3', '195292513ds5', 'Equipa 3_C', 'Ponta de lança', 0, 2, 0),
(9, 'Torneio_3', '143349322ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(9, 'Torneio_3', '193924542ds5', 'Equipa 3_C', 'Guarda-redes', 1, 0, 0),
(9, 'Torneio_3', '193964513ds5', 'Equipa 3_C', 'Defesa', 1, 0, 0),
(9, 'Torneio_3', '183779032ao5', 'Equipa 3_C', 'Ponta de lança', 1, 2, 0),
(9, 'Torneio_3', '123976380er5', 'Equipa 3_C', 'Médio', 1, 0, 0),
(9, 'Torneio_3', '130778829as5', 'Equipa 3_C', 'Avançado', 1, 0, 0),
(10, 'Torneio_3', '190234563ds5', 'Equipa 3_D', 'Guarda-redes', 0, 0, 0),
(10, 'Torneio_3', '193002322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(10, 'Torneio_3', '100424322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(10, 'Torneio_3', '193052312ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(10, 'Torneio_3', '195660013ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(10, 'Torneio_3', '120456828io5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(10, 'Torneio_3', '198916802ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(10, 'Torneio_3', '195660613ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(10, 'Torneio_3', '123066822as5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(10, 'Torneio_3', '190612513ds5', 'Equipa 3_D', 'Ponta de lança', 0, 0, 0),
(10, 'Torneio_3', '103344322ds5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(10, 'Torneio_3', '103007642er5', 'Equipa 3_D', 'Guarda-redes', 1, 0, 0),
(10, 'Torneio_3', '184358022as0', 'Equipa 3_D', 'Defesa', 1, 0, 0),
(10, 'Torneio_3', '183708032ao5', 'Equipa 3_D', 'Ponta de lança', 1, 0, 0),
(10, 'Torneio_3', '103406380er5', 'Equipa 3_D', 'Médio', 1, 0, 0),
(10, 'Torneio_3', '130470822as5', 'Equipa 3_D', 'Avançado', 1, 0, 0),
(10, 'Torneio_3', '193534563ds5', 'Equipa 3_B', 'Guarda-redes', 0, 0, 0),
(10, 'Torneio_3', '123456858io5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(10, 'Torneio_3', '193452352ds5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(10, 'Torneio_3', '193424322gs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(10, 'Torneio_3', '193452312hs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(10, 'Torneio_3', '195661513us5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(10, 'Torneio_3', '198916832qs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(10, 'Torneio_3', '195663613rs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(10, 'Torneio_3', '133456822ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(10, 'Torneio_3', '195212513ds5', 'Equipa 3_B', 'Ponta de lança', 0, 0, 0),
(10, 'Torneio_3', '143344322ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(10, 'Torneio_3', '193424542ds5', 'Equipa 3_B', 'Guarda-redes', 1, 0, 0),
(10, 'Torneio_3', '193264513ds5', 'Equipa 3_B', 'Defesa', 1, 0, 0),
(10, 'Torneio_3', '183778032ao5', 'Equipa 3_B', 'Ponta de lança', 1, 0, 0),
(10, 'Torneio_3', '123476380er5', 'Equipa 3_B', 'Médio', 1, 0, 0),
(10, 'Torneio_3', '130778822as5', 'Equipa 3_B', 'Avançado', 1, 0, 0),
(11, 'Torneio_3', '190234563ds5', 'Equipa 3_D', 'Guarda-redes', 0, 0, 0),
(11, 'Torneio_3', '193002322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(11, 'Torneio_3', '100424322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(11, 'Torneio_3', '193052312ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(11, 'Torneio_3', '195660013ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(11, 'Torneio_3', '120456828io5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(11, 'Torneio_3', '198916802ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(11, 'Torneio_3', '195660613ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(11, 'Torneio_3', '123066822as5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(11, 'Torneio_3', '190612513ds5', 'Equipa 3_D', 'Ponta de lança', 0, 0, 0),
(11, 'Torneio_3', '103344322ds5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(11, 'Torneio_3', '103007642er5', 'Equipa 3_D', 'Guarda-redes', 1, 0, 0),
(11, 'Torneio_3', '184358022as0', 'Equipa 3_D', 'Defesa', 1, 0, 0),
(11, 'Torneio_3', '183708032ao5', 'Equipa 3_D', 'Ponta de lança', 1, 0, 0),
(11, 'Torneio_3', '103406380er5', 'Equipa 3_D', 'Médio', 1, 0, 0),
(11, 'Torneio_3', '130470822as5', 'Equipa 3_D', 'Avançado', 1, 0, 0),
(11, 'Torneio_3', '193234563ds5', 'Equipa 3_A', 'Guarda-redes', 0, 0, 0),
(11, 'Torneio_3', '123456828io5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(11, 'Torneio_3', '193452322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(11, 'Torneio_3', '193424322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(11, 'Torneio_3', '193452312ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(11, 'Torneio_3', '195661513ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(11, 'Torneio_3', '198916832ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(11, 'Torneio_3', '195663613ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(11, 'Torneio_3', '123466822as5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(11, 'Torneio_3', '195612513ds5', 'Equipa 3_A', 'Ponta de lança', 0, 0, 0),
(11, 'Torneio_3', '193344322ds5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(11, 'Torneio_3', '183007642er5', 'Equipa 3_A', 'Guarda-redes', 1, 0, 0),
(11, 'Torneio_3', '184358022as5', 'Equipa 3_A', 'Defesa', 1, 0, 0),
(11, 'Torneio_3', '183758032ao5', 'Equipa 3_A', 'Ponta de lança', 1, 0, 0),
(11, 'Torneio_3', '123406380er5', 'Equipa 3_A', 'Médio', 1, 0, 0),
(11, 'Torneio_3', '130478822as5', 'Equipa 3_A', 'Avançado', 1, 0, 0),
(12, 'Torneio_3', '193534963ds5', 'Equipa 3_C', 'Guarda-redes', 0, 0, 0),
(12, 'Torneio_3', '123496858io5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(12, 'Torneio_3', '193452352ds9', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(12, 'Torneio_3', '193424922gs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(12, 'Torneio_3', '193452912hs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(12, 'Torneio_3', '195661913us5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(12, 'Torneio_3', '198996832qs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(12, 'Torneio_3', '195693613rs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(12, 'Torneio_3', '133496822ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(12, 'Torneio_3', '195292513ds5', 'Equipa 3_C', 'Ponta de lança', 0, 0, 0),
(12, 'Torneio_3', '143349322ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(12, 'Torneio_3', '193924542ds5', 'Equipa 3_C', 'Guarda-redes', 1, 0, 0),
(12, 'Torneio_3', '193964513ds5', 'Equipa 3_C', 'Defesa', 1, 0, 0),
(12, 'Torneio_3', '183779032ao5', 'Equipa 3_C', 'Ponta de lança', 1, 0, 0),
(12, 'Torneio_3', '123976380er5', 'Equipa 3_C', 'Médio', 1, 0, 0),
(12, 'Torneio_3', '130778829as5', 'Equipa 3_C', 'Avançado', 1, 0, 0),
(12, 'Torneio_3', '193534563ds5', 'Equipa 3_B', 'Guarda-redes', 0, 0, 0),
(12, 'Torneio_3', '123456858io5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(12, 'Torneio_3', '193452352ds5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(12, 'Torneio_3', '193424322gs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(12, 'Torneio_3', '193452312hs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(12, 'Torneio_3', '195661513us5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(12, 'Torneio_3', '198916832qs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(12, 'Torneio_3', '195663613rs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(12, 'Torneio_3', '133456822ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(12, 'Torneio_3', '195212513ds5', 'Equipa 3_B', 'Ponta de lança', 0, 0, 0),
(12, 'Torneio_3', '143344322ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(12, 'Torneio_3', '193424542ds5', 'Equipa 3_B', 'Guarda-redes', 1, 0, 0),
(12, 'Torneio_3', '193264513ds5', 'Equipa 3_B', 'Defesa', 1, 0, 0),
(12, 'Torneio_3', '183778032ao5', 'Equipa 3_B', 'Ponta de lança', 1, 0, 0),
(12, 'Torneio_3', '123476380er5', 'Equipa 3_B', 'Médio', 1, 0, 0),
(12, 'Torneio_3', '130778822as5', 'Equipa 3_B', 'Avançado', 1, 0, 0),
(14, 'Torneio_3', '193534963ds5', 'Equipa 3_C', 'Guarda-redes', 0, 0, 0),
(14, 'Torneio_3', '123496858io5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(14, 'Torneio_3', '193452352ds9', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(14, 'Torneio_3', '193424922gs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(14, 'Torneio_3', '193452912hs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(14, 'Torneio_3', '195661913us5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(14, 'Torneio_3', '198996832qs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(14, 'Torneio_3', '195693613rs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(14, 'Torneio_3', '133496822ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(14, 'Torneio_3', '195292513ds5', 'Equipa 3_C', 'Ponta de lança', 0, 0, 0),
(14, 'Torneio_3', '143349322ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(14, 'Torneio_3', '193924542ds5', 'Equipa 3_C', 'Guarda-redes', 1, 0, 0),
(14, 'Torneio_3', '193964513ds5', 'Equipa 3_C', 'Defesa', 1, 0, 0),
(14, 'Torneio_3', '183779032ao5', 'Equipa 3_C', 'Ponta de lança', 1, 0, 0),
(14, 'Torneio_3', '123976380er5', 'Equipa 3_C', 'Médio', 1, 0, 0),
(14, 'Torneio_3', '130778829as5', 'Equipa 3_C', 'Avançado', 1, 0, 0),
(14, 'Torneio_3', '190234563ds5', 'Equipa 3_D', 'Guarda-redes', 0, 0, 0),
(14, 'Torneio_3', '193002322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(14, 'Torneio_3', '100424322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(14, 'Torneio_3', '193052312ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(14, 'Torneio_3', '195660013ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(14, 'Torneio_3', '120456828io5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(14, 'Torneio_3', '198916802ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(14, 'Torneio_3', '195660613ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(14, 'Torneio_3', '123066822as5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(14, 'Torneio_3', '190612513ds5', 'Equipa 3_D', 'Ponta de lança', 0, 0, 0),
(14, 'Torneio_3', '103344322ds5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(14, 'Torneio_3', '103007642er5', 'Equipa 3_D', 'Guarda-redes', 1, 0, 0),
(14, 'Torneio_3', '184358022as0', 'Equipa 3_D', 'Defesa', 1, 0, 0),
(14, 'Torneio_3', '183708032ao5', 'Equipa 3_D', 'Ponta de lança', 1, 0, 0),
(14, 'Torneio_3', '103406380er5', 'Equipa 3_D', 'Médio', 1, 0, 0),
(14, 'Torneio_3', '130470822as5', 'Equipa 3_D', 'Avançado', 1, 0, 0),
(15, 'Torneio_3', '193234563ds5', 'Equipa 3_A', 'Guarda-redes', 0, 0, 0),
(15, 'Torneio_3', '123456828io5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(15, 'Torneio_3', '193452322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(15, 'Torneio_3', '193424322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(15, 'Torneio_3', '193452312ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(15, 'Torneio_3', '195661513ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(15, 'Torneio_3', '198916832ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(15, 'Torneio_3', '195663613ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(15, 'Torneio_3', '123466822as5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(15, 'Torneio_3', '195612513ds5', 'Equipa 3_A', 'Ponta de lança', 0, 0, 0),
(15, 'Torneio_3', '193344322ds5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(15, 'Torneio_3', '183007642er5', 'Equipa 3_A', 'Guarda-redes', 1, 0, 0),
(15, 'Torneio_3', '184358022as5', 'Equipa 3_A', 'Defesa', 1, 0, 0),
(15, 'Torneio_3', '183758032ao5', 'Equipa 3_A', 'Ponta de lança', 1, 0, 0),
(15, 'Torneio_3', '123406380er5', 'Equipa 3_A', 'Médio', 1, 0, 0),
(15, 'Torneio_3', '130478822as5', 'Equipa 3_A', 'Avançado', 1, 0, 0),
(15, 'Torneio_3', '193534963ds5', 'Equipa 3_C', 'Guarda-redes', 0, 0, 0),
(15, 'Torneio_3', '123496858io5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(15, 'Torneio_3', '193452352ds9', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(15, 'Torneio_3', '193424922gs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(15, 'Torneio_3', '193452912hs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(15, 'Torneio_3', '195661913us5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(15, 'Torneio_3', '198996832qs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(15, 'Torneio_3', '195693613rs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(15, 'Torneio_3', '133496822ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(15, 'Torneio_3', '195292513ds5', 'Equipa 3_C', 'Ponta de lança', 0, 0, 0),
(15, 'Torneio_3', '143349322ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(15, 'Torneio_3', '193924542ds5', 'Equipa 3_C', 'Guarda-redes', 1, 0, 0),
(15, 'Torneio_3', '193964513ds5', 'Equipa 3_C', 'Defesa', 1, 0, 0),
(15, 'Torneio_3', '183779032ao5', 'Equipa 3_C', 'Ponta de lança', 1, 0, 0),
(15, 'Torneio_3', '123976380er5', 'Equipa 3_C', 'Médio', 1, 0, 0),
(15, 'Torneio_3', '130778829as5', 'Equipa 3_C', 'Avançado', 1, 0, 0),
(16, 'Torneio_3', '193534563ds5', 'Equipa 3_B', 'Guarda-redes', 0, 0, 0),
(16, 'Torneio_3', '123456858io5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(16, 'Torneio_3', '193452352ds5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(16, 'Torneio_3', '193424322gs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(16, 'Torneio_3', '193452312hs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(16, 'Torneio_3', '195661513us5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(16, 'Torneio_3', '198916832qs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(16, 'Torneio_3', '195663613rs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(16, 'Torneio_3', '133456822ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(16, 'Torneio_3', '195212513ds5', 'Equipa 3_B', 'Ponta de lança', 0, 0, 0),
(16, 'Torneio_3', '143344322ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(16, 'Torneio_3', '193424542ds5', 'Equipa 3_B', 'Guarda-redes', 1, 0, 0),
(16, 'Torneio_3', '193264513ds5', 'Equipa 3_B', 'Defesa', 1, 0, 0),
(16, 'Torneio_3', '183778032ao5', 'Equipa 3_B', 'Ponta de lança', 1, 0, 0),
(16, 'Torneio_3', '123476380er5', 'Equipa 3_B', 'Médio', 1, 0, 0),
(16, 'Torneio_3', '130778822as5', 'Equipa 3_B', 'Avançado', 1, 0, 0),
(16, 'Torneio_3', '190234563ds5', 'Equipa 3_D', 'Guarda-redes', 0, 0, 0),
(16, 'Torneio_3', '193002322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(16, 'Torneio_3', '100424322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(16, 'Torneio_3', '193052312ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(16, 'Torneio_3', '195660013ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(16, 'Torneio_3', '120456828io5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(16, 'Torneio_3', '198916802ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(16, 'Torneio_3', '195660613ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(16, 'Torneio_3', '123066822as5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(16, 'Torneio_3', '190612513ds5', 'Equipa 3_D', 'Ponta de lança', 0, 0, 0),
(16, 'Torneio_3', '103344322ds5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(16, 'Torneio_3', '103007642er5', 'Equipa 3_D', 'Guarda-redes', 1, 0, 0),
(16, 'Torneio_3', '184358022as0', 'Equipa 3_D', 'Defesa', 1, 0, 0),
(16, 'Torneio_3', '183708032ao5', 'Equipa 3_D', 'Ponta de lança', 1, 0, 0),
(16, 'Torneio_3', '103406380er5', 'Equipa 3_D', 'Médio', 1, 0, 0),
(16, 'Torneio_3', '130470822as5', 'Equipa 3_D', 'Avançado', 1, 0, 0),
(17, 'Torneio_3', '193234563ds5', 'Equipa 3_A', 'Guarda-redes', 0, 0, 0),
(17, 'Torneio_3', '123456828io5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(17, 'Torneio_3', '193452322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(17, 'Torneio_3', '193424322ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(17, 'Torneio_3', '193452312ds5', 'Equipa 3_A', 'Defesa', 0, 0, 0),
(17, 'Torneio_3', '195661513ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(17, 'Torneio_3', '198916832ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(17, 'Torneio_3', '195663613ds5', 'Equipa 3_A', 'Médio', 0, 0, 0),
(17, 'Torneio_3', '123466822as5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(17, 'Torneio_3', '195612513ds5', 'Equipa 3_A', 'Ponta de lança', 0, 0, 0),
(17, 'Torneio_3', '193344322ds5', 'Equipa 3_A', 'Avançado', 0, 0, 0),
(17, 'Torneio_3', '183007642er5', 'Equipa 3_A', 'Guarda-redes', 1, 0, 0),
(17, 'Torneio_3', '184358022as5', 'Equipa 3_A', 'Defesa', 1, 0, 0),
(17, 'Torneio_3', '183758032ao5', 'Equipa 3_A', 'Ponta de lança', 1, 0, 0),
(17, 'Torneio_3', '123406380er5', 'Equipa 3_A', 'Médio', 1, 0, 0),
(17, 'Torneio_3', '130478822as5', 'Equipa 3_A', 'Avançado', 1, 0, 0),
(17, 'Torneio_3', '190234563ds5', 'Equipa 3_D', 'Guarda-redes', 0, 0, 0),
(17, 'Torneio_3', '193002322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(17, 'Torneio_3', '100424322ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(17, 'Torneio_3', '193052312ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(17, 'Torneio_3', '195660013ds5', 'Equipa 3_D', 'Defesa', 0, 0, 0),
(17, 'Torneio_3', '120456828io5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(17, 'Torneio_3', '198916802ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(17, 'Torneio_3', '195660613ds5', 'Equipa 3_D', 'Médio', 0, 0, 0),
(17, 'Torneio_3', '123066822as5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(17, 'Torneio_3', '190612513ds5', 'Equipa 3_D', 'Ponta de lança', 0, 0, 0),
(17, 'Torneio_3', '103344322ds5', 'Equipa 3_D', 'Avançado', 0, 0, 0),
(17, 'Torneio_3', '103007642er5', 'Equipa 3_D', 'Guarda-redes', 1, 0, 0),
(17, 'Torneio_3', '184358022as0', 'Equipa 3_D', 'Defesa', 1, 0, 0),
(17, 'Torneio_3', '183708032ao5', 'Equipa 3_D', 'Ponta de lança', 1, 0, 0),
(17, 'Torneio_3', '103406380er5', 'Equipa 3_D', 'Médio', 1, 0, 0),
(17, 'Torneio_3', '130470822as5', 'Equipa 3_D', 'Avançado', 1, 0, 0),
(18, 'Torneio_3', '193534563ds5', 'Equipa 3_B', 'Guarda-redes', 0, 0, 0),
(18, 'Torneio_3', '123456858io5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(18, 'Torneio_3', '193452352ds5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(18, 'Torneio_3', '193424322gs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(18, 'Torneio_3', '193452312hs5', 'Equipa 3_B', 'Defesa', 0, 0, 0),
(18, 'Torneio_3', '195661513us5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(18, 'Torneio_3', '198916832qs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(18, 'Torneio_3', '195663613rs5', 'Equipa 3_B', 'Médio', 0, 0, 0),
(18, 'Torneio_3', '133456822ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(18, 'Torneio_3', '195212513ds5', 'Equipa 3_B', 'Ponta de lança', 0, 0, 0),
(18, 'Torneio_3', '143344322ds5', 'Equipa 3_B', 'Avançado', 0, 0, 0),
(18, 'Torneio_3', '193424542ds5', 'Equipa 3_B', 'Guarda-redes', 1, 0, 0),
(18, 'Torneio_3', '193264513ds5', 'Equipa 3_B', 'Defesa', 1, 0, 0),
(18, 'Torneio_3', '183778032ao5', 'Equipa 3_B', 'Ponta de lança', 1, 0, 0),
(18, 'Torneio_3', '123476380er5', 'Equipa 3_B', 'Médio', 1, 0, 0),
(18, 'Torneio_3', '130778822as5', 'Equipa 3_B', 'Avançado', 1, 0, 0),
(18, 'Torneio_3', '193534963ds5', 'Equipa 3_C', 'Guarda-redes', 0, 0, 0),
(18, 'Torneio_3', '123496858io5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(18, 'Torneio_3', '193452352ds9', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(18, 'Torneio_3', '193424922gs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(18, 'Torneio_3', '193452912hs5', 'Equipa 3_C', 'Defesa', 0, 0, 0),
(18, 'Torneio_3', '195661913us5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(18, 'Torneio_3', '198996832qs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(18, 'Torneio_3', '195693613rs5', 'Equipa 3_C', 'Médio', 0, 0, 0),
(18, 'Torneio_3', '133496822ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(18, 'Torneio_3', '195292513ds5', 'Equipa 3_C', 'Ponta de lança', 0, 0, 0),
(18, 'Torneio_3', '143349322ds5', 'Equipa 3_C', 'Avançado', 0, 0, 0),
(18, 'Torneio_3', '193924542ds5', 'Equipa 3_C', 'Guarda-redes', 1, 0, 0),
(18, 'Torneio_3', '193964513ds5', 'Equipa 3_C', 'Defesa', 1, 0, 0),
(18, 'Torneio_3', '183779032ao5', 'Equipa 3_C', 'Ponta de lança', 1, 0, 0),
(18, 'Torneio_3', '123976380er5', 'Equipa 3_C', 'Médio', 1, 0, 0),
(18, 'Torneio_3', '130778829as5', 'Equipa 3_C', 'Avançado', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogos`
--

CREATE TABLE `jogos` (
  `id_jogo` bigint(20) UNSIGNED NOT NULL,
  `Nome_torneio` varchar(100) NOT NULL,
  `Data` date DEFAULT NULL,
  `Golos_visitantes` int(11) DEFAULT NULL,
  `Golos_visitados` int(11) DEFAULT NULL,
  `Nome_equipa_visitante` varchar(100) NOT NULL,
  `Nome_equipa_visitada` varchar(100) NOT NULL,
  `id_slot` int(11) NOT NULL,
  `Jornada` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jogos`
--

INSERT INTO `jogos` (`id_jogo`, `Nome_torneio`, `Data`, `Golos_visitantes`, `Golos_visitados`, `Nome_equipa_visitante`, `Nome_equipa_visitada`, `id_slot`, `Jornada`) VALUES
(1, 'Torneio Feminino', '2019-09-11', 1, 0, 'Equipa F_A', 'Equipa F_B', 2, 1),
(2, 'Torneio Feminino', '2019-09-13', 2, 5, 'Equipa F_C', 'Equipa F_D', 2, 0),
(3, 'Torneio Feminino', '2019-09-18', 0, 0, 'Equipa F_C', 'Equipa F_A', 2, 2),
(4, 'Torneio Feminino', '2019-09-20', 1, 0, 'Equipa F_B', 'Equipa F_D', 3, 3),
(5, 'Torneio Feminino', '2019-09-25', 0, 0, 'Equipa F_A', 'Equipa F_D', 2, 3),
(6, 'Torneio Feminino', '2019-09-27', 0, 2, 'Equipa F_B', 'Equipa F_C', 3, 4),
(7, 'Torneio Feminino', '2019-11-02', 3, 0, 'Equipa F_B', 'Equipa F_A', 2, 4),
(8, 'Torneio Feminino', '2019-10-04', 0, 0, 'Equipa F_D', 'Equipa F_C', 3, 5),
(9, 'Torneio Feminino', '2019-10-09', 2, 0, 'Equipa F_A', 'Equipa F_C', 2, 5),
(10, 'Torneio Feminino', '2019-10-11', 0, 1, 'Equipa F_D', 'Equipa F_B', 3, 6),
(11, 'Torneio Feminino', '2019-10-16', 2, 0, 'Equipa F_D', 'Equipa F_A', 2, 6),
(12, 'Torneio Feminino', '2019-10-18', 0, 1, 'Equipa F_C', 'Equipa F_B', 3, 7),
(13, 'Torneio Feminino', '2019-10-23', 5, 5, 'Equipa F_A', 'Equipa F_B', 2, 7),
(14, 'Torneio Feminino', '2019-10-25', 0, 0, 'Equipa F_C', 'Equipa F_D', 3, 8),
(15, 'Torneio Feminino', '2019-10-30', 0, 4, 'Equipa F_A', 'Equipa F_C', 2, 8),
(16, 'Torneio Feminino', '2019-11-02', 3, 0, 'Equipa F_B', 'Equipa F_D', 3, 9),
(17, 'Torneio Feminino', '2019-11-06', 0, 1, 'Equipa F_A', 'Equipa F_D', 2, 9),
(18, 'Torneio Feminino', '2019-11-08', 0, 0, 'Equipa F_B', 'Equipa F_C', 3, 10),
(13, 'Torneio_3', '2020-01-06', NULL, NULL, 'Equipa 3_A', 'Equipa 3_B', 1, 9),
(7, 'Torneio_3', '2019-12-02', 0, 0, 'Equipa 3_B', 'Equipa 3_A', 1, 4),
(1, 'Torneio_3', '2019-11-11', 1, 0, 'Equipa 3_A', 'Equipa 3_B', 1, 1),
(2, 'Torneio_3', '2019-11-13', 3, 0, 'Equipa 3_C', 'Equipa 3_D', 2, 1),
(3, 'Torneio_3', '2019-11-18', 0, 0, 'Equipa 3_C', 'Equipa 3_A', 1, 2),
(4, 'Torneio_3', '2019-11-20', 1, 0, 'Equipa 3_B', 'Equipa 3_D', 2, 2),
(5, 'Torneio_3', '2019-11-25', 0, 0, 'Equipa 3_A', 'Equipa 3_D', 1, 3),
(6, 'Torneio_3', '2019-11-27', 0, 2, 'Equipa 3_B', 'Equipa 3_C', 2, 3),
(8, 'Torneio_3', '2019-12-04', 1, 0, 'Equipa 3_D', 'Equipa 3_C', 2, 4),
(9, 'Torneio_3', '2019-12-09', 1, 5, 'Equipa 3_A', 'Equipa 3_C', 1, 5),
(10, 'Torneio_3', '2019-12-11', NULL, NULL, 'Equipa 3_D', 'Equipa 3_B', 2, 5),
(11, 'Torneio_3', '2019-12-16', NULL, NULL, 'Equipa 3_D', 'Equipa 3_A', 1, 6),
(12, 'Torneio_3', '2019-12-18', NULL, NULL, 'Equipa 3_C', 'Equipa 3_B', 2, 6),
(14, 'Torneio_3', '2020-01-08', NULL, NULL, 'Equipa 3_C', 'Equipa 3_D', 1, 7),
(15, 'Torneio_3', '2020-01-13', NULL, NULL, 'Equipa 3_A', 'Equipa 3_C', 2, 8),
(16, 'Torneio_3', '2020-01-15', NULL, NULL, 'Equipa 3_B', 'Equipa 3_D', 1, 8),
(17, 'Torneio_3', '2020-01-20', NULL, NULL, 'Equipa 3_A', 'Equipa 3_D', 2, 9),
(18, 'Torneio_3', '2020-01-22', NULL, NULL, 'Equipa 3_B', 'Equipa 3_C', 1, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `notifica`
--

CREATE TABLE `notifica` (
  `CC_autor` varchar(12) NOT NULL,
  `CC` varchar(12) NOT NULL,
  `id_notificacao` bigint(20) UNSIGNED NOT NULL,
  `Lida` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `notifica`
--

INSERT INTO `notifica` (`CC_autor`, `CC`, `id_notificacao`, `Lida`) VALUES
('123456784ds5', '123456822as5', 1, 0),
('123456822as5', '123456784ds5', 2, 1),
('123456822as6', '123456784ds5', 3, 1),
('125456822as5', '123456784ds5', 4, 1),
('123456828qw4', '123456784ds5', 8, 1),
('123456828io5', '123456784ds5', 9, 1),
('198936232ds5', '123456784ds5', 9381, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id_notificacao` bigint(20) UNSIGNED NOT NULL,
  `Texto` varchar(1000) DEFAULT NULL,
  `Data` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `notificacoes`
--

INSERT INTO `notificacoes` (`id_notificacao`, `Texto`, `Data`) VALUES
(1, 'ola do admin', '2019-11-15 13:55:57'),
(2, 'ola2', '2019-11-15 13:55:25'),
(3, 'ola3', '2019-11-15 16:17:23'),
(4, 'nova notificacao', '2019-11-20 17:06:34'),
(9, 'Novo utilizador Alberto pediu registo na plataforma.<br>\r\n								<a href=\"php_functions/signup_functions.php?f=aceita&user_id=123456828io5\">Permitir</a> ou \r\n								<a href=\"php_functions/signup_functions.php?f=recusa&user_id=123456828io5\">recusar</a>?', '2019-11-20 19:27:06'),
(8, 'Novo utilizador Paulo pediu registo na plataforma.<br>\r\n								<a href=\"php_functions/signup_functions.php?f=aceita&user_id=123456828qw4\">Permitir</a> ou \r\n								<a href=\"php_functions/signup_functions.php?f=recusa&user_id=123456828qw4\">recusar</a>?', '2019-11-20 17:51:43'),
(9381, 'Novo utilizador Diogo pediu registo na plataforma.<br>\r\n								<a href=\"php_functions/signup_functions.php?f=aceita&user_id=198936232ds5\">Permitir</a> ou \r\n								<a href=\"php_functions/signup_functions.php?f=recusa&user_id=198936232ds5\">recusar</a>?', '2019-11-27 12:55:17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `posicoes desejadas`
--

CREATE TABLE `posicoes desejadas` (
  `Posicao` varchar(100) DEFAULT NULL,
  `CC` varchar(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `posicoes desejadas`
--

INSERT INTO `posicoes desejadas` (`Posicao`, `CC`) VALUES
('Guarda-redes', '125456822as5'),
('Defesa', '193456822as5'),
('Defesa', '193445822as5'),
('Defesa', '134456822as5'),
('Defesa', '193452324as5'),
('Médio', '193456852er5'),
('Médio', '193456852as5'),
('Médio', '123456822as6'),
('Avançado', '123478682as6'),
('Avançado', '193459852er5'),
('Ponta de lança', '193756852as5'),
('Guarda-redes', '185456822as5'),
('Defesa', '184456822as5'),
('Ponta de lança', '183756852as5'),
('Médio', '183456852er5'),
('Avançado', '193467852er5'),
('Guarda-redes', '198936822ds5'),
('Defesa', '123456822as5'),
('Defesa', '193447622as5'),
('Defesa', '134456452as5'),
('Defesa', '193482324as5'),
('Médio', '193654322ds5'),
('Médio', '193454342ds5'),
('Médio', '193454322ds5'),
('Avançado', '123678682as6'),
('Ponta de lança', '193756892as5'),
('Avançado', '193459852eh5'),
('Guarda-redes', '185476822as5'),
('Defesa', '184656822as5'),
('Ponta de lança', '183755652as5'),
('Médio', '123456852er5'),
('Avançado', '113467852er5'),
('Guarda-redes', '198936022ds5'),
('Defesa', '123056822as5'),
('Defesa', '193440622as5'),
('Defesa', '134056452as5'),
('Defesa', '193480324as5'),
('Médio', '193054322ds5'),
('Médio', '193654022ds5'),
('Médio', '193450342ds5'),
('Avançado', '123608682as6'),
('Ponta de lança', '193756092as5'),
('Avançado', '190059852eh5'),
('Guarda-redes', '113007842er5'),
('Defesa', '184056022as5'),
('Ponta de lança', '183755052ao5'),
('Médio', '123406850er5'),
('Avançado', '180476822as5'),
('Defesa', '123456842as5'),
('Avançado', '193456822ds5'),
('Avançado', '123466822as5'),
('Guarda-redes', '193234563ds5'),
('Defesa', '123456828io5'),
('Defesa', '193452322ds5'),
('Defesa', '193424322ds5'),
('Defesa', '193452312ds5'),
('Médio', '198916832ds5'),
('Médio', '195663613ds5'),
('Médio', '195661513ds5'),
('Ponta de lança', '195612513ds5'),
('Avançado', '193344322ds5'),
('Guarda-redes', '183007642er5'),
('Defesa', '184358022as5'),
('Ponta de lança', '183758032ao5'),
('Médio', '123406380er5'),
('Avançado', '130478822as5'),
('Guarda-redes', '193534563ds5'),
('Defesa', '123456858io5'),
('Defesa', '193452352ds5'),
('Defesa', '193424322gs5'),
('Defesa', '193452312hs5'),
('Médio', '195661513us5'),
('Avançado', '133456822ds5'),
('Médio', '198916832qs5'),
('Médio', '195663613rs5'),
('Ponta de lança', '195212513ds5'),
('Avançado', '143344322ds5'),
('Guarda-redes', '193424542ds5'),
('Defesa', '193264513ds5'),
('Ponta de lança', '183778032ao5'),
('Médio', '123476380er5'),
('Avançado', '130778822as5'),
('Guarda-redes', '193534963ds5'),
('Defesa', '123496858io5'),
('Defesa', '193452352ds9'),
('Defesa', '193424922gs5'),
('Defesa', '193452912hs5'),
('Médio', '195661913us5'),
('Médio', '198996832qs5'),
('Médio', '195693613rs5'),
('Avançado', '133496822ds5'),
('Ponta de lança', '195292513ds5'),
('Avançado', '143349322ds5'),
('Guarda-redes', '193924542ds5'),
('Defesa', '193964513ds5'),
('Ponta de lança', '183779032ao5'),
('Médio', '123976380er5'),
('Avançado', '130778829as5'),
('Guarda-redes', '190234563ds5'),
('Defesa', '193002322ds5'),
('Defesa', '100424322ds5'),
('Defesa', '193052312ds5'),
('Defesa', '195660013ds5'),
('Médio', '198916802ds5'),
('Médio', '195660613ds5'),
('Avançado', '123066822as5'),
('Ponta de lança', '190612513ds5'),
('Avançado', '103344322ds5'),
('Guarda-redes', '103007642er5'),
('Defesa', '184358022as0'),
('Ponta de lança', '183708032ao5'),
('Médio', '103406380er5'),
('Avançado', '130470822as5'),
('Médio', '120456828io5'),
('Guarda-redes', '198636022ds5'),
('Defesa', '126056822as5'),
('Defesa', '193440662as5'),
('Defesa', '634056452as5'),
('Defesa', '163480324as5'),
('Médio', '193054362ds5'),
('Médio', '193654022ds6'),
('Médio', '193460342ds5'),
('Avançado', '163608682as6'),
('Ponta de lança', '196756092as5'),
('Avançado', '190659852eh5'),
('Guarda-redes', '113007642er5'),
('Defesa', '184356022as5'),
('Ponta de lança', '183755032ao5'),
('Médio', '123406350er5'),
('Avançado', '130476822as5'),
('Defesa', '193874322ds5'),
('Defesa', '193234513ds5');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservas`
--

CREATE TABLE `reservas` (
  `CC` varchar(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservas torneios`
--

CREATE TABLE `reservas torneios` (
  `CC` varchar(12) NOT NULL,
  `Nome_torneio` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `slot`
--

CREATE TABLE `slot` (
  `id_slot` int(11) NOT NULL,
  `Nome_campo` varchar(100) NOT NULL,
  `Hora_inicio` time DEFAULT NULL,
  `Hora_fim` time DEFAULT NULL,
  `Dia_semana` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `slot`
--

INSERT INTO `slot` (`id_slot`, `Nome_campo`, `Hora_inicio`, `Hora_fim`, `Dia_semana`) VALUES
(1, 'Campo de Santa Cruz', '20:00:00', NULL, 'segunda'),
(2, 'Campo da Arregaça', '19:00:00', NULL, 'quarta'),
(3, 'Campo de Santa Cruz', '22:00:00', NULL, 'sexta');

-- --------------------------------------------------------

--
-- Estrutura da tabela `slot_torneios`
--

CREATE TABLE `slot_torneios` (
  `id_slot` int(11) NOT NULL,
  `Nome_torneio` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `slot_torneios`
--

INSERT INTO `slot_torneios` (`id_slot`, `Nome_torneio`) VALUES
(1, 'Torneio Feminino'),
(1, 'Torneio_2'),
(1, 'Torneio_3'),
(2, 'Torneio Feminino'),
(2, 'Torneio_3'),
(3, 'Torneio Feminino'),
(3, 'Torneio_2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `torneios`
--

CREATE TABLE `torneios` (
  `Nome_torneio` varchar(100) NOT NULL,
  `Data_inicio` date NOT NULL,
  `Data_fim` date NOT NULL,
  `Numero_confrontos` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `torneios`
--

INSERT INTO `torneios` (`Nome_torneio`, `Data_inicio`, `Data_fim`, `Numero_confrontos`) VALUES
('Torneio Feminino', '2019-09-11', '2019-11-08', 3),
('Torneio_2', '2020-01-15', '2020-07-15', 3),
('Torneio_3', '2019-11-11', '2020-01-22', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `CC` varchar(12) NOT NULL,
  `Primeiro_nome` varchar(100) NOT NULL,
  `Ultimo_nome` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Telemovel` int(11) DEFAULT NULL,
  `Admin` tinyint(1) DEFAULT NULL,
  `Confirmado` tinyint(1) NOT NULL DEFAULT 0,
  `Banido` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `utilizadores`
--

INSERT INTO `utilizadores` (`CC`, `Primeiro_nome`, `Ultimo_nome`, `Email`, `Password`, `Username`, `Telemovel`, `Admin`, `Confirmado`, `Banido`) VALUES
('125456822as5', 'Inês', 'Moreira', 'ineso@gmail.com', 'inespass', 'InesM', 123456789, 0, 1, 0),
('193456822as5', 'Maria José', 'Almeida', 'mjose@gmail.com', 'mjosepass', 'MariaJoséA', 123456789, 0, 1, 0),
('193445822as5', 'Maria João', 'Costa', 'mjoaoc@gmail.com', 'mjoaocpass', 'MariaJoãoC', 123456789, 0, 1, 0),
('134456822as5', 'Raquel', 'Galvão', 'raquelg@gmail.com', 'raquelgpass', 'RaquelG', 123456789, 0, 1, 0),
('193452324as5', 'Liliana', 'Figueiredo', 'lilianaf@gmail.com', 'lilianafpass', 'LilianaFig', 123456789, 0, 1, 0),
('123456822as6', 'Maria', 'Albertina', 'mariaa@gmail.com', 'mariapass', 'Maria', 123456789, 0, 1, 0),
('193456852as5', 'Catarina', 'Gabriel', 'cata@gmail.com', 'josepass', 'CatarinaG', 123456789, 0, 1, 0),
('193456852er5', 'Patrícia', 'Duarte', 'patriciad@gmail.com', 'patriciadpass', 'PatríciaD', 123456789, 0, 1, 0),
('123478682as6', 'Joana', 'Oliveira', 'joanao@gmail.com', 'joanaopass', 'JoanaO', 123456789, 0, 1, 0),
('193756852as5', 'Joana', 'Gonçalves', 'joanag@gmail.com', 'joanagpass', 'JoanaG', 123456789, 0, 1, 0),
('193459852er5', 'Mariana', 'Duarte', 'marianad@gmail.com', 'marianadpass', 'MarianaD', 123456789, 0, 1, 0),
('193467852er5', 'Alexandra', 'Duarte', 'alexandrad@gmail.com', 'alexandradpass', 'AlexandraD', 123456789, 0, 1, 0),
('183456852er5', 'Andreia', 'Oliveira', 'andreaio@gmail.com', 'andreaiopass', 'AndreiaO', 123456789, 0, 1, 0),
('184456822as5', 'Beatriz', 'Galvão', 'breatrizg@gmail.com', 'breatrizgpass', 'BeatrizG', 123456789, 0, 1, 0),
('185456822as5', 'Carla', 'Freitas', 'carlaf@gmail.com', 'carlafpass', 'CarlaF', 123456789, 0, 1, 0),
('183756852as5', 'Cristiana', 'Azevedo', 'cristianaa@gmail.com', 'cristianaapass', 'CristianaA', 123456789, 0, 1, 0),
('198936822ds5', 'Ana', 'Figueiredo', 'anaf@gmail.com', 'anafpass', 'AnaF', 123456789, 0, 1, 0),
('123456822as5', 'Rita', 'Garrido', 'ritagarrido@gmail.com', 'ritapass', 'RitaG', 123456789, 0, 1, 0),
('193447622as5', 'Isabel', 'Teixeira', 'isabelt@gmail.com', 'isabeltpass', 'IsabelT', 123456789, 0, 1, 0),
('134456452as5', 'Beatriz', 'Dias', 'beatrizd@gmail.com', 'beatrizdpass', 'BeatrizD', 123456789, 0, 1, 0),
('193482324as5', 'Mariana', 'Figueiredo', 'marianaf@gmail.com', 'marianafpass', 'MarianaFig', 123456789, 0, 1, 0),
('193454322ds5', 'Filipa', 'Martins', 'fm@gmail.com', 'filipapass', 'FilipaM', 123456789, 0, 1, 0),
('193654322ds5', 'Liliana', 'Martins', 'lilianam@gmail.com', 'lilianampass', 'LilianaM', 123456789, 0, 1, 0),
('193454342ds5', 'Filipa', 'Santos', 'filipas@gmail.com', 'filipaspass', 'FilipaS', 123456789, 0, 1, 0),
('123678682as6', 'Paula', 'Freitas', 'paulaf@gmail.com', 'paulafpass', 'PaulaF', 123456789, 0, 1, 0),
('193756892as5', 'Fernanda', 'Moreira', 'fernandam@gmail.com', 'jfernandampass', 'FernandaM', 123456789, 0, 1, 0),
('193459852eh5', 'Catarina', 'Duarte', 'catarinad@gmail.com', 'catarinadpass', 'CatarinaD', 123456789, 0, 1, 0),
('113467852er5', 'Camila', 'Alves', 'camilaa@gmail.com', 'camilaapass', 'CamilaA', 123456789, 0, 1, 0),
('123456852er5', 'Andreia', 'Oliveira', 'andreaio@gmail.com', 'andreaiopass', 'AndreiaO', 123456789, 0, 1, 0),
('184656822as5', 'Joana', 'Galvão', 'joanagalvao@gmail.com', 'joanagalvaopass', 'JoanaGalvao', 123456789, 0, 1, 0),
('185476822as5', 'Mariana', 'Freitas', 'marianafreitas@gmail.com', 'marianafreitaspass', 'MarianaFreitas', 123456789, 0, 1, 0),
('183755652as5', 'Andreia', 'Azevedo', 'andreiaa@gmail.com', 'andreiaapass', 'AndreiaA', 123456789, 0, 1, 0),
('198936022ds5', 'Camila', 'Figueiredo', 'camilaf@gmail.com', 'camilafpass', 'CamilaF', 123456789, 0, 1, 0),
('123056822as5', 'Andreia', 'Torres', 'andreiat@gmail.com', 'andreiatpass', 'AndreiaT', 123456789, 0, 1, 0),
('193440622as5', 'Liliana', 'Teixeira', 'lilianat@gmail.com', 'lilianatpass', 'LilianaT', 123456789, 0, 1, 0),
('134056452as5', 'Joana', 'Dias', 'joanad@gmail.com', 'joanadpass', 'JoanaD', 123456789, 0, 1, 0),
('193480324as5', 'Leonor', 'Figueiredo', 'leonorf@gmail.com', 'leonorfpass', 'LeonorFig', 123456789, 0, 1, 0),
('193054322ds5', 'Inês', 'Martins', 'inesm@gmail.com', 'inesmpass', 'InêsMartins', 123456789, 0, 1, 0),
('193654022ds5', 'Liliana', 'Freitas', 'lilianaf@gmail.com', 'lilianafpass', 'LilianaFreitas', 123456789, 0, 1, 0),
('193450342ds5', 'Telma', 'Santos', 'telmas@gmail.com', 'telmaspass', 'TelmaS', 123456789, 0, 1, 0),
('123608682as6', 'Paula', 'Torres', 'paulat@gmail.com', 'paulatpass', 'PaulaT', 123456789, 0, 1, 0),
('193756092as5', 'Luísa', 'Moreira', 'luisam@gmail.com', 'luisampass', 'LuísaM', 123456789, 0, 1, 0),
('190059852eh5', 'Catarina', 'Duarte', 'catarinaduarte@gmail.com', 'catarinaduartepass', 'CatarinaDuarte', 123456789, 0, 1, 0),
('113007842er5', 'Ana', 'Alves', 'anaa@gmail.com', 'anaapass', 'AnaAlves', 123456789, 0, 1, 0),
('184056022as5', 'Emília', 'Galvão', 'emiliagalvao@gmail.com', 'emiliagalvaopass', 'EmíliaGalvao', 123456789, 0, 1, 0),
('183755052ao5', 'Alberta', 'Azevedo', 'albertaa@gmail.com', 'albertaapass', 'AlbertaA', 123456789, 0, 1, 0),
('123406850er5', 'Sílvia', 'Oliveira', 'silviao@gmail.com', 'silviaopass', 'SílviaO', 123456789, 0, 1, 0),
('180476822as5', 'Mafalda', 'Freitas', 'mafaldafreitas@gmail.com', 'mafaldafreitaspass', 'MafaldaFreitas', 123456789, 0, 1, 0),
('198636022ds5', 'Maria João', 'Figueiredo', 'mjoaof@gmail.com', 'mjoaoffpass', 'MJoãoF', 123456789, 0, 1, 0),
('126056822as5', 'Isabel', 'Almeida', 'isabela@gmail.com', 'isabelapass', 'IsabelA', 123456789, 0, 1, 0),
('193440662as5', 'Leonor', 'Teixeira', 'leonort@gmail.com', 'leonortpass', 'LeonorT', 123456789, 0, 1, 0),
('634056452as5', 'Joana', 'Amaral', 'joanaa@gmail.com', 'joanaapass', 'JoanaA', 123456789, 0, 1, 0),
('163480324as5', 'Lurdes', 'Figueiredo', 'lurdesf@gmail.com', 'lurdesfpass', 'LurdesFig', 123456789, 0, 1, 0),
('193054362ds5', 'Inês', 'Castro', 'inesc@gmail.com', 'inescpass', 'InêsCastro', 123456789, 0, 1, 0),
('193654022ds6', 'Liliana', 'Silva', 'lilianas@gmail.com', 'lilianaspass', 'LilianaSilva', 123456789, 0, 1, 0),
('193460342ds5', 'Telma', 'Barata', 'telmab@gmail.com', 'telmabpass', 'TelmaB', 123456789, 0, 1, 0),
('163608682as6', 'Paula', 'Silva', 'paulasilva@gmail.com', 'paulasilvapass', 'PaulaSilva', 123456789, 0, 1, 0),
('196756092as5', 'Luísa', 'Cabral', 'luisacabral@gmail.com', 'luisacabralpass', 'LuísaCabral', 123456789, 0, 1, 0),
('190659852eh5', 'Amélia', 'Duarte', 'ameliaduarte@gmail.com', 'ameliaduartepass', 'AméliaDuarte', 123456789, 0, 1, 0),
('113007642er5', 'Aurora', 'Alves', 'auroraa@gmail.com', 'auroraapass', 'AuroraAlves', 123456789, 0, 1, 0),
('184356022as5', 'Mafalda', 'Galvão', 'mafaldagalvao@gmail.com', 'mafaldagalvaopass', 'MafaldaGalvao', 123456789, 0, 1, 0),
('183755032ao5', 'Sílvia', 'Azevedo', 'silviaa@gmail.com', 'silviaapass', 'SílviaA', 123456789, 0, 1, 0),
('123406350er5', 'Ana Maria', 'Oliveira', 'anamariao@gmail.com', 'anamariaopass', 'AnaMariaO', 123456789, 0, 1, 0),
('130476822as5', 'Mafalda', 'Cabral', 'mafaldacabral@gmail.com', 'mafaldacabralpass', 'MafaldaCabral', 123456789, 0, 1, 0),
('123456842as5', 'João', 'Morais', 'joao@gmail.com', 'joaopass', 'JoãoM', 123456789, 0, 1, 0),
('193456822ds5', 'Virgílio', 'Morais', 'jose@gmail.com', 'vigpass', 'VirgílioM', 123456789, 0, 1, 0),
('193234563ds5', 'Eduardo', 'Ferreira', 'eduardoF@gmail.com', 'eduardopass', 'EduardoF', 123456789, 0, 1, 0),
('123456828io5', 'Alberto', 'Simões', 'albertos@gmail.com', 'albertospass', 'AlbertoS', 123456789, 0, 1, 1),
('193452322ds5', 'Filipe', 'Martins', 'filipem@gmail.com', 'filipempass', 'FilipeMar', 123456789, 0, 1, 0),
('193424322ds5', 'Filipe', 'Bandeira', 'filipeb@gmail.com', 'filipebpass', 'FilipeB', 123456789, 0, 1, 0),
('193452312ds5', 'Filipe', 'Morais', 'filipemor@gmail.com', 'filimpass', 'FilipeMor', 123456789, 0, 1, 0),
('195661513ds5', 'Ruben', 'Menezes', 'rubenm@gmail.com', 'rubenmpass', 'RubenM', 123456789, 0, 1, 0),
('198916832ds5', 'Pedro', 'Morais', 'pedrom@gmail.com', 'pedrompass', 'PedroM', 123456789, 0, 1, 0),
('195663613ds5', 'André', 'Fernandes', 'andref@gmail.com', 'andrefpass', 'AndréF', 123456789, 0, 1, 0),
('123466822as5', 'Luis', 'Osório', 'luis@gmail.com', 'luispass', 'LuisO', 123456789, 0, 1, 0),
('195612513ds5', 'Francisco', 'Teles', 'franciscot@gmail.com', 'franciscopass', 'FranciscoT', 123456789, 0, 1, 0),
('193344322ds5', 'Paulo', 'Rebelo', 'paulor@gmail.com', 'paulorpass', 'PauloR', 123456789, 0, 1, 0),
('183007642er5', 'Diogo', 'Alves', 'diogoa@gmail.com', 'diogoapass', 'DiogoAlves', 123456789, 0, 1, 0),
('184358022as5', 'Rafael', 'Galvão', 'rafaelgalvao@gmail.com', 'rafaelgalvaopass', 'RafaelGalvao', 123456789, 0, 1, 0),
('183758032ao5', 'Rodrigo', 'Azevedo', 'rodrigoa@gmail.com', 'rodrigoapass', 'RodrigoA', 123456789, 0, 1, 0),
('123406380er5', 'Daniel', 'Oliveira', 'danielo@gmail.com', 'danielopass', 'DanielO', 123456789, 0, 1, 0),
('130478822as5', 'Xavier', 'Cabral', 'xaviercabral@gmail.com', 'xaviercabralpass', 'XavierCabral', 123456789, 0, 1, 0),
('193534563ds5', 'Eduardo', 'Guimarães', 'eduardoguimaraes@gmail.com', 'eduardoguimaraespass', 'EduardoGuimarães', 123456789, 0, 1, 0),
('123456858io5', 'Emanuel', 'Tavares', 'emanuelt@gmail.com', 'emanueltpass', 'EmanuelT', 123456789, 0, 1, 0),
('193452352ds5', 'André', 'Espinha', 'andreespinha@gmail.com', 'andreespinhapass', 'AndréEspinha', 123456789, 0, 1, 0),
('193424322gs5', 'Gabriel', 'Guimarães', 'gabrielguimaraes@gmail.com', 'gabrielguimaraespass', 'GabrielGuimarães', 123456789, 0, 1, 0),
('193452312hs5', 'Renato', 'Rosa', 'renatorosa@gmail.com', 'renatorosapass', 'RenatoRosa', 123456789, 0, 1, 0),
('195661513us5', 'Daniel', 'Menezes', 'danielm@gmail.com', 'danielmpass', 'DanielMenezes', 123456789, 0, 1, 0),
('198916832qs5', 'Pedro', 'Farinha', 'pedrofarinha@gmail.com', 'pedrofarinhapass', 'PedroFarinha', 123456789, 0, 1, 0),
('195663613rs5', 'Fábio', 'Fernandes', 'fabiofernandes@gmail.com', 'fabiofernandespass', 'FábioFernandes', 123456789, 0, 1, 0),
('133456822ds5', 'João', 'Almeida', 'ja@gmail.com', 'joaoapass', 'JoãoA', 123456789, 0, 1, 0),
('195212513ds5', 'Rodrigo', 'Teles', 'rodrigoteles@gmail.com', 'rodrigotelespass', 'RodrigoTeles', 123456789, 0, 1, 0),
('143344322ds5', 'Paulo', 'Amaral', 'pauloamaral@gmail.com', 'pauloamaralpass', 'PauloAmaral', 123456789, 0, 1, 0),
('193424542ds5', 'Filipe', 'Simões', 'filipes@gmail.com', 'filipespass', 'FilipeS', 123456789, 0, 1, 0),
('193264513ds5', 'Pedro', 'Costa', 'pedroc@gmail.com', 'pedrocpass', 'PedroC', 123456789, 0, 1, 0),
('183778032ao5', 'Diogo', 'Azevedo', 'diogoa@gmail.com', 'diogoapass', 'DiogoAzevedo', 123456789, 0, 1, 0),
('123476380er5', 'Daniel', 'Cruz', 'danielcruz@gmail.com', 'danielcruzpass', 'DanielCruz', 123456789, 0, 1, 0),
('130778822as5', 'Fábio', 'Cabral', 'fabiocabral@gmail.com', 'fabiocabralpass', 'FábioCabral', 123456789, 0, 1, 0),
('193534963ds5', 'Helder', 'Guimarães', 'helderguimaraes@gmail.com', 'helderguimaraespass', 'HelderGuimarães', 123456789, 0, 1, 0),
('123496858io5', 'Diogo', 'Silva', 'diogos@gmail.com', 'diogospass', 'DiogoSilva', 123456789, 0, 1, 0),
('193452352ds9', 'André', 'Cruz', 'andrecruz@gmail.com', 'andrecruzpass', 'AndréCruz', 123456789, 0, 1, 0),
('193424922gs5', 'Fábio', 'Torres', 'fabiotorres@gmail.com', 'fabiotorrespass', 'FábioTorres', 123456789, 0, 1, 0),
('193452912hs5', 'Renato', 'Azevedo', 'renatoazevedo@gmail.com', 'renatoazevedopass', 'RenatoAzevedo', 123456789, 0, 1, 0),
('195661913us5', 'Daniel', 'Menezes', 'danielm@gmail.com', 'danielmpass', 'DanielMenezes', 123456789, 0, 1, 0),
('198996832qs5', 'Pedro', 'Gama', 'pedrogama@gmail.com', 'pedrogamapass', 'PedroGama', 123456789, 0, 1, 0),
('195693613rs5', 'Martim', 'Fernandes', 'martimfernandes@gmail.com', 'martimfernandespass', 'FábioMartim', 123456789, 0, 1, 0),
('133496822ds5', 'João', 'Henriques', 'joaohenriques@gmail.com', 'joaohenriquespass', 'JoãoHenriques', 123456789, 0, 1, 0),
('195292513ds5', 'Rui', 'Teles', 'ruiteles@gmail.com', 'ruipass', 'RuiTeles', 123456789, 0, 1, 0),
('143349322ds5', 'Leandro', 'Amaral', 'leandroamaral@gmail.com', 'leandroamaralpass', 'LenadroAmaral', 123456789, 0, 1, 0),
('193924542ds5', 'Rafael', 'Simões', 'rafaels@gmail.com', 'rafaelspass', 'RafaelS', 123456789, 0, 1, 0),
('193964513ds5', 'Duarte', 'Costa', 'duartec@gmail.com', 'duartecpass', 'DuarteC', 123456789, 0, 1, 0),
('183779032ao5', 'Diogo', 'Craveiro', 'diogocraveiro@gmail.com', 'diogoCraveiropass', 'Diogocraveiro', 123456789, 0, 1, 0),
('123976380er5', 'Daniel', 'Pereira', 'danielpereira@gmail.com', 'danielpereirapass', 'DanielPereira', 123456789, 0, 1, 0),
('130778829as5', 'Fábio', 'Moedas', 'fabiomoedas@gmail.com', 'fabiomoedaspass', 'FábioMoedas', 123456789, 0, 1, 0),
('193874322ds5', 'Filipe', 'Galvão', 'filipeg@gmail.com', 'filipegpass', 'FilipeG', 123456789, 0, 1, 0),
('198936832ds5', 'Pedro', 'Figueiredo', 'pedrof@gmail.com', 'pedrofpass', 'PedroF', 123456789, 0, 1, 0),
('193234513ds5', 'Pedro', 'Galvão', 'pedrog@gmail.com', 'pedrogpass', 'PedroG', 123456789, 0, 1, 0),
('195664513ds5', 'Pedro', 'Simões', 'pedros@gmail.com', 'pedrospass', 'PedroS', 123456789, 0, 1, 0),
('190234563ds5', 'Ângelo', 'Ferreira', 'angeloF@gmail.com', 'angelopass', 'ÂngeloF', 123456789, 0, 1, 0),
('193002322ds5', 'Diogo', 'Martins', 'diogom@gmail.com', 'diogoempass', 'DiogoMar', 123456789, 0, 1, 0),
('100424322ds5', 'Alexandre', 'Bandeira', 'alexb@gmail.com', 'alexbpass', 'AlexandreBandeira', 123456789, 0, 1, 0),
('193052312ds5', 'Rui', 'Morais', 'ruimor@gmail.com', 'ruimpass', 'RuiMor', 123456789, 0, 1, 0),
('195660013ds5', 'Ruben', 'Machado', 'rubenmachado@gmail.com', 'rubenmachadopass', 'RubenMachado', 123456789, 0, 1, 0),
('198916802ds5', 'Nuno', 'Morais', 'nunomorais@gmail.com', 'nunomoraispass', 'NunoMorais', 123456789, 0, 1, 0),
('195660613ds5', 'André', 'Marques', 'andremarques@gmail.com', 'andremarquespass', 'AndréMarques', 123456789, 0, 1, 0),
('123066822as5', 'Francisco', 'Osório', 'franciscoosorio@gmail.com', 'franciscoosoriopass', 'FranciscoOsorio', 123456789, 0, 1, 0),
('190612513ds5', 'Ricardo', 'Teles', 'ricardoteles@gmail.com', 'ricardotelespass', 'RicardoT', 123456789, 0, 1, 0),
('103344322ds5', 'Rafael', 'Rebelo', 'rafaelrebelo@gmail.com', 'rafaelrebelopass', 'RafaelRebelo', 123456789, 0, 1, 0),
('103007642er5', 'Diogo', 'Nunes', 'diogonunes@gmail.com', 'diogonunespass', 'DiogoNunes', 123456789, 0, 1, 0),
('184358022as0', 'Marco', 'Galvão', 'marcogalvao@gmail.com', 'marcogalvaopass', 'MarcoGalvao', 123456789, 0, 1, 0),
('183708032ao5', 'Bruno', 'Azevedo', 'brunoazevedo@gmail.com', 'brunoazevedopass', 'BrunoAzevedo', 123456789, 0, 1, 0),
('103406380er5', 'Carlos', 'Oliveira', 'carlosoliveira@gmail.com', 'carlosoliveirapass', 'CarlosO', 123456789, 0, 1, 0),
('130470822as5', 'Helder', 'Cabral', 'heldercabral@gmail.com', 'heldercabralpass', 'HelderCabral', 123456789, 0, 1, 0),
('120456828io5', 'Alexandre', 'Simões', 'alexandres@gmail.com', 'alexandrespass', 'AlexandreS', 123456789, 0, 1, 0),
('123456784ds5', 'admin', 'admin', 'admin@gmail.com', 'adminadmin', 'admin', 123456789, 1, 1, 0),
('198936232ds5', 'Diogo', 'Ferreira', 'diogoferreira@gmail.com', 'diogoferreirapass', 'DiogoFerreira', 123456789, 0, 1, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `campos`
--
ALTER TABLE `campos`
  ADD PRIMARY KEY (`Nome_campo`);

--
-- Índices para tabela `capitaes`
--
ALTER TABLE `capitaes`
  ADD PRIMARY KEY (`CC`);

--
-- Índices para tabela `equipas`
--
ALTER TABLE `equipas`
  ADD PRIMARY KEY (`Nome_equipa`),
  ADD KEY `RefTorneios20` (`Nome_torneio`),
  ADD KEY `RefCapitaes21` (`CC`);

--
-- Índices para tabela `equipas jogadores`
--
ALTER TABLE `equipas jogadores`
  ADD PRIMARY KEY (`Nome_equipa`,`CC`),
  ADD KEY `RefJogadores24` (`CC`);

--
-- Índices para tabela `gestores_torneio`
--
ALTER TABLE `gestores_torneio`
  ADD PRIMARY KEY (`CC`);

--
-- Índices para tabela `gestores_torneio torneios`
--
ALTER TABLE `gestores_torneio torneios`
  ADD PRIMARY KEY (`CC`,`Nome_torneio`),
  ADD KEY `RefTorneios16` (`Nome_torneio`);

--
-- Índices para tabela `jogadores`
--
ALTER TABLE `jogadores`
  ADD PRIMARY KEY (`CC`);

--
-- Índices para tabela `jogadores_jogo`
--
ALTER TABLE `jogadores_jogo`
  ADD PRIMARY KEY (`id_jogo`,`Nome_torneio`,`CC`),
  ADD KEY `RefEquipas25` (`Nome_equipa`),
  ADD KEY `RefJogadores27` (`CC`);

--
-- Índices para tabela `jogos`
--
ALTER TABLE `jogos`
  ADD PRIMARY KEY (`id_jogo`,`Nome_torneio`),
  ADD KEY `RefTorneios29` (`Nome_torneio`),
  ADD KEY `RefEquipas32` (`Nome_equipa_visitante`),
  ADD KEY `RefEquipas33` (`Nome_equipa_visitada`),
  ADD KEY `RefSlot37` (`id_slot`),
  ADD KEY `id_jogo` (`id_jogo`) USING BTREE;

--
-- Índices para tabela `notifica`
--
ALTER TABLE `notifica`
  ADD PRIMARY KEY (`CC_autor`),
  ADD UNIQUE KEY `id_notificacao` (`id_notificacao`),
  ADD KEY `RefUtilizadores56` (`CC`);

--
-- Índices para tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id_notificacao`),
  ADD UNIQUE KEY `id_notificacao` (`id_notificacao`);

--
-- Índices para tabela `posicoes desejadas`
--
ALTER TABLE `posicoes desejadas`
  ADD PRIMARY KEY (`CC`);

--
-- Índices para tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`CC`);

--
-- Índices para tabela `reservas torneios`
--
ALTER TABLE `reservas torneios`
  ADD PRIMARY KEY (`CC`,`Nome_torneio`),
  ADD KEY `RefTorneios13` (`Nome_torneio`);

--
-- Índices para tabela `slot`
--
ALTER TABLE `slot`
  ADD PRIMARY KEY (`id_slot`),
  ADD KEY `Nome_campo` (`Nome_campo`);

--
-- Índices para tabela `slot_torneios`
--
ALTER TABLE `slot_torneios`
  ADD PRIMARY KEY (`id_slot`,`Nome_torneio`),
  ADD KEY `RefTorneios36` (`Nome_torneio`);

--
-- Índices para tabela `torneios`
--
ALTER TABLE `torneios`
  ADD PRIMARY KEY (`Nome_torneio`);

--
-- Índices para tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`CC`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `jogos`
--
ALTER TABLE `jogos`
  MODIFY `id_jogo` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT de tabela `notifica`
--
ALTER TABLE `notifica`
  MODIFY `id_notificacao` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9382;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id_notificacao` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9382;

--
-- AUTO_INCREMENT de tabela `slot`
--
ALTER TABLE `slot`
  MODIFY `id_slot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
