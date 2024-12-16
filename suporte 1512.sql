-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16/12/2024 às 03:06
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `suporte`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `chamado`
--

CREATE TABLE `chamado` (
  `id_chamado` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `sala` varchar(255) NOT NULL,
  `computador` varchar(20) NOT NULL,
  `tecnico` varchar(255) NOT NULL,
  `descricao` varchar(1000) NOT NULL,
  `status` varchar(255) NOT NULL,
  `foto` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `id_cursos` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`id_cursos`, `nome`) VALUES
(1, 'Administração'),
(2, 'Química'),
(3, 'Informática'),
(4, 'Contabilidade'),
(5, 'Logística'),
(6, 'Recursos Humanos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagens`
--

CREATE TABLE `imagens` (
  `id_imagens` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `descricao` tinytext NOT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `informativos`
--

CREATE TABLE `informativos` (
  `id_usuario` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `informacao` mediumtext NOT NULL,
  `orientacao` mediumtext NOT NULL,
  `id_informativos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_chamado`
--

CREATE TABLE `log_chamado` (
  `id_chamado` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `sala` varchar(255) NOT NULL,
  `computador` varchar(20) NOT NULL,
  `tecnico` varchar(255) NOT NULL,
  `descricao` varchar(1000) NOT NULL,
  `status` varchar(255) NOT NULL,
  `foto` mediumblob DEFAULT NULL,
  `mudanca` varchar(255) NOT NULL,
  `crud` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_informativos`
--

CREATE TABLE `log_informativos` (
  `id_usuario` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `informacao` mediumtext NOT NULL,
  `orientacao` mediumtext NOT NULL,
  `mudanca` varchar(255) NOT NULL,
  `CRUD` varchar(12) NOT NULL,
  `data_hora` datetime NOT NULL,
  `id_informativos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_interacoes`
--

CREATE TABLE `log_interacoes` (
  `id_log_interacoes` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `comentarios` mediumtext NOT NULL,
  `data_hora` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_perfil`
--

CREATE TABLE `log_perfil` (
  `id_perfil` int(11) NOT NULL,
  `tipo` varchar(12) NOT NULL,
  `mudanca` varchar(12) NOT NULL,
  `crud` varchar(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_reserva`
--

CREATE TABLE `log_reserva` (
  `id_reserva` int(11) NOT NULL,
  `nome_event` varchar(50) NOT NULL,
  `curso` varchar(25) NOT NULL,
  `turma` varchar(10) NOT NULL,
  `local` varchar(255) NOT NULL,
  `tipo_usuario` int(11) NOT NULL,
  `equipamentos` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `objetivo` mediumtext NOT NULL,
  `mudanca` mediumtext NOT NULL,
  `crud` varchar(12) NOT NULL,
  `data_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_usuario`
--

CREATE TABLE `log_usuario` (
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `mudanca` varchar(255) NOT NULL,
  `crud` varchar(10) NOT NULL,
  `data_hora` datetime NOT NULL,
  `validacaoCadastro` varchar(255) NOT NULL,
  `statusAtividade` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `tipo` enum('adm','suporte','padrao','secretaria') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `tipo`) VALUES
(1, 'adm'),
(2, 'suporte'),
(3, 'padrao'),
(4, 'secretaria');

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `nome_event` varchar(50) NOT NULL,
  `curso` varchar(25) NOT NULL,
  `turmas` varchar(10) NOT NULL,
  `local` varchar(255) NOT NULL,
  `tipo_usuario` int(11) NOT NULL,
  `equipamentos` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `objetivo` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `id_turma` int(11) NOT NULL,
  `nome_turma` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `turmas`
--

INSERT INTO `turmas` (`id_turma`, `nome_turma`) VALUES
(1, '1A'),
(2, '2A'),
(3, '3A'),
(4, '1B'),
(5, '2B'),
(6, '3B'),
(7, '1C'),
(8, '2C'),
(9, '3C'),
(10, '1F'),
(11, '2F'),
(12, '3F'),
(13, '1I'),
(14, '2I'),
(15, '3I'),
(16, '1G'),
(17, '2G'),
(18, '1H'),
(19, '2H');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(128) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `validacaoCadastro` varchar(255) NOT NULL,
  `statusAtividade` varchar(255) NOT NULL,
  `id_perfil` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `chamado`
--
ALTER TABLE `chamado`
  ADD PRIMARY KEY (`id_chamado`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_cursos`);

--
-- Índices de tabela `imagens`
--
ALTER TABLE `imagens`
  ADD PRIMARY KEY (`id_imagens`),
  ADD KEY `fk_id_usuario` (`id_usuario`);

--
-- Índices de tabela `informativos`
--
ALTER TABLE `informativos`
  ADD PRIMARY KEY (`id_informativos`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `log_chamado`
--
ALTER TABLE `log_chamado`
  ADD PRIMARY KEY (`id_chamado`);

--
-- Índices de tabela `log_informativos`
--
ALTER TABLE `log_informativos`
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_informativo` (`id_informativos`);

--
-- Índices de tabela `log_interacoes`
--
ALTER TABLE `log_interacoes`
  ADD PRIMARY KEY (`id_log_interacoes`),
  ADD KEY `fk_id_usuario` (`id_usuario`);

--
-- Índices de tabela `log_perfil`
--
ALTER TABLE `log_perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Índices de tabela `log_reserva`
--
ALTER TABLE `log_reserva`
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Índices de tabela `log_usuario`
--
ALTER TABLE `log_usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Índices de tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Índices de tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id_turma`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_perfil` (`id_perfil`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `chamado`
--
ALTER TABLE `chamado`
  MODIFY `id_chamado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_cursos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `imagens`
--
ALTER TABLE `imagens`
  MODIFY `id_imagens` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `informativos`
--
ALTER TABLE `informativos`
  MODIFY `id_informativos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `log_interacoes`
--
ALTER TABLE `log_interacoes`
  MODIFY `id_log_interacoes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `log_perfil`
--
ALTER TABLE `log_perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `informativos`
--
ALTER TABLE `informativos`
  ADD CONSTRAINT `informativos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Restrições para tabelas `log_chamado`
--
ALTER TABLE `log_chamado`
  ADD CONSTRAINT `log_chamado_ibfk_1` FOREIGN KEY (`id_chamado`) REFERENCES `chamado` (`id_chamado`);

--
-- Restrições para tabelas `log_informativos`
--
ALTER TABLE `log_informativos`
  ADD CONSTRAINT `log_informativos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `log_informativos_ibfk_2` FOREIGN KEY (`id_informativos`) REFERENCES `informativos` (`id_informativos`);

--
-- Restrições para tabelas `log_reserva`
--
ALTER TABLE `log_reserva`
  ADD CONSTRAINT `log_reserva_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`);

--
-- Restrições para tabelas `log_usuario`
--
ALTER TABLE `log_usuario`
  ADD CONSTRAINT `log_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `informativos` (`id_usuario`),
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `log_informativos` (`id_usuario`),
  ADD CONSTRAINT `usuario_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `log_usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
