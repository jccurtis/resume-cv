%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% BASED ON:
%
% Friggeri Resume/CV
% XeLaTeX Template
% Version 1.0 (5/5/13)
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% Original author:
% Adrien Friggeri (adrien@friggeri.net)
% https://github.com/afriggeri/CV
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
% Important notes:
% This template needs to be compiled with XeLaTeX and (opt) biber.
% Font awesome needs to be installed locally:
% http://tex.stackexchange.com/questions/132888/fontawesome-font-not-found
% http://fortawesome.github.io/Font-Awesome/
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{black} %black
  \colorlet{orange}{black}
  \colorlet{purple}{black}
  \colorlet{brown}{black}
  \colorlet{red}{black}
  \colorlet{blue}{black}
  \colorlet{fillheader}{white}
  \colorlet{header}{black}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{black}
\colorlet{headercolor}{black}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont[]{Helvetica Neue}
\newfontfamily\medfont[]{Helvetica Neue Light}
\newfontfamily\thinfont[]{Helvetica Neue UltraLight}
\newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}

%\setmathfont{XITS Math}



%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{fontawesome}


\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[9]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [rectangle, anchor=north west, minimum width=\textwidth, minimum height=2.5cm] (textbox) at ($(box.north west)+(1.5cm, -1.5cm)$){};
    \node [anchor=north west, inner sep=0pt] (name) at (textbox.north west) {%
        \fontsize{40pt}{72pt}\color{header}%
        {\thinfont #1}{\thinfont  #2}
    };
    \node [anchor=north west, inner sep=0pt] (title) at ($(name.south west)+(0, 0)$) {%
        \fontsize{18pt}{24pt}\color{header}%
        \medfont #3%
    };
    \node [anchor=north west, inner sep=0pt] (topics) at ($(title.south west)+(0, -2pt)$) {%
        \fontsize{10pt}{24pt}\color{header}%
        \medfont #4%
    };
    \node [anchor=north east, inner sep=0pt] (line0) at (textbox.north east) {%
        \fontsize{10pt}{20pt}\color{header}%
        \medfont #5%
    };
    \node [anchor=north east, inner sep=0pt] (line1) at ($(line0.south east)-(0, 2pt)$) {%
        \fontsize{10pt}{14pt}\color{header}%
        \medfont #6%
    };
    \node [anchor=north east, inner sep=0pt] (line2) at ($(line1.south east)-(0, 2pt)$) {%
        \fontsize{10pt}{14pt}\color{header}%
        \medfont #7%
    };
    \node [anchor=north east, inner sep=0pt] (line3) at ($(line2.south east)-(0, 2pt)$) {%
        \fontsize{10pt}{14pt}\color{header}%
        \medfont #8%
    };
    \node [anchor=north east, inner sep=0pt] (line4) at ($(line3.south east)-(0, 2pt)$) {%
        \fontsize{10pt}{14pt}\color{header}%
        \medfont #9%
    };

  \end{tikzpicture}
  \vspace{2cm}
  \vspace{-2\parskip}
}

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \renewcommand*{\arraystretch}{0.7}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{15.5cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=black} #3}\\%Color=lightgray
    #4\vspace{\parsep}%
  }\\}
\newcommand{\entrymin}[3]{%
  #1&\parbox[t]{15.5cm}{%
    #2%
    \hfill%
    {\footnotesize\addfontfeature{Color=black} #3\vspace{\parsep}}
  }\\}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=1.5cm,top=2cm,right=1.5cm,bottom=1.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}