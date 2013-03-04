@echo off

rem Copyright (c) 2013 Orlando Iovino.
rem
rem Autore: Orlando Iovino.
rem
rem Descrizione: Script per l'installazione della classe guidatematica
rem              nell'albero personale di una distribuzione TeX Live.
rem
rem Versione: v.2.0
rem
rem Riferimenti: [1] https://bitbucket.org/josephwright/siunitx/ (su
rem                  segnalazione di Mosè Giordano)
rem
rem Licenza: LaTeX Project Public License.
rem

if not "%1" == "" goto :variabili

:help

  echo.
	echo  Makefile cls. . . . . . crea la classe e la documentazione
	echo  Makefile doc. . . . . . crea la guida ausiliaria
	echo  Makefile installa . . . installa la classe
	echo  Makefile clean. . . . . elimina i file ausiliari 
	echo  Makefile xclean . . . . elimina i file ausiliari e i documenti prodotti

  goto :EOF

:variabili

	set MAIN=guidatematica
	set MAIN_DOC=%MAIN%-doc
	set CLASSE=%MAIN%.cls
	set CLASSE_DOC=%MAIN_DOC%.pdf
	set FIGURE=logoguitlineare.pdf logoguittondo.pdf
	set STILIIDX=%MAIN%.ist %MAIN%files.ist
	set ALBEROPERS=%USERPROFILE%\texmf
	set AUSILIARI=aux log out toc bbl blg idx ilg ind
	set XCLEAN=%CLASSE% %MAIN%.pdf %CLASSE_DOC%
	
:main

  if /i "%1" == "cls"        goto :cls
  if /i "%1" == "doc"        goto :doc
  if /i "%1" == "installa"   goto :installa
  if /i "%1" == "clean"      goto :clean
  if /i "%1" == "xclean"     goto :xclean
	
  goto :variabili
	
:cls

	if not exist %CLASSE% (
		echo Compilazione di %MAIN%.dtx ...
		pdflatex -interaction=nonstopmode %MAIN%.dtx > nul
		echo ... Fatto!
	) else (
		echo Nessuna compilazione da eseguire: %CLASSE% gia' presente
	)

	goto :EOF
	
:doc

	if not exist %CLASSE% call :cls

	if not exist %CLASSE_DOC% (
		echo Compilazione di %MAIN_DOC%.tex ...
		xelatex %MAIN_DOC% > nul
		bibtex %MAIN_DOC% > nul
		xelatex %MAIN_DOC% > nul
		xelatex %MAIN_DOC% > nul
		echo ... Fatto!
	) else (
		echo Nessuna compilazione da eseguire: %CLASSE_DOC% gia' presente
	)

	goto :EOF
	
:installa

	if not exist %CLASSE_DOC% call :doc

		echo Copia dei file in ...
rem
rem Stile bibliografico
rem
		set TDSDIR=doc\latex\%MAIN%
		echo ... %ALBEROPERS%\bibtex\bst\%MAIN% ...
		if not exist %ALBEROPERS%\%TDSDIR% mkdir %ALBEROPERS%\%TDSDIR%
		xcopy /q /y %MAIN%.bst "%ALBEROPERS%\%TDSDIR%\" > nul
rem
rem Codice sorgente della classe (.dtx)
rem
		set TDSDIR=source\latex\%MAIN%
		echo ... %ALBEROPERS%\source\latex\%MAIN% ...
		if not exist %ALBEROPERS%\%TDSDIR% mkdir %ALBEROPERS%\%TDSDIR%
		xcopy /q /y %MAIN%.dtx "%ALBEROPERS%\%TDSDIR%\" > nul
rem
rem Codice della classe (.cls) e file accessori
rem
		set TDSDIR=tex\latex\%MAIN%
		echo ... %ALBEROPERS%\tex\latex\%MAIN% ...
		if not exist %ALBEROPERS%\%TDSDIR% mkdir %ALBEROPERS%\%TDSDIR%
		xcopy /q /y %CLASSE%   "%ALBEROPERS%\%TDSDIR%\" > nul
		for %%f in (%FIGURE%)   do xcopy /q /y %%f "%ALBEROPERS%\%TDSDIR%\" > nul
		for %%f in (%STILIIDX%) do xcopy /q /y %%f "%ALBEROPERS%\%TDSDIR%\" > nul
rem
rem Documentazione
rem
		set TDSDIR=doc\latex\%MAIN%
		echo ... %ALBEROPERS%\doc\latex\%MAIN% ...
		if not exist %ALBEROPERS%\%TDSDIR% mkdir %ALBEROPERS%\%TDSDIR%
		xcopy /q /y %MAIN%.pdf      "%ALBEROPERS%\%TDSDIR%\" > nul
		xcopy /q /y %MAIN_DOC%.tex  "%ALBEROPERS%\%TDSDIR%\" > nul
		xcopy /q /y %MAIN_DOC%.pdf  "%ALBEROPERS%\%TDSDIR%\" > nul
		
		echo ... Fatto!
		echo.
		echo  Happy TeXing con guidatematica.cls
		
	goto :EOF	
	
:clean

  for %%I in (%AUSILIARI%) do (
    if exist *.%%I del /q *.%%I
  )

	goto :EOF
	
:xclean

	call :clean

	for %%F in (%XCLEAN%) do (
		if exist %%F del /q %%F
	)

	goto :EOF