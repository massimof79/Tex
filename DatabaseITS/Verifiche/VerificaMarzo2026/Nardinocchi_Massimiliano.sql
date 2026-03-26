1-SELECT pazienti.nome, pazienti.cognome, pazienti.citta
FROM pazienti
WHERE pazienti.data_nascita  > '1980-12-31'
ORDER BY pazienti.data_nascita DESC;

2-SELECT reparti.nome_reparto, reparti.piano,
COUNT(ricoveri.id_paziente)
FROM reparti
JOIN ricoveri on reparti.id_reparto = ricoveri.id_reparto
WHERE reparti.piano = '2' OR reparti.piano = '3' 
GROUP BY reparti.nome_reparto;

3-SELECT pazienti.nome, pazienti.cognome
FROM pazienti
JOIN visite ON pazienti.id_paziente = visite.id_paziente
WHERE pazienti.citta = 'Roma' OR pazienti.citta = 'Milano' AND visite.voto > '7';

4-SELECT * FROM pazienti
ORDER BY pazienti.cognome, pazienti.nome;

5-SELECT reparti.nome_reparto, concat (medici.cognome, ' ' , medici.nome) AS Medico_Responsabile
FROM reparti
JOIN medici ON reparti.id_medico = medici.id_medico;

6-SELECT * FROM pazienti
JOIN visite ON pazientI.id_paziente = visite.id_paziente
GROUP BY pazienti.id_paziente;

7-SELECT DISTINCT pazienti.cognome, pazienti.nome, visite.voto
FROM pazienti
JOIN visite ON pazienti.id_paziente = visite.id_paziente
WHERE visite.voto >= '8'
GROUP BY pazienti.id_paziente;

8-SELECT reparti.nome_reparto ,round(AVG(visite.voto),1)
FROM reparti
LEFT JOIN medici on reparti.id_medico = medici.id_medico
LEFT JOIN visite on medici.id_medico = visite.id_medico
GROUP BY reparti.nome_reparto;

9-SELECT * ,
COUNT(visite.id_paziente) AS N_visite
FROM pazienti
JOIN visite ON pazientI.id_paziente = visite.id_paziente
GROUP BY pazienti.id_paziente
HAVING N_visite >= '2';

10-SELECT medici.id_medico, medici.cognome, medici.nome, COUNT(reparti.id_reparto) AS N_Reparti
FROM medici 
JOIN reparti ON medici.id_medico = reparti.id_medico
GROUP BY medici.id_medico
HAVING N_Reparti > '1';

11-SELECT reparti.id_reparto, reparti.nome_reparto, COUNT(visite.id_paziente) AS No_Visite
FROM reparti
JOIN medici ON reparti.id_medico = medici.id_medico
LEFT JOIN visite ON medici.id_medico = visite.id_medico
WHERE visite.No_visite is null
GROUP BY reparti.id_reparto; ??

12-SELECT pazienti.id_paziente, pazienti.cognome, pazienti.nome, round(AVG(visite.voto),1) AS Val_Media
FROM pazienti
JOIN visite ON pazienti.id_paziente = visite.id_paziente
GROUP BY pazienti.id_paziente
ORDER BY Val_Media DESC
LIMIT 1;

14-SELECT reparti.nome_reparto, COUNT(ricoveri.id_paziente) AS N_Pazienti
FROM reparti
JOIN ricoveri ON reparti.id_reparto = ricoveri.id_reparto
GROUP BY reparti.nome_reparto;

15-SELECT reparti.nome_reparto, round(AVG(visite.voto),1) AS Val_Media
FROM reparti
JOIN visite ON reparti.id_medico = visite.id_medico
GROUP BY reparti.nome_reparto
ORDER BY Val_Media DESC
LIMIT 1;

INSERT
INSERT INTO pazienti (nome, cognome, data_nascita, citta)
VALUES ('Mario', 'Rossi', '15 Marzo 2000', 'Bologna')

UPDATE reparti SET piano = 3
WHERE nome_reparto = 'Cardiologia';


