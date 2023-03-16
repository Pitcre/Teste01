-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Fev-2023 às 19:23
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sgm_final`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sgm_final` ()   BEGIN

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estudante`
--

CREATE TABLE `estudante` (
  `num` varchar(8) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estudante`
--

INSERT INTO `estudante` (`num`, `idUsuario`) VALUES
('20180968', 9),
('20180506', 12),
('20180800', 30),
('20180706', 58),
('20280708', 59);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estudante_has_temas`
--

CREATE TABLE `estudante_has_temas` (
  `Estudante_idUsuario` int(11) NOT NULL,
  `temas_idTema` int(11) NOT NULL,
  `limite` int(1) NOT NULL,
  `estado_vinculo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estudante_has_temas`
--

INSERT INTO `estudante_has_temas` (`Estudante_idUsuario`, `temas_idTema`, `limite`, `estado_vinculo`) VALUES
(12, 44, 0, 1),
(30, 48, 0, 1),
(58, 46, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ficheiros`
--

CREATE TABLE `ficheiros` (
  `idFiche` int(11) NOT NULL,
  `Ficheiro` varchar(100) NOT NULL,
  `Descricao` varchar(200) NOT NULL,
  `ficheiro_tipo` varchar(200) NOT NULL,
  `imagem` varchar(200) NOT NULL,
  `Data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ficheiros`
--

INSERT INTO `ficheiros` (`idFiche`, `Ficheiro`, `Descricao`, `ficheiro_tipo`, `imagem`, `Data`) VALUES
(19, 'monografia_mÁrcia_de_molonende_v7-r.pdf', 'teste', 'Fases do Processo', 'beneficios-sistema-gestao-integrada-1.png', '2023-01-19 13:17:34'),
(20, 'test04 - cópia.pdf', 'teste02', 'Normas', 'r.png', '2023-02-20 19:10:52'),
(21, 'test04.pdf', 'teste', 'Regulamento da UÓR', 'captura de ecrã_20230115_171533.png', '2023-01-19 13:26:50');

-- --------------------------------------------------------

--
-- Estrutura da tabela `linnhas_de_investigação`
--

CREATE TABLE `linnhas_de_investigação` (
  `idLinhas` int(11) NOT NULL,
  `titulo` text NOT NULL,
  `Criado` varchar(22) NOT NULL,
  `descricao` text NOT NULL,
  `data_criacao` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `linnhas_de_investigação`
--

INSERT INTO `linnhas_de_investigação` (`idLinhas`, `titulo`, `Criado`, `descricao`, `data_criacao`) VALUES
(1, 'Software de Gestão', 'Mario Afonso', 'Sistema de uma loja', '2022-12-10 12:58:53'),
(2, 'Gestão de Loja', 'Mario Afonso', 'Gestão de Loja', '2022-12-13 17:49:52'),
(3, 'Sistema de Transporte Escolar', 'Mario Afonso', 'Sistema de Transporte Escolar', '2022-12-14 01:15:12'),
(14, 'Intranet', 'Mario Afonso', '', '2023-02-22 22:39:12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `orientador`
--

CREATE TABLE `orientador` (
  `num` varchar(22) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `nivel_academico` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `orientador`
--

INSERT INTO `orientador` (`num`, `categoria`, `nivel_academico`, `idUsuario`) VALUES
('201896Laa', 'Assistente', 'Mestre', 2),
('201896Lb', 'Assistente', 'Mestre', 10),
('201807lab', 'Assistente', 'Mestre', 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tabela_nivel_acesso`
--

CREATE TABLE `tabela_nivel_acesso` (
  `idNivelAcesso` int(11) NOT NULL,
  `nomeNivelAcesso` varchar(50) NOT NULL,
  `DataCadastro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tabela_nivel_acesso`
--

INSERT INTO `tabela_nivel_acesso` (`idNivelAcesso`, `nomeNivelAcesso`, `DataCadastro`) VALUES
(1, 'Administrador', '2022-12-10'),
(2, 'Coordenador', '2022-12-10'),
(3, 'Orientador', '2022-12-10'),
(4, 'Estudante', '2022-12-10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tabela_usuarios`
--

CREATE TABLE `tabela_usuarios` (
  `idUsuario` int(11) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `dataCadastro` date NOT NULL,
  `nome` varchar(45) NOT NULL,
  `Celular` int(9) NOT NULL,
  `email` varchar(45) NOT NULL,
  `idNivelAcesso` int(11) NOT NULL,
  `BI` varchar(14) NOT NULL,
  `imagem` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tabela_usuarios`
--

INSERT INTO `tabela_usuarios` (`idUsuario`, `senha`, `dataCadastro`, `nome`, `Celular`, `email`, `idNivelAcesso`, `BI`, `imagem`) VALUES
(1, '81dc9bdb52d04dc20036dbd8313ed055', '2022-12-10', 'Alicia Molonende', 934195263, 'aliciamolonende@gmail.com', 1, '', 'cópia de o ideal (6).png'),
(2, 'ade45dba47b99904b7f0459dcbacc0b1', '2022-12-10', 'Mario de Molonende', 934195286, 'mariodemolonende@gmail.com', 2, '', ''),
(9, '81dc9bdb52d04dc20036dbd8313ed055', '2022-12-13', 'Delfina Silva', 923556787, 'delfinasilva@gmail.com', 4, '', ''),
(10, '81dc9bdb52d04dc20036dbd8313ed055', '2022-12-14', 'Márcia de Molonende', 923456789, 'marciamolonende@gmail.com', 3, '', 'r.png'),
(12, '579646aad11fae4dd295812fb4526245', '2022-12-14', 'Adriano Molonende', 932466794, 'adrianomolonende@gmail.com', 4, '', ''),
(15, '81dc9bdb52d04dc20036dbd8313ed055', '2022-12-18', 'Mario Afonso', 934195263, 'marioafonso@gmail.com', 2, '12345678901234', 'user (1).png'),
(30, '0f7e44a922df352c05c5f73cb40ba115', '2022-12-21', 'José Francisco', 943567354, 'josefrancisco@gmail.com', 4, '', ''),
(58, '81dc9bdb52d04dc20036dbd8313ed055', '2023-02-20', 'Fátima Molonende', 923456705, 'fatimalemosmolonende@gmail.com', 4, '', 'r.png'),
(59, '81dc9bdb52d04dc20036dbd8313ed055', '2023-02-22', 'Helga Silva', 924356789, 'helgasilva@gmail.com', 4, '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `temas`
--

CREATE TABLE `temas` (
  `idTema` int(11) NOT NULL,
  `tema` varchar(700) CHARACTER SET latin1 NOT NULL,
  `descricao` text CHARACTER SET latin1 NOT NULL,
  `estado` varchar(12) NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp(),
  `idLinhas` int(11) NOT NULL,
  `Orientador_idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Extraindo dados da tabela `temas`
--

INSERT INTO `temas` (`idTema`, `tema`, `descricao`, `estado`, `data`, `idLinhas`, `Orientador_idUsuario`) VALUES
(42, 'Sistema de Transporte Escolar', 'é um sistema para os colaboradores ', 'Disponivel', '2022-12-21 00:27:52', 3, 15),
(43, 'Sistema de Gestão Para uma Cantina', 'Sistema de Gestão Para uma Cantina', 'Disponivel', '2022-12-21 00:54:46', 2, 15),
(44, 'Sistema de Gestão de Correspondencia ', 'é um sistema de software para a empresa ziga', 'Indisponivel', '2022-12-21 18:32:50', 1, 15),
(46, 'Sistema de transporte para a creche', 'Sistema de transporte', 'Disponivel', '2022-12-21 19:49:34', 3, 10),
(48, 'Sistema de uma farmácia', 'Sistema de uma farmácia', 'Indisponivel', '2023-01-19 23:30:08', 1, 15),
(69, 'Site Interno ', 'Site Interno', 'Disponivel', '2023-02-22 22:42:22', 14, 15);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `estudante`
--
ALTER TABLE `estudante`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Estudante_tabela_usuarios1_idx` (`idUsuario`);

--
-- Índices para tabela `estudante_has_temas`
--
ALTER TABLE `estudante_has_temas`
  ADD PRIMARY KEY (`Estudante_idUsuario`,`temas_idTema`),
  ADD KEY `fk_Estudante_has_temas_temas1_idx` (`temas_idTema`),
  ADD KEY `fk_Estudante_has_temas_Estudante1_idx` (`Estudante_idUsuario`);

--
-- Índices para tabela `ficheiros`
--
ALTER TABLE `ficheiros`
  ADD PRIMARY KEY (`idFiche`);

--
-- Índices para tabela `linnhas_de_investigação`
--
ALTER TABLE `linnhas_de_investigação`
  ADD PRIMARY KEY (`idLinhas`);

--
-- Índices para tabela `orientador`
--
ALTER TABLE `orientador`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Orientador_tabela_usuarios1_idx` (`idUsuario`);

--
-- Índices para tabela `tabela_nivel_acesso`
--
ALTER TABLE `tabela_nivel_acesso`
  ADD PRIMARY KEY (`idNivelAcesso`);

--
-- Índices para tabela `tabela_usuarios`
--
ALTER TABLE `tabela_usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_tabela_usuarios_tabela_nivel_acesso1_idx` (`idNivelAcesso`);

--
-- Índices para tabela `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`idTema`),
  ADD KEY `fk_temas_linnhas_de_investigação1_idx` (`idLinhas`),
  ADD KEY `fk_temas_Orientador1_idx` (`Orientador_idUsuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `ficheiros`
--
ALTER TABLE `ficheiros`
  MODIFY `idFiche` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `linnhas_de_investigação`
--
ALTER TABLE `linnhas_de_investigação`
  MODIFY `idLinhas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tabela_nivel_acesso`
--
ALTER TABLE `tabela_nivel_acesso`
  MODIFY `idNivelAcesso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tabela_usuarios`
--
ALTER TABLE `tabela_usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de tabela `temas`
--
ALTER TABLE `temas`
  MODIFY `idTema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `estudante`
--
ALTER TABLE `estudante`
  ADD CONSTRAINT `fk_Estudante_tabela_usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `tabela_usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `estudante_has_temas`
--
ALTER TABLE `estudante_has_temas`
  ADD CONSTRAINT `fk_Estudante_has_temas_Estudante1` FOREIGN KEY (`Estudante_idUsuario`) REFERENCES `estudante` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Estudante_has_temas_temas1` FOREIGN KEY (`temas_idTema`) REFERENCES `temas` (`idTema`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `orientador`
--
ALTER TABLE `orientador`
  ADD CONSTRAINT `fk_Orientador_tabela_usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `tabela_usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tabela_usuarios`
--
ALTER TABLE `tabela_usuarios`
  ADD CONSTRAINT `fk_tabela_usuarios_tabela_nivel_acesso1` FOREIGN KEY (`idNivelAcesso`) REFERENCES `tabela_nivel_acesso` (`idNivelAcesso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `temas`
--
ALTER TABLE `temas`
  ADD CONSTRAINT `fk_temas_Orientador1` FOREIGN KEY (`Orientador_idUsuario`) REFERENCES `orientador` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_temas_linnhas_de_investigação1` FOREIGN KEY (`idLinhas`) REFERENCES `linnhas_de_investigação` (`idLinhas`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
