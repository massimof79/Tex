-- ============================================================
--  DATABASE OSPEDALE
--  DDL + DML con 20 righe per tabella
--  Prof. Fedeli Massimo - Fabbrica Digitale
-- ============================================================

-- ------------------------------------------------------------
--  DDL - Creazione tabelle
-- ------------------------------------------------------------

CREATE TABLE MEDICI (
    id_medico       INT          PRIMARY KEY,
    nome            VARCHAR(50)  NOT NULL,
    cognome         VARCHAR(50)  NOT NULL,
    specializzazione VARCHAR(80) NOT NULL
);

CREATE TABLE PAZIENTI (
    id_paziente     INT          PRIMARY KEY,
    nome            VARCHAR(50)  NOT NULL,
    cognome         VARCHAR(50)  NOT NULL,
    data_nascita    DATE         NOT NULL,
    citta           VARCHAR(50)  NOT NULL
);

CREATE TABLE REPARTI (
    id_reparto      INT          PRIMARY KEY,
    nome_reparto    VARCHAR(80)  NOT NULL,
    piano           INT          NOT NULL,
    id_medico       INT          NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES MEDICI(id_medico)
);

CREATE TABLE RICOVERI (
    id_paziente     INT  NOT NULL,
    id_reparto      INT  NOT NULL,
    data_ricovero   DATE NOT NULL,
    PRIMARY KEY (id_paziente, id_reparto),
    FOREIGN KEY (id_paziente) REFERENCES PAZIENTI(id_paziente),
    FOREIGN KEY (id_reparto)  REFERENCES REPARTI(id_reparto)
);

CREATE TABLE VISITE (
    id_paziente     INT  NOT NULL,
    id_medico       INT  NOT NULL,
    voto            INT  NOT NULL CHECK (voto BETWEEN 1 AND 10),
    data_visita     DATE NOT NULL,
    PRIMARY KEY (id_paziente, id_medico, data_visita),
    FOREIGN KEY (id_paziente) REFERENCES PAZIENTI(id_paziente),
    FOREIGN KEY (id_medico)   REFERENCES MEDICI(id_medico)
);

CREATE TABLE SALE (
    id_sala     INT          PRIMARY KEY,
    edificio    VARCHAR(50)  NOT NULL,
    capienza    INT          NOT NULL CHECK (capienza > 0)
);

-- ------------------------------------------------------------
--  DML - Inserimento dati
-- ------------------------------------------------------------

-- MEDICI (20 righe)
INSERT INTO MEDICI VALUES (1,  'Luca',      'Ferrari',    'Cardiologia');
INSERT INTO MEDICI VALUES (2,  'Anna',      'Ricci',      'Neurologia');
INSERT INTO MEDICI VALUES (3,  'Marco',     'Esposito',   'Ortopedia');
INSERT INTO MEDICI VALUES (4,  'Sara',      'Bianchi',    'Pediatria');
INSERT INTO MEDICI VALUES (5,  'Giovanni',  'Romano',     'Oncologia');
INSERT INTO MEDICI VALUES (6,  'Chiara',    'Colombo',    'Dermatologia');
INSERT INTO MEDICI VALUES (7,  'Paolo',     'Greco',      'Urologia');
INSERT INTO MEDICI VALUES (8,  'Elena',     'Mancini',    'Ginecologia');
INSERT INTO MEDICI VALUES (9,  'Roberto',   'Conti',      'Endocrinologia');
INSERT INTO MEDICI VALUES (10, 'Federica',  'Gallo',      'Reumatologia');
INSERT INTO MEDICI VALUES (11, 'Stefano',   'Marini',     'Pneumologia');
INSERT INTO MEDICI VALUES (12, 'Valentina', 'Costa',      'Gastroenterologia');
INSERT INTO MEDICI VALUES (13, 'Antonio',   'Fontana',    'Nefrologia');
INSERT INTO MEDICI VALUES (14, 'Giulia',    'Serra',      'Ematologia');
INSERT INTO MEDICI VALUES (15, 'Davide',    'Moretti',    'Chirurgia Generale');
INSERT INTO MEDICI VALUES (16, 'Alessia',   'Barbieri',   'Anestesiologia');
INSERT INTO MEDICI VALUES (17, 'Matteo',    'Lombardi',   'Radiologia');
INSERT INTO MEDICI VALUES (18, 'Laura',     'Gentile',    'Psichiatria');
INSERT INTO MEDICI VALUES (19, 'Fabio',     'Ferrara',    'Geriatria');
INSERT INTO MEDICI VALUES (20, 'Monica',    'De Luca',    'Medicina Interna');

-- PAZIENTI (20 righe)
INSERT INTO PAZIENTI VALUES (1,  'Mario',     'Rossi',      '1980-03-15', 'Roma');
INSERT INTO PAZIENTI VALUES (2,  'Lucia',     'Verdi',      '1992-07-22', 'Milano');
INSERT INTO PAZIENTI VALUES (3,  'Giuseppe',  'Neri',       '1975-11-08', 'Napoli');
INSERT INTO PAZIENTI VALUES (4,  'Francesca', 'Bruno',      '2001-01-30', 'Torino');
INSERT INTO PAZIENTI VALUES (5,  'Andrea',    'Russo',      '1968-05-14', 'Roma');
INSERT INTO PAZIENTI VALUES (6,  'Silvia',    'Marino',     '1990-09-03', 'Bologna');
INSERT INTO PAZIENTI VALUES (7,  'Luca',      'Gatti',      '1983-12-19', 'Firenze');
INSERT INTO PAZIENTI VALUES (8,  'Maria',     'Pellegrini', '1955-04-27', 'Roma');
INSERT INTO PAZIENTI VALUES (9,  'Daniele',   'Caruso',     '1999-08-11', 'Palermo');
INSERT INTO PAZIENTI VALUES (10, 'Elisa',     'Fiore',      '1988-02-06', 'Genova');
INSERT INTO PAZIENTI VALUES (11, 'Claudio',   'Santoro',    '1971-06-25', 'Milano');
INSERT INTO PAZIENTI VALUES (12, 'Patrizia',  'Longo',      '1963-10-17', 'Venezia');
INSERT INTO PAZIENTI VALUES (13, 'Simone',    'Marini',     '2003-03-09', 'Bari');
INSERT INTO PAZIENTI VALUES (14, 'Roberta',   'Amato',      '1977-07-31', 'Catania');
INSERT INTO PAZIENTI VALUES (15, 'Emilio',    'Valentini',  '1950-01-12', 'Roma');
INSERT INTO PAZIENTI VALUES (16, 'Cristina',  'Vitale',     '1995-11-28', 'Bologna');
INSERT INTO PAZIENTI VALUES (17, 'Nicola',    'Palumbo',    '1986-04-04', 'Napoli');
INSERT INTO PAZIENTI VALUES (18, 'Teresa',    'De Rosa',    '1960-08-20', 'Torino');
INSERT INTO PAZIENTI VALUES (19, 'Alessandro','Monti',      '2000-05-16', 'Firenze');
INSERT INTO PAZIENTI VALUES (20, 'Giovanna',  'Fabbri',     '1943-12-01', 'Milano');

-- REPARTI (20 righe)
INSERT INTO REPARTI VALUES (1,  'Cardiologia',          1,  1);
INSERT INTO REPARTI VALUES (2,  'Neurologia',           2,  2);
INSERT INTO REPARTI VALUES (3,  'Ortopedia',            3,  3);
INSERT INTO REPARTI VALUES (4,  'Pediatria',            1,  4);
INSERT INTO REPARTI VALUES (5,  'Oncologia',            4,  5);
INSERT INTO REPARTI VALUES (6,  'Dermatologia',         2,  6);
INSERT INTO REPARTI VALUES (7,  'Urologia',             3,  7);
INSERT INTO REPARTI VALUES (8,  'Ginecologia',          2,  8);
INSERT INTO REPARTI VALUES (9,  'Endocrinologia',       4,  9);
INSERT INTO REPARTI VALUES (10, 'Reumatologia',         3, 10);
INSERT INTO REPARTI VALUES (11, 'Pneumologia',          1, 11);
INSERT INTO REPARTI VALUES (12, 'Gastroenterologia',    2, 12);
INSERT INTO REPARTI VALUES (13, 'Nefrologia',           4, 13);
INSERT INTO REPARTI VALUES (14, 'Ematologia',           3, 14);
INSERT INTO REPARTI VALUES (15, 'Chirurgia Generale',   5, 15);
INSERT INTO REPARTI VALUES (16, 'Anestesiologia',       5, 16);
INSERT INTO REPARTI VALUES (17, 'Radiologia',           1, 17);
INSERT INTO REPARTI VALUES (18, 'Psichiatria',          4, 18);
INSERT INTO REPARTI VALUES (19, 'Geriatria',            2, 19);
INSERT INTO REPARTI VALUES (20, 'Medicina Interna',     3, 20);

-- RICOVERI (20 righe)
INSERT INTO RICOVERI VALUES (1,  1,  '2024-01-10');
INSERT INTO RICOVERI VALUES (2,  3,  '2024-01-15');
INSERT INTO RICOVERI VALUES (3,  2,  '2024-02-03');
INSERT INTO RICOVERI VALUES (4,  4,  '2024-02-20');
INSERT INTO RICOVERI VALUES (5,  1,  '2024-03-05');
INSERT INTO RICOVERI VALUES (6,  11, '2024-03-18');
INSERT INTO RICOVERI VALUES (7,  7,  '2024-04-01');
INSERT INTO RICOVERI VALUES (8,  19, '2024-04-14');
INSERT INTO RICOVERI VALUES (9,  9,  '2024-05-07');
INSERT INTO RICOVERI VALUES (10, 6,  '2024-05-22');
INSERT INTO RICOVERI VALUES (11, 5,  '2024-06-10');
INSERT INTO RICOVERI VALUES (12, 12, '2024-06-25');
INSERT INTO RICOVERI VALUES (13, 15, '2024-07-03');
INSERT INTO RICOVERI VALUES (14, 8,  '2024-07-19');
INSERT INTO RICOVERI VALUES (15, 20, '2024-08-01');
INSERT INTO RICOVERI VALUES (16, 13, '2024-08-15');
INSERT INTO RICOVERI VALUES (17, 3,  '2024-09-02');
INSERT INTO RICOVERI VALUES (18, 14, '2024-09-20');
INSERT INTO RICOVERI VALUES (19, 10, '2024-10-08');
INSERT INTO RICOVERI VALUES (20, 2,  '2024-10-25');

-- VISITE (20 righe)
INSERT INTO VISITE VALUES (1,  1,  8, '2024-01-11');
INSERT INTO VISITE VALUES (2,  3,  7, '2024-01-16');
INSERT INTO VISITE VALUES (3,  2,  9, '2024-02-04');
INSERT INTO VISITE VALUES (4,  4,  6, '2024-02-21');
INSERT INTO VISITE VALUES (5,  1,  8, '2024-03-06');
INSERT INTO VISITE VALUES (6,  11, 7, '2024-03-19');
INSERT INTO VISITE VALUES (7,  7,  5, '2024-04-02');
INSERT INTO VISITE VALUES (8,  19, 9, '2024-04-15');
INSERT INTO VISITE VALUES (9,  9,  8, '2024-05-08');
INSERT INTO VISITE VALUES (10, 6,  6, '2024-05-23');
INSERT INTO VISITE VALUES (11, 5, 10, '2024-06-11');
INSERT INTO VISITE VALUES (12, 12, 7, '2024-06-26');
INSERT INTO VISITE VALUES (13, 15, 8, '2024-07-04');
INSERT INTO VISITE VALUES (1,  2,  9, '2024-07-20');
INSERT INTO VISITE VALUES (3,  5,  7, '2024-08-02');
INSERT INTO VISITE VALUES (5,  3,  8, '2024-08-16');
INSERT INTO VISITE VALUES (7,  1,  6, '2024-09-03');
INSERT INTO VISITE VALUES (9,  4,  9, '2024-09-21');
INSERT INTO VISITE VALUES (11, 2,  7, '2024-10-09');
INSERT INTO VISITE VALUES (13, 6,  8, '2024-10-26');

-- SALE (20 righe)
INSERT INTO SALE VALUES (1,  'Edificio A', 4);
INSERT INTO SALE VALUES (2,  'Edificio A', 6);
INSERT INTO SALE VALUES (3,  'Edificio A', 2);
INSERT INTO SALE VALUES (4,  'Edificio B', 8);
INSERT INTO SALE VALUES (5,  'Edificio B', 4);
INSERT INTO SALE VALUES (6,  'Edificio B', 6);
INSERT INTO SALE VALUES (7,  'Edificio C', 10);
INSERT INTO SALE VALUES (8,  'Edificio C', 4);
INSERT INTO SALE VALUES (9,  'Edificio C', 6);
INSERT INTO SALE VALUES (10, 'Edificio D', 8);
INSERT INTO SALE VALUES (11, 'Edificio D', 4);
INSERT INTO SALE VALUES (12, 'Edificio D', 2);
INSERT INTO SALE VALUES (13, 'Edificio E', 6);
INSERT INTO SALE VALUES (14, 'Edificio E', 8);
INSERT INTO SALE VALUES (15, 'Edificio E', 4);
INSERT INTO SALE VALUES (16, 'Edificio F', 12);
INSERT INTO SALE VALUES (17, 'Edificio F', 6);
INSERT INTO SALE VALUES (18, 'Edificio F', 4);
INSERT INTO SALE VALUES (19, 'Edificio G', 8);
INSERT INTO SALE VALUES (20, 'Edificio G', 6);
