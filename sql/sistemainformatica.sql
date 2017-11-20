-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 21-Nov-2017 às 00:16
-- Versão do servidor: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistemainformatica`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_servico`
--

CREATE TABLE `categoria_servico` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_bin NOT NULL,
  `diretorio` varchar(200) COLLATE utf8_bin NOT NULL,
  `servico` varchar(200) COLLATE utf8_bin NOT NULL,
  `imagem` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `categoria_servico`
--

INSERT INTO `categoria_servico` (`id`, `nome`, `diretorio`, `servico`, `imagem`) VALUES
(1, 'Metálico Cat. 5e', 'Metalico Cat. 5e', 'Cabeamento', 'gal_cat5_small.jpg'),
(2, 'Metálico Cat. 6e', 'Metalico Cat. 6e', 'Cabeamento', 'gal_cat6_small.jpg'),
(3, 'Óptico', 'Optico', 'Cabeamento', 'gal_optic_small.jpg'),
(4, 'Infraestrutura', 'Infraestrutura', 'Cabeamento', 'gal_infra_small.jpg'),
(5, 'Elétrica', 'Eletrica', 'Cabeamento', 'gal_elet_small.jpg'),
(6, 'DG Telefonia', 'DG Telefonia', 'Cabeamento', 'gal_tele_small.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_bin NOT NULL,
  `site` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `descricao` varchar(1000) COLLATE utf8_bin NOT NULL,
  `logo` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `site`, `descricao`, `logo`) VALUES
(1, 'Anhanguera', 'www.anhanguera.com', 'Ainda sem descrição', 'cl_anhanguera.jpg'),
(2, 'ASC Service', 'www.ascservice.com.br', 'Ainda sem descrição', 'cl_asc_service.jpg'),
(3, 'Brascont Contabilidade', '', 'Ainda sem descrição', 'cl_brascont.jpg'),
(4, 'Supermercados Caíque', 'www.supercaique.com.br', 'Ainda sem descrição', 'cl_caique.jpg'),
(5, 'Carrefour', 'www.carrefour.com.br', 'Ainda sem descrição', 'cl_carrefour.jpg'),
(6, 'Citroen', 'www.citroen.com.br', 'Ainda sem descrição', 'cl_citroen.jpg'),
(7, 'Condor Guitars', 'www.condormusic.com.br', 'Ainda sem descrição', 'cl_condor_guitars.jpg'),
(8, 'DHL', 'www.dhl.com.br', 'Ainda sem descrição', 'cl_dhl.jpg'),
(9, 'DL Braga Engenharia', 'www.dlbraga.com.br', 'Ainda sem descrição', 'cl_dlbraga.jpg'),
(10, 'Clínica DMI', 'www.clinicadmi.com.br', 'Ainda sem descrição', 'cl_clinica_dmi.jpg'),
(11, 'Fleury', 'www.fleury.com.br', 'Ainda sem descrição', 'cl_fleury.jpg'),
(12, 'Floricultura Beija-Flor', 'www.beijaflordf.com.br', 'Ainda sem descrição', 'cl_floricultura_beija_flor.jpg'),
(13, 'JAC Motors', 'www.jacmotorsbrasil.com.br', 'Ainda sem descrição', 'cl_jac_motors.jpg'),
(14, 'Leroy Merlin', 'www.leroymerlin.com.br', 'Ainda sem descrição', 'cl_leroy_merlin.jpg'),
(15, 'Microcamp Tecnologia', 'www.microcamp.com.br', 'Ainda sem descrição', 'cl_microcamp.jpg'),
(16, 'NTU', 'www.ntu.org.br', 'Ainda sem descrição', 'cl_ntu.jpg'),
(17, 'Posto Comercial Norte', '', 'Ainda sem descrição', 'cl_posto_comercial_norte.jpg'),
(18, 'SICOOB', 'www.sicoob.com.br', 'Ainda sem descrição', 'cl_sicoob.jpg'),
(19, 'TDec Network Group', 'www.tdec.com.br', 'Ainda sem descrição', 'cl_tdec.jpg'),
(20, 'Washburn Guitars', 'www.washburn.com', 'Ainda sem descrição', 'cl_washburng_guitars.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_bin NOT NULL,
  `tipo` varchar(200) COLLATE utf8_bin NOT NULL,
  `conteudo` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`id`, `nome`, `tipo`, `conteudo`) VALUES
(1, 'Telefone 1', 'Telefone', '(61) 3355-2650'),
(2, 'Telefone 2', 'Telefone', '(61) 3354-1464'),
(3, 'E-Mail', 'Outro', 'administracao@sistemainformatica.com'),
(4, 'Endereço', 'Endereco', 'Taguatinga - DF, QNE 19, Lote 2, CEP: 72125-190'),
(5, 'Facebook', 'Rede Social', 'facebook.com/sistemainformatica'),
(6, 'Whatsapp', 'Outro', '(61)1234-1342');

-- --------------------------------------------------------

--
-- Estrutura da tabela `galeria`
--

CREATE TABLE `galeria` (
  `id` int(11) NOT NULL,
  `categoria` varchar(200) COLLATE utf8_bin NOT NULL,
  `imagem` varchar(200) COLLATE utf8_bin NOT NULL,
  `servico` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `galeria`
--

INSERT INTO `galeria` (`id`, `categoria`, `imagem`, `servico`) VALUES
(1, 'Metalico Cat. 5e', '01.JPG', 'Cabeamento'),
(2, 'Metalico Cat. 5e', '02.JPG', 'Cabeamento'),
(3, 'Metalico Cat. 5e', '03.JPG', 'Cabeamento'),
(4, 'Metalico Cat. 5e', '04.JPG', 'Cabeamento'),
(5, 'Metalico Cat. 5e', '08.JPG', 'Cabeamento'),
(6, 'Metalico Cat. 5e', '09.JPG', 'Cabeamento'),
(7, 'Metalico Cat. 5e', '10.JPG', 'Cabeamento'),
(8, 'Metalico Cat. 6e', '01.JPG', 'Cabeamento'),
(9, 'Metalico Cat. 6e', '02.JPG', 'Cabeamento'),
(10, 'Metalico Cat. 6e', '03.JPG', 'Cabeamento'),
(11, 'Metalico Cat. 6e', '04.JPG', 'Cabeamento'),
(12, 'Metalico Cat. 6e', '05.JPG', 'Cabeamento'),
(13, 'Metalico Cat. 6e', '06.JPG', 'Cabeamento'),
(14, 'Metalico Cat. 6e', '07.JPG', 'Cabeamento'),
(15, 'Metalico Cat. 6e', '08.JPG', 'Cabeamento'),
(16, 'Metalico Cat. 6e', '09.JPG', 'Cabeamento'),
(17, 'Metalico Cat. 6e', '10.JPG', 'Cabeamento'),
(18, 'Metalico Cat. 6e', '11.JPG', 'Cabeamento'),
(19, 'Metalico Cat. 6e', '12.JPG', 'Cabeamento'),
(20, 'Metalico Cat. 6e', '13.JPG', 'Cabeamento'),
(21, 'Optico', '01.JPG', 'Cabeamento'),
(22, 'Optico', '02.JPG', 'Cabeamento'),
(23, 'Optico', '03.JPG', 'Cabeamento'),
(24, 'Optico', '04.JPG', 'Cabeamento'),
(25, 'Optico', '05.JPG', 'Cabeamento'),
(26, 'Optico', '06.JPG', 'Cabeamento'),
(27, 'Optico', '07.JPG', 'Cabeamento'),
(28, 'Optico', '08.JPG', 'Cabeamento'),
(29, 'Optico', '09.JPG', 'Cabeamento'),
(30, 'Infraestrutura', '01.JPG', 'Cabeamento'),
(31, 'Infraestrutura', '02.JPG', 'Cabeamento'),
(32, 'Infraestrutura', '03.JPG', 'Cabeamento'),
(33, 'Infraestrutura', '04.JPG', 'Cabeamento'),
(34, 'Infraestrutura', '05.JPG', 'Cabeamento'),
(35, 'Infraestrutura', '06.JPG', 'Cabeamento'),
(36, 'Infraestrutura', '07.JPG', 'Cabeamento'),
(37, 'Infraestrutura', '08.JPG', 'Cabeamento'),
(38, 'Infraestrutura', '09.JPG', 'Cabeamento'),
(39, 'Infraestrutura', '10.JPG', 'Cabeamento'),
(41, 'Infraestrutura', '11.JPG', 'Cabeamento'),
(42, 'Infraestrutura', '12.JPG', 'Cabeamento'),
(43, 'Infraestrutura', '13.JPG', 'Cabeamento'),
(44, 'Infraestrutura', '14.JPG', 'Cabeamento'),
(45, 'Infraestrutura', '15.JPG', 'Cabeamento'),
(46, 'Infraestrutura', '16.JPG', 'Cabeamento'),
(47, 'Infraestrutura', '17.JPG', 'Cabeamento'),
(48, 'Infraestrutura', '18.JPG', 'Cabeamento'),
(49, 'Infraestrutura', '19.JPG', 'Cabeamento'),
(50, 'Eletrica', '01.JPG', 'Cabeamento'),
(51, 'Eletrica', '02.JPG', 'Cabeamento'),
(52, 'Eletrica', '03.JPG', 'Cabeamento'),
(53, 'Eletrica', '04.JPG', 'Cabeamento'),
(54, 'Eletrica', '05.JPG', 'Cabeamento'),
(55, 'Eletrica', '06.JPG', 'Cabeamento'),
(56, 'Eletrica', '07.JPG', 'Cabeamento'),
(57, 'Eletrica', '08.JPG', 'Cabeamento'),
(58, 'Eletrica', '09.JPG', 'Cabeamento'),
(59, 'Eletrica', '10.JPG', 'Cabeamento'),
(60, 'DG Telefonia', '01.JPG', 'Cabeamento'),
(61, 'DG Telefonia', '02.JPG', 'Cabeamento'),
(62, 'DG Telefonia', '03.JPG', 'Cabeamento'),
(63, 'DG Telefonia', '04.JPG', 'Cabeamento'),
(64, 'DG Telefonia', '05.JPG', 'Cabeamento'),
(65, 'DG Telefonia', '06.JPG', 'Cabeamento'),
(66, 'DG Telefonia', '07.JPG', 'Cabeamento'),
(67, 'DG Telefonia', '08.JPG', 'Cabeamento'),
(68, 'DG Telefonia', '09.JPG', 'Cabeamento'),
(69, 'DG Telefonia', '10.JPG', 'Cabeamento');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pag_inicial`
--

CREATE TABLE `pag_inicial` (
  `id` int(11) NOT NULL DEFAULT '1',
  `logo` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `pag_inicial`
--

INSERT INTO `pag_inicial` (`id`, `logo`) VALUES
(1, 'sistema_informatica_logo.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `parceiro`
--

CREATE TABLE `parceiro` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_bin NOT NULL,
  `site` varchar(200) COLLATE utf8_bin NOT NULL,
  `descr` varchar(1000) COLLATE utf8_bin NOT NULL,
  `logo` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `parceiro`
--

INSERT INTO `parceiro` (`id`, `nome`, `site`, `descr`, `logo`) VALUES
(1, 'Clinica DMI', 'www.clinicadmi.com.br', 'Ainda sem descrição', 'pc_clinica_dmi.jpg'),
(2, 'Krista', 'www.krista.com.br', 'Ainda sem descrição', 'pc_krista.jpg'),
(3, 'TDec Network Group', 'www.tdec.com.br', 'Ainda sem descrição', 'pc_tdec.jpg'),
(4, 'Brascont Contabilidade', '', 'Ainda sem descrição', 'pc_brascont.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_bin NOT NULL,
  `diretorio` varchar(200) COLLATE utf8_bin NOT NULL,
  `conteudo` longtext COLLATE utf8_bin NOT NULL,
  `imagem` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`id`, `nome`, `diretorio`, `conteudo`, `imagem`) VALUES
(1, 'Cabeamento', 'Cabeamento', '<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>Alguns servi&ccedil;os de cabeamento oferecidos pela Sistema Inform&aacute;tica</strong></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"margin-left: 40px;\"><span style=\"font-size:16px\">Consultoria T&eacute;cnica;</span></li>\r\n	<li style=\"margin-left: 40px;\"><span style=\"font-size:16px\">Solu&ccedil;&otilde;es e projetos para infraestrutura;</span></li>\r\n	<li style=\"margin-left: 40px;\"><span style=\"font-size:16px\">Projetos e solu&ccedil;&otilde;es em network com especifica&ccedil;&atilde;o e instala&ccedil;&otilde;o de ativos de rede (switches, roteadores, redes wirelles);</span></li>\r\n	<li style=\"margin-left: 40px;\"><span style=\"font-size:16px\">Projeto de sistema de cabeamento de redes (voz, dados e imagens) com cabeamento estruturado;</span></li>\r\n	<li style=\"margin-left: 40px;\"><span style=\"font-size:16px\">Implementa&ccedil;&atilde;o de sistema de cabeamento met&aacute;lico UTP;</span></li>\r\n	<li style=\"margin-left: 40px;\"><span style=\"font-size:16px\">Implementa&ccedil;&atilde;o de sistema de cabeamento &oacute;ptico. Indoor e outdoor;</span></li>\r\n	<li style=\"margin-left: 40px;\"><span style=\"font-size:16px\">Implementa&ccedil;&atilde;o de sistema de cabeamento Telefonia. Indoor e outdoor;</span></li>\r\n	<li style=\"margin-left: 40px;\"><span style=\"font-size:16px\">Certifica&ccedil;&atilde;o de sistema de cabeamento;</span></li>\r\n	<li style=\"margin-left: 40px;\"><span style=\"font-size:16px\">Documenta&ccedil;&atilde;o &ldquo;AS BUILT&rdquo; de redes;</span></li>\r\n	<li style=\"margin-left: 40px;\"><span style=\"font-size:16px\">Site Survey.</span></li>\r\n</ul>\r\n', 'cabeamento.jpg'),
(2, 'Governança de TI', 'Governanca de TI', '<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px\">Trata-se de um conjunto de pr&aacute;ticas, com a finalidade de garantir controles efetivos, ampliar os processos de seguran&ccedil;a, minimizar os riscos, ampliar o desempenho, otimizar a aplica&ccedil;&atilde;o de recursos, reduzir os custos, suportar as melhores decis&otilde;es e consequentemente alinhar TI aos neg&oacute;cios.</span></p>\r\n\r\n<p><br />\r\n<span style=\"font-size:16px\"><strong>Veja algumas vantagens dos servi&ccedil;os de Governan&ccedil;a:</strong></span></p>\r\n\r\n<p style=\"margin-left:40px\">&nbsp;</p>\r\n\r\n<ul style=\"margin-left:40px\">\r\n	<li><span style=\"font-size:16px\">Organiza&ccedil;&atilde;o e estrutura&ccedil;&atilde;o dos diret&oacute;rios de documentos;</span></li>\r\n	<li><span style=\"font-size:16px\">Cria&ccedil;&atilde;o de pol&iacute;tica de seguran&ccedil;a para acesso aos documentos da empresa;</span></li>\r\n	<li><span style=\"font-size:16px\">Gerenciamento de todas as rotinas informatizadas da empresa;</span></li>\r\n	<li><span style=\"font-size:16px\">Estrutura&ccedil;&atilde;o e cria&ccedil;&atilde;o de usu&aacute;rios, seguindo a estrutura administrativa da empresa;</span></li>\r\n	<li><span style=\"font-size:16px\">Limita&ccedil;&atilde;o de acessos;</span></li>\r\n	<li><span style=\"font-size:16px\">Bloqueio de sites, bloqueio de documentos, bloqueio de acesso dentro do sistema coorporativo;</span></li>\r\n	<li><span style=\"font-size:16px\">Gerenciamento dos recursos de hardware;</span></li>\r\n	<li><span style=\"font-size:16px\">Monitoramento dos trabalhos realizados pelos usu&aacute;rios;</span></li>\r\n	<li><span style=\"font-size:16px\">Monitoramento dos acessos efetuados pelos usu&aacute;rios.</span></li>\r\n</ul>\r\n', 'governanca.jpg'),
(3, 'Assistência Técnica', 'Assistencia Tecnica', '<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px\">A Sistema Inform&aacute;tica conta com uma equipe t&eacute;cnica qualificada que prima pela qualidade do servi&ccedil;o prestado aos nossos clientes, estando capacitados para v&aacute;rias atividades.</span></p>\r\n\r\n<p><br />\r\n<span style=\"font-size:16px\"><strong>Alguns servi&ccedil;os de Assit&ecirc;ncia T&eacute;cnica oferecidos pela Sistema Inform&aacute;tica:</strong></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul style=\"margin-left:40px\">\r\n	<li><span style=\"font-size:16px\">Consultoria T&eacute;cnica;</span></li>\r\n	<li><span style=\"font-size:16px\">Palestras;</span></li>\r\n	<li><span style=\"font-size:16px\">Treinamentos;</span></li>\r\n	<li><span style=\"font-size:16px\">Manuten&ccedil;&atilde;o preventiva e corretiva em microcomputadores e impressoras;</span></li>\r\n	<li><span style=\"font-size:16px\">Instala&ccedil;&atilde;o e configura&ccedil;&atilde;o de sistemas operacionais;</span></li>\r\n	<li><span style=\"font-size:16px\">Instala&ccedil;&atilde;o de softwares;</span></li>\r\n	<li><span style=\"font-size:16px\">Instala&ccedil;&atilde;o e configura&ccedil;&atilde;o de servidores;</span></li>\r\n	<li><span style=\"font-size:16px\">Instala&ccedil;&atilde;o e configura&ccedil;&atilde;o de esta&ccedil;&otilde;es de trabalho;</span></li>\r\n	<li><span style=\"font-size:16px\">Compartilhamento de informa&ccedil;&otilde;es e recursos;</span></li>\r\n	<li><span style=\"font-size:16px\">Configura&ccedil;&otilde;es de acesso remoto.</span></li>\r\n</ul>\r\n', 'assistencia_tecnica.jpg'),
(4, 'Formas de Atendimento', 'Formas de Atendimento', '<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px\">Preocupados em atender a necessidade dos nossos clientes disponibilizamos v&aacute;rias formas de atendimentos, possibilitando a escolha do tipo de atendimento que melhor se encaixa &agrave;s necessidades da empresa.</span></p>\r\n\r\n<p><br />\r\n<span style=\"font-size:16px\"><strong>Atendimento Avulso</strong><br />\r\nO cliente n&atilde;o possui nenhum v&iacute;nculo contratual com a Sistema Inform&aacute;tica. Os chamados s&atilde;o atendidos ap&oacute;s aprova&ccedil;&atilde;o da taxa de visita t&eacute;cnica.</span></p>\r\n\r\n<p><br />\r\n<span style=\"font-size:16px\"><strong>Contrato de manuten&ccedil;&atilde;o cobertura total</strong><br />\r\nNesta modalidade de atendimento o cliente recebe da Sistema Inform&aacute;tica toda a cobertura de m&atilde;o-de-obra e pe&ccedil;as necess&aacute;rias a qualquer atendimento com o prazo m&aacute;ximo de 24 horas para o atendimento.</span></p>\r\n\r\n<p><br />\r\n<span style=\"font-size:16px\"><strong>Contrato de manuten&ccedil;&atilde;o cobertura parcial</strong><br />\r\nNesta modalidade o cliente recebe toda cobertura de m&atilde;o-de-obra, adicionando somente os custos necess&aacute;rios a cada reparo com o prazo m&aacute;ximo de 24 horas para o atendimento.</span></p>\r\n\r\n<p><br />\r\n<span style=\"font-size:16px\"><strong>Contrato de T&eacute;cnico Residente</strong><br />\r\nNesta modalidade a Sistema Inform&aacute;tica oferece ao cliente um t&eacute;cnico que dar&aacute; suporte exclusivo &agrave; empresa durante o per&iacute;odo estabelecido no contrato.</span></p>\r\n\r\n<p><br />\r\n<span style=\"font-size:16px\">Conhe&ccedil;a as vantagens de adquirir um&nbsp;<strong><a href=\"http://localhost:8080/sistemainformatica.com/docs/teste.txt\">Contrato de Presta&ccedil;&atilde;o de Servi&ccedil;os</a></strong>&nbsp;da Sistema Inform&aacute;tica.</span></p>\r\n', 'atendimento.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sistema_informatica`
--

CREATE TABLE `sistema_informatica` (
  `id` int(11) NOT NULL,
  `historico` longtext COLLATE utf8_bin NOT NULL,
  `visao` longtext COLLATE utf8_bin NOT NULL,
  `missao` longtext COLLATE utf8_bin NOT NULL,
  `valores` longtext COLLATE utf8_bin NOT NULL,
  `equipe` longtext COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `sistema_informatica`
--

INSERT INTO `sistema_informatica` (`id`, `historico`, `visao`, `missao`, `valores`, `equipe`) VALUES
(1, '<p style=\"text-align:center\"><span style=\"font-size:18px\"><strong>HIST&Oacute;RICO</strong></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\">A&nbsp;<strong>SISTEMA INFORM&Aacute;TICA</strong>&nbsp;foi fundada em 1997, quando o mercado brasileiro de microinform&aacute;tica estava em pleno per&iacute;odo de estrutura&ccedil;&atilde;o. Desde ent&atilde;o, a Empresa trabalha no modelo Integrador de Sistemas, uma maneira&nbsp;<strong>audaciosa </strong>e <strong>pioneira</strong>, mantendo foco total na necessidade de seus clientes, conseguindo assim posi&ccedil;&atilde;o de destaque no mercado.<br />\r\nPrestando servi&ccedil;os de&nbsp;<strong>consultoria</strong>, <strong>projetos</strong>, <strong>implanta&ccedil;&atilde;o </strong>e <strong>manuten&ccedil;&atilde;o&nbsp;</strong>em equipamentos de microinform&aacute;tica, adequando-se as inova&ccedil;&otilde;es tecnol&oacute;gicas emergentes no mercado.</span></p>\r\n', '<p style=\"text-align:center\"><span style=\"font-size:18px\"><strong>VIS&Atilde;O</strong></span></p>\r\n\r\n<p><span style=\"font-size:16px\">Ter reconhecimento e ser refer&ecirc;ncia no centro-oeste, em busca de aprimorar processos, melhorar o desempenho dos profissionais e empresas que utilizam o recurso da inform&aacute;tica como meio de produ&ccedil;&atilde;o.</span></p>\r\n', '<p style=\"text-align:center\"><span style=\"font-size:18px\"><strong>MISS&Atilde;O</strong></span></p>\r\n\r\n<p><span style=\"font-size:16px\">Proporcionar ao cliente a melhor assist&ecirc;ncia t&eacute;cnica em microinform&aacute;tica e implanta&ccedil;&otilde;es de redes, com alta tecnologia, transpar&ecirc;ncia e honestidade, reduzindo custos e trazendo lucratividade para os acionistas e parceiros de neg&oacute;cios.</span></p>\r\n', '<p style=\"text-align:center\"><span style=\"font-size:18px\"><strong>VALORES</strong></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><strong>&Eacute;tica</strong><br />\r\nTranspar&ecirc;ncia no relacionamento com cliente, colaborador, fornecedor, concorrente, mercado e comunidade;</span><br />\r\n&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><strong>Respeito</strong><br />\r\nMaturidade e educa&ccedil;&atilde;o no relacionamento entre cliente, colaborador, fornecedor, concorrente, mercado e comunidade;</span><br />\r\n&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><strong>Comprometimento</strong><br />\r\nEnvolvimento pleno dos colaboradores com todas as a&ccedil;&otilde;es e valores da empresa;</span><br />\r\n&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><strong>Qualidade</strong><br />\r\nSatisfazer e superar sempre as expectativas do cliente;</span><br />\r\n&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><strong>Inova&ccedil;&atilde;o</strong><br />\r\nBusca a identifica&ccedil;&atilde;o permanente de novas tecnologias, m&eacute;todos e processos.</span><br />\r\n&nbsp;</p>\r\n', '<p style=\"text-align:center\"><strong><span style=\"font-size:18px\">EQUIPE</span></strong></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\">A Sistema Inform&aacute;tica conta com uma equipe bem preparada e experiente para atender a sua empresa.<br />\r\nProfissionais &aacute;geis e com amplo conhecimento na &aacute;rea de atua&ccedil;&atilde;o, para tornar o atendimento r&aacute;pido e trazer solu&ccedil;&otilde;es objetivas para os problemas da sua empresa em:</span></p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n<strong><span style=\"font-size:14px\">Assist&ecirc;ncia T&eacute;cnica<br />\r\nGovernan&ccedil;a de TI<br />\r\nCabeamento Estruturado<br />\r\nCabeamento El&eacute;trico Estabilizado<br />\r\nConsultoria<br />\r\nProjetos</span></strong><br />\r\n&nbsp;</p>\r\n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `imagem` varchar(200) COLLATE utf8_bin NOT NULL,
  `ordem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `slider`
--

INSERT INTO `slider` (`id`, `imagem`, `ordem`) VALUES
(1, 'forma_de_atendimento.jpg', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL DEFAULT '1',
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `senha` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `login`, `senha`) VALUES
(1, 'reinaldo', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria_servico`
--
ALTER TABLE `categoria_servico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galeria`
--
ALTER TABLE `galeria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pag_inicial`
--
ALTER TABLE `pag_inicial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parceiro`
--
ALTER TABLE `parceiro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sistema_informatica`
--
ALTER TABLE `sistema_informatica`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria_servico`
--
ALTER TABLE `categoria_servico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `contato`
--
ALTER TABLE `contato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `galeria`
--
ALTER TABLE `galeria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `parceiro`
--
ALTER TABLE `parceiro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `servico`
--
ALTER TABLE `servico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sistema_informatica`
--
ALTER TABLE `sistema_informatica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
