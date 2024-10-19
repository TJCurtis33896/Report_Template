%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{projectUpdate}[2024-04-02 Tapani Project Update]

\usepackage{etoolbox} % Required for conditional logic and easily changing commands

\newtoggle{unnumberedsections} % Create toggle for a class option
\settoggle{unnumberedsections}{false} % Default value for the class option
\DeclareOption{unnumberedsections}{\settoggle{unnumberedsections}{true}} % Set the class option toggle if the class option was used in the template

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any extra options specified to the base class
\ProcessOptions\relax % Process class options

\LoadClass{article} % Load the base class

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage{graphicx}                           % Required for including images
\graphicspath{{Images/}{./}}                    % Specifies where to look for included images
\setlength{\parindent}{0pt}                     % Paragraph indentation
\setlength{\parskip}{10pt}                      % Vertical space between paragraphs
\usepackage[bottom, hang]{footmisc}             % Force footnotes to the bottom of the page and to the left margin
\setlength{\footnotemargin}{6pt}                % Horizontal space between the footnote marker and text
\usepackage[document]{ragged2e}                 % Left align all text in the document (i.e., have a ragged right margin)
\usepackage{lastpage}                           % Required to determine the total number of pages
\AtBeginEnvironment{quote}{\itshape\rmfamily}   % Style quotations
\usepackage{appendix}                           % Required for the appendices section
\usepackage{float}                              % Allows more precisely positioning floats e.g., \begin{figure}[H]
\usepackage{tabularray}                         % Required for tables
\usepackage{xcolor}                             % Provides color support
\usepackage[]{pdfpages}                         % Allows inclusion of PDF documents
\usepackage[normalem]{ulem}                     % Provides support for underlining and other text decorations
\usepackage[en-GB]{datetime2}                   % Provides date formatting
\DTMlangsetup[en-GB]{ord=level}                 % Sets up date formatting
\usepackage{chngcntr}                           % Allows for counter manipulation
\counterwithin*{section}{part}                  % Resets section counter within each part
\usepackage{booktabs}                           % Enhances tables
\usepackage{rotating}                           % Allows rotation of tables and figures
\usepackage{pdflscape}                          % Allows landscape pages
\usepackage{tcolorbox}                          % Provides colored boxes
\usepackage{nameref}

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\usepackage[
    top=2.5cm, % Top margin
    bottom=2.5cm, % Bottom margin
    left=2cm, % Left margin
    right=2cm, % Right margin
    footskip=1.5cm, % Space from the bottom margin to the baseline of the footer
    headsep=0.8cm, % Space from the top margin to the baseline of the header
    headheight=22.6pt, % Height of the header
    %showframe % Uncomment to show frames around the margins for debugging purposes
]{geometry}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters
\usepackage{mathpazo} % Use Palatino for math
\usepackage{lmodern}

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

\usepackage{fancyhdr} % Required for customizing headers and footers
\pagestyle{fancy} % Enable custom headers and footers

\def\partName{}

\fancypagestyle{main}{
    \fancyhf{} % Clear default headers/footers
    \fancyhead[L]{\partName \hspace{1pt} | \currentname}
    \fancyhead[C]{} % Center header
    \fancyhead[R]{\rightheadercontent} % Right header
    \fancyfoot[L]{\reporttitle} % Left footer
    \fancyfoot[C]{} % Center footer
    \fancyfoot[R]{Page | \thepage~of \pageref*{LastPage}} % Right footer
    \renewcommand{\headrulewidth}{0.5pt}
    \renewcommand{\footrulewidth}{0.5pt}
}

\fancypagestyle{plain}{% Redefine ``plain'' style for chapter boundaries
    \fancyhf{} % clear all header and footer fields  
    \fancyhead[L]{} % Left header
    \fancyhead[C]{} % Center header
    \fancyhead[R]{} % Right header
    \fancyfoot[L]{} % Left footer
    \fancyfoot[C]{} % Center footer
    \fancyfoot[R]{Page | \thepage~of \pageref*{LastPage}} % Right footer  
    \renewcommand{\headrulewidth}{0.0pt}
    \renewcommand{\footrulewidth}{0.5pt}
}

\fancypagestyle{fmatter}{% Redefine ``plain'' style for chapter boundaries
    \fancyhf{} % clear all header and footer fields  
    \fancyhead[L]{} % Left header
    \fancyhead[C]{} % Center header
    \fancyhead[R]{} % Right header
    \fancyfoot[L]{} % Left footer
    \fancyfoot[C]{\thepage} % Center footer
    \fancyfoot[R]{} % Right footer  
    \renewcommand{\headrulewidth}{0.0pt}
    \renewcommand{\footrulewidth}{0.0pt}
}

\fancypagestyle{bmatter}{
    \fancyhf{} % Clear default headers/footers
    \fancyhead[L]{} % Left header
    \fancyhead[C]{} % Center header
    \fancyhead[R]{} % Right header
    \fancyfoot[L]{} % Left footer
    \fancyfoot[C]{} % Center footer
    \fancyfoot[R]{Page | \thepage~of \pageref*{LastPage}} % Right footer
    \renewcommand{\headrulewidth}{0.0pt}
    \renewcommand{\footrulewidth}{0.5pt}
}

%----------------------------------------------------------------------------------------
%	SECTIONS
%----------------------------------------------------------------------------------------

\usepackage{titlesec, blindtext, color} % Required for modifying sections

\definecolor{gray75}{gray}{0.75}
\newcommand{\hsp}{\hspace{5pt}}

\iftoggle{unnumberedsections}{ % Conditional logic for the unnumbered sections class options
    \setcounter{secnumdepth}{0} % Don't number sections at any level
}{
    \setcounter{secnumdepth}{3} % Number sections down to subsubsections
}

%------------------------------------------------

\titleformat
{\section} % Section type being modified
[hang] % Section layout type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
{\Large\bfseries} % Text formatting of the whole section, i.e. label and title
{\thesection\hsp\textcolor{gray75}{|}\hsp}
{0pt}
{\Large\bfseries}

\titlespacing*{\section}{0pt}{\baselineskip}{4pt} % Spacing around section titles, the order is: left, before and after

%------------------------------------------------

\titleformat
{\subsection} % Section type being modified
[block] % Section layout type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
{\raggedright\large\bfseries\underline} % Text formatting of the whole section, i.e. label and title
{\thesubsection} % Section label (e.g. number) and its formatting
{5pt} % Horizontal space between the section label and title
{} % Code before the section title
[] % Code after the section title

\titlespacing*{\subsection}{0pt}{0.75\baselineskip}{4pt} % Spacing around section titles, the order is: left, before and after

%------------------------------------------------

\titleformat
{\subsubsection} % Section type being modified
[block] % Section layout type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
{\raggedright\bfseries\normalsize} % Text formatting of the whole section, i.e. label and title
{\thesubsubsection} % Section label (e.g. number) and its formatting
{5pt} % Horizontal space between the section label and title
{} % Code before the section title
[] % Code after the section title

\titlespacing*{\subsubsection}{0pt}{0.5\baselineskip}{0pt} % Spacing around section titles, the order is: left, before and after

%------------------------------------------------

\titleformat
{\paragraph} % Section type being modified
[runin] % Section layout type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
{\bfseries} % Text formatting of the whole section, i.e. label and title
{} % Section label (e.g. number) and its formatting
{0pt} % Horizontal space between the section label and title
{} % Code before the section title
[~~~~] % Code after the section title

\titlespacing*{\paragraph}{0pt}{0pt}{0pt} % Spacing around section titles, the order is: left, before and after

%------------------------------------------------

% Adds page number to PDFs
\def\fillandplacepagenumber{
    \par
    \pagestyle{empty}
    \vbox to 0pt{\vss}\vfill
    \vbox to 0pt{\baselineskip0pt
            \hbox to\linewidth{\hss}
            \baselineskip\footskip
            \hbox to\linewidth{
                \hfil\thepage\hfil
            }\vss
        }
}

%----------------------------------------------------------------------------------------
%	TABLE OF CONTENTS
%----------------------------------------------------------------------------------------

\usepackage{titletoc} % Required for manipulating the table of contents

\setcounter{tocdepth}{2} % Show entries in the table of contents down to subsections

\makeatletter
\renewcommand\tableofcontents{%
    \section*{\centerline{\MakeUppercase{\contentsname}}
      \@mkboth
      {\MakeUppercase\contentsname}
      {\MakeUppercase\contentsname}
     }%
    \@starttoc{toc}%
}
\makeatother

\titlecontents{section} % Section type being modified
[0pt] % Left indentation
{\vspace{-2pt}} % Before code
{{\thecontentslabel}~~} % Formatting of numbered sections of this type
{} % Formatting of numberless sections of this type
{\titlerule*[6pt]{.}\contentspage} % Formatting of the filler to the right of the heading and the page number
[\vspace{2pt}] % After code

%------------------------------------------------

\titlecontents{subsection} % Section type being modified
[0.5cm] % Left indentation
{\vspace{-8pt}} % Before code
{{\thecontentslabel}~~} % Formatting of numbered sections of this type
{} % Formatting of numberless sections of this type
{\titlerule*[6pt]{.}\contentspage} % Formatting of the filler to the right of the heading and the page number
[] % After code

%------------------------------------------------

\titlecontents{subsubsection} % Section type being modified
[1.35cm] % Left indentation
{\vspace{-4pt}} % Before code
{{\thecontentslabel}~~} % Formatting of numbered sections of this type
{} % Formatting of numberless sections of this type
{\titlerule*[6pt]{.}\contentspage} % Formatting of the filler to the right of the heading and the page number
[] % After code

%----------------------------------------------------------------------------------------
%	LISTS
%----------------------------------------------------------------------------------------

\usepackage{enumitem} % Required for list customization

\setlist{itemsep=0pt, topsep=0pt} % Customize spacing around and inside lists

\renewcommand{\labelenumi}{\arabic{enumi}.} % Customize the first level numbered list characters
\renewcommand{\labelenumii}{\alph{enumii}.} % Customize the second level numbered list characters
\renewcommand{\labelenumiii}{\roman{enumiii}.} % Customize the third level numbered list characters

\renewcommand{\labelitemi}{\raisebox{0.5pt}{\textbullet}} % Customize the first level bullet point character
\renewcommand{\labelitemii}{\raisebox{-1.5pt}{--}} % Customize the second level bullet point character
\renewcommand{\labelitemiii}{\raisebox{-1.5pt}{-}} % Customize the third level bullet point character

%----------------------------------------------------------------------------------------
%	CUSTOM COMMANDS
%----------------------------------------------------------------------------------------

\newcommand{\reporttitle}[1]{\renewcommand{\reporttitle}{#1}}
\newcommand{\reportsubtitle}[1]{\renewcommand{\reportsubtitle}{#1}}
\newcommand{\reportauthors}[1]{\renewcommand{\reportauthors}{#1}}
\newcommand{\reportdate}[1]{\renewcommand{\reportdate}{#1}}
\newcommand{\reportver}[1]{\renewcommand{\reportver}{#1}}
\newcommand{\rightheadercontent}[1]{\renewcommand{\rightheadercontent}{#1}}

\makeatletter

\newcommand\frontmatter{
    \cleardoublepage
    \pagenumbering{roman}
    \pagestyle{fmatter}
}

\newcommand\mainmatter{
    \cleardoublepage
    \pagenumbering{arabic}
    \pagestyle{main}
}

\newcommand\backmatter{
    \if@openright
        \cleardoublepage
        \pagestyle{bmatter}
        \pagenumbering{arabic}% resets `page` counter to 1
        \renewcommand*{\thepage}{A-\arabic{page}}
    \else
        \clearpage
    \fi
}

\newcommand*{\currentname}{\@currentlabelname}

\makeatother

%----------------------------------------------------------------------------------------
%	LINKS
%----------------------------------------------------------------------------------------

\usepackage{hyperref} % Required for links

\definecolor{refGreen}{HTML}{728a3e}
\definecolor{linkBlue}{HTML}{015779}
\definecolor{citeGrey}{HTML}{2d2f2b}
\definecolor{black}{HTML}{000000}

\hypersetup{
    colorlinks=true, % Whether to color the text of links
    urlcolor=linkBlue, % Color for \url and \href links
    linkcolor=linkBlue, % Color for \nameref links
    citecolor=citeGrey, % Color of reference citations
    pdftitle={EdgeConneX POR03 Tapani Update},
}

\newcommand*{\fullref}[1]{\hyperref[{#1}]{\autoref*{#1} - \nameref*{#1}}} % One single link

\usepackage{bookmark}