-- =====================================================
-- DATABASE AUTONOLEGGIO
-- =====================================================

-- DROP TABLE (per rieseguire lo script senza errori)
DROP TABLE IF EXISTS PAGAMENTI;
DROP TABLE IF EXISTS MANUTENZIONI;
DROP TABLE IF EXISTS NOLEGGI;
DROP TABLE IF EXISTS AUTO;
DROP TABLE IF EXISTS CLIENTI;
DROP TABLE IF EXISTS CATEGORIE;

-- =====================================================
-- CREATE TABLE
-- =====================================================

CREATE TABLE CLIENTI(
id_cliente INT PRIMARY KEY,
nome VARCHAR(50),
cognome VARCHAR(50),
città VARCHAR(50),
patente VARCHAR(20)
);

CREATE TABLE CATEGORIE(
id_categoria INT PRIMARY KEY,
nome_categoria VARCHAR(50),
costo_giornaliero DECIMAL(10,2)
);

CREATE TABLE AUTO(
id_auto INT PRIMARY KEY,
marca VARCHAR(50),
modello VARCHAR(50),
targa VARCHAR(20),
anno INT,
id_categoria INT,
FOREIGN KEY (id_categoria) REFERENCES CATEGORIE(id_categoria)
);

CREATE TABLE NOLEGGI(
id_noleggio INT PRIMARY KEY,
id_cliente INT,
id_auto INT,
data_inizio DATE,
data_fine DATE,
FOREIGN KEY (id_cliente) REFERENCES CLIENTI(id_cliente),
FOREIGN KEY (id_auto) REFERENCES AUTO(id_auto)
);

CREATE TABLE PAGAMENTI(
id_pagamento INT PRIMARY KEY,
id_noleggio INT,
importo DECIMAL(10,2),
data_pagamento DATE,
FOREIGN KEY (id_noleggio) REFERENCES NOLEGGI(id_noleggio)
);

CREATE TABLE MANUTENZIONI(
id_manutenzione INT PRIMARY KEY,
id_auto INT,
data_manutenzione DATE,
costo DECIMAL(10,2),
FOREIGN KEY (id_auto) REFERENCES AUTO(id_auto)
);

-- =====================================================
-- INSERT CLIENTI
-- =====================================================

INSERT INTO CLIENTI VALUES
(1,'Mario','Rossi','Roma','AA111AA'),
(2,'Luca','Bianchi','Milano','BB222BB'),
(3,'Giulia','Verdi','Torino','CC333CC'),
(4,'Anna','Neri','Roma','DD444DD'),
(5,'Paolo','Gialli','Napoli','EE555EE'),
(6,'Marco','Blu','Milano','FF666FF'),
(7,'Sara','Rosa','Bologna','GG777GG'),
(8,'Davide','Ricci','Roma','HH888HH'),
(9,'Elisa','Marini','Firenze','II999II'),
(10,'Stefano','Greco','Milano','JJ111JJ'),
(11,'Chiara','Conti','Roma','KK222KK'),
(12,'Alessio','Moretti','Torino','LL333LL'),
(13,'Francesca','Barbieri','Genova','MM444MM'),
(14,'Simone','Lombardi','Roma','NN555NN'),
(15,'Valentina','Fontana','Milano','OO666OO'),
(16,'Roberto','Ferrari','Modena','PP777PP'),
(17,'Martina','Giordano','Roma','QQ888QQ'),
(18,'Andrea','Rinaldi','Bari','RR999RR'),
(19,'Federica','Leone','Milano','SS111SS'),
(20,'Giorgio','Testa','Roma','TT222TT');

-- =====================================================
-- INSERT CATEGORIE
-- =====================================================

INSERT INTO CATEGORIE VALUES
(1,'Economica',30),
(2,'Utilitaria',40),
(3,'Berlina',55),
(4,'SUV',70),
(5,'Lusso',120),
(6,'Monovolume',65),
(7,'Elettrica',80),
(8,'Ibrida',75),
(9,'Sportiva',150),
(10,'Furgone',90),
(11,'Economica Plus',35),
(12,'Utilitaria Plus',45),
(13,'Berlina Plus',60),
(14,'SUV Plus',85),
(15,'Lusso Plus',140),
(16,'Minibus',100),
(17,'Pickup',95),
(18,'Cabrio',130),
(19,'City Car',25),
(20,'Familiare',70);

-- =====================================================
-- INSERT AUTO
-- =====================================================

INSERT INTO AUTO VALUES
(1,'Fiat','Panda','AA100AA',2020,1),
(2,'Fiat','500','BB200BB',2021,19),
(3,'Volkswagen','Golf','CC300CC',2019,3),
(4,'BMW','X3','DD400DD',2022,4),
(5,'Mercedes','Classe A','EE500EE',2021,3),
(6,'Toyota','Yaris','FF600FF',2020,2),
(7,'Tesla','Model 3','GG700GG',2022,7),
(8,'Audi','A4','HH800HH',2018,3),
(9,'Renault','Clio','II900II',2019,2),
(10,'Ford','Focus','JJ100JJ',2020,3),
(11,'Peugeot','208','KK200KK',2021,2),
(12,'Dacia','Duster','LL300LL',2021,4),
(13,'Jeep','Renegade','MM400MM',2022,4),
(14,'BMW','Serie 5','NN500NN',2020,5),
(15,'Mercedes','GLA','OO600OO',2021,4),
(16,'Volkswagen','Transporter','PP700PP',2019,10),
(17,'Fiat','Doblo','QQ800QQ',2018,10),
(18,'Mazda','MX-5','RR900RR',2022,18),
(19,'Opel','Corsa','SS100SS',2020,19),
(20,'Skoda','Octavia','TT200TT',2021,20);

-- =====================================================
-- INSERT NOLEGGI
-- =====================================================

INSERT INTO NOLEGGI VALUES
(1,1,1,'2025-01-10','2025-01-15'),
(2,2,4,'2025-02-01','2025-02-05'),
(3,3,3,'2025-02-10','2025-02-12'),
(4,4,7,'2025-03-01','2025-03-10'),
(5,5,2,'2025-03-05','2025-03-08'),
(6,6,5,'2025-03-10','2025-03-15'),
(7,7,6,'2025-03-12','2025-03-14'),
(8,8,8,'2025-03-15','2025-03-20'),
(9,9,9,'2025-03-18','2025-03-22'),
(10,10,10,'2025-03-20','2025-03-25'),
(11,11,11,'2025-03-21','2025-03-23'),
(12,12,12,'2025-03-22','2025-03-28'),
(13,13,13,'2025-03-25','2025-03-30'),
(14,14,14,'2025-03-26','2025-03-29'),
(15,15,15,'2025-03-27','2025-04-02'),
(16,16,16,'2025-03-28','2025-04-01'),
(17,17,17,'2025-03-29','2025-04-03'),
(18,18,18,'2025-03-30','2025-04-05'),
(19,19,19,'2025-04-01','2025-04-04'),
(20,20,20,'2025-04-02','2025-04-06');

-- =====================================================
-- INSERT PAGAMENTI
-- =====================================================

INSERT INTO PAGAMENTI VALUES
(1,1,150,'2025-01-10'),
(2,2,350,'2025-02-01'),
(3,3,120,'2025-02-10'),
(4,4,800,'2025-03-01'),
(5,5,90,'2025-03-05'),
(6,6,300,'2025-03-10'),
(7,7,80,'2025-03-12'),
(8,8,400,'2025-03-15'),
(9,9,200,'2025-03-18'),
(10,10,250,'2025-03-20'),
(11,11,100,'2025-03-21'),
(12,12,420,'2025-03-22'),
(13,13,500,'2025-03-25'),
(14,14,600,'2025-03-26'),
(15,15,700,'2025-03-27'),
(16,16,450,'2025-03-28'),
(17,17,300,'2025-03-29'),
(18,18,650,'2025-03-30'),
(19,19,110,'2025-04-01'),
(20,20,200,'2025-04-02');

-- =====================================================
-- INSERT MANUTENZIONI
-- =====================================================

INSERT INTO MANUTENZIONI VALUES
(1,1,'2025-01-05',100),
(2,2,'2025-01-07',120),
(3,3,'2025-01-10',150),
(4,4,'2025-01-15',300),
(5,5,'2025-01-20',200),
(6,6,'2025-01-25',130),
(7,7,'2025-02-01',250),
(8,8,'2025-02-05',180),
(9,9,'2025-02-10',140),
(10,10,'2025-02-15',160),
(11,11,'2025-02-20',110),
(12,12,'2025-02-25',220),
(13,13,'2025-03-01',260),
(14,14,'2025-03-05',300),
(15,15,'2025-03-10',210),
(16,16,'2025-03-15',190),
(17,17,'2025-03-18',170),
(18,18,'2025-03-20',280),
(19,19,'2025-03-22',130),
(20,20,'2025-03-25',200);
