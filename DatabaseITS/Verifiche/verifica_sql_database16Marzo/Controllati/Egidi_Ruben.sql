1) 
SELECT pazienti.nome, pazienti.cognome, pazienti.citta FROM pazienti
where pazienti.data_nascita > '1980-12-31'
order by pazienti.data_nascita DESC;

2)
SELECT reparti.nome_reparto, reparti.piano, COUNT(ricoveri.id_paziente) as Numero_pazienti from reparti
join ricoveri on reparti.id_reparto = ricoveri.id_reparto
where reparti.piano = '2' OR reparti.piano = '3'
group by reparti.nome_reparto;

3)
SELECT pazienti.nome, pazienti.cognome FROM pazienti
join visite on pazienti.id_paziente = visite.id_paziente
where pazienti.citta = 'Roma' or pazienti.citta = 'Milano' and visite.voto > '7';

4)
SELECT * FROM pazienti
order by pazienti.cognome, pazienti.nome;

5)
SELECT reparti.nome_reparto, CONCAT(medici.cognome, ' ', medici.nome) as Medico_responsabile FROM reparti
join medici on reparti.id_medico = medici.id_medico;

6)
SELECT pazienti.id_paziente, pazienti.cognome, pazienti.nome, count(visite.id_paziente) as Num_visite from pazienti
join visite on pazienti.id_paziente = visite.id_paziente
group by pazienti.id_paziente;

7) 
SELECT pazienti.id_paziente, pazienti.cognome, pazienti.nome, visite.voto from pazienti
join visite on pazienti.id_paziente = visite.id_paziente
where visite.voto >= '8'
GROUP by pazienti.id_paziente;

8) 
SELECT reparti.nome_reparto, round(avg(visite.voto), 1) as Valutazione_media from reparti
left join medici on reparti.id_medico = medici.id_medico
left join visite on medici.id_medico = visite.id_medico
group by reparti.nome_reparto;

9)
SELECT  pazienti.id_paziente, pazienti.cognome, pazienti.nome, count(visite.id_paziente) as Num_visite from pazienti
join visite on pazienti.id_paziente = visite.id_paziente
group by pazienti.id_paziente
having Num_visite >= '2';

10)
select medici.id_medico, medici.nome, medici.cognome, count(reparti.id_medico) as Num_reparti from medici
join reparti on reparti.id_medico = medici.id_medico
group by medici.id_medico
having Num_reparti > '1';

11)
select reparti.id_reparto, reparti.nome_reparto, count(visite.id_paziente) as Num_visite from reparti
join medici on reparti.id_medico = medici.id_medico
left join visite on medici.id_medico = visite.id_medico
where visite.data_visita is null
group by reparti.id_reparto;

12)
SELECT pazienti.id_paziente, pazienti.nome, pazienti.cognome, round(avg(visite.voto), 1) as Valutazione_media from pazienti
join visite on pazienti.id_paziente = visite.id_paziente
group by pazienti.id_paziente
order by Valutazione_media desc
limit 1;

13)
select reparti.nome_reparto, pazienti.id_paziente, pazienti.nome, pazienti.cognome from reparti
join ricoveri on reparti.id_reparto = ricoveri.id_reparto
left join pazienti on ricoveri.id_paziente = pazienti.id_paziente;

14)
select reparti.nome_reparto, count(ricoveri.id_paziente) as Num_pazienti from reparti
join ricoveri on reparti.id_reparto = ricoveri.id_reparto
group by reparti.nome_reparto;

15)
SELECT reparti.nome_reparto, round(avg(visite.voto), 1) as Valutazione_media from reparti
join visite on reparti.id_medico = visite.id_medico
group by reparti.nome_reparto
order by Valutazione_media desc
limit 1;
