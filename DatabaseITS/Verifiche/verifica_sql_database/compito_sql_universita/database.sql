
SET NAMES utf8mb4;

DROP TABLE IF EXISTS ISCRIZIONE;
DROP TABLE IF EXISTS AULA;
DROP TABLE IF EXISTS CORSO;
DROP TABLE IF EXISTS DOCENTE;
DROP TABLE IF EXISTS STUDENTE;

CREATE TABLE STUDENTE(
idStudente INT PRIMARY KEY,
nome VARCHAR(50),
cognome VARCHAR(50),
citta VARCHAR(50),
annoIscrizione INT
);

CREATE TABLE DOCENTE(
idDocente INT PRIMARY KEY,
nome VARCHAR(50),
cognome VARCHAR(50),
dipartimento VARCHAR(50)
);

CREATE TABLE CORSO(
idCorso INT PRIMARY KEY,
nomeCorso VARCHAR(100),
crediti INT,
idDocente INT,
FOREIGN KEY(idDocente) REFERENCES DOCENTE(idDocente)
);

CREATE TABLE AULA(
idAula INT PRIMARY KEY,
edificio VARCHAR(50),
capienza INT
);

CREATE TABLE ISCRIZIONE(
idIscrizione INT PRIMARY KEY,
idStudente INT,
idCorso INT,
voto INT,
dataEsame DATE,
FOREIGN KEY(idStudente) REFERENCES STUDENTE(idStudente),
FOREIGN KEY(idCorso) REFERENCES CORSO(idCorso)
);
INSERT INTO STUDENTE VALUES
(1,'Nome1','Cognome1','Napoli',2020),
(2,'Nome2','Cognome2','Roma',2021),
(3,'Nome3','Cognome3','Torino',2022),
(4,'Nome4','Cognome4','Torino',2023),
(5,'Nome5','Cognome5','Torino',2019),
(6,'Nome6','Cognome6','Napoli',2020),
(7,'Nome7','Cognome7','Napoli',2021),
(8,'Nome8','Cognome8','Roma',2022),
(9,'Nome9','Cognome9','Napoli',2023),
(10,'Nome10','Cognome10','Torino',2019),
(11,'Nome11','Cognome11','Bologna',2020),
(12,'Nome12','Cognome12','Napoli',2021),
(13,'Nome13','Cognome13','Milano',2022),
(14,'Nome14','Cognome14','Torino',2023),
(15,'Nome15','Cognome15','Milano',2019),
(16,'Nome16','Cognome16','Roma',2020),
(17,'Nome17','Cognome17','Milano',2021),
(18,'Nome18','Cognome18','Milano',2022),
(19,'Nome19','Cognome19','Roma',2023),
(20,'Nome20','Cognome20','Milano',2019);

INSERT INTO DOCENTE VALUES
(1,'DocNome1','DocCog1','Informatica'),
(2,'DocNome2','DocCog2','Matematica'),
(3,'DocNome3','DocCog3','Informatica'),
(4,'DocNome4','DocCog4','Informatica'),
(5,'DocNome5','DocCog5','Matematica'),
(6,'DocNome6','DocCog6','Informatica'),
(7,'DocNome7','DocCog7','Fisica'),
(8,'DocNome8','DocCog8','Informatica'),
(9,'DocNome9','DocCog9','Informatica'),
(10,'DocNome10','DocCog10','Informatica'),
(11,'DocNome11','DocCog11','Matematica'),
(12,'DocNome12','DocCog12','Fisica'),
(13,'DocNome13','DocCog13','Informatica'),
(14,'DocNome14','DocCog14','Informatica'),
(15,'DocNome15','DocCog15','Matematica'),
(16,'DocNome16','DocCog16','Informatica'),
(17,'DocNome17','DocCog17','Matematica'),
(18,'DocNome18','DocCog18','Matematica'),
(19,'DocNome19','DocCog19','Matematica'),
(20,'DocNome20','DocCog20','Matematica');

INSERT INTO CORSO VALUES
(1,'Corso1',12,1),
(2,'Corso2',12,14),
(3,'Corso3',12,14),
(4,'Corso4',6,5),
(5,'Corso5',6,1),
(6,'Corso6',12,7),
(7,'Corso7',12,5),
(8,'Corso8',6,13),
(9,'Corso9',9,7),
(10,'Corso10',6,17),
(11,'Corso11',6,15),
(12,'Corso12',9,17),
(13,'Corso13',9,13),
(14,'Corso14',9,12),
(15,'Corso15',12,1),
(16,'Corso16',12,14),
(17,'Corso17',9,19),
(18,'Corso18',9,4),
(19,'Corso19',9,13),
(20,'Corso20',6,16);

INSERT INTO AULA VALUES
(1,'Edificio1',146),
(2,'Edificio2',70),
(3,'Edificio3',95),
(4,'Edificio4',54),
(5,'Edificio5',117),
(6,'Edificio6',118),
(7,'Edificio7',47),
(8,'Edificio8',127),
(9,'Edificio9',95),
(10,'Edificio10',148),
(11,'Edificio11',55),
(12,'Edificio12',110),
(13,'Edificio13',121),
(14,'Edificio14',142),
(15,'Edificio15',109),
(16,'Edificio16',88),
(17,'Edificio17',60),
(18,'Edificio18',39),
(19,'Edificio19',33),
(20,'Edificio20',132);

INSERT INTO ISCRIZIONE VALUES
(1,15,4,24,'2025-09-12'),
(2,15,17,28,'2025-06-24'),
(3,1,16,30,'2025-06-06'),
(4,5,19,22,'2025-08-15'),
(5,4,10,30,'2025-10-25'),
(6,20,2,28,'2025-08-21'),
(7,13,16,22,'2025-05-01'),
(8,20,7,26,'2025-09-13'),
(9,3,4,30,'2025-01-01'),
(10,7,6,26,'2025-01-05'),
(11,12,20,30,'2025-02-15'),
(12,11,10,22,'2025-01-18'),
(13,11,16,18,'2025-09-11'),
(14,16,17,26,'2025-03-20'),
(15,12,7,28,'2025-11-15'),
(16,11,12,18,'2025-02-05'),
(17,14,20,18,'2025-05-12'),
(18,4,1,22,'2025-11-14'),
(19,15,20,22,'2025-05-12'),
(20,19,2,26,'2025-03-20');

