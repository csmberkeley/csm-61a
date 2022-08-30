# CSM 61A worksheet style
This document details style for the creation of worksheets and worksheet problems. 

## Worksheet document layout
A worksheet adheres to the following format:

```
\documentclass{exam}
\usepackage{../commonheader}

\discnumber{%WEEK NUMBER%}
\title{%TITLE%}
\date{%DATE RANGE%}

\begin{document}
\maketitle

\begin{meta}
    ...
\end{meta}

\section{%SECTION TITLE%}
\begin{questions}
    \subimport{../../topics/%TOPIC%/%DIFFICULTY%/}{%PROBLEM NAME%.tex}
    \begin{questionmeta}
        ...
    \end{questionmeta}
    ...
\end{questions}
...

\end{document}
```
Each of a worksheet's topics gets its own `section`. Each `section` has its own set of numbered `questions`. The individual questions are imported from the question bank using `subimport` statements. 

Meta information about the worksheet is included with the `meta` and `questionmeta` environments. This information only appears within metas, not solutions or worksheets. 

## Question layout
A basic question adheres to the following format: 
```
\begin{blocksection}
\question %QUESTION STATEMENT%

\begin{lstlisting}
    %code line 1%
    %code line 2%
    ...
\end{lstlisting}
\end{blocksection}

\begin{solution}
    ...
\end{solution}
```
The `blocksection` environment tells LaTeX to not split the question over a page break, while the `\question` command creates and numbers a new question. `lstlisting` is used to format blocks of code. 

The answer to the problem is displayed in a `solution` environment. This information only appears within metas and solutions, not worksheets.

### Subparts
Questions with subparts are created using the `subparts` environment:

```
\begin{blocksection}
\question %QUESTION STATEMENT%

\begin{parts}
    \part %PART STATEMENT%
    \begin{solution}
        %PART SOLUTION%
    \end{solution}
    ...
\end{parts}
\end{blocksection}
```

## Style for source input
### Names
- The names of problem files in the problem bank should be lowercase and hyphen-separated: *all-ways-skeleton.tex*, not *ALL_WAYS_SKELETON.TEX*.

### `meta` and `questionmeta`
- Use the `questionmeta` environment for meta information about individual questions. It should always be placed within a `questions` environment.
- Use the `meta` environment for meta information about the entire worksheet or individual sections. Do not place it within a `questions` environment.
- In the past, `guide` was used instead of `meta`. `meta` is now preferred to `guide`, but they are fully equivalent and backward compatible. You may change `guide` to `meta` manually as you come across it in the problem bank. 

### `lstlisting` and `\lstinline`
- To format blocks of code, use `lstlisting`:

    ```
    \begin{lstlisting}
        ...
    \end{lstlisting}
    ```

- To format code in line, use `\lstinline`. Do not use `\texttt` to format code.
- Do not use `$` in conjunction with `\lstinline` unless it is absolutely necessary: `\lstinline{total < limit}` is preferable to `\lstinline$total < limit$`.

### Spacing and sectioning
- Use an empty line between paragraphs of body text:
    > Paragraph 1.
    > 
    > Paragraph 2.
    
    Do not use `\\` and `\\\\` for paragraph spacing. `\\` produces a paragraph break that is too small, and `\\\\` produces one that is too big. 
- To insert a line break without the additional space of a paragraph break, use `\\`.
- `solution`, `lstlisting`, and `blocksection` all have automatic vertical spacing; it should not be necessary to add additional spacing. 
- Use `blocksection` when you want to make a section that will never be split across multiple pages. Typically, each problem should be in its own block section. However, long problems may need to be broken up into multiple block sections. 

## Style for content output
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

### Code formatting
- Code and variable names should be formatted wherever they appear, including in body text and solutions. Do not place unformatted code in solutions. 
- For problems that involve complex mathematical expressions, math formatting may be used instead of code formatting. 

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