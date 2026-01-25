-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Gen 25, 2026 alle 11:36
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PCTOAgile`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `attendances`
--

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `hours_spent` decimal(4,2) NOT NULL,
  `description` text DEFAULT NULL,
  `confirmed_by_tutor` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `attendances`
--

INSERT INTO `attendances` (`id`, `assignment_id`, `date`, `hours_spent`, `description`, `confirmed_by_tutor`) VALUES
(1, 1, '2025-06-11', 4.00, 'Introduzione e configurazione ambienti di sviluppo', 1),
(2, 1, '2025-06-12', 5.00, 'Sviluppo HTML e CSS', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `companies`
--

INSERT INTO `companies` (`id`, `name`, `address`, `phone`, `email`) VALUES
(1, 'Azienda Alpha', 'Via Roma 123, Milano', '0245678901', 'info@aziendaalpha.it'),
(2, 'Azienda Beta', 'Corso Italia 45, Torino', '0112345678', 'contatti@aziendabeta.it');

-- --------------------------------------------------------

--
-- Struttura della tabella `pcto_paths`
--

CREATE TABLE `pcto_paths` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `path_name` varchar(255) NOT NULL,
  `total_hours` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `activities` text DEFAULT NULL,
  `skills_required` text DEFAULT NULL,
  `objectives` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `pcto_paths`
--

INSERT INTO `pcto_paths` (`id`, `company_id`, `path_name`, `total_hours`, `start_date`, `end_date`, `activities`, `skills_required`, `objectives`) VALUES
(1, 1, 'Progetto Web Developer', 80, '2025-06-10', '2025-07-10', 'Sviluppo pagine web statiche e dinamiche', 'HTML, CSS, JS', 'Acquisire competenze base nello sviluppo web'),
(2, 2, 'Progetto Help Desk', 60, '2025-06-15', '2025-07-15', 'Supporto tecnico utenti e configurazione PC', 'Comunicazione, reti', 'Apprendere competenze pratiche di supporto tecnico');

-- --------------------------------------------------------

--
-- Struttura della tabella `student_assignments`
--

CREATE TABLE `student_assignments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `pcto_path_id` int(11) NOT NULL,
  `assignment_date` date DEFAULT curdate(),
  `status` enum('assegnato','in_corso','completato','annullato') DEFAULT 'assegnato'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `student_assignments`
--

INSERT INTO `student_assignments` (`id`, `student_id`, `pcto_path_id`, `assignment_date`, `status`) VALUES
(1, 3, 1, '2025-06-09', 'assegnato');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('dirigente','docente','studente','genitore','tutor_aziendale') NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `email`, `created_at`) VALUES
(1, 'dirigente01', 'hashed_password_1', 'dirigente', 'dirigente01@scuola.it', '2025-05-27 14:24:41'),
(2, 'docente01', 'hashed_password_2', 'docente', 'docente01@scuola.it', '2025-05-27 14:24:41'),
(3, 'studente01', 'hashed_password_3', 'studente', 'studente01@studenti.it', '2025-05-27 14:24:41'),
(4, 'genitore01', 'hashed_password_4', 'genitore', 'genitore01@famiglia.it', '2025-05-27 14:24:41'),
(5, 'tutorazienda01', 'hashed_password_5', 'tutor_aziendale', 'tutor01@azienda.it', '2025-05-27 14:24:41');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_id` (`assignment_id`);

--
-- Indici per le tabelle `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `pcto_paths`
--
ALTER TABLE `pcto_paths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indici per le tabelle `student_assignments`
--
ALTER TABLE `student_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `pcto_path_id` (`pcto_path_id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `pcto_paths`
--
ALTER TABLE `pcto_paths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `student_assignments`
--
ALTER TABLE `student_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `student_assignments` (`id`);

--
-- Limiti per la tabella `pcto_paths`
--
ALTER TABLE `pcto_paths`
  ADD CONSTRAINT `pcto_paths_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Limiti per la tabella `student_assignments`
--
ALTER TABLE `student_assignments`
  ADD CONSTRAINT `student_assignments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `student_assignments_ibfk_2` FOREIGN KEY (`pcto_path_id`) REFERENCES `pcto_paths` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
