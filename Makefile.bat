@echo off

rem Copyright (c) 2013 Orlando Iovino.
rem
rem Autore: Orlando Iovino.
rem
rem Descrizione: Script per l'installazione della classe guidatematica
rem              nell'albero personale di una distribuzione TeX Live. 
rem
rem Versione: v0.0
rem
rem Riferimenti: [1] https://bitbucket.org/josephwright/siunitx/ (su
rem                  segnalazione di Mosè Giordano)
rem
rem Licenza: LaTeX Project Public License.
rem


rem Variabili
if not defined TEXMFHOME set TEXMFHOME=%USERPROFILE%\texmf

set CLS=guidatematica
set DOC=GuidaTematica-doc
set FILE=*

rem + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
rem Compilazione dei sorgenti

if not exist %CLS%.cls (
	echo Compilazione di %CLS%.dtx ...
	pdflatex -interaction=nonstopmode %CLS%.dtx > nul
	echo Fatto!
) else (
	echo Nessuna compilazione da eseguire: %CLS%.cls presente
)

if not exist %DOC%.pdf (
	echo Compilazione di %DOC%.tex ...
	xelatex %DOC% > nul
	bibtex %DOC% > nul
	xelatex %DOC% > nul
	xelatex %DOC% > nul
	echo Fatto!
) else (
	echo Nessuna compilazione da eseguire: %DOC%.pdf presente
)
rem + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
rem Copia dei file

for %%I in (%FILE%) do (
	call :file2tdsdir %%I
	call :installa %%I
)

rem + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
echo             *  *  * 
echo Happy TeXing con guidatematiche.cls
echo             *  *  *

pause

rem + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
:file2tdsdir

  set TDSDIR=

  if /i "%~x1" == ".pdf" set TDSDIR=doc\latex\%CLS%
  if /i "%~x1" == ".tex" set TDSDIR=doc\latex\%CLS%
  if /i "%~x1" == ".bib" set TDSDIR=doc\latex\%CLS%
  if /i "%~x1" == ".ist" set TDSDIR=doc\latex\%CLS% 
  if /i "%~x1" == ".dtx" set TDSDIR=source\latex\%CLS%
  if /i "%~x1" == ".cls" set TDSDIR=tex\latex\%CLS% 
  if /i "%~x1" == ".bst" set TDSDIR=bibtex\bst\%CLS% 
  
  goto :EOF
rem + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
:installa

  if defined TDSDIR (
		if not exist %TEXMFHOME%\%TDSDIR% (
			mkdir %TEXMFHOME%\%TDSDIR%
			xcopy /q /y %~f1 "%TEXMFHOME%\%TDSDIR%\" > nul
		) else (
			xcopy /q /y %~f1 "%TEXMFHOME%\%TDSDIR%\" > nul
		)   
  ) 
	rem else (
  rem   echo I file con estensione "%~x1" non saranno copiati
  rem )
  
  goto :EOF
rem + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -