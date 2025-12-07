# Presentazione Filiera 4+2 Informatica - IIS Fermi Sacconi CPIA

## Descrizione
Presentazione LaTeX Beamer di 14 slide sulla filiera formativa tecnologico-professionale 4+2 
per l'indirizzo Informatica e Telecomunicazioni con curvatura in Intelligenza Artificiale e Cybersecurity.

## Struttura della presentazione

1. **Slide titolo** - Introduzione al progetto
2. **Monte ore** - Confronto quinquennale vs quadriennale
3. **Distribuzione 528 ore** - Dettaglio ripartizione su 4 anni
4. **Assegnazione ore** - Modalità di utilizzo per anno
5. **Discipline di base** - Redistribuzione ore vincolate
6. **Compresenze e potenziamento** - Ore aggiuntive per anno
7. **Offerta formativa integrata** - Percorso completo 4+2
8. **Partner strategici** - Rete territoriale
9. **Vantaggi** - Benefici della filiera
10. **Metodologie didattiche** - Approcci innovativi
11. **Profili professionali** - Sbocchi dopo ITS
12. **Monitoraggio** - Sistema di valutazione
13. **Opportunità e adempimenti** - Impegni della rete
14. **Conclusioni e contatti** - Informazioni finali

## Requisiti

Per compilare la presentazione è necessario avere installato:
- Una distribuzione LaTeX completa (TeX Live, MiKTeX, MacTeX)
- I pacchetti LaTeX utilizzati (già inclusi nelle distribuzioni standard):
  - beamer
  - babel (italiano)
  - graphicx
  - tikz
  - booktabs
  - array
  - colortbl
  - xcolor

## Loghi necessari

La presentazione richiede due file di immagine dei loghi da inserire nella stessa cartella del file .tex:

1. **logo_fermi_sacconi.png** - Logo dell'IIS Fermi Sacconi CPIA di Ascoli Piceno
2. **logo_its_turismo.png** - Logo dell'ITS Turismo Marche

### Dove trovare i loghi:
- Logo IIS Fermi Sacconi: dal sito web della scuola o dai documenti ufficiali
- Logo ITS Turismo Marche: dal sito https://www.itsturismomarchenuovetecnologie.it/

### Formato consigliato:
- Formato: PNG con sfondo trasparente
- Dimensioni: almeno 300x300 pixel
- Risoluzione: 150-300 DPI

### Se i loghi non sono disponibili:
È possibile compilare la presentazione senza i loghi commentando le righe che li richiamano:
- Riga 31: `%\logo{...}`
- Righe 48-49: `%\includegraphics...`
- Righe 405-406: `%\includegraphics...`

## Come compilare

### Metodo 1: pdflatex (consigliato)
```bash
pdflatex presentazione_filiera_informatica.tex
pdflatex presentazione_filiera_informatica.tex
```
(Eseguire due volte per aggiornare i riferimenti)

### Metodo 2: latexmk (automatico)
```bash
latexmk -pdf presentazione_filiera_informatica.tex
```

### Metodo 3: Con editor LaTeX
Aprire il file con un editor LaTeX (TeXstudio, Overleaf, TeXmaker) e cliccare su "Compila" o "Build"

## Personalizzazione

### Colori
I colori principali possono essere modificati nelle righe 15-18:
```latex
\definecolor{primaryblue}{RGB}{0,51,102}      % Blu principale
\definecolor{secondaryblue}{RGB}{51,102,153}  % Blu secondario
\definecolor{accentorange}{RGB}{255,102,0}    % Arancione accento
\definecolor{lightgray}{RGB}{240,240,240}     % Grigio chiaro
```

### Informazioni istituzionali
Modificare le righe 34-38 per aggiornare:
- Titolo e sottotitolo
- Autore e istituzione
- Data

### Contenuti
Ogni frame (slide) può essere modificato individualmente mantenendo la struttura LaTeX Beamer.

## Note sulla struttura

La presentazione è basata sulla struttura della presentazione IPSIA Benelli e adattata al contenuto 
specifico della filiera 4+2 Informatica dell'IIS Fermi Sacconi CPIA.

I contenuti sono estratti dal documento ufficiale di candidatura alla filiera formativa 
tecnologico-professionale per l'A.S. 2026/2027.

## Supporto

Per problemi di compilazione LaTeX:
- Verificare che tutti i pacchetti siano installati
- Consultare i log di errore (.log file)
- Verificare che i file dei loghi siano nella cartella corretta

Per modifiche ai contenuti:
- Consultare la documentazione di Beamer: https://ctan.org/pkg/beamer
- Esempi di slide Beamer: https://www.overleaf.com/learn/latex/Beamer

## Autore
Presentazione creata per l'IIS Fermi Sacconi CPIA di Ascoli Piceno
Dicembre 2025
