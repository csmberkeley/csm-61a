# CSM 61A style guide
This document details style for the creation of worksheets and worksheet problems. 

## Worksheet document layout
A worksheet follows the following layout: 

```
\documentclass{exam}
\usepackage{../commonheader}

\discnumber{%WEEK NUMBER%}
\title{%TITLE%}
\date{%DATE RANGE%}

\begin{document}
\maketitle
\begin{guide}
\textbf{Recommended Timeline}
\begin{itemize}
  \item %TIMELINE 1%
  ...
\end{itemize}
\end{guide}


\section{%SECTION TITLE%}
\begin{questions}
\subimport{../../topics/%TOPIC%/%DIFFICULTY%/}{%PROBLEM NAME%.tex}
...
\end{questions}
...

\end{document}

```

## Problem layout

## Miscellaneous input style
### Names
- The names of problem files in the problem bank should be lowercase and hyphen-separated: *all-ways-skeleton.tex*, not *ALL_WAYS_SKELETON.TEX*.

### Formatting code
- To format blocks of code, use `\lstlistings`:

    ```
    \begin{lstlisting}
        ...
    \end{lstlisting}
    ```

- To format code in line, use `\lstinline`. Do not use `\texttt` to format code.
- Do not use `$` in conjunction with `\lstinline` unless it is absolutely necessary: `\lstinline{total < limit}` is preferable to `\lstinline$total < limit$`.

## Miscellaneous output style
### Capitalization
- All titles, subtitles, headings, and subheadings should be in title case: *What Would Python Do?*

### Spelling
- Use American spelling conventions in all cases. 
- Use *traveled* instead of *travelled*, etc.

### Punctuation
- Oxford comma: use it in all cases.
- Use hyphens (-), en (–) dashes, and em dashes (—) as appropriate. Do not insert spaces around dashes. Do not use spaced hyphens such as in *I like Python - just not as a language.* In LaTeX:
    - hyphens are typeset with one dash: `-`
    - en dashes are typeset with two dashes: `--`
    - em dashes are typeset with three dashes: `---`
- Punctuation that is not part of a quotation should not appear inside the quotation marks. Do not follow the American rule that terminal commas and periods should always appear inside quotes. 

### Spacing and sectioning
- Use an empty line between paragraphs of body text:
    > Paragraph 1.
    > 
    > Paragraph 2.
    
    Do not use `\\` and `\\\\` for paragraph spacing. `\\` produces a paragraph break that is too small, and `\\\\` produces one that is too big. 
- To insert a line break without the additional space of a paragraph break, use `\\`.
- `solution`, `lstlistings`, and `blocksection` all have automatic vertical spacing; it should not be necessary to add additional spacing. 
- Use `blocksection` when you want to make a section that will never be split across multiple pages. 

### Dates
- Use full month names and cardinal numbers for dates. *November 24, 2022* is correct; *Nov. 24th, 2022* is not.
- En dashes (–) should be used for date ranges: *June 19–July 4*.

### Grammar
- *That* and *which* are different words. Use *that* for restrictive (defining) clauses: 
    > `fact` is a function that calculates the factorial of its input.

    Do not write this:

    > `fact` is a function which calculates the factorial of its input. 

    Use *which* for non-restrictive clauses that add additional information. Typically, a comma precedes *which*.

    >`fact`, which takes a single argument `n`, is defined below.