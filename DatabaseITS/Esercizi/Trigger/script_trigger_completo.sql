-- SCRIPT COMPLETO: Tabelle + Trigger + Dati

CREATE TABLE IF NOT EXISTS AZIENDA (
    P_iva VARCHAR(20) PRIMARY KEY,
    Ragione_sociale VARCHAR(150),
    Sede_legale VARCHAR(200),
    Sede_operativa VARCHAR(200),
    settore_attivita VARCHAR(100),
    Email_aziendale VARCHAR(120),
    Telefono_ref VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS LOG_AZIENDA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    piva VARCHAR(20),
    operazione VARCHAR(20),
    data_operazione DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS LOG_EMAIL (
    id INT AUTO_INCREMENT PRIMARY KEY,
    piva VARCHAR(20),
    vecchia_email VARCHAR(120),
    nuova_email VARCHAR(120),
    data_modifica DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS STAT_SETTORI (
    settore VARCHAR(100) PRIMARY KEY,
    totale INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS STORICO_SEDI (
    id INT AUTO_INCREMENT PRIMARY KEY,
    piva VARCHAR(20),
    vecchia_sede VARCHAR(200),
    nuova_sede VARCHAR(200),
    data_modifica DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER trg_email_check
BEFORE INSERT ON AZIENDA
FOR EACH ROW
BEGIN
    IF NEW.Email_aziendale NOT LIKE '%@%' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email non valida';
    END IF;
END$$

CREATE TRIGGER trg_log_insert
AFTER INSERT ON AZIENDA
FOR EACH ROW
BEGIN
    INSERT INTO LOG_AZIENDA(piva, operazione)
    VALUES (NEW.P_iva, 'INSERT');
END$$

DELIMITER ;

INSERT INTO AZIENDA
(P_iva, Ragione_sociale, Sede_legale, Sede_operativa, settore_attivita, Email_aziendale, Telefono_ref)
VALUES
('12345678901','Alfa Consulting Srl','Via Verdi 12, Roma','Via Verdi 12, Roma','Consulenza','info@alfaconsulting.it','0612345678');
