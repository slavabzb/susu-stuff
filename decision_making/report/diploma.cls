%%
%% This is file `diploma.cls',
%%
%% The original source files were:
%%
%% report.cls
%% article.cls
%%
%% developed by Constantin B. Yushkov
%%
%% This file was generated from file(s) of the LaTeX base system.
%% --------------------------------------------------------------
%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{diploma}
              [2007/06/19 v1.10
 Modified LaTeX document class]
\newcommand\@ptsize{}

\usepackage[pdftex]{graphicx}
\usepackage[russian]{babel}


\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue

\newif\if@chap
\DeclareOption{chapters}{\@chaptrue}
\DeclareOption{nochapters}{\@chapfalse}

\newif\if@erect
\DeclareOption{enlarge}{\@erecttrue}
\DeclareOption{normals}{\@erectfalse}

\newif\if@russify
\DeclareOption{russify}{\@russifytrue}
\DeclareOption{norussify}{\@russifyfalse}

\newif\if@autocite
\DeclareOption{autocite}{\@autocitetrue}
\DeclareOption{noautocite}{\@autocitefalse}


\newif\if@hlink
\DeclareOption{hlink}{\@hlinktrue}
\DeclareOption{nohlink}{\@hlinkfalse}

\newif\if@fulltoc
\DeclareOption{fulltoc}{\@fulltoctrue}
\DeclareOption{nofulltoc}{\@fulltocfalse}

\newif\if@stdfoots
\DeclareOption{stdfoots}{\@stdfootstrue}
\DeclareOption{nostdfoots}{\@stdfootsfalse}

\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight{297mm}%
    \setlength\paperwidth{210mm}}
\DeclareOption{landscape}
   {\setlength\@tempdima  {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi

\newif\if@ten
\@tenfalse

\newif\if@eleven
\@elevenfalse

\newif\if@fourteen
\@fourteenfalse

\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}\@tentrue}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}\@eleventrue}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{14pt}{\renewcommand\@ptsize{4}\@fourteentrue}

\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}

\setlength\overfullrule{0pt}

\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi


\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}

\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}

\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}


\ExecuteOptions{a4paper,14pt,oneside,onecolumn,russify,stdfoots,nochapters,nohlink,normals,notitlepage,noautocite,nofullto}	%(Изменено:Лесовой) Размер шрифта 14 пт, было 
	%{a4paper,12pt,...}
\ProcessOptions


\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

% re-definition of pagestyle "plain"
\def\ps@plain{
    \@headsfalse
    \renewcommand{\@oddhead}{}
    \renewcommand{\@evenhead}{}
    \renewcommand{\@oddfoot}{\hfill {\,\thepage\,} \hfill}	%(Изменено:Лесовой) Нумерация страниц без тире, было {\,--\thepage\--,}
    \renewcommand{\@evenfoot}{\hfill {\,\thepage\,} \hfill}	%(Изменено:Лесовой) Нумерация страниц без тире, было {\,--\thepage\--,}
}

\newif\if@heads
\@headsfalse

% re-definition of pagestyle "headings"
\if@chap
    \if@twoside
    \def\ps@headings{%
        \@headstrue
        \let\@oddfoot\@empty\let\@evenfoot\@empty
        \def\@evenhead{\raisebox{0pt}[\headheight][0pt]{\vbox{\hbox to\textwidth{\footnotesize \strut {\bfseries\thepage}\hfil\slshape\leftmark}\hrule}}}%
        \def\@oddhead{\raisebox{0pt}[\headheight][0pt]{ \vbox{\hbox to\textwidth{\footnotesize \strut {\slshape\rightmark}\hfil{\bfseries\thepage}}\hrule}}}%
        \let\@mkboth\markboth
        \def\chaptermark##1{%
        \markboth {\MakeUppercase{%
            \ifnum \c@secnumdepth >\m@ne
                \@chapapp\ \ifnum \c@chapter > \z@  \thechapter. \fi \ %
            \fi
            ##1}}{}}%
        \def\sectionmark##1{%
        \markright {\MakeUppercase{%
            \ifnum \c@secnumdepth >\z@
            \thesection. \ %
            \fi
            ##1}}}}
    \else
    \def\ps@headings{%
        \@headstrue
        \let\@oddfoot\@empty
        \def\@oddhead{\raisebox{0pt}[\headheight][0pt]{ \vbox{\hbox to\textwidth{\footnotesize \strut {\slshape\rightmark}\hfil{\bfseries\thepage}}\hrule}}}%
        \let\@mkboth\markboth
        \def\chaptermark##1{%
        \markright {\MakeUppercase{%
            \ifnum \c@secnumdepth >\m@ne
                \@chapapp\ \ifnum \c@chapter > \z@ \thechapter.\fi \ %
                %\@Roman\c@chapter. \ %
            \fi
            ##1}}}}
    \fi
\else
    \if@twoside
    \def\ps@headings{%
        \@headstrue
        \let\@oddfoot\@empty\let\@evenfoot\@empty
        \def\@evenhead{\raisebox{0pt}[\headheight][0pt]{\vbox{\hbox to\textwidth{\footnotesize \strut {\bfseries\thepage}\hfil\slshape\leftmark}\hrule}}}%
        \def\@oddhead{\raisebox{0pt}[\headheight][0pt]{ \vbox{\hbox to\textwidth{\footnotesize \strut {\slshape\rightmark}\hfil{\bfseries\thepage}}\hrule}}}%
        \let\@mkboth\markboth
        \def\sectionmark##1{%
        \markboth {\MakeUppercase{%
            \ifnum \c@secnumdepth >\z@
            \thesection.\quad
            \fi
            ##1}}{}}%
        \def\subsectionmark##1{%
        \markright {%
            \ifnum \c@secnumdepth >\@ne
            \thesubsection.\quad
            \fi
            ##1}}}
    \else
    \def\ps@headings{%
        \@headstrue
        \let\@oddfoot\@empty
        \def\@oddhead{\raisebox{0pt}[\headheight][0pt]{ \vbox{\hbox to\textwidth{\footnotesize \strut {\slshape\rightmark}\hfil{\bfseries\thepage}}\hrule}}}%
        \def\sectionmark##1{%
        \markright {\MakeUppercase{%
            \ifnum \c@secnumdepth >\m@ne
            \thesection.\quad
            \fi
            ##1}}}}
    \fi
\fi


% definition of additional pagestyle "eheadings"
\if@chap
    \if@twoside
    \def\ps@eheadings{%
        \let\@oddfoot\@empty\let\@evenfoot\@empty
        \def\@evenhead{\raisebox{0pt}[\headheight][0pt]{\vbox{\hbox to\textwidth{\footnotesize \strut {\bfseries\thepage}\hfil}\hrule}}}%
        \def\@oddhead{\raisebox{0pt}[\headheight][0pt]{ \vbox{\hbox to\textwidth{\footnotesize \strut \hfil{\bfseries\thepage}}\hrule}}}}%
    \else
    \def\ps@eheadings{%
        \let\@oddfoot\@empty
        \def\@oddhead{\raisebox{0pt}[\headheight][0pt]{ \vbox{\hbox to\textwidth{\footnotesize \strut \hfil{\bfseries\thepage}}\hrule}}}}%
    \fi
\else
    \if@twoside
    \def\ps@eheadings{%
        \let\@oddfoot\@empty\let\@evenfoot\@empty
        \def\@evenhead{\raisebox{0pt}[\headheight][0pt]{\vbox{\hbox to\textwidth{\footnotesize \strut {\bfseries\thepage}\hfil}\hrule}}}%
        \def\@oddhead{\raisebox{0pt}[\headheight][0pt]{ \vbox{\hbox to\textwidth{\footnotesize \strut \hfil{\bfseries\thepage}}\hrule}}}}%
    \else
    \def\ps@eheadings{%
        \let\@oddfoot\@empty
        \def\@oddhead{\raisebox{0pt}[\headheight][0pt]{ \vbox{\hbox to\textwidth{\footnotesize \strut \hfil{\bfseries\thepage}}\hrule}}}}%
    \fi
\fi

% re-definition of additional pagestyle "myheadings"
\def\ps@myheadings{%
    \@headsfalse
    \renewcommand{\@oddfoot}{\hfill \textbf{\,\thepage\,} \hfill}	%(Изменено:Лесовой) Нумерация страниц без тире, было {\,--\thepage\--,}
    \renewcommand{\@evenfoot}{\hfill \textbf{\,\thepage\,} \hfill}	%(Изменено:Лесовой) Нумерация страниц без тире, было {\,--\thepage\--,}
    \def\@evenhead{\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }

% definition of additional pagestyle "title"
\if@twoside
    \def\ps@title{
        \@headsfalse
        \renewcommand{\@oddfoot}{\hfill \textbf{\,\thepage\,} \hfill}	%(Изменено:Лесовой) Нумерация страниц без тире, было {\,--\thepage\--,}
        \renewcommand{\@evenfoot}{\hfill \textbf{\,\thepage\,} \hfill}	%(Изменено:Лесовой) Нумерация страниц без тире, было {\,--\thepage\--,}
        \def\@oddhead{\raisebox{0pt}[\headheight][0pt]{ \vbox{\hbox to\textwidth{\footnotesize \strut {\slshape\MakeUppercase{\@shorttitle}}\hfil}\hrule}}}%
        \def\@evenhead{\raisebox{0pt}[\headheight][0pt]{\vbox{\hbox to\textwidth{\footnotesize \strut \hfil\slshape\@shortauthor}\hrule}}}%

    }
\else
    \def\ps@title{
        \@headsfalse
        \renewcommand{\@oddfoot}{\hfill \textbf{\,\thepage\,} \hfill}
        \def\@oddhead{\raisebox{0pt}[\headheight][0pt]{ \vbox{\hbox to\textwidth{\footnotesize \strut {\slshape \@shortauthor\hfil\MakeUppercase{\@shorttitle}}}\hrule}}}%
    }
\fi

% re-definition of the "title" command with a short version for hedings
\def\title{\@dblarg\diploma@title}
\long\def\diploma@title[#1]#2{\gdef\@title{#2}\gdef\@shorttitle{#1}}
\title{}


% definition of the "subtitle" command
\def\subtitle#1{\gdef\@subtitle{#1}}
\subtitle{}

% re-definition of the "author" command with a short version for hedings
\def\author{\@dblarg\diploma@author}
\long\def\diploma@author[#1]#2{\gdef\@author{#2}\gdef\@shortauthor{#1}}
\author{}

  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \renewcommand{\baselinestretch}{1.25}\selectfont
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \bfseries \MakeUppercase{\@title} \par}%
    \vskip 2em%
    {\LARGE \@subtitle \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}
    \@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \renewcommand{\baselinestretch}{1}\selectfont
  \let \footnote \thanks
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 2em%

   {\LARGE\bfseries \@title \par}%
    \vskip .5em%

    {\LARGE \@subtitle \par}%
     \vskip 2em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi

\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {partition}
\if@chap
    \newcounter {chapter}
    \newcounter {section}[chapter]
\else
    \newcounter{section}
\fi
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thepartition {\@Roman\c@partition}
\if@chap
    \renewcommand \thechapter {\@arabic\c@chapter}
    \renewcommand\thesection{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@section}
\else
    \renewcommand \thesection {\@arabic\c@section}
\fi
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}

\if@russify
    \renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\else
    \renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\fi

\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\part{%
  \cleardoublepage
  \thispagestyle{empty}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\partname\nobreakspace\thepart.\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}

\def\@endpart{\vfil\newpage
              \if@twoside
                \null
                \thispagestyle{empty}%
                \newpage
              \fi
              \if@tempswa
                \twocolumn
              \fi}

\newcommand\partition{%
    \cleardoublepage
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@partition\@spartition}

\def\@partition[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne\relax
      \refstepcounter{partition}%
      \addcontentsline{toc}{part}{\underline{\partitionname\nobreakspace\thepartition.}\hspace{0.5em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \underline{\partitionname\nobreakspace\thepartition}
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spartition#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}

\if@chap
\newcommand\chapter{\cleardoublepage
                    \markboth{}{}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\@chapapp \ifnum \c@chapter > \z@ \hspace{.5em}\numberline{\thechapter.}#1 \fi}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{20\p@}}% разрывчики между строками
                    \addtocontents{lot}{\protect\addvspace{20\p@}}% списка рисункив и таблиц
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \huge\bfseries \@chapapp\space \ifnum \c@chapter > \z@ \thechapter \fi
        \par\nobreak
%        \vskip 20\p@
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 20\p@
  }
  }
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
\else
  \global\let\chapter\relax
\fi
\newcommand\section{\@startsection {section}{1}{0.7cm}%				%(Изменено:Лесовой) Отступ перед заголовком 1 уровня, было {0cm}
                                   {3.5ex \@plus 1ex \@minus .2ex}%	%(Изменено:Лесовой) Отступ перед абзацем после заголовка 1 уровня, было {-3.5ex \@plus -1ex \@minus -.2ex}
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries\raggedright}}	%(Изменено:Лесовой) Обычный шрифт заголовка 1 уровня, было {\normalfont\Large\bfseries}}	
\newcommand\subsection{\@startsection{subsection}{2}{0.7cm}				%(Изменено:Лесовой) Отступ перед заголовком 2 уровня, было {0cm}
                                     {3.25ex\@plus 1ex \@minus .2ex}%		%(Изменено:Лесовой) Отступ перед абзацем после заголовка 1 уровня, было {-3.25ex\@plus -1ex \@minus -.2ex}
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries\raggedright}}	%(Изменено:Лесовой) Обычный шрифт заголовка 2 уровня, было {\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{0.7cm}				%(Изменено:Лесовой) Отступ перед заголовком 3 уровня, было {0cm}
                                     {3.25ex\@plus 1ex \@minus .2ex}%		%(Изменено:Лесовой) Отступ перед абзацем после заголовка 3 уровня, было {-3.25ex\@plus -1ex \@minus -.2ex}
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries\raggedright}}	%(Изменено:Лесовой) Обычный шрифт заголовка 3 уровня, было  {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}


\renewcommand{\@listI}{\leftmargin=37pt
\rightmargin=0pt
\labelsep=5pt
\labelwidth=10pt
\itemindent=0pt
\listparindent=0pt
\topsep=4pt plus 2pt minus 4pt
\partopsep=2pt plus 1pt minus 1pt
\parsep=0pt plus 1pt
\itemsep=\parsep
}

\renewcommand{\@listii}{\leftmargin=24pt
\topsep=2pt plus 1pt minus 1pt
\partopsep=2pt plus 1pt minus 1pt
}



\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi)}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii)}
\newcommand\labelenumiv{\theenumiv)}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \Large\bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \if@fulltoc
            \freesection{\abstractname}%
        \else
            \section*{\abstractname}%
        \fi
      \else
        \small
        \begin{center}%
          {\Large\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \parsep=2ex
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}

\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}

\newcounter{tmpl}
\newenvironment{numparagraphs}
                {\begin{list}{\arabic{tmpl})}%
                {\leftmargin=0pt \rightmargin=0pt \itemindent=2\parindent \parsep=\parskip  \usecounter{tmpl}}}
                {\end{list}}



\newenvironment{titlepage}
    { \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\cleardoublepage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }
    {\if@restonecol\twocolumn \else \fi
    \cleardoublepage
    }

\newcommand\appendix{
  \if@chap
      \gdef\@chapapp{\appendixname}
      \setcounter{chapter}{-1}
      \chapter{\mbox{}\arabic{chapter}}
      \markboth{}{}
      \renewcommand\thefigure{\appendixabbrev.\@arabic\c@figure}
      \renewcommand\thetable{\appendixabbrev.\@arabic\c@table}
  \else
      \freesection{\appendixname}
      \setcounter{section}{0}%
  \fi%

  \gdef\thesection{\@Roman\c@section}
  \renewcommand\theequation{\appendixabbrev.\@arabic\c@equation}
}


\newcommand\Appendix{%
    \cleardoublepage
    \setcounter{section}{0}%
  \if@chap\setcounter{chapter}{0}\fi%
  \gdef\@chapapp{\appendixname}%
    \if@chap
        \gdef\thechapter{\@Roman\c@chapter}
    \else
        \gdef\thesection{\@Roman\c@section}
    \fi
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@Appendix\@Appendix}

\def\@Appendix[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne\relax
      \refstepcounter{partition}%
      \addcontentsline{toc}{part}{\underline{\appendixname.}\hspace{0.5em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \underline{\appendixname}
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@sAppendix#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}

 \usepackage{array}
 \extrarowheight=4pt
 \def\bvline{\vrule \@width 1pt}
 \def\bhline{%
  \noalign{\ifnum0=`}\fi\hrule \@height 1pt \futurelet
   \reserved@a\@xhline}
\def\@xhline{\ifx\reserved@a\hline
               \vskip\doublerulesep
               \vskip-1pt
             \fi
      \ifnum0=`{\fi}}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{5\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

\if@chap
    \@addtoreset{equation}{chapter}
    \renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\else
    \@addtoreset{equation}{section}
    \renewcommand\theequation{\ifnum \c@section>\z@ \thesection.\fi \@arabic\c@equation}
\fi

\newcounter{figure}
\if@chap
    \@addtoreset{figure}{chapter}
    \renewcommand\thefigure{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\fi

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

\newcounter{table}
\if@chap
    \@addtoreset{table}{chapter}
    \renewcommand\thetable{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\fi
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable} 	
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{0\p@}
\setlength\belowcaptionskip{10\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip			
  \sbox\@tempboxa{#1 -- #2.}%
  \ifdim \wd\@tempboxa >\hsize
    \begingroup
	\vspace{-5mm}
        \center #1 -- #2.\sloppy\par		%(Изменено:Лесовой) Подпись рисунка, центрируется, в случае, если она не в одну строку, было #1 -- #2.\sloppy\par
    \endgroup
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}

\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \if@fulltoc
       \freesection{\contentsname}%
    \else
       \section*{\contentsname}%
    \fi
    \if@heads\thispagestyle{eheadings}\fi%
    \markboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\if@chap
    \newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
    \newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
    \newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
    \newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
    \newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

\else
    %\newcommand*\l@section[2]{%
    %\ifnum \c@tocdepth >\z@
    %    \addpenalty\@secpenalty
%	
%        \addvspace{1.0em \@plus\p@}%
%        \setlength\@tempdima{1.5em}%
%        \begingroup
%        \parindent \z@ \rightskip \@pnumwidth
%        \parfillskip -\@pnumwidth		
%	 \leavevmode						%(Изменено:Лесовой) Не печатать заголовки без линии точек,
%        \advance\leftskip\@tempdima
%        \hskip -\leftskip
%        #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
%        \endgroup
%    \fi}

    \newcommand*\l@section{\@dottedtocline{1}{0.5em}{0.9em}}  	%(Добавлено:Лесовой) А печатать с линией точек. +изменены значения отступов в оглавлении
    \newcommand*\l@subsection{\@dottedtocline{2}{2.3em}{1.7em}}
    \newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
    \newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
    \newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\fi

 

\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \if@fulltoc
        \freesection{\listfigurename}%
    \else
        \section*{\listfigurename}%
    \fi
    \if@heads\thispagestyle{eheadings}\fi%
    \markboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \if@fulltoc
        \freesection{\listtablename}%
    \else
        \section*{\listtablename}%
    \fi
    \if@heads\thispagestyle{eheadings}\fi%
    \markboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure


\usepackage[superscript,nomove]{cite}
\if@autocite
    \usepackage{autocite}
\else
    \def\autobibitem#1{\bibitem{#1}}
    \newenvironment{autobibliography}[1]{\begin{thebibliography}{#1}}{\end{thebibliography}}
    \def\citeboth#1#2{\@citess{\citen{#1,#2}}}
\fi
\def\@citess#1{~{[#1]}}		%(Изменено:Лесовой) Ссылки на литературу в квадратных скобках, было \def\@citess#1{\textsuperscript{~{\itshape(#1)}}}	
\def\crossrefcite#1{\emph{(\citen{#1})}}

\renewcommand{\@biblabel}[1]{#1\hfill}		%(Изменено:Лесовой) Номера источников литературы в списке без курсива и точки, было {\emph{#1}.\hfill}
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\freesection{\bibname}%	
      \if@heads\thispagestyle{eheadings}\fi%
      \markboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}
            }
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty


\if@autocite
    \usepackage{autocite}
\fi

\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\freesection{\indexname}]%
                \if@heads\thispagestyle{eheadings}\fi
                \markboth{\MakeUppercase\indexname}{\MakeUppercase\indexname}%
                \parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{5\p@}---\hspace*{2.5\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{5\p@}---\hspace*{5\p@}---\hspace*{2.5\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}


\newenvironment{thenameindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\freesection{\nameindexname}]%
                \if@heads\thispagestyle{eheadings}\fi
                \markboth{\MakeUppercase\indexname}{\MakeUppercase\indexname}%
                \parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\renewcommand\@idxitem{\par\hangindent 20\p@}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}


\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\def\SymbFoot#1{\@SymbFoot{\@nameuse {c@#1}}}
\def\@SymbFoot#1{\ifcase #1\or *\or **\or ***\or ****\or *****\or \textdagger\or \textdagger\textdagger\or \textdagger\textdagger\textdagger\or \textdagger\textdagger\textdagger\textdagger\or \textdagger\textdagger\textdagger\textdagger\textdagger\or \textdaggerdbl\or \textdaggerdbl\textdaggerdbl\or \textdaggerdbl\textdaggerdbl\textdaggerdbl\or \textdaggerdbl\textdaggerdbl\textdaggerdbl\textdaggerdbl\or \textdaggerdbl\textdaggerdbl\textdaggerdbl\textdaggerdbl\textdaggerdbl\@ctrerr  \fi}



\if@stdfoots
\else
    \@addtoreset{footnote}{page}
    \renewcommand\thefootnote{\@SymbFoot\c@footnote}
\fi


\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\nameindexname{Name Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\partitionname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\newcommand\appendixabbrev{A}
\newcommand\abstractname{Abstract}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{20\p@}
\setlength\footnotesep{20\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{amsmath,amsfonts,amssymb}


\def\Rot{\mathop{\operator@font rot}\nolimits}
\def\Grad{\mathop{\operator@font grad}\nolimits}
\def\PD#1#2{\frac{\partial #1}{\partial #2}}
\def\PDD#1#2{\frac{\partial^2 #1}{\partial #2^2}}
\def\defeq{\mathop{=}\limits^{\rm def}}
\def\Int{\mathop{\int}\limits_{-\infty}^{+\infty}}
\def\Iint{\mathop{\iint}\limits_{-\infty}^{+\infty}}
\def\sinc{\mathop{\operator@font sinc}\nolimits}
\def\lim{\mathop{\operator@font lim}\limits}
\def\abs#1{\mathop{\left|\ #1\ \right|}\nolimits}
\def\const{\mathop{\operator@font const}\nolimits}
\def\dg{^\circ}
\def\Ohm{\mathbf{\Omega}}
\def\iu{\mathtt{i}}
\def\en#1{\mathtt{e}^{#1}}
\def\chf#1{$\mathrm{#1}$}

\if@chap
    \newcommand{\freesection}[1]{\section*{#1}
    \if@heads\thispagestyle{eheadings}\fi%
    \addcontentsline{toc}{chapter}{#1}
    \markboth{\MakeUppercase{#1}}{\MakeUppercase{#1}}}
\else
    \newcommand{\freesection}[1]{\section*{#1}
    \if@heads\thispagestyle{eheadings}\fi%
    \addcontentsline{toc}{section}{#1}
    \markboth{\MakeUppercase{#1}}{\MakeUppercase{#1}}}
\fi


\newcommand{\nsection}[1]{\section*{#1}
    \if@heads\thispagestyle{eheadings}\fi%
    \addcontentsline{toc}{section}{#1}
    \markboth{\MakeUppercase{#1}}{\MakeUppercase{#1}}}

\newcommand{\nsubsection}[1]{\subsection*{#1}
    \if@heads\thispagestyle{eheadings}\fi%
    \addcontentsline{toc}{subsection}{#1}
    \markboth{\MakeUppercase{#1}}{\MakeUppercase{#1}}}



\def\Сyril#1{\@Cyril{\@nameuse {c@#1}}}
\def\@Cyril#1{\ifcase #1\or А\or Б\or В\or Г\or Д\or Е\or Ж\or З\or И\or Й\or К\or Л\or М\or
Н\or О\or П\or Р\or С\or Т\or У\or Ф\or Х\or Ц\or Ч\or Ш\or Щ\or Ы\or
Ю\or Э\or Я\else\@ctrerr  \fi
}

\def\cyril#1{\@cyril{\@nameuse {c@#1}}}
\def\@cyril#1{\ifcase #1\or а\or б\or в\or г\or д\or е\or ж\or з\or и\or й\or к\or л\or м\or
н\or о\or п\or р\or с\or т\or у\or ф\or х\or ц\or ч\or ш\or щ\or ы\or
ю\or э\or я\else\@ctrerr  \fi
}

\def\@afterheading{%
  \@nobreaktrue
  \everypar{%
    \if@nobreak
      \@nobreakfalse
      \clubpenalty \@M
      \if@afterindent \else
        {\setbox\z@\lastbox}%
      \fi
    \else
      \clubpenalty \@clubpenalty
      \everypar{}%
    \fi}}

\if@russify

    \frenchspacing
    \righthyphenmin=2

    % изменение определения из стилевого пакета amsmath
    \renewenvironment{subequations}{%
    \refstepcounter{equation}%
    \protected@edef\theparentequation{\theequation}%
    \setcounter{parentequation}{\value{equation}}%
    \setcounter{equation}{0}%
    \def\theequation{\theparentequation.\emph{\cyril{equation}}}%
    \ignorespaces
    }{%
    \setcounter{equation}{\value{parentequation}}%
    \ignorespacesafterend
    }

    \def\today{\number\day\space
                    \ifcase\month\or
                    января\or февраля\or марта\or апреля\or мая\or
                    июня\or июля\or августа\or сентября\or октября\or
                    ноября\or декабря\fi\space\number\year\space г.}

    \renewcommand{\partname}{Часть}
    \renewcommand{\partitionname}{Раздел}
    \renewcommand{\chaptername}{Глава}
    \renewcommand{\contentsname}{Оглавление}
    \renewcommand{\figurename}{Рисунок}
    \renewcommand{\tablename}{Таблица}
    \renewcommand{\appendixname}{Приложение}
    \renewcommand{\appendixabbrev}{П}
    \renewcommand{\refname}{Список литературы}
    \renewcommand{\bibname}{Список литературы}
    \renewcommand{\listtablename}{Список таблиц}
    \renewcommand{\listfigurename}{Список иллюстраций}
    \renewcommand{\abstractname}{Аннотация}
    \renewcommand{\indexname}{Предметный указатель}
    \renewcommand{\nameindexname}{Именной указатель}

    \def\tan{\mathop{\operator@font tg}\nolimits}
    \def\arctan{\mathop{\operator@font arctg}\nolimits}
    \def\cot{\mathop{\operator@font ctg}\nolimits}
    \def\tanh{\mathop{\operator@font th}\nolimits}
    \def\coth{\mathop{\operator@font cth}\nolimits}

    \renewcommand{\theenumii}{\cyril{enumii}}
    \renewcommand{\theenumiii}{\Roman{enumiii}}
\fi


\def\@seccntformat#1{\csname pre#1\endcsname\csname the#1\endcsname \csname post#1\endcsname}
\let\@Tocseccntformat\@seccntformat
\def\@postskip@{\hskip.25em\relax}
\def\postsection{\@postskip@}					%(Изменено:Лесовой) Нет точки после номера заголовка 1 уровня, было {.\@postskip@}
\def\postsubsection{\@postskip@}					%(Изменено:Лесовой) Нет точки после номера заголовка 2 уровня, было {.\@postskip@}
\def\postsubsubsection{\@postskip@}					%(Изменено:Лесовой) Нет точки после номера заголовка 3 уровня, было {.\@postskip@}
\def\postparagraph{.\@postskip@}
\def\postsubparagraph{.\@postskip@}
\def\presection{}
\def\presubsection{}
\def\presubsubsection{}
\def\preparagraph{}
\def\presubparagraph{}

% этот кусок кода нужен, чтобы точки ставились в оглавлении
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi

  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      \sloppy
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\@Tocseccntformat{#1}}%
      \fi
      #8}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\@Tocseccntformat{#1}}%
        \fi
        #8}}%
  \fi
  \@xsect{#5}}

\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      \sloppy
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}

\newcommand{\void}[1]{}

\newcommand{\epigraph}[2]{
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
  \begin{flushright} \parbox{0.5\textwidth}{\parindent=2em \emph{#1}}\\ \bigskip #2 \end{flushright}
  \if@tempswa\twocolumn\fi}

\newcommand{\dedication}[1]{\cleardoublepage
\vspace{5em}\begin{flushright}\parbox{0.5\textwidth}{\Large \emph{#1}}\end{flushright} \thispagestyle{empty}\cleardoublepage}

\newlength{\shirina}
\newlength{\raznost}
\newcommand{\markedpar}[1]{
\begin{flushleft}
\shirina=\textwidth
\settowidth{\raznost}{\vrule width 1pt\relax\hspace{1em}}
\addtolength{\shirina}{-2\raznost}
\noindent\hbox{%
\vrule width 1pt\relax\hspace{1em}\parbox{\shirina}{#1}}
\end{flushleft}}


\newcommand{\beautifulline}{
\begin{center}
\rule{0.1\textwidth}{.4pt}%
\raisebox{-.2pt}{\rule{0.15\textwidth}{.8pt}}%
\raisebox{-.4pt}{\rule{0.25\textwidth}{1.2pt}}%
\raisebox{-.2pt}{\rule{0.15\textwidth}{.8pt}}%
\rule{0.1\textwidth}{.4pt}%
\end{center}}


%\if@hlink
%    \usepackage[pdftex]{hyperref}
%    \hypersetup{
%        colorlinks=false,
%        linkcolor=black,
%        pdfpagemode=None,
%    }
%\fi

    \setlength{\topmargin}{-20mm}
    \setlength{\oddsidemargin}{0mm}
    \setlength{\evensidemargin}{-11mm}
    \setlength{\textwidth}{170mm}
    \setlength{\textheight}{265mm}
    \setlength{\hoffset}{0mm}


\if@erect
    \addtolength{\textwidth}{-10mm}
    \addtolength{\textheight}{-18mm}
    \addtolength{\oddsidemargin}{-2mm}
    \addtolength{\hoffset}{1mm}
\fi


\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
   {\null\ps@empty \newpage}\if@twocolumn{\null\ps@empty\newpage}\fi\fi\fi}

       \newcommand{\super}[1]{\raisebox{4pt}{\scriptsize #1}}
       \newcommand{\sub}[1]{\raisebox{-2pt}{\scriptsize #1}}

\if@ten
       \renewcommand{\super}[1]{\raisebox{3.5pt}{\scriptsize #1}}
       \renewcommand{\sub}[1]{\raisebox{-1.5pt}{\scriptsize #1}}
\fi
\if@eleven
       \renewcommand{\super}[1]{\raisebox{4pt}{\scriptsize #1}}
       \renewcommand{\sub}[1]{\raisebox{-1.5pt}{\scriptsize #1}}
\fi
\if@fourteen
       \renewcommand{\super}[1]{\raisebox{4.5pt}{\scriptsize #1}}
       \renewcommand{\sub}[1]{\raisebox{-2pt}{\scriptsize #1}}
\fi

\addto\captionsrussian{ 				%(Добавлено:Лесовой) Русские обозначения по ГОСТ
\def\figurename{Рисунок} %Рисунок
}
\addto\captionsrussian{ 				%(Добавлено:Лесовой) Русские обозначения по ГОСТ
\def\bibname{БИБЛИОГРАФИЧЕСКИЙ СПИСОК}
}
\addto\captionsrussian{ 				%(Добавлено:Лесовой) Русские обозначения по ГОСТ
\def\contentsname{ОГЛАВЛЕНИЕ}
}

\usepackage[lmargin=2.5cm,rmargin=1cm,tmargin=2cm,bmargin=2.6cm]{geometry}		%(Добавлено:Лесовой) Настройка размеров полей по ГОСТ 

\endinput
%%
%% End of file `report.cls'.
