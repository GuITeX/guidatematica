SHELL = /bin/sh

### Copyright (c) 2013 Orlando Iovino.
###
### Autore: Orlando Iovino.
###
### Descrizione: Makefile per l'installazione della classe guidatematica
###		 nell'albero personale di una distribuzione TeX Live. 
###
### Versione: v.1.0
###
### Riferimenti: [1] https://bitbucket.org/josephwright/siunitx/ (su
###		      segnalazione di Mosè Giordano)
###
### Licenza: LaTeX Project Public License.
###

.SILENT:

#
# Senza nessuna regola stampa l'help (che è la prima regola)
# 

help:
	echo ""
	echo " make cls. . . . . . crea la classe e la documentazione"
	echo " make doc. . . . . . crea la guida ausiliaria"
	echo " make installa . . . installa la classe"
	echo ""

#
# VARIABILI
#

MAIN		= guidatematica
MAIN_DOC	= $(MAIN)-doc
CLASSE 		= $(MAIN).cls
CLASSE_DOC	= $(MAIN_DOC).pdf
FIGURE		= logoguitlineare.pdf logoguittondo.pdf
STILIIDX	= $(wildcard *.ist)
ALBEROPERS	= $(shell kpsewhich -var-value TEXMFHOME)
AUSILIARI	= *.aux *.log *.out *.toc *.bbl *.blg *.idx *.ilg *.ind

# 
# REGOLE 
#

.PHONY: clean

cls: $(CLASSE)

$(CLASSE): $(MAIN).dtx
	echo "Compilazione di $< ..."
	pdflatex $< > /dev/null
	echo "... Fatto!"


doc: $(CLASSE_DOC)

$(CLASSE_DOC): $(MAIN_DOC).tex
	echo "Compilazione di $< ..."
	xelatex $< > /dev/null
	bibtex	$(MAIN_DOC) > /dev/null
	xelatex $< > /dev/null
	xelatex $< > /dev/null
	echo "... Fatto!"


installa: $(CLASSE) $(CLASSE_DOC)
	echo "Copia dei file in ..."
#
# Stile bibliografico
#
	echo "... $(ALBEROPERS)/bibtex/bst/$(MAIN) ..."
	mkdir -p  $(ALBEROPERS)/bibtex/bst/$(MAIN)
	cp -u $(MAIN).bst $(ALBEROPERS)/bibtex/bst/$(MAIN)
#
# Codice sorgente della classe (.dtx)
#
	echo "... $(ALBEROPERS)/source/latex/$(MAIN) ..."
	mkdir -p  $(ALBEROPERS)/source/latex/$(MAIN)
	cp -u $(MAIN).dtx $(ALBEROPERS)/source/latex/$(MAIN)
#	
# Codice della classe (.cls) e file accessori
#	
	echo "... $(ALBEROPERS)/tex/latex/$(MAIN) ..."
	mkdir -p  $(ALBEROPERS)/tex/latex/$(MAIN)
	cp -u $(MAIN).cls $(ALBEROPERS)/tex/latex/$(MAIN)
	cp -u $(FIGURE)   $(ALBEROPERS)/tex/latex/$(MAIN)
	cp -u $(STILIIDX) $(ALBEROPERS)/tex/latex/$(MAIN)
#	
# Documentazione
#
	echo "... $(ALBEROPERS)/doc/latex/$(MAIN) ..."	
	mkdir -p  $(ALBEROPERS)/doc/latex/$(MAIN)
	cp -u $(MAIN).pdf $(ALBEROPERS)/doc/latex/$(MAIN)
	cp -u $(MAIN_DOC).pdf $(MAIN_DOC).tex $(ALBEROPERS)/doc/latex/$(MAIN)
	echo "... Fatto!"
	echo ""
	echo "Happy TeXing con guidatematica.cls"
	echo ""

clean:
	rm -f $(AUSILIARI)
