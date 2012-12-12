%%
%% This is file `guidatematica.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% guidatematica.dtx  (with options: `class')
%%   ________________________________________
%%   The guidatematica class for typesetting books in the GuIT series
%%   "Guide Tematiche"
%%   Copyright (C) 2012 GuIT, Gruppo utilizzatori Italiani di TeX e LaTeX
%%   All rights reserved
%% 
%%   http://www.guitex.org
%% 
%%   License information appended
%% 
\NeedsTeXFormat{LaTeX2e}[2009/01/01]
\ProvidesClass{guidatematica}%
   [2012/12/12 v.0.6c Classe per comporre testi della collana
   Guide Tematiche del GuIT]
\DeclareOption{ipertesto}{%
\AtBeginDocument{\RequirePackage[colorlinks,linkcolor={blue},
  citecolor={blue!80!black},urlcolor={blue}]{hyperref}}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions*\relax

\LoadClassWithOptions{memoir}
\pdfpagewidth=\paperwidth
\pdfpageheight=\paperheight

\stockwidth=\paperwidth
\stockheight=\paperheight
\RequirePackage{ifxetex}
\ifxetex
\RequirePackage{fontspec}
\setmainfont[Ligatures=TeX,Numbers=OldStyle]{Latin Modern Roman}
\setsansfont[Ligatures=TeX,Numbers=OldStyle]{Latin Modern Sans}
\setmonofont[Numbers=Lining]{Latin Modern Mono}
\newfontfamily{\tvfamily}[Numbers=Lining]{Latin Modern Mono Prop}
\newfontfamily{\scfamily}%
   [Ligatures=TeX,Numbers=OldStyle]{Latin Modern Roman Caps}
\DeclareRobustCommand\scshape{\scfamily}
\DeclareTextFontCommand{\texttm}{\ttfamily}
\DeclareTextFontCommand{\texttv}{\tvfamily}
\DeclareTextFontCommand{\textsc}{\scshape}
\def\textl#1{{\addfontfeature{Numbers=Lining}#1}}
\RequirePackage{unicode-math}
\setmathfont{Latin Modern Math}
\RequirePackage{polyglossia}
\setmainlanguage{italian}
\else
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[italian]{babel}
\RequirePackage[tt={oldstyle=false,tabular,monowidth}]{cfr-lm}
\fi

\RequirePackage{graphicx}
\RequirePackage{metalogo}
\RequirePackage{pict2e}[2009/06/01]
\RequirePackage{microtype}
\RequirePackage{etoolbox}
\RequirePackage{xcolor}
\RequirePackage{natbib}
\RequirePackage{multicol}
\RequirePackage{imakeidx}
\RequirePackage{fancyvrb}
\RequirePackage{afterpage}
\RequirePackage{enumitem}
\RequirePackage{listings}
\lstloadlanguages{[LaTeX]TeX}
\RequirePackage{canoniclayout}
\marginparwidth=0.8\dimexpr\evensidemargin+1in-\marginparsep\relax
\def\GetFileInfo#1{%
  \def\filename{#1}%
  \def\@tempb##1 ##2 ##3\relax##4\relax{%
    \def\filedate{##1}%
    \def\fileversion{##2}%
    \def\fileinfo{##3}}%
  \edef\@tempa{\csname ver@#1\endcsname}%
  \expandafter\@tempb\@tempa\relax? ? \relax\relax}
\let\@copymark\@empty % Di default è vuoto
\newcommand*\setcopymark[1]{\gdef\@copymark{#1}}
\newcommand*\@insertcopymark{%
\begin{picture}(0,0)\unitlength=1mm\relax\if@openright
\put(10,9.5){\rotatebox{90}{\makebox(0,0)[l]{\@copymark}}}%
\else
\ifodd\value{page}\put(10,9.5){\rotatebox{90}{%
   \makebox(0,0)[l]{\@copymark}}}\else
\put(-10,9.5){\rotatebox{90}{\makebox(0,0)[l]{\@copymark}}}\fi\fi
\end{picture}%
}
\def\cblayoutsinistro{%
\dimen256=\dimexpr\headheight+\topmargin+1in-4pt-\paperheight\relax
\dimen258=\dimexpr\evensidemargin+1in\relax
\dimen262=1mm\relax
\dimen260=\dimexpr \paperwidth*\p@/\dimen262\relax
\dimen264=\dimexpr \paperheight-\topmargin-\headheight-1in
     -\headsep-\textheight\relax
\begin{picture}(0,0)(\strip@pt\dimen258,-\strip@pt\dimen256)%
\put(0,0){\unitlength=\p@
\put(0,0){\framebox(\strip@pt\paperwidth,\strip@pt\paperheight){}}%
\color{red}%
\put(\strip@pt\dimen258,\strip@pt\dimen264){%
    \framebox(\strip@pt\textwidth,\strip@pt\textheight){}}%
\Line(0,0)(\strip@pt\paperwidth,\strip@pt\paperheight)%
\put(\strip@pt\dimexpr\paperwidth/2\relax,%
    \strip@pt\dimexpr\dimen264+\textheight/2\relax)%
    {\circle{\strip@pt\paperwidth}}%
}
\end{picture}}

\def\cblayoutdestro{%
\dimen256=\dimexpr\headheight+\topmargin+1in-4pt-\paperheight\relax
\dimen258=\dimexpr\oddsidemargin+1in\relax
\dimen262=1mm\relax
\dimen260=\dimexpr \paperwidth*\p@/\dimen262\relax
\dimen264=\dimexpr \paperheight-\topmargin-\headheight-1in
    -\headsep-\textheight\relax
\begin{picture}(0,0)(\strip@pt\dimen258,-\strip@pt\dimen256)%
\put(0,0){\unitlength=\p@
\put(0,0){\framebox(\strip@pt\paperwidth,\strip@pt\paperheight){}}%
\color{red}%
\put(\strip@pt\dimen258,\strip@pt\dimen264){%
    \framebox(\strip@pt\textwidth,\strip@pt\textheight){}}%
\Line(0,\strip@pt\paperheight)(\strip@pt\paperwidth,0)%
\put(\strip@pt\dimexpr\paperwidth/2\relax,%
   \strip@pt\dimexpr\dimen264+\textheight/2\relax)%
   {\circle{\strip@pt\paperwidth}}%
}
\end{picture}}
\nouppercaseheads
\renewcommand{\footruleskip}{0pt}
\makeevenfoot{plain}{\@insertcopymark}{\textsc{\thepage}}{}
\makeoddfoot{plain}{}{\textsc{\thepage}}{\@insertcopymark}
\makeevenfoot{headings}{\@insertcopymark}{}{}
\makeoddfoot{headings}{}{}{\@insertcopymark}
\makeevenfoot{myheadings}{\@insertcopymark}{}{}
\makeoddfoot{myheadings}{}{}{\@insertcopymark}
\makeheadrule{headings}{\textwidth}{0pt}
\makeheadrule{myheadings}{\textwidth}{0pt}
\makeevenhead{headings}%
   {{\textsc{\thepage}\quad}}{\textsc{\small\leftmark}}{}
\makeoddhead{headings}%
   {}{\textsc{\small\rightmark}}{{\quad\textsc{\thepage}}}
\makeevenhead{myheadings}%
   {{\textsc{\thepage}\quad}}{\textsc{\small\leftmark}}{}
\makeoddhead{myheadings}%
   {}{\textsc{\small\rightmark}}{{\quad\textsc{\thepage}}}
\makepsmarks{headings}{%
\createmark{chapter}{both}{shownumber}{\@chapapp\space}{.\qquad}
\createmark{section}{right}{shownumber}{$\mathsection$\,}{\qquad}
\renewcommand*\indexmark{\markboth{\indexname}{\indexname}}}
\makepagestyle{headingslayout}
\makeevenhead{headingslayout}{\cblayoutsinistro
   \textsc{\thepage}\quad\textsc{\small\leftmark}}{}{}
\makeevenfoot{headingslayout}{\@insertcopymark}{}{}
\makeoddhead{headingslayout}{\cblayoutdestro
   \hfill\null}{}{\textsc{\small\rightmark}{\quad\textsc{\thepage}}}
\makeoddfoot{headingslayout}{}{}{\@insertcopymark}
\makechapterstyle{guidatematica}{%
   \renewcommand*{\chapnumfont}{%
      \fontshape{it}\fontsize{40}{40}\selectfont}
   \renewcommand*{\printchaptername}{}
   \renewcommand*{\chapternamenum}{}
   \renewcommand*{\chaptitlefont}{%
       \fontsize{18}{16}\scshape}% sterlineato
   \renewcommand*{\printchapternum}{%
       \noindent\rlap{\makebox[\textwidth][r]{\rlap{\hskip10pt
       \chapnumfont \thechapter}}}\printchaptertitle}
   \renewcommand*{\afterchapternum}{}
}
\AtBeginDocument{\chapterstyle{guidatematica}}
\renewcommand*\partnamefont{\normalfont\large\scshape}
\renewcommand*\partnumfont{\normalfont\large\scshape}
\renewcommand*\parttitlefont{\normalfont\huge\scshape}
\setbeforesecskip{-3.5ex plus-1ex minus-0.2ex}
\setbeforesubsecskip{-3ex plus-1ex minus-0.2ex}
\setbeforesubsubsecskip{-2.5ex plus-1ex minus-0.2ex}
\setbeforeparaskip{1\onelineskip plus1ex minus0.2ex}
\setbeforesubparaskip{1\onelineskip plus1ex minus0.2ex}
\setaftersecskip{1.5ex plus0.2ex}
\setaftersubsecskip{1.5ex plus0.2ex}
\setaftersubsubsecskip{1.5ex plus0.2ex}
\setafterparaskip{-1em}
\setaftersubparaskip{-1em}
\setsubparaindent{\parindent}

\setsecheadstyle{\large\scshape\raggedright}
\setsubsecheadstyle{\large\scshape\raggedright}
\setsubsubsecheadstyle{\large\scshape\raggedright}
\setparaheadstyle{\small\scshape}
\setsubparaheadstyle{\small\scshape}

\aliaspagestyle{part}{empty}
\aliaspagestyle{chapter}{empty}
\copypagestyle{titlepage}{headings}
\renewcommand\cftpartpagefont{\scshape}
\renewcommand\cftpartfont{\large\scshape}
\renewcommand\cftchapterfont{\large\scshape}
\renewcommand\cftchapterpagefont{\scshape}
\renewcommand*{\cftchapterfillnum}[1]{%
    {\cftchapterleader}\nobreak
    \cftchapterformatpnum{#1}%
    \cftchapterafterpnum\par\nobreak}
\setlength{\cftbeforechapterskip}{1.0em \@plus 2\p@}
\captiondelim{\quad}
\captionnamefont{\small\scshape}
\captiontitlefont{\small}
\captionstyle[\centering]{}
\hangcaption
\captionwidth{\dimexpr\textwidth-2\parindent\relax}\changecaptionwidth
\renewcommand\descriptionlabel[1]{\hspace\labelsep\normalfont\scshape #1}
\renewcommand\blockdescriptionlabel[1]{\normalfont\scshape #1}
\providecommand\plaindescriptionlabel[1]{\hspace\labelsep\normalfont #1}

\renewlist{blockdescription}{description}{1}
\setlist[blockdescription]{before={\let\makelabel\blockdescriptionlabel},
leftmargin=\z@,labelsep*=0.5em,labelindent=\z@,labelwidth=\z@}

\newlist{plaindescription}{description}{1}
\setlist[plaindescription]{before={\let\makelabel\plaindescriptionlabel}}

\newlist{compactenumerate}{enumerate}{1}
\setlist[compactenumerate,1]{label=\arabic*.,
   noitemsep, partopsep=\z@, topsep=.25\onelineskip}

\newlist{compactitemize}{itemize}{4}
\setlist[compactitemize]{label=*,
   noitemsep,partopsep=\z@,topsep=.25\onelineskip}

\newlist{compactdescription}{description}{1}
\setlist[compactdescription]{%
style=sameline,noitemsep,partopsep=\z@,topsep=.25\onelineskip}
\AtBeginDocument{\setsecnumdepth{subsection}
   \settocdepth{subsection}\maxsecnumdepth{subsection}
   \maxtocdepth{subsection}}
 \DeclareMathSymbol{\virgola}{\mathpunct}{letters}{"3B}
 \DeclareMathSymbol{\virgoladecimale}{\mathord}{letters}{"3B}
\ifxetex
 \AtBeginDocument{\ifcsstring{xpg@main@language}{english}{\relax}{%
    \mathcode`\,=\string"8000}}
\else
 \AtBeginDocument{\ifcsstring{languagename}{english}{\relax}{%
    \mathcode`\,=\string"8000}}
\fi
{\catcode `,=\active \gdef,{\futurelet\let@token\m@thcomma}}%
\AtEndPreamble{%
\gdef\m@thcomma#1{%
\unless\ifcat\noexpand\let@token*%
  \virgola
\else
\expandafter\expandafter\expandafter
    \ifcsname\expandafter\@gobble\string#1\endcsname
  \virgola
\else
  \ifnum`#1<`0\relax
    \virgola
  \else
    \ifnum`#1>`9\relax
      \virgola
    \else
      \virgoladecimale
    \fi
  \fi
\fi
\fi#1}%
}
\renewcommand{\bibsection}{\chapter{\bibname}\prebibhook}
\let\imki@idxprologue\empty
\def\imki@columns{2}
\renewenvironment{theindex}
{%
\clearforchapter
    \csname phantomsection\endcsname
\chapter{\indexname}%
\indexmark%
\parindent\z@
\parskip\z@ \@plus .3\p@\relax
\let\item\@idxitem
\begin{multicols}{\imki@columns}[\imki@idxprologue]
}
{%
\end{multicols}\gdef\imki@idxprologue{}\clearpage
}
\AtBeginDocument{\bibliographystyle{guidatematica}%
\ifxetex
   \ifcsstring{xpg@main@language}{italian}%
     {\csgappto{init@extras@italian}{\nofrench@indent}}{}%
\fi}
\newenvironment{titlepage}{\clearpage
\pagestyle{titlepage}
\oddsidemargin=\dimexpr(\oddsidemargin+\evensidemargin)/2\relax
\makeoddhead{titlepage}{}{\smash{\Large\scshape\@author}}{}
\makeoddfoot{titlepage}{}{\smash{\large\scshape\@date}}{}
}{\clearpage}

\providecommand\subtitle[1]{\gdef\@subtitle{#1}}
\let\@subtitle\empty

\renewcommand\maketitle{
\begin{titlepage}
\vspace*{\stretch{.7}}
{\centering\LARGE\scshape\@title\par}
\ifdefvoid{\@subtitle}{}{\vspace{2\onelineskip}
{\centering\scshape\Large\@subtitle\par}}
\vspace{\stretch{.7}}
{\centering\includegraphics[width=40mm]{LogoGuITtondo}\par}
\vspace*{\stretch{.7}}
\end{titlepage}
}
\newenvironment{medaglione}[1][\linewidth]{%
    \begin{lrbox}{0}%
    \begin{minipage}{\dimexpr#1-2\fboxsep-2\fboxrule}
}{%
    \end{minipage}\end{lrbox}\fbox{\usebox{0}}\relax
}

\newenvironment{sintassi}{\flushleft\medaglione}%
   {\endmedaglione\endflushleft}
\newcommand*\hz{\nobreak\hskip\z@}
\renewcommand*\meta[1]{$\langle$\textit{\hz#1}$\rangle$}
\renewcommand*\marg[1]{\texttt{\char123}\meta{#1}\texttt{\char125}}
\renewcommand*\oarg[1]{\texttt{[}\meta{#1}\texttt{]}}
\newcommand*\Arg[1]{\texttt{\char123\relax#1\char125}}
\def\GT@splitargs#1,#2!{\def\@tempA{#1}\def\@tempB{#2}}
\newcommand\garg[1]{\GT@splitargs#1!\texttt{(}\meta{\@tempA}%
   \texttt{,}\meta{\@tempB}\texttt{)}}
\newcommand*\comando[1]{\texttt{\string#1}}
\renewcommand*{\cs}[1]{\texttt{\char92#1}\index{#1@\texttt{\char92#1}}}
\let\csindex\cs
\newcommand*\Sambiente[2]{\cs{begin}\marg{#1}\oarg{#2}\,\dots
   \cs{end}\marg{#1}}
\newcommand*\Dambiente[3]{\cs{begin}\marg{#1}\oarg{#2}\oarg{#3}\,\dots
   \cs{end}\marg{#1}}
\newcommand*\Bambiente[1]{\cs{begin}\texttt{\char123#1\char125}}
\newcommand*\Eambiente[1]{\cs{end}\texttt{\char123#1\char125}}
\DeclareRobustCommand*\ambstyle[1]{\textsf{\slshape#1}}
\DeclareRobustCommand*\classstyle[1]{\texttv{\itshape#1}}
\DeclareRobustCommand*\filestyle[1]{\texttm{\textl{#1}}}
\DeclareRobustCommand*\packstyle[1]{\texttm{\itshape\textl{#1}}}
\DeclareRobustCommand*\progstyle[1]{\textsf{#1}}
\DeclareRobustCommand*\prog[1]{\progstyle{#1}%
   \index{programma!#1@\progstyle{#1}}}
\DeclareRobustCommand*\pack[1]{\packstyle{#1}%
   \index{pacchetto!#1@\packstyle{#1}}}
\DeclareRobustCommand*\class[1]{\classstyle{#1}%
   \index{classe!#1@\classstyle{#1}}}
\DeclareRobustCommand*\file[1]{\filestyle{#1}%
   \index{file!#1@\filestyle{#1}}}
\DeclareRobustCommand*\amb[1]{\ambstyle{#1}%
   \index{ambiente!#1@\ambstyle{#1}}}
\DeclareRobustCommand*\opzstyle[1]{\textsl{\textl{#1}}}
\DeclareRobustCommand*\contastyle[1]{\texttm{#1}}
\DeclareRobustCommand*\stilestyle[1]{\texttm{#1}}
\DeclareRobustCommand*\numeristyle[1]{\texttm{#1}}
\DeclareRobustCommand*\umisurastyle[1]{\texttm{#1}}
\DeclareRobustCommand*\chiavestyle[1]{\texttm{#1}}
\DeclareRobustCommand*\descrittorestyle[1]{\texttm{#1}}
\DeclareRobustCommand*\posizionestyle[1]{\texttm{#1}}
\DeclareRobustCommand*\allineamentostyle[1]{\texttm{#1}}

\DeclareRobustCommand*\opz[1]{\opzstyle{#1}%
   \index{opzione!#1@\opzstyle{#1}}}
\DeclareRobustCommand*\conta[1]{\contastyle{#1}%
   \index{contatore!#1@\contastyle{#1}}}
\DeclareRobustCommand*\stile[1]{\stilestyle{#1}%
   \index{stile della pagina!#1@\stilestyle{#1}}}
\DeclareRobustCommand*\numeri[1]{\numeristyle{#1}%
   \index{numerazione!#1@\numeristyle{#1}}}
\DeclareRobustCommand*\umisura[1]{\umisurastyle{#1}%
   \index{unit\`a di misura!#1@\umisurastyle{#1}}}
\DeclareRobustCommand*\chiave[1]{\chiavestyle{#1}%
   \index{chiave!#1@\chiavestyle{#1}}}
\DeclareRobustCommand*\descrittore[1]{\descrittorestyle{#1}%
   \index{descrittore di colonna!#1@\descrittorestyle{#1}}}
\DeclareRobustCommand*\posizione[1]{\posizionestyle{#1}%
   \index{posizione degli oggetti flottanti!#1@\posizionestyle{#1}}}
\DeclareRobustCommand*\allineamento[1]{\allineamentostyle{#1}%
   \index{codice di allineamento!#1@\allineamentostyle{#1}}}
\DeclareRobustCommand*\GuIT{{\dimen@=\f@size\p@\dimen2=20.88\p@
\edef\guitscale{\strip@pt\dimexpr\dimen@*\p@/\dimen2\relax}%
\raisebox{-0.93ex}[\z@][\z@]{%
   \includegraphics[scale=\guitscale]{LogoGuITlineare}}}}
\let\guit\GuIT
%% Copyright 2012 GuIT, Gruppo utilizzatori Italiani di TeX e LaTeX
%% 
%% Distributable under the LaTeX Project Public License,
%% version 1.3c or higher (your choice). The latest version of
%% this license is at: http://www.latex-project.org/lppl.txt
%% 
%% This Work has the status of `maintained'
%% 
%% The Current Maintainer is the GuIT staff
%% 
%% This work consists of this file guidatematica.dtx,
%% and the derived files guidatematica.cls and guidatematica.pdf
%% plus the associated documentation GuidaTematica-doc.tex
%% and GuidaTematica-doc.pdf.
%% 
%%
%% End of file `guidatematica.cls'.
