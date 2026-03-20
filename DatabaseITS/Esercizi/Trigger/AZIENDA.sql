-- phpMyAdmin SQL Dump
-- version 5.2.3-1.fc43
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Mar 20, 2026 alle 09:21
-- Versione del server: 10.11.16-MariaDB
-- Versione PHP: 8.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fsl`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `AZIENDA`
--

CREATE TABLE `AZIENDA` (
  `P_iva` varchar(20) NOT NULL,
  `Ragione_sociale` varchar(150) DEFAULT NULL,
  `Sede_legale` varchar(200) DEFAULT NULL,
  `Sede_operativa` varchar(200) DEFAULT NULL,
  `settore_attivita` varchar(100) DEFAULT NULL,
  `Email_aziendale` varchar(120) DEFAULT NULL,
  `Telefono_ref` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `AZIENDA`
--

INSERT INTO `AZIENDA` (`P_iva`, `Ragione_sociale`, `Sede_legale`, `Sede_operativa`, `settore_attivita`, `Email_aziendale`, `Telefono_ref`) VALUES
('01234567890', 'Tech Solutions Srl', 'Via Roma 10, Milano', 'Via Milano 25, Torino', 'IT', 'info@techsolutions.it', '0111234567'),
('01234567S0', 'TECH SOLUTIONS SRL', 'Via Roma 10, Milano', 'Via Milano 25, Torino', 'IT', 'info@techsolutions.it', '0111234567'),
('IT00000000001', 'TechSolutions', 'Pesaro', 'Pesaro', 'IT', 'info@tech.it', '0721000001'),
('IT00000000002', 'NetLab', 'Fano', 'Fano', 'IT', 'info@netlab.it', '0721000002'),
('IT00000000003', 'SoftWave', 'Urbino', 'Pesaro', 'Software', 'info@softwave.it', '0721000003'),
('IT00000000004', 'DataMind', 'Rimini', 'Rimini', 'Data', 'info@datamind.it', '0721000004'),
('IT00000000005', 'Innova', 'Pesaro', 'Pesaro', 'IT', 'info@innova.it', '0721000005'),
('IT00000000006', 'CyberSys', 'Ancona', 'Pesaro', 'Security', 'info@cybersys.it', '0721000006'),
('IT00000000007', 'AIWorks', 'Bologna', 'Pesaro', 'AI', 'info@aiworks.it', '0721000007'),
('IT00000000008', 'CloudLab', 'Milano', 'Pesaro', 'Cloud', 'info@cloudlab.it', '0721000008'),
('IT00000000009', 'DevGroup', 'Roma', 'Pesaro', 'Software', 'info@devgroup.it', '0721000009'),
('IT00000000010', 'LogicNet', 'Torino', 'Pesaro', 'Networking', 'info@logicnet.it', '0721000010'),
('IT00000000011', 'FutureIT', 'Firenze', 'Pesaro', 'IT', 'info@future.it', '0721000011'),
('IT00000000012', 'SmartSoft', 'Genova', 'Pesaro', 'Software', 'info@smartsoft.it', '0721000012'),
('IT00000000013', 'NextData', 'Parma', 'Pesaro', 'Data', 'info@nextdata.it', '0721000013'),
('IT00000000014', 'CodeLab', 'Modena', 'Pesaro', 'Software', 'info@codelab.it', '0721000014'),
('IT00000000015', 'InfoSys', 'Padova', 'Pesaro', 'IT', 'info@infosys.it', '0721000015'),
('IT00000000016', 'BlueTech', 'Pisa', 'Pesaro', 'IT', 'info@bluetech.it', '0721000016'),
('IT00000000017', 'AlphaAI', 'Perugia', 'Pesaro', 'AI', 'info@alphaai.it', '0721000017'),
('IT00000000018', 'BetaCloud', 'Napoli', 'Pesaro', 'Cloud', 'info@betacloud.it', '0721000018'),
('IT00000000019', 'GammaSec', 'Salerno', 'Pesaro', 'Security', 'info@gammasec.it', '0721000019'),
('IT00000000020', 'DeltaSoft', 'Bari', 'Pesaro', 'Software', 'info@deltasoft.it', '0721000020');

--
-- Trigger `AZIENDA`
--
DELIMITER $$
CREATE TRIGGER `trg_block_delete` BEFORE DELETE ON `AZIENDA` FOR EACH ROW BEGIN
    IF OLD.settore_attivita = 'IT' THEN
        SIGNAL SQLSTATE '45000';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_log_insert_2` AFTER INSERT ON `AZIENDA` FOR EACH ROW BEGIN
 INSERT INTO AZIENDA_LOG	 VALUES (NULL, NEW.P_iva, 'INSERT', NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_uppercase` BEFORE INSERT ON `AZIENDA` FOR EACH ROW BEGIN
    SET NEW.Ragione_sociale = UPPER(TRIM(NEW.Ragione_sociale));
END
$$
DELIMITER ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `AZIENDA`
--
ALTER TABLE `AZIENDA`
  ADD PRIMARY KEY (`P_iva`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
