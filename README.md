guidatematica
==============

Contiene i sorgenti della classe *guidatematica.cls* e file accessori.

Descrizione
----------

*guidatematica.cls* è una classe LaTeX per scrivere
 [guide tematiche](http://www.guitex.org/home/it/guide-tematiche/la-filosofia-delle-guide-a-tema)
 per il
 [GuIT — Gruppo Utilizzatori Italiani di TeX](http://www.guitex.org/home/).
 
L'autore della classe e della documentazione a corredo è Claudio Beccari.

Installazione
----------

La classe è la sua documentazione sono generate dai sorgenti
*guidatematica.dtx* e *guidatematica-doc.tex*:

* per creare la classe *guidatematica.cls* si deve compilare
  *guidatematica.dtx* mediante `pdflatex`;
* per creare la guida di supporto si deve compilare *guidatematica-doc.tex*
  con `xelatex` più `bibtex` per la bibliografia; l'indice analitico è invece
  creato in modo sincrono grazie al pacchetto
  [imakeidx](http://www.ctan.org/pkg/imakeidx).

Se si è interessati ad installare la classe nel proprio albero personale con
una distribuzione TeX Live, sono disponibili un
* *Makefile* da usare su *GNU/Linux* mediante il programma
   [make](http://www.gnu.org/software/make/);
* *Makefile.bat* da usare su Windows (si deve aprire il `Prompt dei comandi` e
   scrivere `Makefile`).
   
Per la corretta compilazione dei sorgenti si raccomanda una distribuzione `TeX Live` completa ed aggiornata.

Licenza
----------

La classe *guidatematica* e la guida di supporto sono soggette alla licenza
**LPPL**, LaTeX Project Public Licence, versione 1.3 o successive; il testo
della licenza è sempre contenuto in qualunque distribuzione del sistema TeX, e
nel sito
[http://www.latex-project.org/lppl.txt](http://www.latex-project.org/lppl.txt)

Solo per utenti [GNU Emacs](http://www.gnu.org/software/emacs/)
----------

Al repository
[auctex_style_guidatematica](https://github.com/orlyfurious/auctex_style_guidatematica)
è disponibile il file di stile *non ufficiale* guidatematica.el per
[AUCTeX](http://www.gnu.org/software/auctex/).
