1)select pazienti.nome, pazienti.cognome, pazienti.citta, pazienti.data_nascita FROM pazienti
where pazienti.data_nascita > '1980-01-01'
ORDER by pazienti.data_nascita DESC;


2)select reparti.nome_reparto, reparti.piano, count(ricoveri.id_paziente) as Num_Tot_Paz from reparti join ricoveri on reparti.id_reparto =ricoveri.id_reparto 
Where reparti.piano IN (2,3)
group by nome_reparto,piano

3)SELECT DISTINCT pazienti.nome, pazienti.cognome, visite.voto FROM pazienti JOIN visite ON pazienti.id_paziente = visite.id_paziente WHERE pazienti.citta IN ('Roma', 'Milano') AND visite.voto > 7;


4)SELECT pazienti.cognome, pazienti.nome from pazienti 
Order BY pazienti.cognome, pazienti.nome


5)SELECT reparti.nome_reparto, medici.nome, medici.cognome from reparti join medici on reparti.id_medico = medici.id_medico

6)SELECT pazienti.nome, pazienti.cognome from pazienti join visite on pazienti.id_paziente = visite.id_paziente
Where visite.voto is not null 


7)SELECT pazienti.nome, pazienti.cognome, visite.voto from pazienti join visite on pazienti.id_paziente = visite.id_paziente
Where visite.voto >=8


8)select reparti.nome_reparto, round(avg(visite.voto),1) AS media from reparti join medici on reparti.id_medico = medici.id_medico join visite on medici.id_medico= visite.id_medico GROUP by reparti.id_reparto


9)SELECT pazienti.nome,pazienti.cognome, count(visite.voto) As Num_visite from pazienti join visite on pazienti.id_paziente = visite.id_paziente 
GROUP by pazienti.nome,pazienti.cognome having Num_visite > 2

10)SELECT medici.nome,medici.cognome, count(reparti.nome_reparto) as Num_Rep from medici join reparti on medici.id_medico= reparti.id_reparto
GROUP BY medici.nome,medici.cognome HAVING Num_Rep >1

11)SELECT reparti.nome_reparto, visite.voto from reparti join medici on reparti.id_medico = medici.id_medico left join visite on medici.id_medico = visite.id_medico where visite.voto is null

12)select pazienti.nome,pazienti.cognome, avg(visite.voto) AS Media_Voto from pazienti join visite on pazienti.id_paziente= visite.id_paziente GROUP By pazienti.id_paziente, pazienti.nome, pazienti.cognome
ORDER by Media_Voto desc

13)select pazienti.nome, pazienti.cognome, reparti.nome_reparto,ricoveri.data_ricovero
from pazienti join ricoveri on pazienti.id_paziente= ricoveri.id_paziente join reparti on ricoveri.id_reparto = reparti.id_reparto ORDER by pazienti.cognome,pazienti.nome

14






PARTE 2 INSERT INTO pazienti (nome, cognome , data_nascita, citta)
VALUES ("Mario", "Rossi", "2000-03-15", "Bologna")

PARTE 3: UPDATE reparti SET reparti.piano = 3 WHERE reparti.nome_reparto = 'cardiologia'
