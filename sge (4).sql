-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28-Maio-2019 às 05:48
-- Versão do servidor: 10.1.34-MariaDB
-- PHP Version: 7.1.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sge`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `idaluno` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `dataNascimento` date NOT NULL,
  `sexo` varchar(12) NOT NULL,
  `obsMedicas` varchar(600) NOT NULL,
  `nomeAutorizado` varchar(100) NOT NULL,
  `parentesco` varchar(30) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `idturma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`idaluno`, `nome`, `cpf`, `dataNascimento`, `sexo`, `obsMedicas`, `nomeAutorizado`, `parentesco`, `telefone`, `idturma`) VALUES
(1, 'Gabriel ', '06323555140', '2019-05-07', 'Masculino', 'Nenhuma', 'Maria do Socorro', 'Mae', '61999898777', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno_responsavel`
--

CREATE TABLE `aluno_responsavel` (
  `idaluno` int(11) NOT NULL,
  `idresponsavel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

CREATE TABLE `contrato` (
  `idcontrato` int(11) NOT NULL,
  `dataMatricula` date NOT NULL,
  `valorTotal` double NOT NULL,
  `status` int(11) NOT NULL,
  `idresponsavel` int(11) NOT NULL,
  `idfuncionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `idfuncionario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `fone` varchar(16) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`idfuncionario`, `nome`, `cpf`, `rg`, `cargo`, `fone`, `cep`, `endereco`, `idusuario`) VALUES
(1, 'Gabriel ', '06323555140', '3447969', 'EstagiÃ¡rio', '56565', '72510518', 'Santa Maria', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensalidade`
--

CREATE TABLE `mensalidade` (
  `idmensalidade` int(11) NOT NULL,
  `valor` double NOT NULL,
  `desconto` double NOT NULL,
  `juros` double NOT NULL,
  `dataVencimento` date NOT NULL,
  `dataPagamento` date NOT NULL,
  `valorPago` double NOT NULL,
  `status` int(11) NOT NULL,
  `idcontrato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL,
  `menu` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  `icone` varchar(45) DEFAULT NULL,
  `exibir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`idmenu`, `menu`, `link`, `icone`, `exibir`) VALUES
(2, 'Jogos', 'jogos.com', 'jogos.jpg', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_perfil`
--

CREATE TABLE `menu_perfil` (
  `idmenu` int(11) NOT NULL,
  `idperfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `menu_perfil`
--

INSERT INTO `menu_perfil` (`idmenu`, `idperfil`) VALUES
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL,
  `perfil` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`idperfil`, `perfil`) VALUES
(1, 'Administrador'),
(2, 'Auxiliar');

-- --------------------------------------------------------

--
-- Estrutura da tabela `responsavel`
--

CREATE TABLE `responsavel` (
  `idresponsavel` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `escolaridade` varchar(20) NOT NULL,
  `profissao` varchar(45) NOT NULL,
  `foneResidencial` varchar(16) NOT NULL,
  `foneCelular` varchar(16) NOT NULL,
  `foneCelularDois` varchar(16) NOT NULL,
  `foneTrabalho` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `responsavel`
--

INSERT INTO `responsavel` (`idresponsavel`, `nome`, `cpf`, `rg`, `cep`, `endereco`, `escolaridade`, `profissao`, `foneResidencial`, `foneCelular`, `foneCelularDois`, `foneTrabalho`) VALUES
(1, 'Gabriel Rodrigues de', '06323555140', '3447969', '72510-518', 'QR 310 Conjunto R, 38', 'MÃ©dio', 'EstagiÃ¡rio', '61993912165', '61993912165', '61993912165', '61993912165'),
(2, 'Gabriel Rodrigues de', '06323555140', '595959', '72510-518', 'QR 310 Conjunto R, 38', 'Médio', 'Estagiário', '61993912165', '61993912165', '61993912165', '61993912165'),
(3, 'Carlos', '564584787', '11212121', '2255511', 'Santa Maria QR 310', 'Superior', 'Auxiliar de Cozinha', '619898989888', '61322656555', '61225544777', '61993369558'),
(4, 'Rafael Rodrigues', '021212445', '10212124', '598988', 'Santa Maria QR 310', 'Superior', 'Professor', '4545454', '544545454', '1512115', '0155454'),
(5, 'Leonardo Pereira', '0215454545', '0245545457', '252656565', 'Psul Taguatinga', 'Superior', 'Analista de Sistemas', '15454584787', '121212122', '1212121212', '23568698');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `idturma` int(11) NOT NULL,
  `tipoTurma` varchar(45) NOT NULL,
  `horario` time NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFinal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`idturma`, `tipoTurma`, `horario`, `dataInicio`, `dataFinal`) VALUES
(1, 'Maternal', '10:10:00', '2019-05-02', '2019-05-24'),
(3, 'Bercario', '12:00:00', '2010-02-01', '2015-02-01'),
(4, 'Maternal-2', '01:02:00', '2001-03-03', '2002-03-03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma_funcionario`
--

CREATE TABLE `turma_funcionario` (
  `idturma` int(11) NOT NULL,
  `idfuncionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `idperfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `login`, `senha`, `status`, `idperfil`) VALUES
(1, 'gabriel123', '123', 1, 2),
(2, 'gabriel124', '111', 2, 2),
(3, 'admin', 'admin', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`idaluno`),
  ADD KEY `fk_aluno_turma1_idx` (`idturma`);

--
-- Indexes for table `aluno_responsavel`
--
ALTER TABLE `aluno_responsavel`
  ADD PRIMARY KEY (`idaluno`,`idresponsavel`),
  ADD KEY `fk_aluno_has_responsavel_responsavel1_idx` (`idresponsavel`),
  ADD KEY `fk_aluno_has_responsavel_aluno1_idx` (`idaluno`);

--
-- Indexes for table `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`idcontrato`),
  ADD KEY `fk_contrato_responsavel1_idx` (`idresponsavel`),
  ADD KEY `fk_contrato_funcionario1_idx` (`idfuncionario`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idfuncionario`),
  ADD KEY `fk_funcionario_usuario1_idx` (`idusuario`);

--
-- Indexes for table `mensalidade`
--
ALTER TABLE `mensalidade`
  ADD PRIMARY KEY (`idmensalidade`),
  ADD KEY `fk_mensalidade_contrato1_idx` (`idcontrato`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idmenu`);

--
-- Indexes for table `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD PRIMARY KEY (`idmenu`,`idperfil`),
  ADD KEY `fk_menu_has_perfil_perfil1_idx` (`idperfil`),
  ADD KEY `fk_menu_has_perfil_menu_idx` (`idmenu`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idperfil`);

--
-- Indexes for table `responsavel`
--
ALTER TABLE `responsavel`
  ADD PRIMARY KEY (`idresponsavel`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`idturma`);

--
-- Indexes for table `turma_funcionario`
--
ALTER TABLE `turma_funcionario`
  ADD PRIMARY KEY (`idturma`,`idfuncionario`),
  ADD KEY `fk_turma_has_funcionario_funcionario1_idx` (`idfuncionario`),
  ADD KEY `fk_turma_has_funcionario_turma1_idx` (`idturma`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `fk_usuario_perfil1_idx` (`idperfil`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aluno`
--
ALTER TABLE `aluno`
  MODIFY `idaluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contrato`
--
ALTER TABLE `contrato`
  MODIFY `idcontrato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `idfuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mensalidade`
--
ALTER TABLE `mensalidade`
  MODIFY `idmensalidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `idmenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idperfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `responsavel`
--
ALTER TABLE `responsavel`
  MODIFY `idresponsavel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `turma`
--
ALTER TABLE `turma`
  MODIFY `idturma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_aluno_turma1` FOREIGN KEY (`idturma`) REFERENCES `turma` (`idturma`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `aluno_responsavel`
--
ALTER TABLE `aluno_responsavel`
  ADD CONSTRAINT `fk_aluno_has_responsavel_aluno1` FOREIGN KEY (`idaluno`) REFERENCES `aluno` (`idaluno`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_aluno_has_responsavel_responsavel1` FOREIGN KEY (`idresponsavel`) REFERENCES `responsavel` (`idresponsavel`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `fk_contrato_funcionario1` FOREIGN KEY (`idfuncionario`) REFERENCES `funcionario` (`idfuncionario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contrato_responsavel1` FOREIGN KEY (`idresponsavel`) REFERENCES `responsavel` (`idresponsavel`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionario_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `mensalidade`
--
ALTER TABLE `mensalidade`
  ADD CONSTRAINT `fk_mensalidade_contrato1` FOREIGN KEY (`idcontrato`) REFERENCES `contrato` (`idcontrato`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD CONSTRAINT `fk_menu_has_perfil_menu` FOREIGN KEY (`idmenu`) REFERENCES `menu` (`idmenu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_menu_has_perfil_perfil1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `turma_funcionario`
--
ALTER TABLE `turma_funcionario`
  ADD CONSTRAINT `fk_turma_has_funcionario_funcionario1` FOREIGN KEY (`idfuncionario`) REFERENCES `funcionario` (`idfuncionario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_turma_has_funcionario_turma1` FOREIGN KEY (`idturma`) REFERENCES `turma` (`idturma`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
