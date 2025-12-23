\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesistemp_en}[2025/12/23 SNU Thesis Class (report-based)]

% Pass any unknown options to the base class (report)
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}%
}
\ProcessOptions\relax

% Load base class (chapter enabled)
\LoadClass{report}

% Page layout
\RequirePackage[
  papersize={188mm, 257mm},
  left=30mm,right=30mm,
  top=20mm,bottom=30mm,
  headheight=15mm, footskip=15mm]{geometry}

% Font and spacing
\RequirePackage{fontspec}
\setmainfont{NotoSerifKR}[
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Regular,
  ItalicFeatures = {FakeSlant=0.2}
]
\RequirePackage{luatexko}
\setmainhangulfont{NotoSerifKR}[
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Regular,
  ItalicFeatures = {FakeSlant=0.2}
]
\hangulpunctuations=0
\RequirePackage{setspace}
% You can adjust line spacing in the document body:
% \onehalfspacing or \doublespacing

% Mathematics
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{xpatch}
% Code to remove the dot
\makeatletter
\xpatchcmd{\@thm}{\thm@headpunct{.}}{\thm@headpunct{:}}{}{}
\makeatother
% Code to make hypothesis
\newtheorem{hypothesis}{Hypothesis}
% \begin{hypothesis}[put any keyword in parenthesis]
% ...
% \end{hypothesis}
\RequirePackage{mathtools}
\RequirePackage{microtype}

% Graphics and figures
\RequirePackage{graphicx}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{tikz}
\usetikzlibrary{decorations.pathmorphing,positioning,arrows.meta,calc,shapes.geometric,cd}
\RequirePackage{pdflscape}
\RequirePackage{afterpage} 
\RequirePackage{rotating}
\RequirePackage{float}
\RequirePackage{adjustbox}

% Tables
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage{colortbl}
\RequirePackage[flushleft]{threeparttable}
\RequirePackage{longtable}

% Captions
\RequirePackage[labelfont=bf]{caption}
\RequirePackage{subcaption}

% Lists
\RequirePackage{enumitem}
% \begin{enumerate}[label = (\arabic*);\arabic*.;\Roman.;\textbullet;\textasteriskcentered]
% ...
% \end{enumerate}

% Section title centering
% Section title formatting: display as 'Chapter <number> <title>' and center
\RequirePackage{titlesec}
\titleformat{\chapter}[block]
  {\normalfont\Large\bfseries\centering}
  {Chapter~\thechapter}{0.5em}{}
\titleformat{\section}[hang]
  {\normalfont\Large\bfseries\raggedright}
  {\thesection}{0.5em}{}
\titleformat{\subsection}[hang]
  {\normalfont\large\bfseries\raggedright}
  {\thesubsection}{0.5em}{}
\titleformat{\subsubsection}[hang]
  {\normalfont\normalsize\bfseries\raggedright}
  {\thesubsubsection}{0.5em}{}
\RequirePackage{tocloft}
\renewcommand{\cftchappresnum}{Chapter~}
\renewcommand{\cftchapaftersnum}{~.}
\setlength{\cftchapindent}{0pt}
\setlength{\cftchapnumwidth}{6em}
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\cfttoctitlefont}{\hfil\bfseries\Large}
\renewcommand{\cftaftertoctitle}{\hfil}
\setlength{\cfttabindent}{0pt}
\setlength{\cfttabnumwidth}{6em}
\renewcommand{\listtablename}{\qquad\qquad\quad List of Tables}
\renewcommand{\cftlottitlefont}{\hfil\bfseries\Large}
\renewcommand{\cftafterlottitle}{\hfil}
\renewcommand{\cfttabpresnum}{\bfseries Table~}
\renewcommand{\cfttabaftersnum}{\bfseries . }
\setlength{\cftfigindent}{0pt}
\setlength{\cftfignumwidth}{6em}
\renewcommand{\listfigurename}{\qquad\qquad\quad List of Figures}
\renewcommand{\cftloftitlefont}{\hfil\bfseries\Large}
\renewcommand{\cftafterloftitle}{\hfil}
\renewcommand{\cftfigpresnum}{\bfseries Figure~}
\renewcommand{\cftfigaftersnum}{\bfseries . }

% Colored boxes
\RequirePackage{tcolorbox}

% Header/footer
\RequirePackage{fancyhdr}
\RequirePackage[hang,flushmargin]{footmisc}
\pagestyle{plain}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Bibliography
\RequirePackage[authoryear, round]{natbib}
\bibliographystyle{apalike_nd}
% Make unidentified dates in citation to be displayed in n.d.

% Hyperlinks (load after most packages)
\RequirePackage{xurl} 
% Enable hypenation in URL links
\RequirePackage[hidelinks, colorlinks=true, linkcolor=black, urlcolor=Mahogany, citecolor=Mahogany, breaklinks=true, pagebackref=true]{hyperref}
\RequirePackage{bookmark}

% Adjustments
\setlength\emergencystretch{1em}
% Redefine footnote size
\renewcommand{\footnotesize}{\fontsize{9}{11}\selectfont}

\renewcommand{\floatpagefraction}{1}  

% Avoid undefined conditional in titlepage
\providecommand{\thesiskorean}{}

% Helper: unnumbered front-matter chapter with TOC entry
\newcommand{\frontchapter}[1]{%
  \chapter*{#1}%
  \addcontentsline{toc}{chapter}{#1}%
}

\renewcommand*\contentsname{Table of Contents}
\renewcommand*\bibname{Bibliography}