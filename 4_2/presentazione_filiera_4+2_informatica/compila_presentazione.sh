#!/bin/bash

# Script per compilare la presentazione LaTeX Beamer
# Filiera 4+2 Informatica - IIS Fermi Sacconi CPIA

echo "================================================"
echo "Compilazione Presentazione Filiera 4+2"
echo "IIS Fermi Sacconi CPIA - Ascoli Piceno"
echo "================================================"
echo ""

# Verifica presenza file .tex
if [ ! -f "presentazione_filiera_informatica.tex" ]; then
    echo "ERRORE: File presentazione_filiera_informatica.tex non trovato!"
    exit 1
fi

# Verifica presenza loghi
LOGO1="logo_fermi_sacconi.png"
LOGO2="logo_its_turismo.png"

if [ ! -f "$LOGO1" ]; then
    echo "ATTENZIONE: Logo $LOGO1 non trovato!"
    echo "La presentazione verrà compilata ma i loghi non saranno visualizzati."
    echo "Inserire il file $LOGO1 in questa cartella e ricompilare."
    echo ""
fi

if [ ! -f "$LOGO2" ]; then
    echo "ATTENZIONE: Logo $LOGO2 non trovato!"
    echo "La presentazione verrà compilata ma i loghi non saranno visualizzati."
    echo "Inserire il file $LOGO2 in questa cartella e ricompilare."
    echo ""
fi

# Compilazione
echo "Inizio compilazione..."
echo ""

# Prima passata
pdflatex -interaction=nonstopmode presentazione_filiera_informatica.tex > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "ERRORE durante la prima compilazione!"
    echo "Controlla il file presentazione_filiera_informatica.log per dettagli."
    exit 1
fi

# Seconda passata (per riferimenti e indice)
pdflatex -interaction=nonstopmode presentazione_filiera_informatica.tex > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "ERRORE durante la seconda compilazione!"
    echo "Controlla il file presentazione_filiera_informatica.log per dettagli."
    exit 1
fi

# Pulizia file temporanei
echo "Pulizia file temporanei..."
rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb

echo ""
echo "================================================"
echo "COMPILAZIONE COMPLETATA CON SUCCESSO!"
echo "================================================"
echo ""
echo "File generato: presentazione_filiera_informatica.pdf"
echo ""

# Verifica dimensione file PDF
if [ -f "presentazione_filiera_informatica.pdf" ]; then
    SIZE=$(du -h "presentazione_filiera_informatica.pdf" | cut -f1)
    echo "Dimensione file PDF: $SIZE"
    echo ""
fi

echo "Puoi aprire il PDF con:"
echo "  - Linux: xdg-open presentazione_filiera_informatica.pdf"
echo "  - macOS: open presentazione_filiera_informatica.pdf"
echo "  - Windows: start presentazione_filiera_informatica.pdf"
echo ""
echo "================================================"
