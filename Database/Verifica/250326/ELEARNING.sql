-- phpMyAdmin SQL Dump
-- version 5.2.3-1.fc43
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Mar 24, 2026 alle 09:11
-- Versione del server: 10.11.16-MariaDB
-- Versione PHP: 8.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ELEARNING`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `CORSI`
--

CREATE TABLE `CORSI` (
  `id_corso` int(11) NOT NULL,
  `titolo` varchar(100) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `livello` varchar(20) DEFAULT NULL,
  `costo` decimal(8,2) DEFAULT NULL,
  `attivo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `CORSI`
--

INSERT INTO `CORSI` (`id_corso`, `titolo`, `categoria`, `livello`, `costo`, `attivo`) VALUES
(1, 'SQL Base', 'Informatica', 'Base', 80.00, 1),
(2, 'SQL Avanzato', 'Informatica', 'Avanzato', 120.00, 1),
(3, 'Python Base', 'Informatica', 'Base', 90.00, 1),
(4, 'Python Avanzato', 'Informatica', 'Avanzato', 150.00, 1),
(5, 'Reti', 'Informatica', 'Intermedio', 110.00, 1),
(6, 'Sistemi Operativi', 'Informatica', 'Intermedio', 130.00, 1),
(7, 'Matematica Discreta', 'Matematica', 'Base', 70.00, 1),
(8, 'Statistica', 'Matematica', 'Intermedio', 100.00, 1),
(9, 'Algebra Lineare', 'Matematica', 'Avanzato', 140.00, 1),
(10, 'Machine Learning', 'Informatica', 'Avanzato', 200.00, 1),
(11, 'HTML CSS', 'Informatica', 'Base', 60.00, 1),
(12, 'JavaScript', 'Informatica', 'Intermedio', 100.00, 1),
(13, 'Java Base', 'Informatica', 'Base', 90.00, 1),
(14, 'Java Avanzato', 'Informatica', 'Avanzato', 150.00, 0),
(15, 'Cybersecurity', 'Informatica', 'Avanzato', 180.00, 1),
(16, 'Filosofia', 'Umanistica', 'Base', 50.00, 1),
(17, 'Inglese', 'Lingue', 'Base', 70.00, 1),
(18, 'Economia', 'Economia', 'Intermedio', 100.00, 1),
(19, 'Project Management', 'Economia', 'Avanzato', 160.00, 1),
(20, 'Data Science', 'Informatica', 'Avanzato', 220.00, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `DOCENTI`
--

CREATE TABLE `DOCENTI` (
  `id_docente` int(11) NOT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `specializzazione` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `DOCENTI`
--

INSERT INTO `DOCENTI` (`id_docente`, `cognome`, `nome`, `specializzazione`) VALUES
(1, 'Verdi', 'Giuseppe', 'Database'),
(2, 'Neri', 'Alberto', 'Python'),
(3, 'Bianchi', 'Stefano', 'Reti'),
(4, 'Rossi', 'Lorenzo', 'Sistemi'),
(5, 'Ferrari', 'Paolo', 'Matematica'),
(6, 'Greco', 'Anna', 'Statistica'),
(7, 'Romano', 'Luca', 'Machine Learning'),
(8, 'Conti', 'Elisa', 'Web'),
(9, 'Marino', 'Davide', 'Java'),
(10, 'Rizzo', 'Chiara', 'Cybersecurity'),
(11, 'Gallo', 'Marco', 'Filosofia'),
(12, 'Costa', 'Sara', 'Inglese'),
(13, 'Fontana', 'Paolo', 'Economia'),
(14, 'Moretti', 'Simone', 'Project Management'),
(15, 'Barbieri', 'Irene', 'Data Science'),
(16, 'Ricci', 'Andrea', 'Database'),
(17, 'Lombardi', 'Francesca', 'Python'),
(18, 'Esposito', 'Matteo', 'Web'),
(19, 'Villa', 'Giorgio', 'Java'),
(20, 'Testa', 'Valentina', 'Matematica');

-- --------------------------------------------------------

--
-- Struttura della tabella `ISCRIZIONI`
--

CREATE TABLE `ISCRIZIONI` (
  `id_iscrizione` int(11) NOT NULL,
  `id_studente` int(11) DEFAULT NULL,
  `id_corso` int(11) DEFAULT NULL,
  `data_iscrizione` date DEFAULT NULL,
  `stato` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ISCRIZIONI`
--

INSERT INTO `ISCRIZIONI` (`id_iscrizione`, `id_studente`, `id_corso`, `data_iscrizione`, `stato`) VALUES
(1, 1, 1, '2026-01-01', 'attiva'),
(2, 2, 2, '2026-01-02', 'attiva'),
(3, 3, 3, '2026-01-03', 'attiva'),
(4, 4, 4, '2026-01-04', 'attiva'),
(5, 5, 5, '2026-01-05', 'attiva'),
(6, 6, 6, '2026-01-06', 'attiva'),
(7, 7, 7, '2026-01-07', 'attiva'),
(8, 8, 8, '2026-01-08', 'attiva'),
(9, 9, 9, '2026-01-09', 'attiva'),
(10, 10, 10, '2026-01-10', 'attiva'),
(11, 11, 1, '2026-02-01', 'attiva'),
(12, 12, 2, '2026-02-02', 'attiva'),
(13, 13, 3, '2026-02-03', 'attiva'),
(14, 14, 4, '2026-02-04', 'attiva'),
(15, 15, 5, '2026-02-05', 'attiva'),
(16, 16, 6, '2026-02-06', 'attiva'),
(17, 17, 7, '2026-02-07', 'attiva'),
(18, 18, 8, '2026-02-08', 'attiva'),
(19, 19, 9, '2026-02-09', 'attiva'),
(20, 20, 10, '2026-02-10', 'attiva');

-- --------------------------------------------------------

--
-- Struttura della tabella `LEZIONI`
--

CREATE TABLE `LEZIONI` (
  `id_lezione` int(11) NOT NULL,
  `id_corso` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `data_lezione` date DEFAULT NULL,
  `durata` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `LEZIONI`
--

INSERT INTO `LEZIONI` (`id_lezione`, `id_corso`, `id_docente`, `data_lezione`, `durata`) VALUES
(1, 1, 1, '2026-01-10', 2),
(2, 2, 1, '2026-01-15', 3),
(3, 3, 2, '2026-01-20', 2),
(4, 4, 2, '2026-02-01', 3),
(5, 5, 3, '2026-02-05', 2),
(6, 6, 4, '2026-02-10', 3),
(7, 7, 5, '2026-02-15', 2),
(8, 8, 6, '2026-02-20', 2),
(9, 9, 5, '2026-02-25', 3),
(10, 10, 7, '2026-03-01', 3),
(11, 11, 8, '2026-03-02', 2),
(12, 12, 8, '2026-03-03', 2),
(13, 13, 9, '2026-03-04', 2),
(14, 14, 9, '2026-03-05', 3),
(15, 15, 10, '2026-03-06', 2),
(16, 16, 11, '2026-03-07', 2),
(17, 17, 12, '2026-03-08', 2),
(18, 18, 13, '2026-03-09', 2),
(19, 19, 14, '2026-03-10', 3),
(20, 20, 15, '2026-03-11', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `PAGAMENTI`
--

CREATE TABLE `PAGAMENTI` (
  `id_pagamento` int(11) NOT NULL,
  `id_iscrizione` int(11) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `importo` decimal(8,2) DEFAULT NULL,
  `metodo` varchar(50) DEFAULT NULL,
  `esito` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `PAGAMENTI`
--

INSERT INTO `PAGAMENTI` (`id_pagamento`, `id_iscrizione`, `data_pagamento`, `importo`, `metodo`, `esito`) VALUES
(1, 1, '2026-01-02', 80.00, 'carta', 'positivo'),
(2, 2, '2026-01-03', 120.00, 'carta', 'positivo'),
(3, 3, '2026-01-04', 90.00, 'paypal', 'positivo'),
(4, 4, '2026-01-05', 150.00, 'carta', 'negativo'),
(5, 5, '2026-01-06', 110.00, 'bonifico', 'positivo'),
(6, 6, '2026-01-07', 130.00, 'carta', 'positivo'),
(7, 7, '2026-01-08', 70.00, 'paypal', 'positivo'),
(8, 8, '2026-01-09', 100.00, 'carta', 'positivo'),
(9, 9, '2026-01-10', 140.00, 'bonifico', 'negativo'),
(10, 10, '2026-01-11', 200.00, 'carta', 'positivo'),
(11, 11, '2026-02-02', 80.00, 'carta', 'positivo'),
(12, 12, '2026-02-03', 120.00, 'paypal', 'positivo'),
(13, 13, '2026-02-04', 90.00, 'carta', 'positivo'),
(14, 14, '2026-02-05', 150.00, 'carta', 'positivo'),
(15, 15, '2026-02-06', 110.00, 'bonifico', 'positivo'),
(16, 16, '2026-02-07', 130.00, 'carta', 'positivo'),
(17, 17, '2026-02-08', 70.00, 'paypal', 'positivo'),
(18, 18, '2026-02-09', 100.00, 'carta', 'positivo'),
(19, 19, '2026-02-10', 140.00, 'bonifico', 'positivo'),
(20, 20, '2026-02-11', 200.00, 'carta', 'positivo');

-- --------------------------------------------------------

--
-- Struttura della tabella `RECENSIONI`
--

CREATE TABLE `RECENSIONI` (
  `id_recensione` int(11) NOT NULL,
  `id_studente` int(11) DEFAULT NULL,
  `id_corso` int(11) DEFAULT NULL,
  `voto` int(11) DEFAULT NULL,
  `commento` varchar(255) DEFAULT NULL,
  `data_recensione` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `RECENSIONI`
--

INSERT INTO `RECENSIONI` (`id_recensione`, `id_studente`, `id_corso`, `voto`, `commento`, `data_recensione`) VALUES
(1, 1, 1, 4, 'Buono', '2026-02-01'),
(2, 2, 2, 5, 'Ottimo', '2026-02-02'),
(3, 3, 3, 3, 'Discreto', '2026-02-03'),
(4, 4, 4, 4, 'Interessante', '2026-02-04'),
(5, 5, 5, 5, 'Molto utile', '2026-02-05'),
(6, 6, 6, 4, 'Chiaro', '2026-02-06'),
(7, 7, 7, 3, 'Difficile', '2026-02-07'),
(8, 8, 8, 4, 'Ben fatto', '2026-02-08'),
(9, 9, 9, 5, 'Ottimo', '2026-02-09'),
(10, 10, 10, 5, 'Eccellente', '2026-02-10'),
(11, 11, 1, 4, 'Buono', '2026-03-01'),
(12, 12, 2, 5, 'Ottimo', '2026-03-02'),
(13, 13, 3, 4, 'Utile', '2026-03-03'),
(14, 14, 4, 5, 'Perfetto', '2026-03-04'),
(15, 15, 5, 4, 'Interessante', '2026-03-05'),
(16, 16, 6, 3, 'Complesso', '2026-03-06'),
(17, 17, 7, 4, 'Chiaro', '2026-03-07'),
(18, 18, 8, 5, 'Ottimo', '2026-03-08'),
(19, 19, 9, 4, 'Buono', '2026-03-09'),
(20, 20, 10, 5, 'Eccellente', '2026-03-10');

-- --------------------------------------------------------

--
-- Struttura della tabella `STUDENTI`
--

CREATE TABLE `STUDENTI` (
  `id_studente` int(11) NOT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `data_iscrizione` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `STUDENTI`
--

INSERT INTO `STUDENTI` (`id_studente`, `cognome`, `nome`, `email`, `data_iscrizione`) VALUES
(1, 'Rossi', 'Mario', 'mario.rossi@mail.it', '2025-01-10'),
(2, 'Bianchi', 'Luca', 'luca.bianchi@mail.it', '2025-02-15'),
(3, 'Verdi', 'Anna', 'anna.verdi@mail.it', '2025-03-20'),
(4, 'Neri', 'Paolo', 'paolo.neri@mail.it', '2025-04-11'),
(5, 'Gialli', 'Sara', 'sara.gialli@mail.it', '2025-05-01'),
(6, 'Blu', 'Marco', 'marco.blu@mail.it', '2025-06-18'),
(7, 'Viola', 'Elena', 'elena.viola@mail.it', '2025-07-22'),
(8, 'Rosa', 'Davide', 'davide.rosa@mail.it', '2025-08-30'),
(9, 'Conti', 'Giulia', 'giulia.conti@mail.it', '2025-09-05'),
(10, 'Greco', 'Alessio', 'alessio.greco@mail.it', '2025-10-12'),
(11, 'Romano', 'Chiara', 'chiara.romano@mail.it', '2026-01-10'),
(12, 'Ferrari', 'Matteo', 'matteo.ferrari@mail.it', '2026-01-15'),
(13, 'Esposito', 'Laura', 'laura.esposito@mail.it', '2026-02-01'),
(14, 'Ricci', 'Simone', 'simone.ricci@mail.it', '2026-02-20'),
(15, 'Marino', 'Irene', 'irene.marino@mail.it', '2026-03-02'),
(16, 'Rizzo', 'Andrea', 'andrea.rizzo@mail.it', '2026-03-10'),
(17, 'Lombardi', 'Francesca', 'francesca.lombardi@mail.it', '2026-03-15'),
(18, 'Moretti', 'Stefano', 'stefano.moretti@mail.it', '2026-03-18'),
(19, 'Barbieri', 'Valentina', 'valentina.barbieri@mail.it', '2026-03-20'),
(20, 'Fontana', 'Giorgio', 'giorgio.fontana@mail.it', '2026-03-22');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `CORSI`
--
ALTER TABLE `CORSI`
  ADD PRIMARY KEY (`id_corso`);

--
-- Indici per le tabelle `DOCENTI`
--
ALTER TABLE `DOCENTI`
  ADD PRIMARY KEY (`id_docente`);

--
-- Indici per le tabelle `ISCRIZIONI`
--
ALTER TABLE `ISCRIZIONI`
  ADD PRIMARY KEY (`id_iscrizione`),
  ADD KEY `id_studente` (`id_studente`),
  ADD KEY `id_corso` (`id_corso`);

--
-- Indici per le tabelle `LEZIONI`
--
ALTER TABLE `LEZIONI`
  ADD PRIMARY KEY (`id_lezione`),
  ADD KEY `id_corso` (`id_corso`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indici per le tabelle `PAGAMENTI`
--
ALTER TABLE `PAGAMENTI`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `id_iscrizione` (`id_iscrizione`);

--
-- Indici per le tabelle `RECENSIONI`
--
ALTER TABLE `RECENSIONI`
  ADD PRIMARY KEY (`id_recensione`),
  ADD KEY `id_studente` (`id_studente`),
  ADD KEY `id_corso` (`id_corso`);

--
-- Indici per le tabelle `STUDENTI`
--
ALTER TABLE `STUDENTI`
  ADD PRIMARY KEY (`id_studente`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `ISCRIZIONI`
--
ALTER TABLE `ISCRIZIONI`
  ADD CONSTRAINT `ISCRIZIONI_ibfk_1` FOREIGN KEY (`id_studente`) REFERENCES `STUDENTI` (`id_studente`),
  ADD CONSTRAINT `ISCRIZIONI_ibfk_2` FOREIGN KEY (`id_corso`) REFERENCES `CORSI` (`id_corso`);

--
-- Limiti per la tabella `LEZIONI`
--
ALTER TABLE `LEZIONI`
  ADD CONSTRAINT `LEZIONI_ibfk_1` FOREIGN KEY (`id_corso`) REFERENCES `CORSI` (`id_corso`),
  ADD CONSTRAINT `LEZIONI_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `DOCENTI` (`id_docente`);

--
-- Limiti per la tabella `PAGAMENTI`
--
ALTER TABLE `PAGAMENTI`
  ADD CONSTRAINT `PAGAMENTI_ibfk_1` FOREIGN KEY (`id_iscrizione`) REFERENCES `ISCRIZIONI` (`id_iscrizione`);

--
-- Limiti per la tabella `RECENSIONI`
--
ALTER TABLE `RECENSIONI`
  ADD CONSTRAINT `RECENSIONI_ibfk_1` FOREIGN KEY (`id_studente`) REFERENCES `STUDENTI` (`id_studente`),
  ADD CONSTRAINT `RECENSIONI_ibfk_2` FOREIGN KEY (`id_corso`) REFERENCES `CORSI` (`id_corso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
