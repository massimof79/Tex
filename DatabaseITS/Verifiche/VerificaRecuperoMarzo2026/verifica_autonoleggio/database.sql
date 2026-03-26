
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
