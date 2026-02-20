-- =========================================================
-- POPOLAMENTO DB (phpMyAdmin import) - Faker-like + Reset
-- MySQL / MariaDB (InnoDB)
-- =========================================================

SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';
SET time_zone = '+00:00';
START TRANSACTION;

-- Charset sessione (opzionale)
SET NAMES utf8mb4;

-- ---------------------------------------------------------
-- RESET (disabilita FK, svuota tabelle, riabilita FK)
-- ---------------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM disponibilita_competenze;
DELETE FROM esperienza;
DELETE FROM disponibilita;
DELETE FROM tutor_azienda;
DELETE FROM tutor_scuola;
DELETE FROM competenze;
DELETE FROM studente;
DELETE FROM azienda;

SET FOREIGN_KEY_CHECKS = 1;

-- opzionale: reset autoincrement (se ti serve)
ALTER TABLE disponibilita AUTO_INCREMENT = 1;
ALTER TABLE tutor_scuola AUTO_INCREMENT = 1;
ALTER TABLE studente AUTO_INCREMENT = 1;


-- ---------------------------------------------------------
-- AZIENDA (20)
-- ---------------------------------------------------------
INSERT INTO azienda
(p_iva, ragione_sociale, sede_legale, sede_operativa, settore_attivita, codice_dipendente_ref, email_aziendale, telefono_ref)
VALUES
('11111111111','TechLab SRL','Milano','Milano','Software','D001','info@techlab.it','02-10000001'),
('22222222222','Meccatronica SPA','Torino','Torino','Automazione','D002','info@meccatronica.it','011-1000002'),
('33333333333','GreenEnergy SRL','Bologna','Bologna','Energia','D003','info@greenenergy.it','051-1000003'),
('44444444444','DataVision SRL','Roma','Roma','AI','D004','info@datavision.it','06-10000004'),
('55555555555','NetSolutions SRL','Firenze','Firenze','Networking','D005','contatti@netsolutions.it','055-1000005'),
('66666666666','CyberSec Italia','Napoli','Napoli','Security','D006','info@cybersecitalia.it','081-1000006'),
('77777777777','SmartFactory SRL','Modena','Modena','IoT','D007','info@smartfactory.it','059-1000007'),
('88888888888','CloudHub SRL','Padova','Padova','Cloud','D008','hello@cloudhub.it','049-1000008'),
('99999999999','RoboTech SPA','Genova','Genova','Robotica','D009','info@robotech.it','010-1000009'),
('10101010101','BioMed Solutions','Pisa','Pisa','Biotech','D010','info@biomedsolutions.it','050-1000010'),
('12121212121','EduSoft SRL','Perugia','Perugia','EdTech','D011','support@edusoft.it','075-1000011'),
('13131313131','LogiTrack SRL','Verona','Verona','Logistica','D012','info@logitrack.it','045-1000012'),
('14141414141','AgriTech Lab','Parma','Parma','Agritech','D013','info@agritechlab.it','0521-100013'),
('15151515151','FinAnalytics SRL','Trieste','Trieste','Fintech','D014','info@finanalytics.it','040-1000014'),
('16161616161','GeoSystems SRL','Cagliari','Cagliari','GIS','D015','info@geosystems.it','070-1000015'),
('17171717171','MediaLab SRL','Bari','Bari','Multimedia','D016','info@medialab.it','080-1000016'),
('18181818181','QuantumIT SRL','Udine','Udine','Quantum','D017','info@quantumit.it','0432-100017'),
('19191919191','AutoDrive SPA','Ferrara','Ferrara','Automotive','D018','info@autodrive.it','0532-100018'),
('20202020202','VisionX SRL','Siena','Siena','Computer Vision','D019','info@visionx.it','0577-100019'),
('21212121212','FutureAI SRL','Trento','Trento','AI','D020','info@futureai.it','0461-100020');

-- ---------------------------------------------------------
-- TUTOR_SCUOLA (20)
-- ---------------------------------------------------------
INSERT INTO tutor_scuola
(codice_docente, cognome, nome, email_istituzionale, dipartimento_app, n_max_studenti_seguiti)
VALUES
(NULL,'Rossi','Luca','l.rossi@scuola.it','Informatica',5),
(NULL,'Bianchi','Marco','m.bianchi@scuola.it','Elettronica',6),
(NULL,'Verdi','Anna','a.verdi@scuola.it','Meccanica',4),
(NULL,'Neri','Paolo','p.neri@scuola.it','Automazione',5),
(NULL,'Gallo','Sara','s.gallo@scuola.it','Chimica',3),
(NULL,'Costa','Gianni','g.costa@scuola.it','Fisica',4),
(NULL,'Fontana','Elisa','e.fontana@scuola.it','Matematica',6),
(NULL,'Moretti','Davide','d.moretti@scuola.it','Informatica',5),
(NULL,'Greco','Marta','m.greco@scuola.it','Biologia',3),
(NULL,'Romano','Fabio','f.romano@scuola.it','Informatica',5),
(NULL,'Ferrari','Claudia','c.ferrari@scuola.it','Elettronica',4),
(NULL,'Martini','Luigi','l.martini@scuola.it','Meccanica',6),
(NULL,'Ricci','Simona','s.ricci@scuola.it','Automazione',5),
(NULL,'Marino','Andrea','a.marino@scuola.it','Chimica',4),
(NULL,'Silvestri','Paola','p.silvestri@scuola.it','Fisica',3),
(NULL,'DeLuca','Carlo','c.deluca@scuola.it','Matematica',5),
(NULL,'Rinaldi','Laura','l.rinaldi@scuola.it','Informatica',4),
(NULL,'Barbieri','Giorgio','g.barbieri@scuola.it','Biologia',3),
(NULL,'Testa','Francesca','f.testa@scuola.it','Informatica',6),
(NULL,'Serra','Antonio','a.serra@scuola.it','Elettronica',5);

-- ---------------------------------------------------------
-- TUTOR_AZIENDA (20) (1:1 su p_iva, quindi uno per azienda)
-- ---------------------------------------------------------
INSERT INTO tutor_azienda
(codice_dipendente, cognome, nome, email_aziendale, p_iva)
VALUES
('D001','Ferrari','Luca','l.ferrari@techlab.it','11111111111'),
('D002','Riva','Marco','m.riva@meccatronica.it','22222222222'),
('D003','Sala','Anna','a.sala@greenenergy.it','33333333333'),
('D004','Villa','Paolo','p.villa@datavision.it','44444444444'),
('D005','Rossi','Sara','s.rossi@netsolutions.it','55555555555'),
('D006','Bassi','Gianni','g.bassi@cybersecitalia.it','66666666666'),
('D007','Testi','Elisa','e.testi@smartfactory.it','77777777777'),
('D008','Ratti','Davide','d.ratti@cloudhub.it','88888888888'),
('D009','Pini','Marta','m.pini@robotech.it','99999999999'),
('D010','Naldi','Fabio','f.naldi@biomedsolutions.it','10101010101'),
('D011','Rizzi','Claudia','c.rizzi@edusoft.it','12121212121'),
('D012','Leoni','Luigi','l.leoni@logitrack.it','13131313131'),
('D013','Mori','Simona','s.mori@agritechlab.it','14141414141'),
('D014','Orsi','Andrea','a.orsi@finanalytics.it','15151515151'),
('D015','Ferri','Paola','p.ferri@geosystems.it','16161616161'),
('D016','Grassi','Carlo','c.grassi@medialab.it','17171717171'),
('D017','Seri','Laura','l.seri@quantumit.it','18181818181'),
('D018','Donati','Giorgio','g.donati@autodrive.it','19191919191'),
('D019','Vitali','Francesca','f.vitali@visionx.it','20202020202'),
('D020','Gatti','Antonio','a.gatti@futureai.it','21212121212');

-- ---------------------------------------------------------
-- STUDENTE (20) - CF univoci, email univoche, indirizzi realistici
-- ---------------------------------------------------------
INSERT INTO studente
(id_studente, cognome, nome, data_nascita, luogo_nascita, cf, citta, cap, via, n_civico, email_istituzionale, classe, indirizzo_studi)
VALUES
(NULL,'Rossi','Mario','2006-01-10','Pesaro','RSSMRA06A10PESR','Pesaro','61121','Via Roma','10','mario.rossi@scuola.it','5A','Informatica'),
(NULL,'Bianchi','Luca','2005-03-11','Fano','BNCLCU05C11FANO','Fano','61032','Via Milano','22','luca.bianchi@scuola.it','5A','Informatica'),
(NULL,'Verdi','Anna','2006-05-21','Urbino','VRDANN06E21URBN','Urbino','61029','Via Dante','5','anna.verdi@scuola.it','5B','Elettronica'),
(NULL,'Neri','Paolo','2005-02-15','Ancona','NRIPAO05B15ANCO','Ancona','60100','Via Po','8','paolo.neri@scuola.it','5B','Meccanica'),
(NULL,'Gallo','Sara','2006-07-19','Pesaro','GLLSRA06L19PESR','Pesaro','61121','Via Napoli','13','sara.gallo@scuola.it','5C','Automazione'),
(NULL,'Costa','Gianni','2005-09-09','Fano','CSTGNN05P09FANO','Fano','61032','Via Torino','44','gianni.costa@scuola.it','5C','Chimica'),
(NULL,'Fontana','Elisa','2006-04-01','Urbino','FNTELS06D01URBN','Urbino','61029','Via Firenze','2','elisa.fontana@scuola.it','5D','Informatica'),
(NULL,'Moretti','Davide','2005-11-12','Pesaro','MRTDVD05S12PESR','Pesaro','61121','Via Bologna','30','davide.moretti@scuola.it','5D','Informatica'),
(NULL,'Greco','Marta','2006-12-18','Fano','GRCMRT06T18FANO','Fano','61032','Via Bari','11','marta.greco@scuola.it','5E','Biologia'),
(NULL,'Romano','Fabio','2005-06-17','Ancona','RMNFBA05H17ANCO','Ancona','60100','Via Genova','6','fabio.romano@scuola.it','5E','Informatica'),
(NULL,'Ferrari','Claudia','2006-01-08','Pesaro','FRRCLD06A08PESR','Pesaro','61121','Via Rimini','19','claudia.ferrari@scuola.it','5F','Elettronica'),
(NULL,'Martini','Luigi','2005-08-22','Fano','MRTLGA05M22FANO','Fano','61032','Via Pisa','33','luigi.martini@scuola.it','5F','Meccanica'),
(NULL,'Ricci','Simona','2006-02-13','Urbino','RCCSMN06B13URBN','Urbino','61029','Via Siena','14','simona.ricci@scuola.it','5G','Automazione'),
(NULL,'Marino','Andrea','2005-10-03','Pesaro','MRNAND05R03PESR','Pesaro','61121','Via Padova','9','andrea.marino@scuola.it','5G','Chimica'),
(NULL,'Silvestri','Paola','2006-03-25','Fano','SLVPLA06C25FANO','Fano','61032','Via Venezia','17','paola.silvestri@scuola.it','5H','Fisica'),
(NULL,'DeLuca','Carlo','2005-12-30','Ancona','DLCCRL05T30ANCO','Ancona','60100','Via Torino','21','carlo.deluca@scuola.it','5H','Matematica'),
(NULL,'Rinaldi','Laura','2006-07-07','Pesaro','RNLLRA06L07PESR','Pesaro','61121','Via Napoli','12','laura.rinaldi@scuola.it','5I','Informatica'),
(NULL,'Barbieri','Giorgio','2005-05-05','Fano','BRBGRG05E05FANO','Fano','61032','Via Milano','18','giorgio.barbieri@scuola.it','5I','Biologia'),
(NULL,'Testa','Francesca','2006-06-06','Urbino','TSTFNC06H06URBN','Urbino','61029','Via Roma','7','francesca.testa@scuola.it','5L','Informatica'),
(NULL,'Serra','Antonio','2005-09-14','Pesaro','SRRNTN05P14PESR','Pesaro','61121','Via Firenze','15','antonio.serra@scuola.it','5L','Elettronica');

-- ---------------------------------------------------------
-- COMPETENZE (20)
-- ---------------------------------------------------------
INSERT INTO competenze (nome_competenza) VALUES
('Python'),
('Java'),
('SQL'),
('Cybersecurity'),
('Networking'),
('AI'),
('Machine Learning'),
('PLC'),
('CAD'),
('Robotica'),
('Cloud'),
('IoT'),
('HTML'),
('CSS'),
('JavaScript'),
('Linux'),
('Git'),
('Docker'),
('Data Analysis'),
('Computer Vision');

-- ---------------------------------------------------------
-- DISPONIBILITA (20) (codice_id autoincrement -> verranno 1..20)
-- Periodi e descrizioni più variate
-- ---------------------------------------------------------
INSERT INTO disponibilita
(codice_id, p_iva, data_inizio, data_fine, n_max_studenti_ospitabili, descrizione_attivita, indirizzo_studi_consigliato)
VALUES
(NULL,'11111111111','2025-03-03','2025-06-06',3,'Sviluppo web backend e API REST','Informatica'),
(NULL,'22222222222','2025-03-04','2025-06-07',2,'Supporto linee automatizzate e sensoristica','Meccanica'),
(NULL,'33333333333','2025-03-05','2025-06-05',4,'Monitoraggio consumi e reportistica energetica','Chimica'),
(NULL,'44444444444','2025-03-10','2025-06-10',2,'Dataset labeling e prototipazione modelli ML','Informatica'),
(NULL,'55555555555','2025-03-11','2025-06-11',3,'Cablaggio, VLAN, troubleshooting e documentazione','Informatica'),
(NULL,'66666666666','2025-03-12','2025-06-12',2,'Hardening, log analysis e sicurezza endpoint','Informatica'),
(NULL,'77777777777','2025-03-13','2025-06-13',3,'Prototipi IoT con microcontrollori e MQTT','Elettronica'),
(NULL,'88888888888','2025-03-14','2025-06-14',2,'Deploy su cloud, CI/CD di base e monitoraggio','Informatica'),
(NULL,'99999999999','2025-03-17','2025-06-17',2,'Robotica: test attuatori, calibrazione e safety','Meccanica'),
(NULL,'10101010101','2025-03-18','2025-06-18',2,'Gestione campioni e digitalizzazione schede','Chimica'),
(NULL,'12121212121','2025-03-19','2025-06-19',2,'EdTech: contenuti interattivi e analytics','Informatica'),
(NULL,'13131313131','2025-03-20','2025-06-20',3,'Logistica: tracciamento, dashboard e KPI','Informatica'),
(NULL,'14141414141','2025-03-21','2025-06-21',2,'Agritech: sensori su campo e raccolta dati','Chimica'),
(NULL,'15151515151','2025-03-24','2025-06-24',3,'Fintech: data quality e query ottimizzate','Informatica'),
(NULL,'16161616161','2025-03-25','2025-06-25',2,'GIS: geocoding e gestione layer cartografici','Informatica'),
(NULL,'17171717171','2025-03-26','2025-06-26',3,'Multimedia: editing base e gestione asset','Informatica'),
(NULL,'18181818181','2025-03-27','2025-06-27',2,'Introduzione a concetti quantum e simulazione','Informatica'),
(NULL,'19191919191','2025-03-28','2025-06-28',2,'Automotive: test diagnostici e telemetria','Meccanica'),
(NULL,'20202020202','2025-03-31','2025-06-30',2,'Computer Vision: pipeline immagini e metriche','Informatica'),
(NULL,'21212121212','2025-04-01','2025-07-01',3,'AI: prototipi e valutazione prestazioni','Informatica');

-- ---------------------------------------------------------
-- DISPONIBILITA_COMPETENZE (>=20) - tabella ponte N:M
-- (codice_id 1..20, competenze già caricate)
-- ---------------------------------------------------------
INSERT INTO disponibilita_competenze (codice_id, nome_competenza) VALUES
(1,'Python'),(1,'SQL'),(1,'Git'),(1,'Docker'),
(2,'PLC'),(2,'CAD'),
(3,'Data Analysis'),(3,'SQL'),
(4,'Machine Learning'),(4,'Python'),(4,'AI'),
(5,'Networking'),(5,'Linux'),
(6,'Cybersecurity'),(6,'Linux'),
(7,'IoT'),(7,'Python'),
(8,'Cloud'),(8,'Docker'),(8,'Git'),
(9,'Robotica'),(9,'CAD'),
(10,'Data Analysis'),
(11,'JavaScript'),(11,'HTML'),(11,'CSS'),
(12,'SQL'),(12,'Data Analysis'),
(13,'IoT'),(13,'Data Analysis'),
(14,'SQL'),(14,'Python'),
(15,'SQL'),(15,'Data Analysis'),
(16,'Python'),
(17,'Python'),
(18,'Linux'),
(19,'Computer Vision'),(19,'Python'),
(20,'AI'),(20,'Machine Learning');

-- ---------------------------------------------------------
-- ESPERIENZA (20)
-- PK: (id_studente, p_iva_azienda_ospitante)
-- FK: codice_id_disponibilita -> disponibilita(codice_id)
-- FK: codice_docente_tutor_scuola -> tutor_scuola(codice_docente) (1..20)
-- FK: codice_dipendente_tutor_azienda -> tutor_azienda(codice_dipendente)
-- ---------------------------------------------------------
INSERT INTO esperienza
(id_studente, p_iva_azienda_ospitante, codice_id_disponibilita, codice_docente_tutor_scuola, codice_dipendente_tutor_azienda,
 periodo_effettivo, n_ore_previste, n_ore_svolte, valutazione_finale, esito)
VALUES
(1,'11111111111',1,1,'D001','Marzo-Giugno',120,118,'Buono','Superato'),
(2,'22222222222',2,2,'D002','Marzo-Giugno',120,120,'Ottimo','Superato'),
(3,'33333333333',3,3,'D003','Marzo-Giugno',120,116,'Buono','Superato'),
(4,'44444444444',4,4,'D004','Marzo-Giugno',120,112,'Discreto','Superato'),
(5,'55555555555',5,5,'D005','Marzo-Giugno',120,119,'Ottimo','Superato'),
(6,'66666666666',6,6,'D006','Marzo-Giugno',120,120,'Ottimo','Superato'),
(7,'77777777777',7,7,'D007','Marzo-Giugno',120,117,'Buono','Superato'),
(8,'88888888888',8,8,'D008','Marzo-Giugno',120,114,'Discreto','Superato'),
(9,'99999999999',9,9,'D009','Marzo-Giugno',120,120,'Ottimo','Superato'),
(10,'10101010101',10,10,'D010','Marzo-Giugno',120,118,'Buono','Superato'),
(11,'12121212121',11,11,'D011','Marzo-Giugno',120,115,'Buono','Superato'),
(12,'13131313131',12,12,'D012','Marzo-Giugno',120,113,'Discreto','Superato'),
(13,'14141414141',13,13,'D013','Marzo-Giugno',120,120,'Ottimo','Superato'),
(14,'15151515151',14,14,'D014','Marzo-Giugno',120,118,'Buono','Superato'),
(15,'16161616161',15,15,'D015','Marzo-Giugno',120,119,'Ottimo','Superato'),
(16,'17171717171',16,16,'D016','Marzo-Giugno',120,117,'Buono','Superato'),
(17,'18181818181',17,17,'D017','Marzo-Giugno',120,114,'Discreto','Superato'),
(18,'19191919191',18,18,'D018','Marzo-Giugno',120,120,'Ottimo','Superato'),
(19,'20202020202',19,19,'D019','Marzo-Giugno',120,118,'Buono','Superato'),
(20,'21212121212',20,20,'D020','Aprile-Luglio',120,116,'Buono','Superato');

COMMIT;
