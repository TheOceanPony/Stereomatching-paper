\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{ConfFTI}[2018/04/16]
\LoadClass[twocolumn, oneside]{article}
%=============================== DeclareOption =======================================
\DeclareOption{incollection}{%
	\pagestyle{empty}
}

\DeclareOption{alone}{%
	\pagestyle{plain}
}

\DeclareOption{regform}{%
	\pagestyle{empty}
	\def\@regformcheck{1}
	\let\finishauthors\@empty
}

\ExecuteOptions{incollection}
\ProcessOptions\relax
\ifdefined\@regformcheck\relax\else\def\@regformcheck{0}\fi
%======================================================================================
\renewcommand{\@biblabel}[1]{#1.}
%======================================================================================
\RequirePackage[%
	a4paper,%
	footskip=1cm,%
	headsep=0.3cm,%
	top=2cm, %поле сверху
	bottom=2cm, %поле снизу
	left=2cm, %поле ліворуч
	right=2cm, %поле праворуч
]{geometry}
%======================================================================================
\RequirePackage[colorlinks=false,
	urlcolor = blue, %Colour for external hyperlinks
	linkcolor  = red, %Colour of internal links
	citecolor  = green, %Colour of citations
	bookmarks,
	bookmarksnumbered=true,
	breaklinks=true,
	unicode,
	linktoc = all,
	hypertexnames=false,
	]{hyperref}
		\AtBeginDocument{
		\hypersetup{
			pdfinfo={
			%Author={\@authortoPDFfile},
			Title={\@title},
			}
		}
	}
%====================================================================================================
\RequirePackage{cmap}
\RequirePackage[T2A,T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,russian,ukrainian]{babel}
%\RequirePackage{misccorr}
\let\phi\varphi
\let\epsilon\varepsilon
\g@addto@macro\bfseries{\boldmath} % ---  в назві статті математичні символи також будуть жирними
\renewcommand{\sfdefault}{fos}
\renewcommand{\bfdefault}{b}
\RequirePackage{textcase}
%=====================================================================================================
\RequirePackage[protrusion=true, expansion, tracking=true, kerning=true]{microtype}
\RequirePackage[keeplastbox]{flushend}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}	
\RequirePackage{textcomp}
\RequirePackage{graphicx}

%%===================== Верстка списків ===================%%
%%                                                         %%
\RequirePackage{enumitem}
\def\labelenumi{\theenumi)}
\def\theenumii{\alph{enumii}}
\def\labelenumii{\theenumii)}
\def\p@enumii{\theenumi}
\def\labelenumiii{{\bf--}}
\let\theenumiii\relax
\def\p@enumiii{\theenumi\theenumii}
\setlist{nolistsep}
%%                                                         %%
%%=========================================================%%

%%========== Підписи під таблицями та рисунками ===========%%
%%                                                         %%
\def\tabcaption{\def\@captype{table}\caption}
\def\figcaption{\def\@captype{figure}\caption}
\RequirePackage{subfig}
\renewcommand\thesubfigure{\alph{subfigure}}
\RequirePackage[labelsep=period]{caption}
%%                                                         %%
%%=========================================================%%

%%============== Для сумісності із минулими версіями ======%%
\ifdefined\balance
\relax
\else
\let\balance\relax
\fi
%%================ Назви, залежні від мови =================%%
%%                                                          %%
\let\@afterindentfalse\@afterindenttrue
\@afterindenttrue
\newcommand{\langdepmacro}[4]{%
    \newcommand{#1}{%
        \iflanguage{ukrainian}{#2}{%
        \iflanguage{russian}{#3}{%
        \iflanguage{english}{#4}{}%
        }}%
    }%
}
\langdepmacro{\keyname}{Ключові слова}{Ключевые слова}{Keywords}
\langdepmacro{\pacsname}{PACS номери}{PACS номера}{PACS numbers}
\langdepmacro{\udcname}{УДК}{УДК}{UDC}
\langdepmacro{\ntuu}%
{Національний технічний університет України \protect\par <<Київський політехнічний інститут  імені Ігоря Сікорського>>}%
{Национальный технический университет Украины \protect\par <<Киевский политехнический институт имени Игоря Сикорского>>}%
{National Technical University of Ukraine <<Igor Sykorsky Kyiv Polytechnic Institute>>}

\langdepmacro{\ipt}%
{Фізико-технічний інститут}%
{Физико-технический институт}%
{Institute of Physics and Technology}
\def\ntuuipt{\ntuu, \protect\par\ipt}%

\addto\captionsrussian{%
\def\refname{Перечень использованных источников}%
}
\addto\captionsukrainian{%
\def\refname{Перелік використаних джерел}%
}
\addto\captionsenglish{%
\def\refname{References}%
}

\addto\captionsenglish{%
\def\figurename{Fig.}%
}

\addto\captionsrussian{%
\def\tablename{Табл.}%
}

\addto\captionsukrainian{%
\def\tablename{Табл.}%
}
%%=========================================================%%
\let\@pacsprint\@empty
\let\@udcprint\@empty
\let\@keywordprint\@empty
\def\pacs#1{%
	\if\relax\detokenize{#1}\relax
		\else
			\def\@pacsprint{\pacsname:\hskip1ex#1}
	\fi
}
\def\udc#1{%
	\if\relax\detokenize{#1}\relax
		\else
			\def\@udcprint{\udcname\hskip1ex#1}
	\fi
}
\def\keywords#1{%
	\if\relax\detokenize{#1}\relax
		\else
			\def\@keywordPDFprint{#1}
			\def\@keywordprint{{\itshape\keyname}:\,#1\par}
	\fi
}
%%=================== Реєстраційна форма ===================%%
%%                                                          %%

\def\FullName#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@FullNamePrint{#1}
	\fi
}

\def\Birthday#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@BirthdayPrint{#1}
	\fi
}

\def\Position#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@PositionPrint{#1}
	\fi
}


\def\phone#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@phonePrint{#1}
	\fi
}

\def\confsection#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@confsectionPrint{#1}
	\fi
}

\def\copynum#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@copynumPrint{#1}
	\fi
}

\def\NeedLiving#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@NeedLivingPrint{#1}
	\fi
}

\def\NeedInvitation#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@NeedInvitationPrint{#1}
	\fi
}

\def\authoremail#1{%
	\if\relax\detokenize{#1}\relax
	\else
		\def\@emailPrint{#1}
		\def\email{#1}
	\fi
}

\newcommand\papertitle{}% initialize
\newcommand\paperauthors{}% initialize
\newcommand{\thispapertitle}[1]{\renewcommand\papertitle{#1}}
\newcommand{\thispaperauthor}[2]{%
	\g@addto@macro\paperauthors{#1}%
	\ifx#2\finishauthors
	% no more authors
	\else
	\g@addto@macro\paperauthors{, }%
	\expandafter\thispaperauthor % reinsert the swallowed token
	\fi
}

%======== Генерування .tex-файлу реєстраційної форми =========

\IfFileExists{\jobname.dat}{\input{\jobname.dat}}{}
\def\@regformname{Реєстраційна форма учасника-доповідача}
\newwrite\regformfile
\begingroup
\catcode`?=0 \catcode`\\=12
?endlinechar=`^^J
?gdef?writeregformfile#1{%
	?immediate?openout?regformfile=regform_#1.tex%
	?immediate?write?regformfile{%
\documentclass[regform, onecolumn]{ConfFTI}
\usepackage{array}
\usepackage[version=4]{mhchem}
\let\NoCaseChange\relax
\begin{document}
	\pagestyle{empty}
	\begin{center}{\Large\bfseries ?unexpanded?expandafter{?@regformname}\\}
	\bigskip
		\begin{tabular}{{|>{\raggedright\arraybackslash}p{.3\textwidth}|p{.6\textwidth}|}}
			\hline
			?unexpanded{ПІБ}                                                                     & ?ifdefined?@FullNamePrint?unexpanded?expandafter{?@FullNamePrint}?fi             \\ \hline
			?unexpanded{Дата народження (дд.мм.рр)}                                              & ?ifdefined?@BirthdayPrint?unexpanded?expandafter{?@BirthdayPrint}?fi             \\ \hline
			?unexpanded{Установа}                                                                & ?unexpanded?expandafter{?@affiliationfirstauthor}                                \\ \hline
			?unexpanded{Назва доповіді}                                                          & ?unexpanded?expandafter{?@title}                                                 \\ \hline
			?unexpanded{Автори}                                                                  & ?unexpanded?expandafter{?paperauthors}                                           \\ \hline
			?unexpanded{Секція}                                                                  & ?ifdefined?@confsectionPrint?unexpanded?expandafter{?@confsectionPrint}?fi       \\ \hline
			?unexpanded{Посада}                                                                  & ?ifdefined?@PositionPrint?unexpanded?expandafter{?@PositionPrint}?fi             \\ \hline
			?unexpanded{Мобільний телефон}                                                       & ?ifdefined?@phonePrint?unexpanded?expandafter{?@phonePrint}?fi                   \\ \hline
			?unexpanded{E-mail}                                                                  & ?ifdefined?@emailPrint?unexpanded?expandafter{?@emailPrint}?fi                   \\ \hline
			?unexpanded{Кількість примірників матеріалів}                                        & ?ifdefined?@copynumPrint?unexpanded?expandafter{?@copynumPrint}?fi               \\ \hline
			?unexpanded{Потреба в житлі (Ні/Хостел/Готель/інше) \protect\par та дати бронювання} & ?ifdefined?@NeedLivingPrint?unexpanded?expandafter{?@NeedLivingPrint}?fi         \\ \hline
			?unexpanded{Необхідність запрошення (Так/Ні)}                                        & ?ifdefined?@NeedInvitationPrint?unexpanded?expandafter{?@NeedInvitationPrint}?fi \\ \hline
		\end{tabular}
		\end{center}
\end{document}
}%
}%
?endgroup%

%%================ Висячі строки та вдови ==================%%
%%                                                          %%
\clubpenalty =10000
\widowpenalty=10000
\finalhyphendemerits=10000

%================== Відступи в формулах ====================%%
\g@addto@macro\normalsize{%
	\setlength\abovedisplayskip{1ex}
	\setlength\belowdisplayskip{1ex}
	\setlength\abovedisplayshortskip{1ex}
	\setlength\belowdisplayshortskip{1ex}
}

%============ Відступ між написом та рисунком ==============%%
\setlength{\textfloatsep}{5pt}

%%============= Підписи до рисунку (розмір тексту)==========%%
%\captionsetup[figure]{font=small,labelfont=small}
%\captionsetup[table]{font=small,labelfont=small}

%%============ Bibliography spacing ========================%%
\newlength{\bibitemsep}\setlength{\bibitemsep}{.1\baselineskip plus .05\baselineskip minus .05\baselineskip}
\newlength{\bibparskip}\setlength{\bibparskip}{0pt}
\let\oldthebibliography\thebibliography
\renewcommand\thebibliography[1]{%
  \oldthebibliography{#1}%
  \setlength{\parskip}{\bibitemsep}%
  \setlength{\itemsep}{\bibparskip}%
}

%%=================== Заголовки секцій =====================%%
%%                                                          %%
\def\@seccntformat#1{\csname the#1\endcsname.\enskip}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-2ex \@plus -1ex \@minus -.2ex}%
                                   {1.3ex \@plus.2ex}%
                                   {\normalfont\large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
	                                 {\normalfont\large\bfseries}}
\let\@abstract\@empty
\renewcommand{\abstract}[1]{\gdef\@abstract{%
\begingroup
#1
\endgroup
}}
\date{}
\renewcommand{\@maketitle}{%
  \newpage
  \ifx\@pacsprint\@empty\@udcprint
	  \else
		 \ifx\@udcprint\@empty\@pacsprint
		 \else
			  \@pacsprint \\
			  \@udcprint
		 \fi	
  \fi
  \nopagebreak
  \null
  \vskip 1em%
  \begin{center}%
  \let \footnote \thanks
    {\Large\bfseries\sffamily\MakeTextUppercase{\@title}\par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{center}%
        \@author
      \end{center}\par}%
    \vskip 1ex%
    {\@affiliation}%
  \end{center}%
  }
\renewcommand\maketitle{\par
\begingroup
\iflanguage{ukrainian}{\renewcommand\thefootnote{\itshape\alph{footnote}}}{%
\iflanguage{russian}{\renewcommand\thefootnote{\itshape\asbuk{footnote}}}{%
\iflanguage{english}{\renewcommand\thefootnote{\itshape\alph{footnote}}}{}%
}
}
%\renewcommand\thefootnote{\itshape\asbuk{footnote}}%\@fnsymbol\c@footnote}%
%    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
%    \long\def\@makefntext##1{\parindent 1em\noindent
%            \hb@xt@1.8em{%
%                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
                \noindent\hrulefill\vspace*{-2ex}
                \section*{\abstractname}
                %{\noindent\large\bfseries\abstractname\par\vskip1em}
                \noindent\small\@abstract
                \par
                \vskip1em
	            \noindent\@keywordprint
                \smallskip\noindent\hrulefill\medskip
      \else
        \twocolumn[\@maketitle
                \noindent\hrulefill\vspace*{-2ex}
                \section*{\abstractname}
                %{\noindent\large\bfseries\abstractname\par\vskip1em}
                \noindent\small\@abstract
                \par
                \vskip1em
              \noindent\@keywordprint
              \smallskip\noindent\hrulefill\bigskip
        ]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    %\thispagestyle{empty}
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
%\renewcommand\maketitle{
%\twocolumn[
%	\@maketitle
%        \thispagestyle{empty}
%        \noindent\hrulefill\vspace*{-2ex}
%        \section*{\abstractname}
%        %{\noindent\large\bfseries\abstractname\par\vskip1em}
%        \noindent\small\@abstract
%        \par
%        \vskip1em
%      \noindent\@keywordprint\par
%      \smallskip\noindent\hrulefill\bigskip
%]
%}

\let\@authortofile\@empty
\newcounter{i}
\setcounter{i}{0}
\def\@separatora{\def\@separatora{, }}% Delay comma once
\let\email\@empty
\newcommand{\addauthor}[3][]{%
  \if\relax\detokenize{#1}\relax
      \g@addto@macro\@author{\@separatora#2\textsuperscript{#3}}    		      	
  \else
	  \g@addto@macro\@author{\@separatora#2\if\relax\detokenize{#3}\relax\else\textsuperscript{#3\@separatora\hskip-0.5ex}\fi\thanks{#1}}
  \fi	
  \g@addto@macro\@authortofile{\@separator#2}
}

\let\@affiliation\@empty
\def\affiliation#1#2{%
  \g@addto@macro\@affiliation{\par\textsuperscript{#2}{\itshape#1}\smallskip}
  \ifnum#2=1\def\@affiliationfirstauthor{#1}\fi
}
%%=================== ВФайлові операції ====================%%
%%                                                          %%

\def\process@authors{\expandafter{\@authortofile\@separator!}}
\def\@separator#1\@separator#2{%
\immediate\write\titleauthorfile{%
     \string\thispaperauthor{\unexpanded{#1}}}%
\ifx!#2%
\else
 \expandafter\@separator\expandafter#2%
\fi
}%
\newwrite\titleauthorfile
\newcommand\writedatatofile[1]{%
  \immediate\openout\titleauthorfile=#1.dat
  \immediate\write\titleauthorfile{%
     \string\thispapertitle{\unexpanded\expandafter{\@title}}}%
  \process@authors
  \immediate\write\titleauthorfile{\string\finishauthors}%%%
  \immediate\closeout\titleauthorfile
}
%=============================================================%%
\let\author\addauthor
%%============================================================%%
\input{glyphtounicode}
\pdfgentounicode=1
%\AtEndDocument{%
%	\ifdim\pagetotal<.75\pagegoal%
%	\ClassError{ConfIPT}{The last page filled less than 3/4}{Please, fill the page}
%	\fi
%}
\AtBeginDocument{%
	\@ifpackageloaded{fullpage}{%
		\ClassError{ConfIPT}{You Are using unwanted package fullpage}{Remove \string\usepackage\{fullpage\}}
		\stop
		}{}
	\ifnum\@regformcheck=1\relax\else{%	
	\writedatatofile{\jobname}
	\writeregformfile{\jobname}
	}
	\fi
	}
\def\PaperLanguage#1{
	\selectlanguage{#1}
	\maketitle
	}
\endinput
