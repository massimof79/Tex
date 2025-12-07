# Guida ai Loghi per la Presentazione

## Loghi richiesti

La presentazione richiede due file di immagine:

### 1. Logo IIS Fermi Sacconi CPIA
**Nome file:** `logo_fermi_sacconi.png`

**Dove trovarlo:**
- Sito web della scuola: https://www.iisfermi.edu.it/
- Documenti ufficiali dell'istituto
- Carta intestata della scuola
- Registro elettronico
- Dalla segreteria didattica

**Caratteristiche consigliate:**
- Formato: PNG con sfondo trasparente
- Dimensioni minime: 300x300 pixel
- Risoluzione: 150-300 DPI
- Qualità: Alta definizione per la stampa

### 2. Logo ITS Turismo Marche
**Nome file:** `logo_its_turismo.png`

**Dove trovarlo:**
- Sito ufficiale: https://www.itsturismomarchenuovetecnologie.it/
- Area download del sito
- Materiale promozionale dell'ITS
- Contattare l'ufficio comunicazione dell'ITS

**Caratteristiche consigliate:**
- Formato: PNG con sfondo trasparente
- Dimensioni minime: 300x300 pixel
- Risoluzione: 150-300 DPI
- Qualità: Alta definizione per la stampa

## Come inserire i loghi

### Metodo 1: Posizionamento automatico
1. Salvare i due file PNG con i nomi esatti:
   - `logo_fermi_sacconi.png`
   - `logo_its_turismo.png`
2. Posizionarli nella stessa cartella del file `presentazione_filiera_informatica.tex`
3. Compilare la presentazione con lo script `compila_presentazione.sh` o con pdflatex

### Metodo 2: Nomi file personalizzati
Se i loghi hanno nomi diversi, modificare il file .tex:
- Cercare tutte le occorrenze di `logo_fermi_sacconi.png` e sostituire con il nome corretto
- Cercare tutte le occorrenze di `logo_its_turismo.png` e sostituire con il nome corretto

Le righe da modificare sono:
- Riga 31 (logo nel footer)
- Righe 48-49 (logo nella slide titolo)
- Righe 405-406 (logo nella slide finale)

## Preparazione dei loghi

### Da file ad alta risoluzione
Se hai i loghi in formato vettoriale (SVG, EPS, AI) o PDF:
```bash
# Conversione da SVG a PNG
inkscape logo.svg --export-png=logo.png --export-dpi=300 --export-width=600

# Conversione da PDF a PNG
pdftoppm -png -r 300 logo.pdf logo
mv logo-1.png logo.png
```

### Rimozione sfondo bianco
Se il logo ha uno sfondo bianco invece che trasparente:
```bash
# Con ImageMagick
convert logo.png -fuzz 10% -transparent white logo_trasparente.png

# Con GIMP (metodo manuale)
1. Apri il logo in GIMP
2. Aggiungi canale alfa: Layer -> Transparency -> Add Alpha Channel
3. Seleziona lo sfondo bianco: Select -> By Color
4. Elimina: Edit -> Clear o tasto Canc
5. Esporta come PNG
```

### Ridimensionamento ottimale
```bash
# Con ImageMagick - mantiene proporzioni
convert logo.png -resize 600x600 logo_ridimensionato.png

# Con GIMP
1. Image -> Scale Image
2. Imposta larghezza o altezza a 600 pixel
3. Mantieni proporzioni attive
4. Esporta come PNG
```

## Compilazione senza loghi

Se non hai ancora i loghi, puoi comunque compilare la presentazione:

### Opzione 1: Commenta le righe dei loghi
Apri `presentazione_filiera_informatica.tex` e aggiungi `%` all'inizio di queste righe:

```latex
% Riga 31
%\logo{\includegraphics[height=0.6cm]{logo_fermi_sacconi.png}\hspace{0.3cm}\includegraphics[height=0.6cm]{logo_its_turismo.png}}

% Righe 48-49 (slide titolo)
%\includegraphics[height=1.5cm]{logo_fermi_sacconi.png}\hspace{1cm}
%\includegraphics[height=1.5cm]{logo_its_turismo.png}

% Righe 405-406 (slide finale)
%\includegraphics[height=1.2cm]{logo_fermi_sacconi.png}\hspace{1.5cm}
%\includegraphics[height=1.2cm]{logo_its_turismo.png}
```

### Opzione 2: Crea loghi placeholder
Crea due file PNG temporanei con scritte "LOGO FERMI SACCONI" e "LOGO ITS TURISMO":

```bash
# Con ImageMagick
convert -size 600x600 xc:white -pointsize 40 -fill black \
  -gravity center -annotate +0+0 "IIS\nFERMI SACCONI\nCPIA" \
  logo_fermi_sacconi.png

convert -size 600x600 xc:white -pointsize 40 -fill black \
  -gravity center -annotate +0+0 "ITS\nTURISMO\nMARCHE" \
  logo_its_turismo.png
```

## Contatti per assistenza loghi

### IIS Fermi Sacconi CPIA
- Email: apis01100a@istruzione.it
- PEC: apis01100a@pec.istruzione.it
- Tel: (contattare la segreteria per il numero)

### ITS Turismo Marche
- Sito: https://www.itsturismomarchenuovetecnologie.it/
- Contatti disponibili sul sito web

## Verifica qualità loghi

Dopo aver inserito i loghi e compilato la presentazione, verifica:

✓ I loghi sono nitidi e non pixelati
✓ Lo sfondo è trasparente o si integra bene
✓ Le dimensioni sono proporzionate
✓ I colori sono fedeli agli originali
✓ I loghi sono visibili in proiezione

Se i loghi appaiono di bassa qualità, richiedi versioni ad alta risoluzione agli uffici competenti.
