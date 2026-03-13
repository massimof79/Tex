
SET NAMES utf8mb4;

DROP TABLE IF EXISTS MANUTENZIONE;
DROP TABLE IF EXISTS NOLEGGIO;
DROP TABLE IF EXISTS BICI;
DROP TABLE IF EXISTS CLIENTE;
DROP TABLE IF EXISTS STAZIONE;

CREATE TABLE CLIENTE(
idCliente INT PRIMARY KEY,
nome VARCHAR(50),
cognome VARCHAR(50),
email VARCHAR(100),
citta VARCHAR(50)
);

CREATE TABLE STAZIONE(
idStazione INT PRIMARY KEY,
nome VARCHAR(50),
citta VARCHAR(50),
numeroPosti INT
);

CREATE TABLE BICI(
idBici INT PRIMARY KEY,
modello VARCHAR(50),
tipo VARCHAR(30),
stato VARCHAR(30),
idStazione INT,
FOREIGN KEY (idStazione) REFERENCES STAZIONE(idStazione)
);

CREATE TABLE NOLEGGIO(
idNoleggio INT PRIMARY KEY,
dataInizio DATE,
dataFine DATE,
idCliente INT,
idBici INT,
FOREIGN KEY (idCliente) REFERENCES CLIENTE(idCliente),
FOREIGN KEY (idBici) REFERENCES BICI(idBici)
);

CREATE TABLE MANUTENZIONE(
idManutenzione INT PRIMARY KEY,
dataManutenzione DATE,
tipoIntervento VARCHAR(100),
idBici INT,
FOREIGN KEY (idBici) REFERENCES BICI(idBici)
);

INSERT INTO CLIENTE VALUES
(1,'Luca','Rossi','luca@email.it','Roma'),
(2,'Marco','Bianchi','marco@email.it','Milano'),
(3,'Giulia','Verdi','giulia@email.it','Torino'),
(4,'Anna','Neri','anna@email.it','Roma'),
(5,'Paolo','Gialli','paolo@email.it','Milano'),
(6,'Sara','Blu','sara@email.it','Roma'),
(7,'Davide','Riva','davide@email.it','Bologna'),
(8,'Elena','Costa','elena@email.it','Firenze'),
(9,'Matteo','Villa','matteo@email.it','Roma'),
(10,'Laura','Fontana','laura@email.it','Napoli'),
(11,'Andrea','Greco','andrea@email.it','Roma'),
(12,'Chiara','Testa','chiara@email.it','Milano'),
(13,'Simone','Sala','simone@email.it','Torino'),
(14,'Francesca','Longo','francesca@email.it','Roma'),
(15,'Giorgio','Serra','giorgio@email.it','Genova'),
(16,'Alessia','Ferri','alessia@email.it','Roma'),
(17,'Stefano','Conti','stefano@email.it','Milano'),
(18,'Valentina','Rizzo','valentina@email.it','Roma'),
(19,'Roberto','Marini','roberto@email.it','Firenze'),
(20,'Irene','Gatti','irene@email.it','Roma');

INSERT INTO STAZIONE VALUES
(1,'Centro','Roma',25),
(2,'Stazione','Roma',30),
(3,'Duomo','Milano',40),
(4,'Navigli','Milano',20),
(5,'Centro','Torino',22),
(6,'Universita','Bologna',18),
(7,'Centro','Firenze',24),
(8,'Porto','Genova',15),
(9,'Lungomare','Napoli',28),
(10,'Parco','Roma',26),
(11,'Stadio','Roma',20),
(12,'Fiera','Milano',35),
(13,'Metro','Torino',19),
(14,'Museo','Firenze',21),
(15,'Collina','Genova',17),
(16,'Nord','Roma',23),
(17,'Sud','Roma',27),
(18,'Est','Roma',16),
(19,'Ovest','Roma',18),
(20,'Campus','Bologna',22);

INSERT INTO BICI VALUES
(1,'City100','tradizionale','disponibile',1),
(2,'City200','elettrica','disponibile',1),
(3,'UrbanPro','elettrica','disponibile',2),
(4,'EcoBike','tradizionale','manutenzione',3),
(5,'VoltX','elettrica','disponibile',4),
(6,'City300','tradizionale','disponibile',5),
(7,'SpeedBike','tradizionale','disponibile',6),
(8,'EcoRide','elettrica','disponibile',7),
(9,'VoltCity','elettrica','disponibile',8),
(10,'UrbanLite','tradizionale','disponibile',9),
(11,'MetroBike','tradizionale','disponibile',10),
(12,'GreenMove','elettrica','disponibile',11),
(13,'PowerRide','elettrica','disponibile',12),
(14,'SmartBike','tradizionale','disponibile',13),
(15,'EcoCity','tradizionale','disponibile',14),
(16,'VoltRide','elettrica','disponibile',15),
(17,'UrbanRide','tradizionale','disponibile',16),
(18,'CityRide','tradizionale','disponibile',17),
(19,'E-BikePro','elettrica','disponibile',18),
(20,'GreenBike','tradizionale','disponibile',19);

INSERT INTO NOLEGGIO VALUES
(1,'2025-01-10','2025-01-10',1,1),
(2,'2025-01-11','2025-01-11',2,2),
(3,'2025-01-12','2025-01-12',3,3),
(4,'2025-01-13','2025-01-13',4,4),
(5,'2025-01-14','2025-01-14',5,5),
(6,'2025-01-15','2025-01-15',6,6),
(7,'2025-01-16','2025-01-16',7,7),
(8,'2025-01-17','2025-01-17',8,8),
(9,'2025-01-18','2025-01-18',9,9),
(10,'2025-01-19','2025-01-19',10,10),
(11,'2025-01-20','2025-01-20',11,11),
(12,'2025-01-21','2025-01-21',12,12),
(13,'2025-01-22','2025-01-22',13,13),
(14,'2025-01-23','2025-01-23',14,14),
(15,'2025-01-24','2025-01-24',15,15),
(16,'2025-01-25','2025-01-25',16,16),
(17,'2025-01-26','2025-01-26',17,17),
(18,'2025-01-27','2025-01-27',18,18),
(19,'2025-01-28','2025-01-28',19,19),
(20,'2025-01-29','2025-01-29',20,20);

INSERT INTO MANUTENZIONE VALUES
(1,'2025-02-01','controllo freni',1),
(2,'2025-02-02','sostituzione batteria',2),
(3,'2025-02-03','controllo ruote',3),
(4,'2025-02-04','controllo generale',4),
(5,'2025-02-05','sostituzione catena',5),
(6,'2025-02-06','controllo freni',6),
(7,'2025-02-07','controllo batteria',7),
(8,'2025-02-08','controllo ruote',8),
(9,'2025-02-09','manutenzione motore',9),
(10,'2025-02-10','controllo freni',10),
(11,'2025-02-11','controllo generale',11),
(12,'2025-02-12','sostituzione catena',12),
(13,'2025-02-13','controllo batteria',13),
(14,'2025-02-14','controllo ruote',14),
(15,'2025-02-15','controllo generale',15),
(16,'2025-02-16','sostituzione freni',16),
(17,'2025-02-17','controllo ruote',17),
(18,'2025-02-18','controllo generale',18),
(19,'2025-02-19','manutenzione batteria',19),
(20,'2025-02-20','controllo generale',20);
