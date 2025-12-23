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
\newtheorem{hypothesis}{가설}
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
\RequirePackage{chngcntr} 

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

\renewcommand*\bibname{""}

% --- Section / Subsection : 제 n 장, 제 n 절 ---
% subsection 번호는 각 장 안에서 1,2,3... 으로만 가게
\counterwithin{section}{chapter}
\counterwithin{subsection}{section}
\titleformat{\chapter}[block]
  {\normalfont\Large\bfseries\centering}
  {제~\thechapter~장}{0.5em}{}
\titleformat{\section}[hang]
  {\normalfont\large\bfseries\raggedright}
  {제~\thesection~절}{0.5em}{}
\titleformat{\subsection}[hang]
  {\normalfont\normalsize\bfseries\raggedright}
  {제~\thesubsection~소절}{0.5em}{}
\titleformat{\subsubsection}[hang]
  {\normalfont\normalsize\bfseries\raggedright}
  {제~\thesubsubsection~관}{0.5em}{}
\renewcommand{\thesubsection}{\arabic{subsection}}
% --- 표 번호 : [표 section-counter] → 예: [표 1-1] ---
\renewcommand{\tablename}{표}

% 표 번호를 '장-번호' 형식으로
\counterwithin{table}{chapter}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}

% 캡션에 [표 1-1] 형식으로 출력
\DeclareCaptionLabelFormat{kor-tab}{[표~#2]}
\captionsetup[table]{labelformat=kor-tab,labelsep=space}

% --- 그림 번호 : [그림 counter] → 예: [그림 1], [그림 2] ---
\renewcommand{\figurename}{그림}
\renewcommand{\thefigure}{\arabic{figure}} % 기본이지만 명시

\DeclareCaptionLabelFormat{kor-fig}{[그림~#2]}
\captionsetup[figure]{labelformat=kor-fig,labelsep=space}
% 목차 / 표 목차 / 그림 목차 설정 -------------------
\RequirePackage{tocloft}

% --- 목차 제목 ---
\renewcommand{\contentsname}{목\qquad 차}
\renewcommand{\cfttoctitlefont}{\hfil\bfseries\Large}
\renewcommand{\cftaftertoctitle}{\hfil}

% 들여쓰기/번호 폭 (필요하면 조정)
\setlength{\cftchapindent}{0pt}
\setlength{\cftchapnumwidth}{4em}
\setlength{\cftsecindent}{2em}
\setlength{\cftsecnumwidth}{4em}
% 표 목차 들여쓰기/번호폭
\setlength{\cfttabindent}{0pt}
\setlength{\cfttabnumwidth}{4em} % 폭은 필요에 따라 조정

% 그림 목차 들여쓰기/번호폭
\setlength{\cftfigindent}{0pt}
\setlength{\cftfignumwidth}{4em} % 이것도 적당히 조정

% 목차에서 섹션 번호: "제 1 장"
\renewcommand{\cftchappresnum}{제~}
\renewcommand{\cftchapaftersnum}{~장\ }

% 목차에서 섭섹션 번호: "제 1 절"
\renewcommand{\cftsecpresnum}{제~}
\renewcommand{\cftsecaftersnum}{~절\ }

% --- 표 목차 ---
\renewcommand{\listtablename}{\qquad\qquad\quad 표\qquad 목차}
\renewcommand{\cftlottitlefont}{\hfil\bfseries\Large}
\renewcommand{\cftafterlottitle}{\hfil}
% [표 1-1] 형식
\renewcommand{\cfttabpresnum}{\bfseries[표~}
\renewcommand{\cfttabaftersnum}{\bfseries]\ }

% --- 그림 목차 ---
\renewcommand{\listfigurename}{\qquad\qquad\quad 그림\qquad 목차}
\renewcommand{\cftloftitlefont}{\hfil\bfseries\Large}
\renewcommand{\cftafterloftitle}{\hfil}
% [그림 1] 형식
\renewcommand{\cftfigpresnum}{\bfseries[그림~}
\renewcommand{\cftfigaftersnum}{\bfseries]\ }

% Helper: unnumbered front-matter chapter with TOC entry
\newcommand{\frontchapter}[1]{%
  \chapter*{#1}%
  \addcontentsline{toc}{chapter}{#1}%
}