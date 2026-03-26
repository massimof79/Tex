PARTE 1
1)
SELECT nome, cognome, citta FROM `pazienti` WHERE data_nascita>"1980-00-00" 
ORDER BY data_nascita DESC
2)
SELECT nome_reparto, piano, COUNT(ricoveri.id_paziente)
FROM `reparti` JOIN ricoveri ON reparti.id_reparto = ricoveri.id_reparto
WHERE piano IN (2,3)
GROUP BY (reparti.nome_reparto);
3)
SELECT nome, cognome, visite.voto
FROM `pazienti` JOIN visite ON pazienti.id_paziente = visite.id_paziente
WHERE citta IN ("Roma","Milano") AND visite.voto>7
GROUP BY pazienti.id_paziente;
4)
SELECT * FROM `pazienti`
ORDER BY pazienti.cognome, pazienti.nome;
5)
SELECT * FROM `reparti` 
JOIN medici ON reparti.id_medico = medici.id_medico
ORDER BY medici.nome;
6)
SELECT * FROM `pazienti` 
RIGHT JOIN visite ON pazienti.id_paziente = visite.id_paziente;
7)
SELECT nome, cognome, visite.voto
FROM `pazienti` JOIN visite ON pazienti.id_paziente = visite.id_paziente
WHERE citta IN ("Roma","Milano") AND visite.voto>=8
GROUP BY pazienti.id_paziente;
8)
SELECT reparti.nome_reparto, AVG(visite.voto)AS "MediaVoti"
FROM `reparti` JOIN visite ON reparti.id_medico = visite.id_medico
GROUP BY reparti.nome_reparto;
9)
SELECT pazienti.nome, pazienti.cognome, COUNT(visite.id_paziente) AS "NumVis" 
FROM `pazienti` JOIN visite ON pazienti.id_paziente = visite.id_paziente
WHERE "NumVis" > 2;
10)
SELECT medici.nome,medici.cognome, COUNT(reparti.id_medico) AS "NumReparti" 
FROM `medici` JOIN reparti ON medici.id_medico = reparti.id_medico
WHERE "NumReparti">1
11)
SELECT reparti.nome_reparto FROM `reparti` LEFT JOIN visite ON reparti.id_medico = visite.id_medico
WHERE visite.id_paziente IS NULL;
12)
SELECT t.nome, t.cognome, t.MediaVoto FROM (
SELECT pazienti.nome as nome, pazienti.cognome as cognome, AVG(visite.voto) AS "MediaVoto" FROM pazienti JOIN visite ON pazienti.id_paziente = visite.id_paziente
GROUP BY visite.id_paziente ) as t
order by t.MediaVoto desc
LIMIT 1;



PARTE 2

INSERT INTO `pazienti`(`nome`, `cognome`, `data_nascita`, `citta`) VALUES ('Mario','Rossi','2000-03-15','Bologna')

PARTE 3

UPDATE `reparti` SET `piano`='[3]' WHERE nome_reparto = "Cardiologia";

PARTE 4

CREATE TABLE sale(
    id_sala INT PRIMARY KEY AUTO_INCREMENT,
    edificio varchar(50) NOT NULL,
    capienza INT NOT NULL
    )
    
CREATE TABLE interventi(
    id_intervento INT PRIMARY KEY AUTO_INCREMENT,
    descrizione varchar(50) NOT NULL,
    data_intervento DATE NOT NULL,
    id_sala INT,
    FOREIGN KEY id_sala REFERENCES sale(id_sala),
    id_medico INT,
    FOREIGN KEY id_medico REFERENCES medici(id_medico)
    )

