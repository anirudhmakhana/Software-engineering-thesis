% Draft document class for King Mongkut’s Institute of Technology
% Ladkrabang theses, based on the 2019 Rev02 PDF specification.
%
% Peter Flynn, Silmaril Consultants, March 2023 <peter@silmaril.ie>
%
\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{mongkut-thesis}[2023/03/20 v0.1
  Thesis format for King Mongkut’s Institute of Technology Ladkrabang]
%\RequirePackage{fix-cm}
%\PassOptionsToPackage{svgnames}{xcolor}
\def\class@size{12pt}
\DeclareOption{12pt}{\def\class@size{12pt}}
\def\class@paper{a4paper}
\DeclareOption{a4paper}{\def\class@paper{a4paper}}
\DeclareOption{letterpaper}{\def\class@paper{letterpaper}}
\ProcessOptions\relax
\LoadClass[titlepage,oneside,12pt,a4paper]{report}
\RequirePackage{fontspec}%
\RequirePackage{lmodern}%
\setmainfont{TeX Gyre Termes}
\RequirePackage[a4paper,margin=1in,left=1.5in]{geometry}%
\RequirePackage{graphicx,calc,setspace,textcase,array}
\def\KMIT@advisor{No advisor given}
\newcommand{\advisor}[1]{\gdef\KMIT@advisor{#1}}
\def\KMIT@author{No author[s] given}
\renewcommand{\author}[1]{\gdef\@author{#1\\\relax}}
\newcounter{KMIT@authorno}
\def\processauthors#1=#2\\#3\sentinel{%
  \stepcounter{KMIT@authorno}%
  \theKMIT@authorno.&#1&#2\\
  \if\relax#3 \else
    \expandafter\processauthors#3\sentinel
  \fi
}%    1. Project Member’s Name Student ID: xxxxx
\def\listauthors#1=#2\\#3\sentinel{%
  #1\\
  \if\relax#3 \else
    \expandafter\listauthors#3\sentinel
  \fi
}%    1. Project Member’s Name Student ID: xxxxx
\newbox\KMIT@ackbox
\newenvironment{acknowledgement}{%
  \global\setbox\KMIT@ackbox=\vbox\bgroup
    \onehalfspacing\raggedright\parskip\baselineskip
}{
  \egroup
}%
\newbox\KMIT@abstractbox
\renewenvironment{abstract}{%
  \global\setbox\KMIT@abstractbox=\vbox\bgroup
    \onehalfspacing\raggedright\parskip\baselineskip
}{
  \egroup
}%
\newlength{\KMIT@titlespace}
\setlength{\KMIT@titlespace}{20pt + 96pt}
\newlength{\KMIT@authorspace}
\setlength{\KMIT@authorspace}{54pt + 96pt}
\def\KMIT@degree{Bachelor of Engineering in Software Engineering}
\def\KMIT@department{Department of Computer Engineering}
\def\KMIT@faculty{Faculty of Engineering}
\def\KMIT@name{King Mongkut’s Institute of Technology Ladkrabang}
\renewcommand\maketitle{%
  \begin{titlepage}%
    \typeout{Title page}%
    \vspace*{12pt}%
    \begin{center}%
      \vbox to\KMIT@titlespace{\centering
        \fontsize{20}{24}\selectfont\bfseries
        \@title
       \par\vfill}%
      \includegraphics[height=4cm]{mongkut-crest.png}%
      \vspace*{96pt}
      \vbox to\KMIT@authorspace{\centering
        \fontsize{18}{24}\selectfont
        \expandafter\listauthors\@author\sentinel
        \par\vfill}%
      \par
      \begingroup
        \fontsize{18}{24}\selectfont
        \KMIT@degree\\
        \KMIT@department\\
        \KMIT@faculty\\
        \KMIT@name\\
        Academic Year \the\year
        \par
      \endgroup
      \vfill
    \end{center}%
  \end{titlepage}%
    \pagestyle{empty}
    \setcounter{tocdepth}{3}
    \setcounter{secnumdepth}{0}
    \clearpage
    \null\vfill
    \begin{flushleft}
      \typeout{Copyright}%
      COPYRIGHT \the\year\\
      \MakeTextUppercase{\KMIT@faculty}\\
      \MakeTextUppercase{\KMIT@name}\\
    \end{flushleft}
    \clearpage
    \onehalfspacing
    \vspace*{12pt}%
    \begingroup\raggedright
    \typeout{Catalog entry}%
      \textbf{Thesis --- Academic Year \the\year}
      \par
      \KMIT@degree
      \par
      \KMIT@department
      \par
      \KMIT@name
      \par\bigskip
      \textbf{Title:} \@title
      \par\bigskip
      \textbf{Authors:}\par
      \begin{tabular}{@{}rl>{Student ID: }l@{}}
        \expandafter\processauthors\@author\sentinel
      \end{tabular}%
      \par\vfill
      \flushright
      \begin{minipage}{55mm}
        \centering
        Approved for submission
        \par\vspace{15mm}
        \dotfill
        \par\vspace{5mm}
        \KMIT@advisor\\
        Advisor
        \par\vspace{10mm}
        Date \dotfill/\dotfill/\dotfill
      \end{minipage}\par
    \endgroup
    \clearpage
    \vspace*{2in}%
    \begingroup
      \typeout{Acknowledgement}%
      \fontsize{20}{24}\selectfont\bfseries
      Acknowledgement
      \par
    \endgroup
    \vspace{1.5\baselineskip}%
    \copy\KMIT@ackbox
    \clearpage
    \vspace*{2in}%
    \begingroup
      \typeout{Abstract}%
      \fontsize{20}{24}\selectfont\bfseries
      Abstract
      \par
    \endgroup
    \vspace{1.5\baselineskip}%
    \copy\KMIT@abstractbox
    \clearpage
    \typeout{ToC, LoF, LoT}%
    \tableofcontents
    \listoffigures
    \listoftables
    \pagenumbering{arabic}
    \global\let\and\relax
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
}
