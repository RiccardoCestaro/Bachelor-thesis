% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "2.0",
%     date            = "25 March 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "Send email to suchow@post.harvard.edu.",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/03/25 v2.0 Dissertate Class]
\LoadClass[12pt, twoside, openright, a4paper]{book}

%
% Options
%
\RequirePackage{etoolbox}

% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\toggletrue{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
\RequirePackage[outer=1in, inner=1.55in, twoside, a4paper]{geometry}
\usepackage{ragged2e}
%\RaggedRight
\RequirePackage{graphicx}
\usepackage{fixltx2e}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}

% Fonts.
\RequirePackage{color}
\RequirePackage{xcolor}
\usepackage{hyperref}
\RequirePackage{url}
\RequirePackage{amssymb}
\RequirePackage{mathspec}
%\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}
%\setmathrm{EB Garamond}
\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{EB Garamond}
\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{Source Code Pro}
\RequirePackage[labelfont={bf,sf,footnotesize,singlespacing},
                textfont={sf,footnotesize,singlespacing},
                justification={justified,RaggedRight},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
                
                
                
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\RequirePackage{microtype}

% Tikz
\usepackage{tikz}
\usepackage{pgfplots}
\pgfplotsset{compat=newest} 
\pgfplotsset{plot coordinates/math parser=false} 
\newlength\fheight
\newlength\fwidth
\usepackage{booktabs}
\usepackage{multirow}
%\usepackage{multicolumn}
\usepackage{subcaption}
\usetikzlibrary{patterns,decorations.pathreplacing,backgrounds,calc}
\usepackage{afterpage}
\usepackage{tabulary}
\newcommand{\ra}[1]{\renewcommand{\arraystretch}{#1}}


% Pseudocode
\usepackage{algorithm}
\usepackage[noend]{algpseudocode}
\renewcommand\algorithmicthen{}
\renewcommand\algorithmicdo{}
\@addtoreset{algorithm}{chapter}% algorithm counter resets every chapter
\usepackage{lscape}
\renewcommand{\thealgorithm}{\thechapter.\arabic{algorithm}}% Algorithm # is <chapter>.<algorithm>


% Abbreviations
\newcommand{\abbrlabel}[1]{\makebox[3cm][l]{\textbf{#1}\ \dotfill}}
\newenvironment{abbreviations}{\begin{list}{}{\renewcommand{\makelabel}{\abbrlabel}}}{\end{list}}


% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}

% Front matter.
\setcounter{tocdepth}{2}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Indice delle immagini}
\renewcommand\listtablename{Indice delle tabelle}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
\renewcommand\bibname{Riferimenti}
%\RequirePackage[super,comma,numbers]{natbib}
\RequirePackage[comma,numbers]{natbib}
\renewcommand{\bibnumfmt}[1]{[#1]}
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace{1.3\baselineskip}}
\bibliographystyle{IEEEtran}


% Glossary
\usepackage[toc, acronym]{glossaries}
\input{glossario} % database di termini
\makeglossaries
\definecolor{redd}{HTML}{cc0000} 
\renewcommand{\glsfirstoccur}{\textsuperscript{[\color{redd}G\color{black}]}}
\newcommand{\glsfirstoccurspace}{\glsfirstoccur \hspace*{0.1cm}}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\advisor#1{\gdef\@advisor{#1}}
\def\mastername#1{\gdef\@mastername{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
\def\coadvisorOneUniversity#1{\gdef\@coadvisorOneUniversity{#1}}
\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\committeeInternal#1{\gdef\@committeeInternal{#1}}
\def\committeeInternalOne#1{\gdef\@committeeInternalOne{#1}}
\def\committeeInternalTwo#1{\gdef\@committeeInternalTwo{#1}}
\def\committeeExternal#1{\gdef\@committeeExternal{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeterm#1{\gdef\@degreeterm{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}
% School name and location
\university{University of Padova}
\universitycity{Padova}
\universitystate{Italy}

% School color found from university's graphic identity site:
% http://www.nyu.edu/employees/resources-and-services/media-and-communications/styleguide.html
\definecolor{SchoolColor}{rgb}{0.71, 0, 0.106} % UNIPD red
\definecolor{chaptergrey}{rgb}{0.61, 0, 0.09} % dialed back a little
\definecolor{midgrey}{rgb}{0.4, 0.4, 0.4}

\hypersetup{
    colorlinks,
    citecolor=SchoolColor,
    filecolor=black,
    linkcolor=black,
    urlcolor=SchoolColor,
}


\renewcommand{\frontmatter}{
	\pagenumbering{roman}
	\input{frontmatter/personalize}
	\maketitle
	\frontispiece
	\dedicationpage
	\abstractpage
	\acknowledgments
	%\sommario
	\tableofcontents
	\phantomsection
	\clearpage

	% figure listing - required if you have any figures
	\addcontentsline{toc}{chapter}{Indice delle immagini}
	\listoffigures
	\phantomsection
	\cleardoublepage

	% table listing - required if you have any tables
	\addcontentsline{toc}{chapter}{Indice delle tabelle}
	\listoftables
	\phantomsection
	\cleardoublepage

	% \acronyms

	\cleardoublepage
	\setcounter{page}{1}
	\pagenumbering{arabic}
}

\renewcommand*\contentsname{Indice}

\newcommand{\cover}{
	\pagenumbering{roman}
	\input{frontmatter/personalize}
	\makecover
}

\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\setcounter{page}{1}
	\begin{center}
	\vbox to0pt{\vbox to\textheight{\vfill \includegraphics[width=11.5cm]{resources/unipd-light} \vfill}\vss}
	%\vspace*{\fill}
	\begin{figure}
	\centering
  		\includegraphics[height=2.5cm]{resources/unipd-bn}
	\end{figure}

	\setstretch{1.5}

	\scshape{\Large{\bfseries{Università degli Studi di Padova}}} \\
	\line(1, 0){400} \\
	\scshape{\large{Dipartimento di matematica “Tullio Levi Civita”}} \\

	\vspace{5pt}
	\small{\textit{Tesi di laurea in}}
	\@mastername

	\setstretch{2.5}

	\vspace{30pt}
	\scshape{\LARGE{\bfseries{\textcolor{SchoolColor}{\thetitle}}}} \normalsize \\
	\vspace{25pt}
	\vspace{15pt}
	
	\setstretch{1.2}

	\vfill
	\begin{normalsize}
	\begin{flushleft}
	  \textit{Supervisore} \hfill \textit{Candidato}\\
	  \vspace{1pt}
	  \@advisor \hfill \@author\\
	  Università di Padova \\
	  \vspace{6pt}
	  \textit{Co-supervisore} \\
	  \@coadvisorOne \\
	  \@coadvisorOneUniversity
	  \vspace{10pt}
	\end{flushleft}
	\end{normalsize}
	
	\end{center}
	\vspace*{\fill}
	\singlespacing
	\cleardoublepage
}

\newcommand{\copyrightpage}{
	\newpage
	\thispagestyle{empty}
	\vspace*{25pt}
	\begin{center}
	\scshape \noindent \small \copyright \  \small  \theauthor \\
	all rights reserved, \@degreeyear
	\end{center}
	\newpage
	\rm
}

\newcommand{\frontispiece}{
	\newpage
	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
	\end{center}
	\vspace*{\fill}
}

\newcommand{\dedicationpage}{
	\phantomsection
	\setcounter{page}{3}
	\vspace*{\fill}
	\scshape \noindent \input{frontmatter/dedication}
	\vspace*{\fill}
	\cleardoublepage
	\rm
}

\newcommand{\acknowledgments}{
	\phantomsection
	\chapter*{Ringraziamenti}
	\noindent
	\input{frontmatter/thanks}
	\vspace*{\fill} \newpage
}

\newcommand{\sommario}{
	\phantomsection
	\chapter*{Sommario}
	\input{frontmatter/preface}
}

\newcommand{\acronyms}{
	\phantomsection
	\addcontentsline{toc}{chapter}{Listing of acronyms}
	\chapter*{Listing of acronyms}
	\input{frontmatter/abbr.tex}
}

\newcommand{\abstractpage}{
	\phantomsection
	\setcounter{page}{5}
	\addcontentsline{toc}{chapter}{Abstract}
	\chapter*{Abstract}
	\input{frontmatter/abstract}
}


\renewcommand{\backmatter}{
    \begin{appendices}
        \include{chapters/appendixA}
    \end{appendices}
    \input{endmatter/personalize}
    \clearpage
    \bibliography{references}
    \addcontentsline{toc}{chapter}{References}
    \bibliographystyle{apalike2}
    \include{endmatter/colophon}
}

\newcommand{\glossarypage}{
	\phantomsection
    \printglossaries
}


\usepackage{courier} %% Sets font for listing as Courier.
\usepackage{listings, xcolor}
\lstset{
tabsize = 3, %% set tab space width
showstringspaces = false, %% prevent space marking in strings, string is defined as the text that is generally printed directly to the console
numbers = left, %% display line numbers on the left
commentstyle = \color{green}, %% set comment color
keywordstyle = \color{blue}, %% set keyword color
stringstyle = \color{red}, %% set string color
rulecolor = \color{black}, %% set frame color to avoid being affected by text color
basicstyle = \fontsize{9}{11} \ttfamily , %% set listing font and size
breaklines = true, %% enable line breaking
numberstyle = \tiny,
}



\usepackage{microtype}                  % microtipografia

\usepackage{mparhack,fixltx2e,relsize}  % finezze tipografiche
\usepackage{adjustbox}