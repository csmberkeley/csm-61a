% exam.cls
%
% A LaTeX2e document class for preparing exams.

%% exam.cls
%% Copyright (c) 1994, 1997, 2000, 2004, 2008, 2011,
%% 2015, 2017, 2021 Philip S. Hirschhorn
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2003/12/01 or later.
%
% This work has the LPPL maintenance status "author-maintained".
% 
% This work consists of the files exam.cls and examdoc.tex.


% The user's guide for exam.cls is in the file examdoc.tex.


%%% Philip Hirschhorn
%%% Department of Mathematics
%%% Wellesley College
%%% Wellesley, MA 02481
%%% psh@math.mit.edu

% The newest version of this documentclass should always be available
% from my web page: http://www-math.mit.edu/~psh/


\def\fileversion{2.7}
\def\filedate{2021/02/26}
%---------------------------------------------------------------------
%---------------------------------------------------------------------
% 
% If there's some feature that you'd like that this file doesn't
% provide, tell me about it.
% 
%
%
%
%
% Thanks to:
%
% Piet van Oostrum, from whose excellent ``fancyheadings.sty'' we
% shamelessly stole most of the code for setting the headers and
% footers.
%
% Mate Wierdl <mw@wierdlmpc.msci.memphis.edu>, who contributed the
% code so that if the number of points is ``1'', then the default
% value of \pointname will print ``1 point'' instead of ``1 points''.
%
% Tom Brikowski <brikowi@utdallas.edu>, who contributed the code for
% making the number of points and number of questions available as
% macros (as well as the idea of putting the number of points in a 
% box, instead of in parentheses).  (I changed his code to make this
% all optional, so if there are errors there, it's my fault and not
% his.)
%
% Ottmar Beucher <beucher@fh-karlsruhe.de>, Dan Drake
% <drake@math.umn.edu>, and Justus Piater <Justus.Piater@ULg.ac.be> who
% contributed ideas and code for the \pointsofquestion and \gradetable
% commands for printing a Grading Table.  (I changed all the code to
% make this compatible with hyperref.sty, so if there are errors there,
% it's my fault and not theirs.)
%
% Justus Piater <Justus.Piater@ULg.ac.be>, who contributed the code for
% the solution environment.  (I changed his code to allow page breaks
% inside solutions so, once again, if it's buggy, it's my fault.) 
%
% Donald Arseneau <asnd@triumf.ca>, who created the excellent
% ``framed.sty'' and generously allowed me to include basically the
% whole thing in exam.cls, making the few changes needed for it to
% work well with question environments:
% framed.sty   v 0.8a   21-Jul-2003
% Copyright (C) 1992-2003 by Donald Arseneau
% These macros may be freely transmitted, reproduced, or modified
% provided that this notice is left intact.
%
%--------------------------------------------------------------------
%--------------------------------------------------------------------
%                    Changelog since version 2.4:

%--------------------------------------------------------------------
% Version 2.7, 2021/02/26

% No longer betatest.

%--------------------------------------------------------------------
% Version 2.607$\beta$, 2019/07/21

% We fixed a bug, apparently introduced in version 2.602, that affected
% vertical point tables (both regular and bonus, but not combined),
% shifting the total points in the table towards the right of the cell,
% rather than having the total points centered.  The fix was to delete
% an \hspace*{\fill} that had no business being there.

% --------------------------------------------------------------------
% Version 2.606$\beta$, 2019/02/17

% We introduced a new command, \unstarredvspace, that changes the
% solution environment so that, when solutions are not being printed,
% any optional space called for is inserted with \vspace{amount},
% instead of \vspace*{amount}.  There is also a new command
% \nounstarredvpsace that reverts to the default.

%--------------------------------------------------------------------
% Version 2.605$\beta$, 2018/08/22

% We corrected the bug introduced in Version 2.604$\beta$ that caused a
% \ref to a \correctchoice in a choices environment to have the wrong
% value.  The correction was to change \stepcounter to \refstepcounter.

%--------------------------------------------------------------------
% Version 2.604$\beta$, 2018/05/14

% We changed the code for the \correctchoice command in the checkboxes
% environment to correct a bug that causes the item label for the second
% item to appear in the wrong place when the first item is a
% \correctchoice and there's no text in between the \begin{checkboxes}
% and the \correctchoice.  We made a similar change to the choices
% environment, which had the same problem.

%--------------------------------------------------------------------
% Version 2.603, 2017/12/15

% No longer betatest.

%--------------------------------------------------------------------
% Version 2.602$\beta$, 2017/12/15

% We changed the code for multicolumn grade and point tables to remove
% the incompatibility with colortbl.sty and other packages that load
% colortbl.sty (e.g., xcolor.sty with the "table" option).

%--------------------------------------------------------------------
% Version 2.601$\beta$, 2017/09/22

% We changed command and environment names in the code from framed.sty
% that's included (slightly modified) in exam.cls so that the user can
% say \usepackage{framed} without creating conflicts.  This also allows
% the user to use packages, such as minted.sty, that load framed.sty

%--------------------------------------------------------------------
% Version 2.6, 2017/09/19

% No longer betatest.

%--------------------------------------------------------------------
% Version 2.510$\beta$, 2016/10/11

% Bugfix: We changed \@setheadheight and \@setfootheight to fix a bug
% that was introduced by the bugfix in version 2.306beta, 2009/03/28:
% If the second page has a different \textheight (because of a change
% in either headheight or footheight between pages 1 and 2), then page
% 2 would use the \textheight of page 1.  Pages 3 and beyond would get
% the correct \textheight.  The original version of this set \@colroom
% and \vsize to the new \textheight, but that had a bug in that if a
% float appeared at the top of a page, there would be no notice taken
% of the space lost to the float, and so the text would overrun the
% bottom of the page.  The bugfix in version 2.306beta eliminated the
% changes to \@colht and \vsize.  In this bugfix, we adjust \@colroom,
% \@colht, and \vsize in the same way that we adjust \textheight.

%--------------------------------------------------------------------
% Version 2.509$\beta$, 2016/09/12

% Multicolumn grade and point tables, and a new syntax for multirow
% grade and point tables (which were introduced in version
% 2.508beta).

% Multicolumn tables are vertically oriented, while multirow tables
% are horizontally oriented, and so they do not take the optional
% argument choosing between horizontal and vertical.  They all take
% one required argument specifying the number of columns (for
% multicolumn) or the number of rows (for multirow).

% The tables can be:

%   grade tables or point tables,

%   plain, bonus, or combined,

%   indexed by questions or by pages,

%   complete or partial.

% As usual, if you omit the optional argument that chooses between
% questions and pages, you get questions.

% The new commands are:

% \def\multirowgradetable{numrows}[questions or pages]
% \def\multirowpointtable{numrows}[questions or pages]
% \def\multirowbonusgradetable{numrows}[questions or pages]
% \def\multirowbonuspointtable{numrows}[questions or pages]
% \def\multirowcombinedgradetable{numrows}[questions or pages]
% \def\multirowcombinedpointtable{numrows}[questions or pages]

% \def\multirowpartialgradetable{numrows}{rangename}[questions or pages]
% \def\multirowpartialpointtable{numrows}{rangename}[questions or pages]
% \def\multirowpartialbonusgradetable{numrows}{rangename}[questions or pages]
% \def\multirowpartialbonuspointtable{numrows}{rangename}[questions or pages]
% \def\multirowpartialcombinedgradetable{numrows}{rangename}[questions or pages]
% \def\multirowpartialcombinedpointtable{numrows}{rangename}[questions or pages]

% \def\multicolumngradetable{numcols}[questions or pages]
% \def\multicolumnpointtable{numcols}[questions or pages]
% \def\multicolumnbonusgradetable{numcols}[questions or pages]
% \def\multicolumnbonuspointtable{numcols}[questions or pages]
% \def\multicolumncombinedgradetable{numcols}[questions or pages]
% \def\multicolumncombinedpointtable{numcols}[questions or pages]

% \def\multicolumnpartialgradetable{numcols}{rangename}[questions or pages]
% \def\multicolumnpartialpointtable{numcols}{rangename}[questions or pages]
% \def\multicolumnpartialbonusgradetable{numcols}{rangename}[questions or pages]
% \def\multicolumnpartialbonuspointtable{numcols}{rangename}[questions or pages]
% \def\multicolumnpartialcombinedgradetable{numcols}{rangename}[questions or pages]
% \def\multicolumnpartialcombinedpointtable{numcols}{rangename}[questions or pages]

% The older grade and point table commands can still be used.  For
% example, the commands

%   \gradetable[h][questions]
%   \multirowgradetable{1}[questions]

% are equivalent.

% The distance between the rows of a multirow table and between the
% columns of a multicolumn table is \doublerulesep, the default value
% of which is 2.0pt.  You can change that using a \setlength command,
% as in

%   \setlength{\doublerulesep}{0.5in}

%--------------------------------------------------------------------
% Version 2.508$\beta$, 2016/08/06

% New commands: Multirow grade and point tables.

% These are all horizontally oriented tables, and so do not take the
% optional argument choosing between horizontal and vertical.  They all
% take one required argument specifying the number of columns, which is
% the number of columns used for the point values (including the total),
% but not counting the column of row headings.

% Note: The syntax was changed in version 2.509beta, so that you now
% specify the number of *rows* rather than the number of *columns*!  For
% example, the first command below should now be

% \multirowgradetable{numrows}[questions or pages]

% The tables can be:

%   grade tables or point tables,

%   plain, bonus, or combined,

%   indexed by questions or by pages,

%   complete or partial.

% The new commands are:


% \multirowgradetable{numcols}[questions or pages]
% \multirowpointtable{numcols}[questions or pages]
% \multirowbonusgradetable{numcols}[questions or pages]
% \multirowbonuspointtable{numcols}[questions or pages]
% \multirowcombinedgradetable{numcols}[questions or pages]
% \multirowcombinedpointtable{numcols}[questions or pages]

% \multirowpartialgradetable{numcols}{rangename}[questions or pages]
% \multirowpartialpointtable{numcols}{rangename}[questions or pages]
% \multirowpartialbonusgradetable{numcols}{rangename}[questions or pages]
% \multirowpartialbonuspointtable{numcols}{rangename}[questions or pages]
% \multirowpartialcombinedgradetable{numcols}{rangename}[questions or pages]
% \multirowpartialcombinedpointtable{numcols}{rangename}[questions or pages]

%--------------------------------------------------------------------
% Version 2.507$\beta$, 2016/07/14

% New commands:

%   \pointstwosided
%   \pointstwosidedreversed

% The first causes points to be in the right margin on odd numbered
% pages and in the left margin on even numbered pages.

% The second causes points to be in the left margin on odd numbered
% pages and in the right margin on even numbered pages.

% Also: Some minor edits (e.g., deleting the unused \thebonuspoints).

%--------------------------------------------------------------------
% Version 2.506$\beta$, 2016/05/12

% Fixed an obscure bug that arose only when \CorrectChoiceEmphasis
% used color and a \CorrectChoice (in a choices or checkboxes
% environment) followed a \choice whose text completely filled its
% last line, and which was not separated from the \CorrectChoice by a
% blank line, in which case an extra (blank) line was inserted by that
% \choice.  We fixed this by adding an improvised "\leavehmode"
% (styled after \leavevmode) to the \CorrectChoice command in both the
% choices and checkboxes environments, which caused the text of the
% previous \choice to be broken into lines *before* the \special
% inserted by the \color command was added.

%--------------------------------------------------------------------
% Version 2.505$\beta$, 2016/05/10

% We fixed a bug in the choices and checkboxes environments that arose
% only when \CorrectChoiceEmphasis used color.  If it did, and if the
% text of a correct choice exactly filled a line, and if there was no
% blank line in the latex file separating this correct choice from the
% following choice, there would be an extra blank line inserted after
% the correct choice.  We did this by inserting \color@begingroup and
% \color@endgroup as needed.  (We're pretty sure the actual fix was
% the \endgraf in the expansion of \color@endgroup.)

%--------------------------------------------------------------------
% Version 2.504$\beta$, 2016/05/09

% We fixed a bug in the solutionbox environment that caused enumerate,
% itemize, or description environments to have their text stick into
% the right margin.  We did this by resetting \@totalleftmargin and
% \linewidth in the box containing the solution.

%--------------------------------------------------------------------
% Version 2.503$\beta$, 2016/03/25

% New commands:

%      \colorfillwithlines
%      \colorfillwithdottedlines

% The first causes the lines drawn by the \fillwithlines command to be
% drawn in color.  The default color is set by the command 

%      \definecolor{FillWithLinesColor}{gray}{0.8}

% and the color can be changed by giving a new \definecolor command.
% You can return to black lines by giving the command

%      \nocolorfillwithlines

% \colorfillwithdottedlines causes the lines drawn by the
% \fillwithdottedlines command to be drawn in color.  The default
% color is set by the command 

%      \definecolor{FillWithDottedLinesColor}{gray}{0.8}

% and the color can be changed by giving a new \definecolor command.
% You can return to black dotted lines by giving the command

%      \nocolorfillwithdottedlines

%--------------------------------------------------------------------
% Version 2.502$\beta$, 2016/03/23

% The command

%   \colorsolutionboxes

% that was created in version 2.501beta now affects not only the boxes
% created by \solutionbox, but also by \makeemptybox, \solutionorbox,
% and all of the boxes printed by all of the various solution
% environments when solutions are being printed surrounded by a box.

%--------------------------------------------------------------------
% Version 2.501$\beta$, 2016/02/08

% Changed the \solutionbox environment so that it works correctly
% inside a tabular.

% Also: The \solutionbox frame can now be printed in color, as long as
% you load color.sty in the preamble.
%
%  Usage: Say
%
%   \usepackage{color}
%
% in the preamble, and then give the command
%
%   \colorsolutionboxes
%
% to have the frame around a solutionbox in color.  The default color
% was created by the command
%
%   \definecolor{SolutionBoxColor}{gray}{0.8}
%
% and you can change the color by giving a new \definecolor command
% (which must be done *after* the \colorsolutionboxes command).
%
% To cancel color solutionbox frames and return to black, give the
% command
%
%   \nocolorsolutionboxes

%--------------------------------------------------------------------
% Version 2.5 2015/05/07

% No longer betatest.

%--------------------------------------------------------------------
% Version 2.408$\beta$ 2013/11/17

% New commands:
%
%   \firstqinrange{whatever}
%   \lastqinrange{whatever}
%   \numqinrange{whatever}
%
% where ``whatever'' is the name of a grading range.
%
% \firstqinrange{whatever} prints the number of the first question in
% the range.
%
% \lastqinrange{whatever} prints the number of the last question in the
% range.
%
% \numqinrange{whatever} prints the number of questions in the range.
%
% We changed a couple of internal command name related to grading
% ranges.  If the user defines the range `myrange', then we now use

%   \range@myrange@firstp
%   \range@myrange@lastp
%   \range@myrange@firstq
%   \range@myrange@lastq
%
% where we used to use
%
%   \tbl@myrange@firstp
%   \tbl@myrange@lastp
%   \tbl@myrange@firstq
%   \tbl@myrange@lastq

%--------------------------------------------------------------------
% Version 2.407$\beta$ 2012/12/19

% New environment:
%
%   solutionbox
%
% The solutionbox environment is different from the other solution
% environments (solution, solutionorbox, solutionorlines,
% solutionordottedlines, and solutionorgrid), in that
%
%   (1) The box is always printed, whether answers are being printed
%   or not.
%
%   (2) The argument giving the size of the box is a required
%   argument, not an optional argument, and so it should be enclosed
%   in braces, not in brackets.  It can be either a length or
%   \stretch{number}.
%
%   (3) We make no use of the TheSolution environment; the solutionbox
%   environment is completely freestanding.
%
% If answers are not being printed then only the box is printed, with
% nothing in it.  If answers are being printed, then the solution is
% printed inside of the box.
%
% Note: It's the user's responsibility to be sure that the box is
% large enough to hold the solution!  If the solution takes up too
% much vertical space, then it will spill out of the bottom of the
% box, overwriting whatever follows the box.
%
%--------------------------------------------------------------------
% Version 2.406$\beta$, 2012/12/16
%
% New command:
%
%   \noquestionsonthispage
%
%   This command tells the \ifcontinuation and \ifincomplete commands
%   to assume that no part of any question is on this page.  This is
%   similar to the job done by the \nomorequestions command for the
%   pages that follow the end of all of the questions.
%
%
% If you give the command \noquestionsonthispage on a page, then
%
%   (1) \ifcontinuation on that page will expand to its second
%   argument,
%   (2) \ifincomplete on that page will expand to its second
%   argument, and
%   (3) an \ifincomplete on an earlier page will not assume that a
%   question from that earlier page continues onto this page.
%
% The way that this command affects the \ifincomplete command on
% earlier pages is as follows: If there is a page with no questions or
% parts or subparts or subsubparts, then the last page before that
% with a question (or part, etc.) would normally be deemed incomplete;
% if, however, the page with no questions (or parts, etc.) (along with
% all adjacent pages with no questions or parts etc.) has a
% \noquestionsonthispage command, then that last page with a question
% (or part, etc.) will not be deemed incomplete.
%
% Note that if you're tempted to use this command on a page that follows
% the end of all of the questions, then you should probably use the
% command \nomorequestions instead.
%
%--------------------------------------------------------------------
% Version 2.405$\beta$, 2012/10/21
%
% It is now possible to use a parts, subparts, or subsubparts
% environment inside one of the solution environments (solution,
% solutionorbox, solutionorlines, solutionordottedlines, or
% solutionorgrid) without getting problems from multiply defined
% labels or having its points (if any) counted as being actual points
% on the exam.
%
% Any \part, \subpart, or \subsubpart command inside one of the
% solution environments now writes a \PgInfo command in the .aux file
% of the form question2@object3, but no labels and no other \PgInfo
% commands.  In addition, if there are points assigned to any of these
% commands inside any of the solution environments, those points are
% not added to the points of the question or the points on the page,
% and do not affect any gradetables or pointtables.
%
%--------------------------------------------------------------------
% Version 2.404$\beta$, 2012/09/03
%
% New command:
%
%   \fillwithgrid{length}
%
% New environment:
%
%   solutionorgrid
%
% These are similar to the \fillwithlines command and the
% solutionorlines environment.
%
% By default, the created grids are in black.  However, if you give the
% commands
%
% \usepackage{color}
% \colorgrids
%
% then the grids will be in color, by default a light gray.  That
% default color was defined by the command
%
% \definecolor{GridColor}{gray}{0.8}
%
% You can change the color by redefining the color GridColor, and you
% can return to using black grids by giving the command
%
% \nocolorgrids
%
% The default grid size and grid line thickness were set by the
% commands
%
% \setlength{\gridsize}{5mm}
% \setlength{\gridlinewidth}{0.1pt}
%
% You can change either or both of those by giving new \setlength
% commands.  The period of the grid is \gridsize (both horizontally
% and vertically).  That is, the horizontal distance from the left
% edge of one vertical line to the left edge of the next vertical line
% is \gridsize, as is the vertical distance from the top edge of one
% horizontal line to the top edge of the next horizontal line.  Thus,
% each square has outer side length equal to \gridsize+\gridlinewidth.
%
%--------------------------------------------------------------------
% Version 2.403$\beta$, 2012/08/29:
%
% We changed the code for the command \fillin (which had been modified
% in version 2.402beta) so that if only one optional argument is used,
% a space following that optional argument will not be ignored.  We
% did this in such a way that the second optional argument will be
% recognized even when spaces appear in between the optional
% arguments.
%
%--------------------------------------------------------------------
% Version 2.402$\beta$, 2012/08/21:
%
% We modified the command \fillin that we had created in version
% 2.401beta.  \fillin now takes two optional arguments (and no required
% arguments).
%
% \fillin can take two optional arguments, as in
%
% \fillin[Answer][Length]
%
% The first optional argument is the answer to be printed above the line
% when \printanswers is in effect; the default value is empty.  That
% line is printed a distance of \answerclearance below the baseline.
%
% The second optional argument is the length of the line that we print;
% the default value is \fillinlinelength.  The value of
% \fillinlinelength is set with the command
%
%   \setlength\fillinlinelength{1in}
%
% and can be changed by giving a new \setlength command.
%
% When answers are being printed, the first optional argument is
% printed subject to the declarations in the argument of the last
% \CorrectChoiceEmphasis command.  It is centered on the line unless
% it is too long, in which case it extends to the right of the line.
%
%--------------------------------------------------------------------
% Version 2.401$\beta$, 2012/08/20:
%
%
% New command:
%
%   \fillin[CorrectAnswer]{width}
%
% This is for use in fill in the blank questions.  This command inserts
% a blank line of width ``width''.  If answers are being printed and if
% the optional argument ``CorrectAnswer'' appears, then the optional
% argument is printed subject to the declarations in the argument of the
% last \CorrectChoiceEmphasis command, and it is printed a distance of
% \answerclearance above the line.  It is centered on the line unless it
% is too long, in which case it extends to the right of the line.
%
% Note: We changed this command in version 2.401beta.
%
%--------------------------------------------------------------------
%--------------------------------------------------------------------
%--------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{exam}[\filedate\space Version \fileversion\space by
  Philip Hirschhorn]

\RequirePackage{ifthen}

\newif\ifprintanswers
\printanswersfalse
\DeclareOption{answers}{\printanswerstrue}
\DeclareOption{noanswers}{\printanswersfalse}

\newif\ifcancelspace
\cancelspacefalse
\DeclareOption{cancelspace}{\cancelspacetrue}
\DeclareOption{nocancelspace}{\cancelspacefalse}

% The following keeps track of whether the user has requested that we
% add up the points on the exam.  We make the default false so that
% users who put other than numbers into the points argument of a
% question (or part, or subpart) won't get error messages.
% We use \if@printtotalpoints as a flag to signal that we are counting
% points, so that we will know to print the total on the screen (and
% in the log file).  We use this separate flag so that the user can
% use both \addpoints and \noaddpoints to count some points and not
% others, but still have the total printed when we finish the file no
% matter what the state of \if@addpoints.
\newif\if@addpoints
\newif\if@printtotalpoints
\def\addpoints{\global\@addpointstrue\global\@printtotalpointstrue}
\def\noaddpoints{\global\@addpointsfalse}
\@addpointsfalse
\@printtotalpointsfalse
\DeclareOption{addpoints}{\addpoints}


\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}




%                         *****************
%                         ** PAGE LAYOUT **
%                         *****************


% We set the parameters in terms of \paperwidth and \paperheight
% so that the options

% a4paper
% a5paper
% b5paper
% letterpaper
% legalpaper
% executivepaper
% landscape

% will all work:

\setlength{\textwidth}{\paperwidth}
\addtolength{\textwidth}{-2in}
\setlength{\oddsidemargin}{0pt}
\setlength{\evensidemargin}{0pt}

\setlength{\headheight}{15pt}
\setlength{\headsep}{15pt}
\setlength{\topmargin}{0in}
\addtolength{\topmargin}{-\headheight}
\addtolength{\topmargin}{-\headsep}
\setlength{\footskip}{29pt}
\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-2.2in}

\setlength{\marginparwidth}{.5in}
\setlength{\marginparsep}{5pt}

%--------------------------------------------------------------------

%                          ****************
%                          ** EXTRAWIDTH **
%                          ****************

\newlength\@extrawidth

% \@rightmargin is needed for \pointsinrightmargin and
% \pointsdroppedatright, so that we can right justify the points:
\newlength\@rightmargin
\setlength{\@rightmargin}{1in}

% We put the argument of \extrawidth into a length so that it will
% work correctly even if it's negative:

\def\extrawidth#1{%
  \@extrawidth=#1
  \advance \textwidth by \@extrawidth
  \divide\@extrawidth by 2
  \advance\oddsidemargin by -\@extrawidth
  \advance\evensidemargin by -\@extrawidth
  % Bug fix, 13 April 2004: 
  %\advance\@rightmargin by \@extrawidth
  \advance\@rightmargin by -\@extrawidth
}

%--------------------------------------------------------------------
%--------------------------------------------------------------------
%             Making room for large headers and footers

% The following are used to save the effect of any changes to 
% \topmargin and \textheight caused by \extraheadheight or
% \extrafootheight commands.  They hold the values currently in effect.
% We put them into lengths so that it will work correctly even if the
% argument is negative:

\newlength\@extrahead
\newlength\@extrafoot
\setlength{\@extrahead}{0in}
\setlength{\@extrafoot}{0in}

% The following are used to hold the requested values for extrahead and
% extrafoot, first page and all pages after the first, and then the
% similar things requested for the cover pages:
\newlength\run@exhd
\newlength\fp@exhd
\newlength\run@exft
\newlength\fp@exft
\newlength\covrun@exhd
\newlength\covfp@exhd
\newlength\covrun@exft
\newlength\covfp@exft

\setlength{\run@exhd}{0in}
\setlength{\fp@exhd}{0in}
\setlength{\run@exft}{0in}
\setlength{\fp@exft}{0in}
\setlength{\covrun@exhd}{0in}
\setlength{\covfp@exhd}{0in}
\setlength{\covrun@exft}{0in}
\setlength{\covfp@exft}{0in}

\newcommand*\adj@hdht@ftht{%
  \if@coverpages
    \ifnum\value{page}=1\relax
      \@setheadheight{\covfp@exhd}%
      \@setfootheight{\covfp@exft}%
    \else
      \@setheadheight{\covrun@exhd}%
      \@setfootheight{\covrun@exft}%
    \fi
  \else
    \ifnum\value{page}=1\relax
      \@setheadheight{\fp@exhd}%
      \@setfootheight{\fp@exft}%
    \else
      \@setheadheight{\run@exhd}%
      \@setfootheight{\run@exft}%
    \fi
  \fi
}

\newcommand*\extraheadheight{%
  \@ifnextchar[{\@xtrahd}{\@ytrahd}%
}

\def\@xtrahd[#1]#2{%
  \setlength{\fp@exhd}{#1}%
  \setlength{\run@exhd}{#2}%
  \adj@hdht@ftht
}

\def\@ytrahd#1{%
  \setlength{\fp@exhd}{#1}%
  \setlength{\run@exhd}{#1}%
  \adj@hdht@ftht
}

\newcommand*\extrafootheight{%
  \@ifnextchar[{\@xtraft}{\@ytraft}%
}

\def\@xtraft[#1]#2{%
  \setlength{\fp@exft}{#1}%
  \setlength{\run@exft}{#2}%
  \adj@hdht@ftht
}

\def\@ytraft#1{%
  \setlength{\fp@exft}{#1}%
  \setlength{\run@exft}{#1}%
  \adj@hdht@ftht
}

\newcommand*\coverextraheadheight{%
  \@ifnextchar[{\cov@xtrahd}{\cov@ytrahd}%
}

\def\cov@xtrahd[#1]#2{%
  \setlength{\covfp@exhd}{#1}%
  \setlength{\covrun@exhd}{#2}%
  \adj@hdht@ftht
}

\def\cov@ytrahd#1{%
  \setlength{\covfp@exhd}{#1}%
  \setlength{\covrun@exhd}{#1}%
  \adj@hdht@ftht
}

\newcommand*\coverextrafootheight{%
  \@ifnextchar[{\cov@xtraft}{\cov@ytraft}%
}

\def\cov@xtraft[#1]#2{%
  \setlength{\covfp@exft}{#1}%
  \setlength{\covrun@exft}{#2}%
  \adj@hdht@ftht
}

\def\cov@ytraft#1{%
  \setlength{\covfp@exft}{#1}%
  \setlength{\covrun@exft}{#1}%
  \adj@hdht@ftht
}

\def\@appendoutput#1{%
  \output=\expandafter{\the\output #1}%
}

\@appendoutput{\adj@hdht@ftht}

%--------------------------------------------------------------------
%                 \@setheadheight and \@setfootheight:

\def\@setheadheight#1{%
  \begingroup % Avoid trouble from using \@temp and \@spaces
    % Reset the effect of the most recent change:
    \global\advance\topmargin by -\@extrahead
    \global\advance\textheight by \@extrahead
    % Bugfix, Version 2.510beta, 2016/10/11:
    \global\advance\@colroom by \@extrahead
    \global\advance\@colht by \@extrahead
    \global\advance\vsize by \@extrahead
    %
    % Save the newly set value:
    \def\@temp{#1}
    \def\@spaces{ }
    \ifx\@temp\@empty
      \global\@extrahead=0in
    \else
      \ifx\@temp\@spaces
        \global\@extrahead=0in
      \else
        \global\@extrahead=#1
      \fi
    \fi
    % Set the new values:
    \global\advance\topmargin by \@extrahead
    \global\advance\textheight by -\@extrahead
    % Bugfix, Version 2.510beta, 2016/10/11:
    \global\advance\@colroom by -\@extrahead
    \global\advance\@colht by -\@extrahead
    \global\advance\vsize by -\@extrahead
    %
    % Bugfix, Version 2.510beta, 2016/10/11:
    % We're fixing a bug that was introduced by the bugfix in version
    % 2.306beta, 2009/03/28: If the second page has a different
    % \textheight (because of a change in either headheight or
    % footheight between pages 1 and 2), then page 2 would use the
    % \textheight of page 1.  Pages 3 and beyond would get the correct
    % \textheight.
    % The original version of this set \@colroom and \vsize to the new
    % \textheight, but that had a bug in that if a float appeared at
    % the top of a page, there would be no notice taken of the space
    % lost to the float, and so the text would overrun the bottom of
    % the page.
    % In this bugfix, we adjust \@colroom, \@colht, and \vsize in the
    % same way that we adjust \textheight.
    %
    % Make it take effect RIGHT NOW!:
    % (The following stuff isn't necessary if \@setheadheight is
    % executed only in the preamble or as we return from the output
    % routine, but we're leaving it in so that this will still work if
    % we use this at some random point in the middle of composing a
    % page).
    % Bugfix, Version 2.306beta, 2009/03/28:
    % We don't do this!!
    % If the user had a figure environment that floated to the
    % top of a page, then this would cause that page to run
    % over the footer and off the bottom of the page, because
    % this somehow caused a full page's worth of stuff to be
    % placed after the figure, as if the figure wasn't taking
    % up space on the page.
    % We *do* need to put \@colht at the correct new value, though,
    % apparently because \@colht is set near the end of the
    % output routine.
%     \global\@colht=\textheight
%
%     \global\@colroom=\textheight
%     \global\vsize=\textheight
%     \global\pagegoal=\textheight
  \endgroup
}% @setheadheight

\def\@setfootheight#1{%
  \begingroup % Avoid trouble from using \@temp and \@spaces
    % Reset the effect of the most recent change:
    \global\advance\textheight by \@extrafoot
    % Bugfix, Version 2.510beta, 2016/10/11:
    \global\advance\@colroom by \@extrafoot
    \global\advance\@colht by \@extrafoot
    \global\advance\vsize by \@extrafoot
    %
    % Save the newly set value:
    \def\@temp{#1}
    \def\@spaces{ }
    \ifx\@temp\@empty
      \global\@extrafoot=0in
    \else
      \ifx\@temp\@spaces
        \global\@extrafoot=0in
      \else
        \global\@extrafoot=#1
      \fi
    \fi
    % Set the new values:
    \global\advance\textheight by -\@extrafoot
    % Bugfix, Version 2.510beta, 2016/10/11:
    \global\advance\@colroom by -\@extrafoot
    \global\advance\@colht by -\@extrafoot
    \global\advance\vsize by -\@extrafoot
    %
    % Bugfix, Version 2.510beta, 2016/10/11:
    % We're fixing a bug that was introduced by the bugfix in version
    % 2.306beta, 2009/03/28: If the second page has a different
    % \textheight (because of a change in either headheight or
    % footheight between pages 1 and 2), then page 2 would use the
    % \textheight of page 1.  Pages 3 and beyond would get the correct
    % \textheight.
    % The original version of this set \@colroom and \vsize to the new
    % \textheight, but that had a bug in that if a float appeared at
    % the top of a page, there would be no notice taken of the space
    % lost to the float, and so the text would overrun the bottom of
    % the page.
    % In this bugfix, we adjust \@colroom, \@colht, and \vsize in the
    % same way that we adjust \textheight.
    %
    % Make it take effect RIGHT NOW!:
    % (The following stuff isn't necessary if \@setfootheight is
    % executed only in the preamble or as we return from the output
    % routine, but we're leaving it in so that this will still work if
    % we use this at some random point in the middle of composing a
    % page). 
    % Bugfix, Version 2.306beta, 2009/03/28:
    % We don't do this!!
    % If the user had a figure environment that floated to the
    % top of a page, then this would cause that page to run
    % over the footer and off the bottom of the page, because
    % this somehow caused a full page's worth of stuff to be
    % placed after the figure, as if the figure wasn't taking
    % up space on the page.
    % We *do* need to put \@colht at the correct new value, though,
    % apparently because \@colht is set near the end of the
    % output routine.
%     \global\@colht=\textheight
%
%     \global\@colroom=\textheight
%     \global\vsize=\textheight
%     \global\pagegoal=\textheight
  \endgroup
}% @setfootheight


%---------------------------------------------------------------------
%
%                      *************************
%                      ** HEADERS AND FOOTERS **
%                      *************************
% 
% The pagestyles available are head, foot, headandfoot, and empty.
% \pagestyle{head} prints the head, and gives an empty foot.
% \pagestyle{foot} prints the foot, and gives an empty head.
% \pagestyle{headandfoot} prints both the head and the foot.
% \pagestyle{empty} gives an empty head and an empty foot.
% 

%                            Pagestyles:

\newcommand*\ps@head{%
  \@dohead
  \@nofoot
}

\newcommand*\ps@headandfoot{%
  \@dohead
  \@dofoot
}

\newcommand*\ps@foot{%
  \@nohead
  \@dofoot
}

% \ps@empty is already defined by article.cls, so we'll
% say \def instead of \newcommand*:
\def\ps@empty{%
  \@nohead
  \@nofoot
}

\newif\if@coverpages
\@coverpagesfalse

\newcounter{num@coverpages}
% We'll set this to zero in case there is no coverpages environment:
\setcounter{num@coverpages}{0}

\newenvironment{coverpages}{%
    \ifnum \value{numquestions}>0\relax
      \ClassError{exam}{%
        Coverpages cannot be used after questions have begun.\MessageBreak
      }{%
        All question, part, subpart, and subsubpart environments
        \MessageBreak
        must begin after the cover pages are complete.\MessageBreak
      }%
    \fi
    \@coverpagestrue
    \pagenumbering{roman}%
    \adj@hdht@ftht
  }{%
    \clearpage
    \setcounter{num@coverpages}{\value{page}}%
    \addtocounter{num@coverpages}{-1}%
    \pagenumbering{arabic}%
    % Bugfix, Version 2.307\beta, 2009/06/11:
    % We have to say \@coverpagesfalse before \adj@hdht@ftht
    % because we're still inside the group created by the
    % coverpages environment and we want to set the 
    % extraheadheight and extrafootheight to the values correct
    % for the first non-cover page:
    \@coverpagesfalse
    \adj@hdht@ftht
}

\newcommand*\cover@question@error{%
  \ClassError{exam}{%
    No questions are allowed in the cover pages.\MessageBreak
  }{%
    All question, part, subpart, and subsubpart environments
    \MessageBreak
    must begin after the cover pages are complete.\MessageBreak
  }%
}

\newcommand*\@dohead{%
  \def\@oddhead{%
    \if@coverpages
      \ifnum\value{page}=1\relax
        \cov@fullhead
      \else
        \covrun@fullhead
      \fi
    \else
      \ifnum\value{page}=1\relax
        \@fullhead
      \else
        \run@fullhead
      \fi
    \fi
  }% @oddhead
  \let\@evenhead=\@oddhead
}

\newcommand*\@dofoot{%
  \def\@oddfoot{%
    \if@coverpages
      \ifnum\value{page}=1\relax
        \cov@fullfoot
      \else
        \covrun@fullfoot
      \fi
    \else
      \ifnum\value{page}=1\relax
        \@fullfoot
      \else
        \run@fullfoot
      \fi
    \fi
  }% @oddfoot
  \let\@evenfoot=\@oddfoot
}

\newcommand*\@nohead{%
  \def\@oddhead{}%
  \let\@evenhead=\@oddhead
}

\newcommand*\@nofoot{%
  \def\@oddfoot{}%
  \let\@evenfoot=\@oddfoot
}

%--------------------------------------------------------------------
%       \@fullhead, \run@fullhead, \@fullfoot, and \run@fullfoot:

\newcommand*\@fullhead{%
  \vbox to \headheight{%
    \vss
    \hbox to \textwidth{%
      \normalfont\rlap{\parbox[b]{\textwidth}{\raggedright\@lhead\strut}}%
        \hss\parbox[b]{\textwidth}{\centering\@chead\strut}\hss
        \llap{\parbox[b]{\textwidth}{\raggedleft\@rhead\strut}}%
    }% hbox
    \if@headrule
      \hrule
    \else
      % an invisible hrule, to keep positioning constant:
      \hrule width 0pt
    \fi
  }% vbox
}

\newcommand*\run@fullhead{%
  \vbox to \headheight{%
    \vss
    \hbox to \textwidth{%
      \normalfont\rlap{\parbox[b]{\textwidth}{\raggedright\run@lhead\strut}}%
        \hss\parbox[b]{\textwidth}{\centering\run@chead\strut}\hss
        \llap{\parbox[b]{\textwidth}{\raggedleft\run@rhead\strut}}%
    }% hbox
    \ifrun@headrule
      \hrule
    \else
      % an invisible hrule, to keep positioning constant:
      \hrule width 0pt
    \fi
  }% vbox
}

% We arrange it so that the very top of first line of text in the
% foot is at a fixed position on the page, whether or not there's
% a footrule:

\newcommand*\@fullfoot{%
  \vbox to 0pt{%
    \if@footrule
      \hrule
    \else
      % an invisible hrule, to keep positioning constant:
      \hrule width 0pt
    \fi
    \vskip 3pt
    \hbox to \textwidth{%
      \normalfont\rlap{\parbox[t]{\textwidth}{\raggedright\@lfoot}}%
        \hss\parbox[t]{\textwidth}{\centering\@cfoot}\hss
        \llap{\parbox[t]{\textwidth}{\raggedleft\@rfoot}}%
    }% hbox
    \vss
  }% vbox
}

\newcommand*\run@fullfoot{%
  \vbox to 0pt{%
    \ifrun@footrule
      \hrule
    \else
      % an invisible hrule, to keep positioning constant:
      \hrule width 0pt
    \fi
    \vskip 3pt
    \hbox to \textwidth{%
      \normalfont\rlap{\parbox[t]{\textwidth}{\raggedright\run@lfoot}}%
        \hss\parbox[t]{\textwidth}{\centering\run@cfoot}\hss
        \llap{\parbox[t]{\textwidth}{\raggedleft\run@rfoot}}%
    }% hbox
    \vss
  }% vbox
}

%--------------------------------------------------------------------
%       \cov@fullhead, \covrun@fullhead, \cov@fullfoot, and
%       \covrun@fullfoot: 

\newcommand*\cov@fullhead{%
  \vbox to \headheight{%
    \vss
    \hbox to \textwidth{%
      \normalfont\rlap{\parbox[b]{\textwidth}{\raggedright\cov@lhead\strut}}%
        \hss\parbox[b]{\textwidth}{\centering\cov@chead\strut}\hss
        \llap{\parbox[b]{\textwidth}{\raggedleft\cov@rhead\strut}}%
    }% hbox
    \ifcov@headrule
      \hrule
    \else
      % an invisible hrule, to keep positioning constant:
      \hrule width 0pt
    \fi
  }% vbox
}

\newcommand*\covrun@fullhead{%
  \vbox to \headheight{%
    \vss
    \hbox to \textwidth{%
      \normalfont\rlap{\parbox[b]{\textwidth}{\raggedright\covrun@lhead\strut}}%
        \hss\parbox[b]{\textwidth}{\centering\covrun@chead\strut}\hss
        \llap{\parbox[b]{\textwidth}{\raggedleft\covrun@rhead\strut}}%
    }% hbox
    \ifcovrun@headrule
      \hrule
    \else
      % an invisible hrule, to keep positioning constant:
      \hrule width 0pt
    \fi
  }% vbox
}

% We arrange it so that the very top of first line of text in the
% foot is at a fixed position on the page, whether or not there's
% a footrule:

\newcommand*\cov@fullfoot{%
  \vbox to 0pt{%
    \ifcov@footrule
      \hrule
    \else
      % an invisible hrule, to keep positioning constant:
      \hrule width 0pt
    \fi
    \vskip 3pt
    \hbox to \textwidth{%
      \normalfont\rlap{\parbox[t]{\textwidth}{\raggedright\cov@lfoot}}%
        \hss\parbox[t]{\textwidth}{\centering\cov@cfoot}\hss
        \llap{\parbox[t]{\textwidth}{\raggedleft\cov@rfoot}}%
    }% hbox
    \vss
  }% vbox
}

\newcommand*\covrun@fullfoot{%
  \vbox to 0pt{%
    \ifcovrun@footrule
      \hrule
    \else
      % an invisible hrule, to keep positioning constant:
      \hrule width 0pt
    \fi
    \vskip 3pt
    \hbox to \textwidth{%
      \normalfont\rlap{\parbox[t]{\textwidth}{\raggedright\covrun@lfoot}}%
        \hss\parbox[t]{\textwidth}{\centering\covrun@cfoot}\hss
        \llap{\parbox[t]{\textwidth}{\raggedleft\covrun@rfoot}}%
    }% hbox
    \vss
  }% vbox
}

%--------------------------------------------------------------------
%--------------------------------------------------------------------
%
%            ********************************************
%            ** COMMANDS TO DEFINE HEADERS AND FOOTERS **
%            ********************************************
%
% \lhead[#1]{#2} sets the first page left head to #1, and the
%   running left head to #2
% 
% \lhead{#1} sets both the first page left head and the running
%   left head to #1
% 
% \chead, \rhead, \lfoot, \cfoot, and \rfoot work similarly.
% 
% 
% \@lhead is the left head for Page 1
% \run@lhead is the running left head
% (i.e., for all pages other than the first)
% 
% \@chead is the center head for Page 1
% \run@chead is the running center head
% (i.e., for all pages other than the first)
% 
% etc.
% 
% Alternative commands are:
% \firstpageheader{LEFT}{CENTER}{RIGHT}
% \runningheader{LEFT}{CENTER}{RIGHT}
% or
% \header{LEFT}{CENTER}{RIGHT}
% which is equivalent to the two commands
%          \firstpageheader{LEFT}{CENTER}{RIGHT}
%          \runningheader{LEFT}{CENTER}{RIGHT}
% 
% Alternative commands are:
% \firstpagefooter{LEFT}{CENTER}{RIGHT}
% \runningfoother{LEFT}{CENTER}{RIGHT}
% or
% \footer{LEFT}{CENTER}{RIGHT}
% which is equivalent to the two commands
%          \firstpagefooter{LEFT}{CENTER}{RIGHT}
%          \runningfoother{LEFT}{CENTER}{RIGHT}

\def\firstpageheader#1#2#3{%
  \def\@lhead{#1}%
  \def\@chead{#2}%
  \def\@rhead{#3}%
}

\def\runningheader#1#2#3{%
  \def\run@lhead{#1}%
  \def\run@chead{#2}%
  \def\run@rhead{#3}%
}

\def\header#1#2#3{%
  \firstpageheader{#1}{#2}{#3}%
  \runningheader{#1}{#2}{#3}%
}

\def\firstpagefooter#1#2#3{%
  \def\@lfoot{#1}%
  \def\@cfoot{#2}%
  \def\@rfoot{#3}%
}

\def\runningfooter#1#2#3{%
  \def\run@lfoot{#1}%
  \def\run@cfoot{#2}%
  \def\run@rfoot{#3}%
}

\def\footer#1#2#3{%
  \firstpagefooter{#1}{#2}{#3}%
  \runningfooter{#1}{#2}{#3}%
}

\def\lhead{\@ifnextchar[{\@xlhead}{\@ylhead}}
\def\@xlhead[#1]#2{\def\@lhead{#1}\def\run@lhead{#2}}
\def\@ylhead#1{\def\run@lhead{#1}\def\@lhead{#1}}

\def\chead{\@ifnextchar[{\@xchead}{\@ychead}}
\def\@xchead[#1]#2{\def\@chead{#1}\def\run@chead{#2}}
\def\@ychead#1{\def\run@chead{#1}\def\@chead{#1}}

\def\rhead{\@ifnextchar[{\@xrhead}{\@yrhead}}
\def\@xrhead[#1]#2{\def\@rhead{#1}\def\run@rhead{#2}}
\def\@yrhead#1{\def\run@rhead{#1}\def\@rhead{#1}}

\def\lfoot{\@ifnextchar[{\@xlfoot}{\@ylfoot}}
\def\@xlfoot[#1]#2{\def\@lfoot{#1}\def\run@lfoot{#2}}
\def\@ylfoot#1{\def\run@lfoot{#1}\def\@lfoot{#1}}

\def\cfoot{\@ifnextchar[{\@xcfoot}{\@ycfoot}}
\def\@xcfoot[#1]#2{\def\@cfoot{#1}\def\run@cfoot{#2}}
\def\@ycfoot#1{\def\run@cfoot{#1}\def\@cfoot{#1}}

\def\rfoot{\@ifnextchar[{\@xrfoot}{\@yrfoot}}
\def\@xrfoot[#1]#2{\def\@rfoot{#1}\def\run@rfoot{#2}}
\def\@yrfoot#1{\def\run@rfoot{#1}\def\@rfoot{#1}}


%                    Initialize head and foot:

\pagestyle{headandfoot}

\lhead{}
\chead{}
\rhead{}
\lfoot{}
\cfoot[]{Page \thepage}
\rfoot{}

%--------------------------------------------------------------------
%                    Coverpage headers and footers
%
% \coverlhead[#1]{#2} sets the first cover page left head to #1, and the
%   running cover left head to #2
% 
% \coverlhead{#1} sets both the first cover page left head and the running
%   cover left head to #1
% 
% \coverchead, \coverrhead, \coverlfoot, \covercfoot, and \coverrfoot
% work similarly.
% 
% 
% \cov@lhead is the left head for Page 1
% \covrun@lhead is the running left head
% (i.e., for all pages other than the first)
% 
% \cov@chead is the center head for Page 1
% \covrun@chead is the running center head
% (i.e., for all pages other than the first)
% 
% etc.
% 
% Alternative commands are:
% \coverfirstpageheader{LEFT}{CENTER}{RIGHT}
% \coverrunningheader{LEFT}{CENTER}{RIGHT}
% or
% \coverheader{LEFT}{CENTER}{RIGHT}
% which is equivalent to the two commands
%          \coverfirstpageheader{LEFT}{CENTER}{RIGHT}
%          \coverrunningheader{LEFT}{CENTER}{RIGHT}
% 
% Alternative commands are:
% \coverfirstpagefooter{LEFT}{CENTER}{RIGHT}
% \coverrunningfoother{LEFT}{CENTER}{RIGHT}
% or
% \coverfooter{LEFT}{CENTER}{RIGHT}
% which is equivalent to the two commands
%          \coverfirstpagefooter{LEFT}{CENTER}{RIGHT}
%          \coverrunningfoother{LEFT}{CENTER}{RIGHT}

\def\coverfirstpageheader#1#2#3{%
  \def\cov@lhead{#1}%
  \def\cov@chead{#2}%
  \def\cov@rhead{#3}%
}

\def\coverrunningheader#1#2#3{%
  \def\covrun@lhead{#1}%
  \def\covrun@chead{#2}%
  \def\covrun@rhead{#3}%
}

\def\coverheader#1#2#3{%
  \coverfirstpageheader{#1}{#2}{#3}%
  \coverrunningheader{#1}{#2}{#3}%
}

\def\coverfirstpagefooter#1#2#3{%
  \def\cov@lfoot{#1}%
  \def\cov@cfoot{#2}%
  \def\cov@rfoot{#3}%
}

\def\coverrunningfooter#1#2#3{%
  \def\covrun@lfoot{#1}%
  \def\covrun@cfoot{#2}%
  \def\covrun@rfoot{#3}%
}

\def\coverfooter#1#2#3{%
  \coverfirstpagefooter{#1}{#2}{#3}%
  \coverrunningfooter{#1}{#2}{#3}%
}

\def\coverlhead{\@ifnextchar[{\cov@xlhead}{\cov@ylhead}}
\def\cov@xlhead[#1]#2{\def\cov@lhead{#1}\def\covrun@lhead{#2}}
\def\cov@ylhead#1{\def\covrun@lhead{#1}\def\cov@lhead{#1}}

\def\coverchead{\@ifnextchar[{\cov@xchead}{\cov@ychead}}
\def\cov@xchead[#1]#2{\def\cov@chead{#1}\def\covrun@chead{#2}}
\def\cov@ychead#1{\def\covrun@chead{#1}\def\cov@chead{#1}}

\def\coverrhead{\@ifnextchar[{\cov@xrhead}{\cov@yrhead}}
\def\cov@xrhead[#1]#2{\def\cov@rhead{#1}\def\covrun@rhead{#2}}
\def\cov@yrhead#1{\def\covrun@rhead{#1}\def\cov@rhead{#1}}

\def\coverlfoot{\@ifnextchar[{\cov@xlfoot}{\cov@ylfoot}}
\def\cov@xlfoot[#1]#2{\def\cov@lfoot{#1}\def\covrun@lfoot{#2}}
\def\cov@ylfoot#1{\def\covrun@lfoot{#1}\def\cov@lfoot{#1}}

\def\covercfoot{\@ifnextchar[{\cov@xcfoot}{\cov@ycfoot}}
\def\cov@xcfoot[#1]#2{\def\cov@cfoot{#1}\def\covrun@cfoot{#2}}
\def\cov@ycfoot#1{\def\covrun@cfoot{#1}\def\cov@cfoot{#1}}

\def\coverrfoot{\@ifnextchar[{\cov@xrfoot}{\cov@yrfoot}}
\def\cov@xrfoot[#1]#2{\def\cov@rfoot{#1}\def\covrun@rfoot{#2}}
\def\cov@yrfoot#1{\def\covrun@rfoot{#1}\def\cov@rfoot{#1}}


%                 Initialize coverpage head and foot:

\coverlhead{}
\coverchead{}
\coverrhead{}
\coverlfoot{}
\covercfoot{}
\coverrfoot{}




%--------------------------------------------------------------------
%--------------------------------------------------------------------

%                      Headrules and footrules:

\newif\if@headrule
\newif\ifrun@headrule

\def\firstpageheadrule{\@headruletrue}
\def\nofirstpageheadrule{\@headrulefalse}

\def\runningheadrule{\run@headruletrue}
\def\norunningheadrule{\run@headrulefalse}

\def\headrule{\@headruletrue\run@headruletrue}
\def\noheadrule{\@headrulefalse\run@headrulefalse}

\newif\if@footrule
\newif\ifrun@footrule

\def\firstpagefootrule{\@footruletrue}
\def\nofirstpagefootrule{\@footrulefalse}

\def\runningfootrule{\run@footruletrue}
\def\norunningfootrule{\run@footrulefalse}

\def\footrule{\@footruletrue\run@footruletrue}
\def\nofootrule{\@footrulefalse\run@footrulefalse}

%                             Initialize:

\noheadrule
\nofootrule

%                 Cover page headrules and footrules:

\newif\ifcov@headrule
\newif\ifcovrun@headrule

\def\coverfirstpageheadrule{\cov@headruletrue}
\def\nocoverfirstpageheadrule{\cov@headrulefalse}

\def\coverrunningheadrule{\covrun@headruletrue}
\def\nocoverrunningheadrule{\covrun@headrulefalse}

\def\coverheadrule{\cov@headruletrue\covrun@headruletrue}
\def\nocoverheadrule{\cov@headrulefalse\covrun@headrulefalse}

\newif\ifcov@footrule
\newif\ifcovrun@footrule

\def\coverfirstpagefootrule{\cov@footruletrue}
\def\nocoverfirstpagefootrule{\cov@footrulefalse}

\def\coverrunningfootrule{\covrun@footruletrue}
\def\nocoverrunningfootrule{\covrun@footrulefalse}

\def\coverfootrule{\cov@footruletrue\covrun@footruletrue}
\def\nocoverfootrule{\cov@footrulefalse\covrun@footrulefalse}

%                             Initialize:

\nocoverheadrule
\nocoverfootrule

%--------------------------------------------------------------------
%--------------------------------------------------------------------

%                \numpages, \iflastpage, and \oddeven
%     Also: \numpoints, \numquestions, \numparts, and \numsubparts
%                    Also also: \pointsofquestion
%     Also: \numcoverpages and \totalnumpages

% Make the number of pages available as the macro \numpages,
% the number of points as \numpoints,
% the number of questions as \numquestions,
% the number of parts as \numparts, and
% the number of subparts as \numsubparts

% This was previously done with \pageref commands.  When I stopped
% using \pageref for this (in order to make this compatible with
% hyperref.sty), this stuff was created:

% \gdef commands for exam@lastpage, exam@numpoints,
% exam@numbonuspoints, exam@numquestions, exam@numparts,
% exam@numsubparts and exam@numsubsubparts are written to the .aux
% file via \AtEndDocument.

% \gdef commands for pointsofq@i, pointsofq@ii, etc. and
% bonuspointsofq@i, bonuspointsofq@ii, etc.  are written to the .aux
% file as each question is completed (see the definition of the
% questions environment).

% \gdef commands for pointsonpage@i, pointsonpage@ii, etc. and
% bonuspointsonpage@i, bonuspointsonpage@ii, etc. are written to the
% .aux file as we encounter points defined for a later page, and for
% the last such page with AtEndDocument.

\def\numpages{\@ifundefined{exam@lastpage}%
  {\mbox{\normalfont\bfseries ??}}%
  \exam@lastpage
}% numpages

% Change 2011/04/01: We added a ``0'' in front of the
% mbox when \exam@lastcoverpage isn't defined.  This is
% so that the construction \romannumeral\numcoverpages
% won't generate an error on the first run of latex.
\def\numcoverpages{\@ifundefined{exam@lastcoverpage}%
  {0\mbox{\normalfont\bfseries ??}}%
  \exam@lastcoverpage
}% numpages

\def\totalnumpages{\@ifundefined{exam@totalpages}%
  {\mbox{\normalfont\bfseries ??}}%
  \exam@totalpages
}% numpages

\def\numpoints{\@ifundefined{exam@numpoints}%
  {\mbox{\normalfont\bfseries ??}}%
  \exam@numpoints
}% numpoints
\def\numbonuspoints{\@ifundefined{exam@numbonuspoints}%
  {\mbox{\normalfont\bfseries ??}}%
  \exam@numbonuspoints
}% numbonuspoints

\def\numquestions{\@ifundefined{exam@numquestions}%
  {\mbox{\normalfont\bfseries ??}}%
  \exam@numquestions
}% numquestions

\def\numparts{\@ifundefined{exam@numparts}%
  {\mbox{\normalfont\bfseries ??}}%
  \exam@numparts
}% numparts

\def\numsubparts{\@ifundefined{exam@numsubparts}%
  {\mbox{\normalfont\bfseries ??}}%
  \exam@numsubparts
}% numsubparts

\def\numsubsubparts{\@ifundefined{exam@numsubsubparts}%
  {\mbox{\normalfont\bfseries ??}}%
  \exam@numsubsubparts
}% numsubsubparts

\def\pointsofquestion#1{\@ifundefined{pointsofq@\romannumeral #1}%
  {\mbox{\normalfont\bfseries ??}}%
  {\csname pointsofq@\romannumeral #1\endcsname}%
}% pointsofquestion
\def\bonuspointsofquestion#1{\@ifundefined{bonuspointsofq@\romannumeral #1}%
  {\mbox{\normalfont\bfseries ??}}%
  {\csname bonuspointsofq@\romannumeral #1\endcsname}%
}% bonuspointsofquestion

% For use in \combinedgradetable and \combinedpointtable, we're
% changing the defintions of \pointsonpage and \bonuspointsonpage
% so that when, e.g.,  pointsonpage@ii is undefined, we just produce
% 0.  This comes up because the final page of the exam may have either
% points with no bonus point or bonus points with no points, in which
% case the combined table will try to list both points and bonus points
% for that last page, and one of those will be undefined.
%
% \def\pointsonpage#1{\@ifundefined{pointsonpage@\romannumeral #1}%
%   {\mbox{\normalfont\bfseries ??}}%
%   {\csname pointsonpage@\romannumeral #1\endcsname}%
% }% pointsonpage
% \def\bonuspointsonpage#1{\@ifundefined{bonuspointsonpage@\romannumeral #1}%
%   {\mbox{\normalfont\bfseries ??}}%
%   {\csname bonuspointsonpage@\romannumeral #1\endcsname}%
% }% bonuspointsonpage
%
% spanish.ldf redefines \@roman, so we'll avoid using \roman:
\def\pointsonpage#1{\@ifundefined{pointsonpage@\romannumeral #1}%
  {0}%
  {\csname pointsonpage@\romannumeral #1\endcsname}%
}% pointsonpage
\def\bonuspointsonpage#1{\@ifundefined{bonuspointsonpage@\romannumeral #1}%
  {0}%
  {\csname bonuspointsonpage@\romannumeral #1\endcsname}%
}% bonuspointsonpage


\newif\if@pointschanged
\@pointschangedfalse

\newcommand*{\CheckIfChanged@hlf}[2]{%
  % The first argument is the name of a half counter.
  % The second argument expands to the name (without the escape
  % character, and not assumed to be defined) of the control sequence
  % holding the previous value.
  \@ifundefined{#2}%
    {\global\@pointschangedtrue}%
    {%
    % OK; it's defined.  See if it's changed:
    \begingroup
      \set@hlfcntr{tmp@hlfcntr}{\csname #2\endcsname}%
      \edef\othpt@check{\prtaux@hlfcntr{tmp@hlfcntr}}%
      \edef\pt@check{\prtaux@hlfcntr{#1}}%
      \ifx \pt@check \othpt@check
        % Do nothing
      \else
        \global\@pointschangedtrue
      \fi
    \endgroup
    }%
}% CheckIfChanged@hlf


%%%\let\@realenddocument=\enddocument
%%%\def\enddocument{\clearpage
%%%   \if@filesw 
%%%     {\advance\c@page-1 \immediate\write\@mainaux
%%%       {\string\newlabel{@lastpage}{{}{\arabic{page}}}}%
%%%     }
%%%   \fi
%%%   \@realenddocument
%%%}

\AtEndDocument{%
  \clearpage
  \if@filesw
    \advance\c@page-1
    \immediate\write\@mainaux
      {\string\gdef\string\exam@lastpage{\arabic{page}}}%
    \immediate\write\@mainaux
      {\string\gdef\string\exam@lastcoverpage{\arabic{num@coverpages}}}%
    % We can now trash the value of num@coverpages:
    \addtocounter{num@coverpages}{\value{page}}%
    \immediate\write\@mainaux
      {\string\gdef\string\exam@totalpages{\arabic{num@coverpages}}}%
    \advance\c@page+1 % In case some other package looks at \c@page
    %
    \immediate\write\@mainaux
        {\string\gdef\string\exam@numpoints{%
                            \prtaux@hlfcntr{numpoints}}}%
    % See if this has changed from the last run of LaTeX:
    \CheckIfChanged@hlf{numpoints}{exam@numpoints}%
    \immediate\write\@mainaux
        {\string\gdef\string\exam@numbonuspoints{%
                            \prtaux@hlfcntr{numbonuspoints}}}%
    % See if this has changed from the last run of LaTeX:
    \CheckIfChanged@hlf{numbonuspoints}{exam@numbonuspoints}%
    \immediate\write\@mainaux
      {\string\gdef\string\exam@numquestions{\thenumquestions}}%
    \immediate\write\@mainaux
      {\string\gdef\string\exam@numparts{\thenumparts}}%
    \immediate\write\@mainaux
      {\string\gdef\string\exam@numsubparts{\thenumsubparts}}%
    \immediate\write\@mainaux
      {\string\gdef\string\exam@numsubsubparts{\thenumsubsubparts}}%
    \ifnum \thepageof@pagepoints > 0\relax
      \immediate\write\@mainaux
          {\string\gdef\string\pointsonpage@\romannumeral
                          \csname c@pageof@pagepoints\endcsname
             {\prtaux@hlfcntr{@pagepoints}}}%
      % See if this has changed from the last run of LaTeX:
      \CheckIfChanged@hlf{@pagepoints}{pointsonpage@\romannumeral
                          \csname c@pageof@pagepoints\endcsname}%
    \fi
    \ifnum \thepageof@pagebonuspoints > 0\relax
      \immediate\write\@mainaux
          {\string\gdef\string\bonuspointsonpage@\romannumeral
                          \csname c@pageof@pagebonuspoints\endcsname
             {\prtaux@hlfcntr{@pagebonuspoints}}}%
      \CheckIfChanged@hlf{@pagebonuspoints}{bonuspointsonpage@\romannumeral
                          \csname c@pageof@pagebonuspoints\endcsname}%
    \fi
    \immediate\write\@mainaux
      {\string\gdef\string\lastpage@withpoints{\page@withpoints}}%
    % See if this has changed from the last run of LaTeX:
    \@ifundefined{lastpage@withpoints}%
      {\global\@pointschangedtrue}%
      {%
      % OK; it's defined.  See if it's changed:
      \begingroup
        \edef\othpt@check{\page@withpoints}%
        \edef\pt@check{\lastpage@withpoints}%
        \ifx \pt@check \othpt@check
          % Do nothing
        \else
          \global\@pointschangedtrue
        \fi
      \endgroup
      }%
    \immediate\write\@mainaux
      {\string\gdef\string\lastpage@withbonuspoints{\page@withbonuspoints}}%
    % See if this has changed from the last run of LaTeX:
    \@ifundefined{lastpage@withbonuspoints}%
      {\global\@pointschangedtrue}%
      {%
      % OK; it's defined.  See if it's changed:
      \begingroup
        \edef\othpt@check{\page@withbonuspoints}%
        \edef\pt@check{\lastpage@withbonuspoints}%
        \ifx \pt@check \othpt@check
          % Do nothing
        \else
          \global\@pointschangedtrue
        \fi
      \endgroup
      }%
  \fi
  % Echo numbers of questions, parts, and subparts:
  \typeout{This exam contains \thenumquestions\space questions
    with \thenumparts\space parts, \thenumsubparts\space subparts,
    and \thenumsubsubparts\space subsubparts.}
  % If counting points, echo total points:
  \if@printtotalpoints
    \begingroup
      \def\typ@expnd{%
        \thenumpoints
        \ifnumpoints@half
          \space and a half%
        \fi
      }
      \typeout{This exam has a total of \typ@expnd\space points.}
      \def\typ@expnd{%
        \thenumbonuspoints
        \ifnumbonuspoints@half
          \space and a half%
        \fi
      }
      \typeout{This exam has a total of \typ@expnd\space bonus points.}
    \endgroup
  \fi
  \if@pointschanged
    \ClassWarningNoLine{exam}{Point totals have changed.
               Rerun to get point totals right}%
  \fi
}% AtEndDocument


% We define \iflastpage so that it can safely be used
% in headers and footers:
\def\iflastpage#1#2{%
  \@ifundefined{exam@lastpage}{\def\@@lastpage{-1}}%
          {\edef\@@lastpage{\exam@lastpage}}%
  \ifnum\value{page}=\@@lastpage\relax
    #1%
  \else
    #2%
  \fi
}% iflastpage


% The macro \oddeven takes two arguments.  If the page number is odd,
% then you get the first argument; otherwise, you get the second
% argument.
\def\oddeven#1#2{%
  \ifodd\value{page}%
    #1%
  \else
    #2%
  \fi
}% oddeven



%--------------------------------------------------------------------
%--------------------------------------------------------------------
%                 \ifcontinuation, \ContinuedQuestion,
%                \ifincomplete, and \IncompleteQuestion

% The commands \ifcontinuation, \ContinuedQuestion, \ifincomplete, and
% \IncompleteQuestion assume that there is only one questions
% environment in the entire document.  (Actually, \ContinuedQuestion
% should work even if there are multiple questions environments, but
% none of the other three will work in general.)



% \PgInfo@write, \PgInfo and \PgInfo@get are our replacements
% for \label, \newlabel, and \pageref.  (We're avoiding using
% \label, \newlabel, and \pageref so that we will be compatible
% with hyperref.sty, which redefines those commands.)

% We use \PgInfo, \PgInfo@write, and \PgInfo@get to know on which page
% each question, part, subpart, subsubpart, and choice appears.

% We use \PgInfo@write to write \PgInfo commands to the .aux file.  The
% \PgInfo command takes two arguments: A question (or part, or subpart,
% or subsubpart) label, and the number of the page on which it appears.

% The label for a question is of the form `question@2' (if it's question
% 2).

% The label for a part is of the form `part@2@1' (if it's part a of
% question 2).

% The label for a subpart is of the form `subpart@2@1@3' (if it's
% subpart iii of part a of question 2).

% The label for a subsubpart is of the form `subsubpart@2@1@3@4' (if
% it's subsubpart $\delta$ of subpart iii of part a of question 2).

% Each question, part, subpart, subsubpart, and choice also gets a
% \PgInfo@write command using a label of the form question2@object3 (if
% it's the third object of the second question).

% Inside one of the solution environments (solution, solutionorbox,
% etc.) each part, subpart, subsubpart, and choice get only the
% \PgInfo@write command using a label of the form question2@object3
% (if it's the third object of the second question).

% When read in from the .aux file, the \PgInfo command defines a
% control sequence of the form `Pg@label' that expands to the page
% number for the corresponding question.  For example,
% \PgInfo{subsubpart@2@1@3@4}{7} defines \csname
% Pg@subsubpart@2@1@3@4\endcsname to expand to 7.

% The \PgInfo@get{label} command returns the value of the macro Pg@label,
% but it *doesn't* check whether that macro is defined.  Thus, it's
% important to check that the macro Pg@label is defined before giving the
% command \PgInfo@get{label}.



% The token list to a \write command isn't expanded until
% it's shipped out.  Since the argument to PgInfo@write
% generally contains macros, we want to expand those macros
% now, rather than waiting until this is shipped out, at which
% point the macros may have different values.  Thus, we use
% \edef to force expansion of the argument, and we put
% a \noexpand in front of \thepage so that the \thepage
% will not be expanded now.  (This may not get shipped out
% until a later page, and so we want the \thepage to be expanded
% only when it's shipped out.)
% We use the \begingroup \endgroup pair so that our use
% of \reserved@a won't affect its use anywhere else.
\def\PgInfo@write#1{%
  \begingroup
    \edef\reserved@a{\write\@mainaux
      {\string\PgInfo{#1}{\noexpand\thepage}}}%
    \reserved@a
  \endgroup
}

%\PgInfo commands are written to the .aux file by the \PgInfo@write
%command; that's the only place that \PgInfo commands appear.
\def\PgInfo#1#2{\expandafter\gdef\csname Pg@#1\endcsname{#2}}

% Note: PgInfo@get assumes that the control sequence being
% constructed is already defined; you have to make sure of this
% *before* calling \Pginfo@get
\def\PgInfo@get#1{\csname Pg@#1\endcsname}

% \set@counter@to@pageof takes two arguments: The first is the name of a
% counter, and the second (expands to) the label of a question, part,
% subpart, subsubpart, or choice.  If that label exists, then we set the
% counter equal to the page on which the question (or part, etc.)
% appears.  If that label doesn't exist, we set the counter equal to -1.
% (No labels exist on the first run of LaTeX on the file, and if a new
% question (or part, etc.) was created by editing the file, then the
% label will not exist until the run of LaTeX after that.)
\def\set@counter@to@pageof#1#2{%
  \@ifundefined{Pg@#2}%
  {\setcounter{#1}{-1}}%
  {\setcounter{#1}{\csname Pg@#2\endcsname}}%
}


%--------------------------------------------------------------------

% \ifcontinuation#1#2 expands to #2 if either:
% (1) The command \noquestionsonthispage has been given on this page,
% or
% (2) The current page is before the page containing question number
% 1, or
% (3) A question begins on this page before any part, subpart,
% subsubpart, or choice begins, or
% (4) The current page is later than a page with the \nomorequestions
% command.
% Otherwise, it expands to #1.
%
% Thus, for example, if there are no questions, parts, subparts,
% subsubparts, or choices on this page, and no \noquestionsonthispage
% command, and we're not before question 1, and not after a
% \nomorequestions command, then \ifcontinuation will expand to #1.


\def\ifcontinuation#1#2{%
  % If there's a \noquestionsonthispage command on this page, then
  % we assume that we're not continuing anything:
  \@ifundefined{No@Questions@Pg@\thepage}%
    {\chk@contin{#1}{#2}}%
    {#2}%
}% \ifcontinuation

\def\chk@contin#1#2{%
  % We check whether we're on a page *before* the page on which the
  % first question appears.  If we don't yet know which page has
  % question number 1, then we must be doing an early run of LaTeX,
  % and we'll assume we're not a continuation.
  \expandafter\ifx\csname Pg@question@1\endcsname\relax
    % No page info yet; assume not a continuation
    #2%
  \else
    % Note: The ``\relax'' at the end of the following \ifnum
    % serves an entirely different purpose from the one at the
    % end of the above \expandafter\ifx.  That one (above)
    % is one of the things being compared, whereas the
    % one we're about to use is just to clearly mark the
    % end of the second number being compared by the \ifnum
    % (since it's conceivable that the ``#2'' would begin
    % with a digit).
    \ifnum \thepage < \csname Pg@question@1\endcsname\relax
      % We're before the page with question 1:
      #2%
    \else
      % The current page begins a new question if Contin@\thepage
      % has been defined as a macro that expands to \relax (Note
      % that this is different from if Contin@\thepage has never
      % been defined at all, in which case it will be let equal to
      % \relax (temporarily) by the \csname command.)
      \expandafter\ifx\csname Contin@\thepage\endcsname\ref@relax
        #2%
      \else
        % See if we're after a \nomorequestions command:
        \@ifundefined{Pg@@endquestions}%
        {#1}%
        {\ifnum \thepage > \PgInfo@get{@endquestions}\relax
          % We're after a \nomorequestions:
          #2%
         \else
           % We actually are incomplete:
           #1%
         \fi
        }%
      \fi
    \fi 
  \fi
}% chk@contin

\def\nomorequestions{%
  \PgInfo@write{@endquestions}%
}% nomorequestions

\def\noquestionsonthispage{%
  \write\@mainaux{\string\expandafter\string\gdef
    \string\csname\space No@Questions@Pg@\thepage\string\endcsname
    {No questions here}}%
}% noquestionsonthispage


%--------------------------------------------------------------------
% \ContinuedQuestion is for use in headers and footers, where we can
% assume that \thepage is the number of the page on which we'll
% actually appear.

% \ContinuedQuestion expands to the number of the question that
% continues onto this page, or to -1 if this page begins with a new
% question.

% ACTUALLY: \ContinuedQuestion expands to a positive number if either
% (1) this page doesn't contain the beginning of any question, part,
% subpart, subsubpart, or choice, or (2) this page has a part, subpart,
% subsubpart, or choice that appears before any question.  That means
% that if the current page actually begins with space for a continuation
% of the previous question (but doesn't begin any part, subpart,
% subsubpart, or choice of that question) and then has a question, then
% we'll be asserting that this page begins with a new question, but the
% actual top of the page will begin with some blank space that's
% intended for the previous question.

% \ContinuedQuestion works by examining the value of the macro
% Contin@\thepage.  If this page starts with a question (i.e., if no
% question continues onto this page), then the macro Contin@\thepage
% will be defined, and will expand to `\relax' (and so an \ifx between
% \csname Contin@\thepage\endcsname and \ref@relax will be true).

% If Contin@\thepage is undefined, then when it is used in an \ifx
% command it will be temporarily set equal to \relax (which is
% *different* from being a macro that expands to \relax); in this case,
% there is no question, part, subpart, subsubpart, or choice that begins
% on this page, and so \ContinuedQuestion will be set equal to the last
% question that was begun on a page before this one.

% The last possibility is that this page begins with either a part,
% subpart, subsubpart, or choice.  In this case, Contin@\thepage is
% defined, and it expands to the number of the question that is
% continued onto this page.


\def\ref@relax{\relax}

\def\ContinuedQuestion{%
  \expandafter\ifx\csname Contin@\thepage\endcsname\relax
    % We get here if there's no question, part, subpart,
    % subsubpart, or choice on this page, and so Contin@\thepage has
    % never been defined at all.  In that case, this page
    % continues whichever question was last begun on or 
    % before this page.
    \find@latestques
    \thelatest@ques
  \else
    \expandafter\ifx\csname Contin@\thepage\endcsname\ref@relax
      % We get here if this page begins with a new question,
      % which is why Contin@\thepage has been defined to be
      % a macro that expands to \relax.
      % ACTUALLY: We get here if this page has a question that
      % appears before any part, subpart, subsubpart, or choice.  That
      % means that if the current page actually begins with space
      % for a continuation of the previous question but doesn't begin
      % any part, subpart, subsubpart, or choice of that question, then
      % we'll be asserting that this page begins with a new question,
      % but the actual top of the page will begin with some space
      % that's intended for the previous question.
      -1\relax
    \else
      % We get here if we didn't get anywhere above.  This happens
      % if Contin@\thepage has been defined to be a macro that expands
      % to something other than \relax, in which case it has been
      % defined to be a macro that expands to the number of the
      % question that continues onto this page.
      \csname Contin@\thepage\endcsname
    \fi
  \fi
}

%--------------------------------------------------------------------
% \find@latestques is for use in headers and footers, where we can
% assume that \thepage actually equals the page on which we'll appear.
% We find the last question that was started on or before the current
% page.

\newcounter{latest@ques}

\newcommand\find@latestques{%
  % \find@latestques is for use in headers and footers.
  % \find@latestques will set the counter latest@ques
  % to the number of the last question
  % that was begun on the exam from page 1 through the current
  % page.  This may well be the value of the question counter,
  % but it may be less than that if the page following this one
  % begins a new question and that question beginning was
  % typeset before the present page was shipped out.
  % Note: This macro is called both by \ContinuedQuestion and by
  % \find@quesend, which is why it has to find the last question
  % begun on or before the current page, rather than just before
  % the current page.
  \ifnum 1 > \value{question}\relax
    % Oops; probably because we're before the first question
    % Just set latest@ques to -1:
    \setcounter{latest@ques}{-1}%
  \else
    % If question latest@ques actually begins on this page (rather
    % than on the next page, but early enough on the next page
    % that the counter was advanced before we ran off into the
    % output routine to output the page and set the header and 
    % footer), then that's the correct question number.
    \expandafter\ifx\csname Pg@question@\arabic{question}\endcsname\relax
      % We don't know what page that question is on;
      % this must be an early run, before the aux file
      % is helpful.  Just set it equal to -1 and wait until the next
      % run to get it right.
      \setcounter{latest@ques}{-1}%
    \else
      % We now know that \PgInfo@get can tell us the page number
      % of \arabic{question} and of all earlier questions.
      % Set latest@ques equal to the current question number, and
      % then call \decr@latest@ques to recursively decrement
      % latest@ques as needed to find a question that begins on
      % or before the current page:
      \setcounter{latest@ques}{\value{question}}%
      \decr@latest@ques
    \fi
  \fi
}

\def\decr@latest@ques{%
  % If we get here, then we've already checked that the reference
  % Pg@question@\thelatest@ques is defined at least for a value of
  % \thelatest@ques greater than or equal to it's present value,
  % so we assume it's defined for all lesser values as well:
  \ifnum \thepage < \PgInfo@get{question@\thelatest@ques}\relax
    % Nope; latest@ques starts on a later page
    % Decrement latest@ques and see if that one's right:
    \addtocounter{latest@ques}{-1}%
    \ifnum \thelatest@ques < 1\relax
      \setcounter{latest@ques}{-1}%
      \let\next@dlq=\relax
    \else
      \let\next@dlq=\decr@latest@ques
    \fi
  \else
    % latest@ques starts on this page or earlier, so
    % that's the correct question number!  Exit:
    \let\next@dlq=\relax
  \fi
  \next@dlq
}

%--------------------------------------------------------------------
%--------------------------------------------------------------------
%--------------------------------------------------------------------
\newcounter{ques@end}
\newcounter{last@object}

\def\find@quesend{%
  % We find the last question started on or before the current page
  % and then find the page containing the last part (or subpart, or
  % subsubpart, or choice) of that question, and set the counter
  % ques@end to that page number.
  % Set latest@ques equal to the correct question number:
  \find@latestques
  \ifnum \value{latest@ques} < 0\relax
    % This must be an early run of LaTeX, before we have
    % \PgInfo commands in the .aux file:
    \setcounter{ques@end}{-1}%
  \else
    % We now know that this question has at least one object (since
    % we know that latest@ques isn't negative).
    % We'll find its highest numbered object by setting last@object
    % equal to 2 and then calling \find@lastobject to recursively
    % test whether that object number exists and, if so, incrementing
    % last@object to test for a higher numbered one:
    \setcounter{last@object}{2}%
    \find@lastobject
    \setcounter{ques@end}{\PgInfo@get{question\thelatest@ques
               @object\thelast@object}}%
  \fi
}% find@quesend

\def\find@lastobject{%
  % We check whether this question has an object numbered last@object
  % and recursively increment last@object to find the highest
  % numbered value for which the object exists:
  \@ifundefined{Pg@question\thelatest@ques @object\thelast@object}%
    {\addtocounter{last@object}{-1}%
      \let\nextfind@lastobject=\relax
    }%
    {\addtocounter{last@object}{1}%
      \let\nextfind@lastobject=\find@lastobject
    }%
  \nextfind@lastobject
}% find@lastobject



%--------------------------------------------------------------------
%--------------------------------------------------------------------
%--------------------------------------------------------------------

\newcounter{incmp@ques}

\def\IncompleteQuestion{%
  \Find@Incmp@ques
  % If there's no incomplete question, the counter incmp@ques will be
  % set to -1:
  \theincmp@ques
}

\def\Find@Incmp@ques{%
  % If we're on the last page, then there's no incomplete question:
  \iflastpage{\setcounter{incmp@ques}{-1}}{\chk@incomp}%
}% Find@Incmp@ques
\newcounter{next@ques}
\newcounter{next@page}

\def\chk@incomp{%
  % If we get here, we're not on the last page.
  % \find@quesend calls \find@latestques to set the counter
  % latest@ques equal to the number of the last question begun on or
  % before the current page, and then it sets the counter ques@end to
  % the page containing the last ques@object of that question:
  \find@quesend
  \ifnum \theques@end > \thepage\relax
    % This question has a part (or sub...) starting on a later page
    \setcounter{incmp@ques}{\value{latest@ques}}%
  \else
    \chk@incompi
  \fi
}% chk@incomp

\def\chk@incompi{%
  % If there are any pages after the current one and before the next
  % question (if there is a next question) that lack a
  % \noquestionsonthispage and that aren't following the page of a
  % \nomorequestions command, then question latest@ques is incomplete.
  % Otherwise, there is no incomplete question:
  \setcounter{next@ques}{\thelatest@ques}%
  \addtocounter{next@ques}{1}%
  % We use next@page as a scratch counter.  We start by setting it
  % to the last page we want to check for a \noquestionsonthispage
  % command:
  \expandafter\ifx\csname Pg@question@\thenext@ques \endcsname\relax
    % This isn't the last page but there is no next question:
%
    \@ifundefined{exam@lastpage}%
      {\setcounter{next@page}{-1}}%
      {\setcounter{next@page}{\exam@lastpage}}%
%
%    \setcounter{next@page}{\exam@lastpage}%
  \else
    \setcounter{next@page}{\PgInfo@get{question@\thenext@ques}}%
    \addtocounter{next@page}{-1}%
  \fi
  % See if that's after a \nomorequestions command:
  \@ifundefined{Pg@@endquestions}%
    {}%
    {\ifnum \PgInfo@get{@endquestions} < \value{next@page}\relax
       \setcounter{next@page}{\PgInfo@get{@endquestions}}%
     \fi
    }%
  % OK, the counter next@page now contains the last page to check.
  \chk@incompii
}% chk@incompi

\def\chk@incompii{%
  \ifnum \value{next@page} > \value{page}\relax
    % We need to check the page next@page:
    \@ifundefined{No@Questions@Pg@\arabic{next@page}}%
    {\setcounter{incmp@ques}{\value{latest@ques}}%
      \let\next@incompii=\relax
    }%
    {\addtocounter{next@page}{-1}%
      \let\next@incompii = \chk@incompii
    }%
  \else
    % There's no incomplete question:
    \setcounter{incmp@ques}{-1}%
    \let\next@incompii=\relax
  \fi
  \next@incompii
}% chk@incompii

\def\ifincomplete#1#2{%
  % We need to pass the arguments to \chk@ifincomp; we save them in
  % macros so they won't be messed up by the call to \Find@Incmp@ques:
  \def\incomp@first{#1}%
  \def\incomp@second{#2}%
  % If there's a \noquestionsonthispage command on this page, then
  % we assume nothing from this page is incomplete:
  \@ifundefined{No@Questions@Pg@\thepage}%
    {\chk@ifincomp}%
    {\incomp@second}%
}% ifincomplete

\def\chk@ifincomp{%
  \Find@Incmp@ques
  % If there's no incomplete question, \Find@Incmp@ques sets the
  % counter incmp@ques to -1:
  \ifnum \theincmp@ques < 0\relax
    \incomp@second
  \else
    % Are we after a page with \nomorequestions?
    \@ifundefined{Pg@@endquestions}%
      {\incomp@first}%
      {\ifnum \thepage < \PgInfo@get{@endquestions}\relax
         \incomp@first
       \else
         \incomp@second
       \fi
      }%
  \fi
}% chk@ifincomp

%--------------------------------------------------------------------
% These are the commands for dealing with hlfcntr's, i.e., the things
% used to count points.
%
% A point value is a nonnegative integer with an optional half integer.
% A hlfcntr consists of a regular counter together with an \if: If the
% regular counter is called ``counter'', then the \if is called
% ``\ifcounter@half''; it's set true by ``\counter@halftrue'' and set
% false by ``\counter@halffalse''.
%
% The commands:
%
% \new@hlfcntr{countername}
% \set@hlfcntr{countername}{value}
% \copy@hlfcntr{tocounter}{fromcounter}
% \addto@hlfcntr{countername}{value}
% \add@hlfcntrtohlfcntr{getsaddedto}{whatsadded}
% \ifhlfcntr@pos{countername}
% \prtaux@hlfcntr{countername}
% \prt@hlfcntr{countername}
%
% ``value'' can be either a (nonnegative) integer, an integer followed by
% ``\half'', or just plain ``\half''.  (Actually, ``value'' can be empty
% (although the braces must be present), in which case it's interpreted
% as ``0''.)
%
% Examples of valid values:
%   0
%   0\half
%   1
%   1\half
%   2
%   2\half
% etc.

% Note on using ``\global'': LaTeX's \setcounter and \addtocounter
% commands are already \global (i.e., you don't have to say
% ``\global''), but \somethingtrue and \somethingfalse (used to set
% \ifsomething) aren't.  Thus, we need to say ``\global'' when setting
% these things.

% To create a hlfcntr:
\newcommand*\new@hlfcntr[1]{%
  \newcounter{#1}%
  \expandafter\newif\csname if#1@half\endcsname
}% new@hlfcntr


% A scratch hlfcntr:
\new@hlfcntr{tmp@hlfcntr}

\newcommand*\horiz@half{$\frac{1}{2}$}
\newcommand*\slanted@half{%
  $\raise0.6ex\hbox{$\scriptstyle 1$}\kern -.2em/\kern -.2em
     \raise-0.5ex\hbox{$\scriptstyle 2$}$%
}% slanted@half
\newcommand*\useslantedhalf{\global\let\half\slanted@half}
\newcommand*\usehorizontalhalf{\global\let\half\horiz@half}
\newcommand*\half{\slanted@half}


\newcommand*\set@hlfcntr[2]{%
  \begingroup
    \global\csname #1@halffalse\endcsname
    % If there as a `\half' present, it will be executed
    % right after the assignment of the digit part of #2
    % to the counter #1.
    \def\half{%
      \global\csname #1@halftrue\endcsname
    }%
    % We insert a `0' in case there are no digits present:
    % We avoid using \setcounter, because calc.sty redefines
    % \setcounter in a way that conflicts with the \half trick
    % we're using:
    %    \setcounter{#1}{0#2}\relax
    \global\csname c@#1\endcsname 0#2\relax
  \endgroup
}% set@hlfcntr

\newcommand*\copy@hlfcntr[2]{%
  % We set #1 to the value of #2
  \setcounter{#1}{\value{#2}}%
  \csname if#2@half\endcsname
    \global\csname #1@halftrue\endcsname
  \else
    \global\csname #1@halffalse\endcsname
  \fi
}% copy@hlfcntr

\newcommand*\addto@hlfcntr[2]{%
  % We add the valueandhalf #2 to hlfcntr #1
  \begingroup
    \def\half{\add@half{#1}}%
    % We insert a `0' in case there are no digits present:
    % We avoid using \addtocounter, because calc.sty redefines
    % \addtocounter in a way that conflicts with the \half trick
    % we're using:
    %    \addtocounter{#1}{0#2}\relax
    \global\advance\csname c@#1\endcsname 0#2\relax
  \endgroup
}% addto@hlfcntr

\newcommand*\add@hlfcntrtohlfcntr[2]{%
  % We add the hlfcntr #2 to the hlfcntr #1
  \addtocounter{#1}{\value{#2}}%
  \csname if#2@half\endcsname
    \add@half{#1}%
  \fi
}% add@hlfcntrtohlfcntr

\newcommand*\add@half[1]{%
  % We add one half to hlfcntr #1:
  \csname if#1@half\endcsname
    \addtocounter{#1}{1}%
    \global\csname #1@halffalse\endcsname
  \else
    \global\csname #1@halftrue\endcsname
  \fi
}% add@half

% Important reminder about \ifhlfcntr@pos: Do not use it inside
% another conditional!  The construction
%  \ifhlfcntr@pos{somecounter}
%    do some stuff...
%  \fi
% is perfectly fine as long as it's expanded, but: If it's inside
% another conditional, and the condition is not satisfied, then it's
% read through without expansion.  In that case, TeX sees the
% \ifhlfcntr@pos but does *not* recognize it as being part of a
% conditional, but when it sees the concluding \fi it does recognize
% that, and so TeX completes the outer conditional at that \fi, which
% causes an error.
\newcounter{ifpos@cntr}
\def\ifhlfcntr@pos#1{%
  % The argument must be a hlfcntr (which, of course,
  % can never be negative); we'll be true if and only if
  % that halfcntr is positive:
  \setcounter{ifpos@cntr}{\value{#1}}%
  \csname if#1@half\endcsname
    \addtocounter{ifpos@cntr}{1}%
  \fi
  \ifnum \value{ifpos@cntr} > 0\relax
}% ifhlfnctr@pos

% \prtaux@hlfcntr is used inside the argument of a \write command for
% writing to the .aux file:
\newcommand*\prtaux@hlfcntr[1]{%
  % We don't want a \relax after the 0 in the following
  % line, because it would sometimes appear in the aux file:
  \ifnum \value{#1} = 0 
    % We have to make the following a macro, because if we
    % don't do this part, the \fi will cause confusion, since
    % there's no \if visible until the \csname is expanded:
    \prtaux@halforzero{#1}%
  \else
    \arabic{#1}%
    % We have to make the following a macro, because if we
    % don't do this part, the \fi will cause confusion, since
    % there's no \if visible until the \csname is expanded:
    \prtaux@halforblank{#1}%
  \fi
}% prtaux@hlfcntr
\newcommand*\prtaux@halforzero[1]{%
  \csname if#1@half\endcsname
    \string\half
  \else
    0%
  \fi
}% prtaux@hlforzero
\newcommand*\prtaux@halforblank[1]{%
  \csname if#1@half\endcsname
    \string\half
  \fi
}% prtaux@halforblank

\newcommand*\prt@hlfcntr[1]{%
  % We don't want a \relax after the 0 in the following
  % line, because it would sometimes appear in the aux file:
  \ifnum \value{#1} = 0 
    % We have to make the following a macro, because if we
    % don't do this part, the \fi will cause confusion, since
    % there's no \if visible until the \csname is expanded:
    \prt@halforzero{#1}%
  \else
    \arabic{#1}%
    % We have to make the following a macro, because if we
    % don't do this part, the \fi will cause confusion, since
    % there's no \if visible until the \csname is expanded:
    \prt@halforblank{#1}%
  \fi
}% prt@hlfcntr
\newcommand*\prt@halforzero[1]{%
  \csname if#1@half\endcsname
    \half
  \else
    0%
  \fi
}% prt@hlforzero
\newcommand*\prt@halforblank[1]{%
  \csname if#1@half\endcsname
    \half
  \fi
}% prt@halforblank

% End of the commands for dealing with hlfcntr's

%--------------------------------------------------------------------
%---------------------------------------------------------------------
%
%                    ***************************
%                    ** QUESTION ENVIRONMENTS **
%                    ***************************
%
%
%

% We define the command \part only inside of a parts environment, so
% that we don't interfere with the meaning of the standard article
% documentclass command \part if that is used inside of a questions
% environment.  The commands \question, \subpart, and \subsubpart are
% defined everywhere inside of a questions environment.  If the user
% accidentally gives a \subpart command outside of a subparts
% environment, then an error will be created.




% We use the counter name `partno' for the parts environment so that
% we will not interfere with the counter `part' used by the article
% document class.

\newcounter{question}
\newcounter{partno}
\newcounter{subpart}
\newcounter{subsubpart}
\newcounter{choice}
\new@hlfcntr{numpoints}
\set@hlfcntr{numpoints}{0}
\new@hlfcntr{numbonuspoints}
\set@hlfcntr{numbonuspoints}{0}
\new@hlfcntr{pointsof@thisquestion}
\set@hlfcntr{pointsof@thisquestion}{0}
\new@hlfcntr{bonuspointsof@thisquestion}
\set@hlfcntr{bonuspointsof@thisquestion}{0}
\newcounter{numquestions}
\newcounter{numparts}
\newcounter{numsubparts}
\newcounter{numsubsubparts}
\newcounter{Curr@Page}

% @pagepoints accumulates the points on a single page:
\new@hlfcntr{@pagepoints}
\set@hlfcntr{@pagepoints}{0}
\new@hlfcntr{@pagebonuspoints}
\set@hlfcntr{@pagebonuspoints}{0}
\newcounter{pageof@pagepoints}
\setcounter{pageof@pagepoints}{0}
\newcounter{pageof@pagebonuspoints}
\setcounter{pageof@pagebonuspoints}{0}

% latest@points is a holding area for points until we know
% whether they'll land on the same page as the points
% currently counted in @pagepoints:
\new@hlfcntr{latest@points}
\set@hlfcntr{latest@points}{0}
\new@hlfcntr{latest@bonuspoints}
\set@hlfcntr{latest@bonuspoints}{0}

% Whenever we meet a new page on which points are defined, we'll
% redefine \page@withpoints to expand to that page.  At the end of the
% document, it will hold the last page that has points, and we'll write
% a \gdef\lastpage@withpoints command to the .aux file.
% We initialize \page@withpoints here:
\def\page@withpoints{0}%
\def\page@withbonuspoints{0}%

% \pageinfo@commands is used by each question, part, subpart, and
% subsubpart to insert into everypar the \PgInfo@write command to put
% its page number into the .aux file, the \PgInfo@get command to read
% the page number into the counter Curr@Page, and to test and set
% \Contin@\theCurr@Page.  \temp@toks is used by part, subpart, and
% subsubpart to append all that to \pageinfo@commands, rather than
% deleting whatever may have been put into \pageinfo@commands by the
% current question and/or part and/or subpart.
\newtoks\pageinfo@commands
\newtoks\temp@toks

% \pagepoint@commands holds the commands to manage the counting of the
% number of points defined on each page.
\newtoks\pagepoint@commands

% \point@toks holds the commands to print the points at the proper
% location on the page (except that it's not used by the \qformat
% option).
\newtoks\point@toks

% We'll use \greeknum to number subsubparts
\def\greeknum#1{\expandafter\lc@greek\csname c@#1\endcsname}
\def\lc@greek#1{%
  \ifcase #1\or $\alpha$\or $\beta$\or $\gamma$\or $\delta$\or
  $\epsilon$\or $\zeta$\or $\eta$\or $\theta$\or $\iota$\or
  $\kappa$\or $\lambda$\or $\mu$\or $\nu$\or $\xi$\or o\or $\pi$\or
  $\rho$\or $\sigma$\or $\tau$\or $\upsilon$\or $\phi$\or $\chi$\or
  $\psi$\or $\omega$\else \@ctrerr
  \fi
}% lc@greek


% The following macros are a variation on a trick from Victor
% Eijkhout's ``TeX by Topic'', page 142:
% Both \prepend@toklist and \append@toklist take two arguments,
% both of which should be token lists.
% \prepend@toklist prepends #2 to #1
% \append@toklist appends #2 to #1

\def\prepend@toklist#1#2{%
  \edef\do@it{\noexpand#1={\the#2\the#1}}%
  \do@it
}% prepend@toklist

\def\append@toklist#1#2{%
  \edef\do@it{\noexpand#1={\the#1\the#2}}%
  \do@it
}% append@toklist


% The command \qformat is provided for the user who wants to
% design a nonstandard question line.  If this command is used,
% then the usual line containing the question number and the beginning
% of the question will be replaced by the line specified by the
% \qformat command, and the question will begin on the following
% line.
% Within the argument of the \qformat command:
% \thequestion will be replaced by the question number, and
% \thepoints will be replaced by ``\@points \@pointname'' if the
% number of points has been specified for this question, and otherwise
% it inserts nothing at all.  (The conditional @placepoints is used to
% determine if there were points specified for this question.)
% The argument to the \qformat command *must* contain some
% stretch, i.e., at least one \hfil or \dotfill or ...
%
% The command \noqformat cancels the effect of \qformat and returns us
% to the default situation.
%
% The commands \bonusqformat and \nobonusformat are analogous.
\newif\if@qformat
\@qformatfalse
\newif\if@bonusqformat
\@bonusqformatfalse

\def\qformat#1{%
  \global\@qformattrue
  \gdef\@questionformat{#1}%
}% qformat
\def\bonusqformat#1{%
  \global\@bonusqformattrue
  \gdef\@bonusquestionformat{#1}%
}% bonusqformat

\newcommand\noqformat{%
  \global\@qformatfalse
}% noqformat
\newcommand\nobonusqformat{%
  \global\@bonusqformatfalse
}% nobonusqformat


% \thepoints is for use in either a \qformat command
% or a \pointformat command (or a \bonusqformat command).
% It needs to have the
% \if@placepoints so that if it's used in a \qformat command
% it won't print anything if there are no points:
\newcommand\thepoints{%
  \if@placepoints
    \if@bonus
      \@points \@bonuspointname
    \else
      \@points \@pointname
    \fi
  \fi
}% thepoints

% \themarginpoints is for use only in a \pointformat command,
% and so it doesn't need the \if@placepoints bit in \thepoints:
\newcommand\themarginpoints{%
  \if@bonus
    \@points \@marginbonuspointname
  \else
    \@points \@marginpointname
  \fi
}% themarginpoints

% We define the \subpart and \subsubpart commands when we enter a
% questions environment (rather than waiting until we enter a subparts
% of subsubparts environment) so that we can signal an error if a
% \subpart or \subsubpart command appears outside of the corresponding
% environment.  (We don't do this for the \part command so that the user
% can use the standard sectioning \part command outside of a parts
% environment.)

% The counter ques@object will count the items in each question, where
% an item is defined as either the question itself, or a part, or a
% subpart, or a subsubpart, or a choice.  This will be used by
% \find@quesend to find the last page occupied by the last question
% begun on or before the current page:
\newcounter{ques@object}

% \first@questionobject will be used by the \question command.
% That is, it will be used only once, but we want to keep its
% definition here, near the definitions of \addquestionobject and
% \questionobject@pluspagecheck.
\newcommand{\first@questionobject}{%
  \setcounter{ques@object}{1}%
  % \PgInfo@write expands it's argument, so we don't need edef:
%   \edef\q@object@label{%
%     question\arabic{question}@object\arabic{ques@object}}%
%   \PgInfo@write{\q@object@label}%
  \PgInfo@write{question\arabic{question}@object\arabic{ques@object}}%
}% first@questionobject

% \addquestionobject will be used by each part, subpart, and
% subsubpart, and can also be used by the user to mark the end of a
% question that spills over onto the next page without any part,
% subpart, etc. starting on that page:
\newcommand{\addquestionobject}{%
  \addtocounter{ques@object}{1}%
  % \PgInfo@write expands it's argument, so we don't need edef:
%   \edef\q@object@label{%
%     question\arabic{question}@object\arabic{ques@object}}%
%   \PgInfo@write{\q@object@label}%
  \PgInfo@write{question\arabic{question}@object\arabic{ques@object}}%
}% addquestionobject

% \questionobject@pluspagecheck will be used by each choice, as well
% as by any \part, \subpart, or \subsubpart that's inside of a
% solution.  It uses the questionobject to check if we're the first
% one on the current page, since choices (and questions etc. inside of
% solution environments) don't have labels the way that questions,
% parts, subparts, and subsubparts do (those things use the label to
% check if they're the first thing on the page).
\newcommand{\questionobject@pluspagecheck}{%
  % We don't want to do any of this if we're both inside a solution
  % environment and not printing answers (because we want to avoid
  % incrementing ques@object):
  \if@insolution
    \ifprintanswers
      \doqobj@ppchk
    \fi
  \else
    \doqobj@ppchk
  \fi
}% questionobject@pluspagecheck
\newcommand{\doqobj@ppchk}{%
  \addtocounter{ques@object}{1}%
  % We need the edef because we check the page of \q@object@label:
  \edef\q@object@label{%
    question\arabic{question}@object\arabic{ques@object}}%
  \PgInfo@write{\q@object@label}%
  \set@counter@to@pageof{Curr@Page}{\q@object@label}%
  \expandafter\ifx\csname Contin@\theCurr@Page\endcsname\relax
    % We're the first \question, \part, \subpart, \subsubpart,
    % or choice on this page:
    \global\expandafter\edef\csname
    Contin@\theCurr@Page\endcsname{\arabic{question}}%
  \fi
}% doqobj@ppchk                               



% if@bonus will be true when we're doing a bonusquestion or bonuspart
% or etc., and it will also be used also to distinguish between
% \gradetable and \bonusgradetable (and between \pointtable and
% \bonuspointtable, etc.), and also to distinguish between
% \pointsinrange and \bonuspointsinrange:
\newif\if@bonus
\@bonusfalse

% The following are for advanced users who want to customize the list
% parameters (\topsep, \partopsep, \itemsep, \parsep, etc.) for the
% lists that these environments create.  They are all defined to be
% empty, but the user can change them using \renewcommand.
\newcommand\questionshook{}
\newcommand\partshook{}
\newcommand\subpartshook{}
\newcommand\subsubpartshook{}
\newcommand\choiceshook{}
\newcommand\checkboxeshook{}


\newenvironment{questions}{%
  % \@queslevel is used for two purposes:
  % (1) We check that every \question, \part, \subpart, and 
  % \subsubpart command appears inside the appropriate environment,
  % and generate an error if one appears in the wrong place.
  % (2) If a \qformat is being used and if \@queslevel tells us
  % that we're currently processing a question, then we set
  % \global \point@toks={} to avoid setting the points for a 
  % question other than via the qformat command.
  \def\@queslevel{question}%
  \def\titledquestion##1{%
    \@bonusfalse
    \def\thequestiontitle{##1}%
    \process@question
  }%
  \def\bonustitledquestion##1{%
    \@bonustrue
    \def\thequestiontitle{##1}%
    \process@question
  }%
  \def\question{%
    \@bonusfalse
    \def\thequestiontitle{\csname p@question\endcsname
                          \csname thequestion\endcsname}%
    \process@question
  }%
  \def\bonusquestion{%
    \@bonustrue
    \def\thequestiontitle{\csname p@question\endcsname
                          \csname thequestion\endcsname}%
    \process@question
  }%
  \def\process@question{%
    \if@coverpages
      \cover@question@error
    \fi
    \@checkqueslevel{question}%
    \addtocounter{numquestions}{1}%
    % Write the sum of points of the previous question (if any)
    % to the .aux file.  (At this point, the question counter
    % has not yet been incremented, so \value{question} is the
    % number of the question that was just completed.)
    \if@filesw
      \ifnum \value{question} > 0\relax
        % First do regular points:
        \immediate\write\@mainaux
          {\string\gdef\string\pointsofq@
            \romannumeral \csname c@question\endcsname
              {\prtaux@hlfcntr{pointsof@thisquestion}}}%
        % See if this has changed from the last run of LaTeX:
        \CheckIfChanged@hlf{pointsof@thisquestion}{pointsofq@\romannumeral
                            \csname c@question\endcsname}%
        % Now do bonus points:
        \immediate\write\@mainaux
          {\string\gdef\string\bonuspointsofq@
            \romannumeral \csname c@question\endcsname
              {\prtaux@hlfcntr{bonuspointsof@thisquestion}}}%
        % See if this has changed from the last run of LaTeX:
        \CheckIfChanged@hlf{bonuspointsof@thisquestion}%
                           {bonuspointsofq@\romannumeral
                             \csname c@question\endcsname}%
      \fi
    \fi
    \set@hlfcntr{pointsof@thisquestion}{0}%
    \set@hlfcntr{bonuspointsof@thisquestion}{0}%
    % If there was a question with points immediately preceding
    % this question (i.e., there were no parts in the previous
    % question), then @placepoints will still be true, and we need to
    % cancel it.  (We used to do this inside of the \thepoints macro,
    % but that allowed for an error if the user specified points for a
    % question but had a \qformat that didn't mention \thepoints.)  We
    % also set @placepoints to be false when entering a parts
    % environment. 
    \global \@placepointsfalse
    % point@toks will normally be empty at this point, but it might be
    % nonempty if there were points somewhere in the previous question
    % that never made it onto the page because we never entered
    % horizontal mode (perhaps because the user was weird and let the
    % text of a question (or part, etc.) consist entirely of an
    % enumerate environment, or description environment, or etc.).
    \global \point@toks={}%
    % Important: Don't leave any blank lines inside of
    % \pageinfo@commands!!  This token list will be dumped into
    % horizontal mode by \everypar, and so any blank lines will
    % cause paragraph breaks. 
    \pageinfo@commands={%
      \edef\@queslabel{question@\arabic{question}}%
      \PgInfo@write{\@queslabel}%
      \first@questionobject
      % In addition to the \PgInfo@write we use an actual \label
      % command.  We do this in order to make the question numbers in
      % the grade tables into \ref's, so that if the user says
      % \usepackage{hyperref}, those question numbers will be clickable.
      % 
      % A further purpose of these labels (which we actually do for all
      % questions, parts, subparts, and subsubparts) is that if a
      % question (or part, etc.) is, e.g., moved from one page to
      % another, LaTeX will notice this and warn the user that LaTeX
      % must be run one more time to be sure everything is correct.
      % 
      % We need to do this even though we've already included code to
      % check when point totals change because questions (and parts,
      % etc.) know what page they're on from reading the info written to
      % the .aux file on the previous run.  Thus, if a question (or
      % part, etc.) is moved to a different page, then the pointsonpage
      % totals won't notice until the *second* subsequent run of LaTeX,
      % and so there'll be no warning to the user on the *first* run.
      % Including these labels gives the user a warning on that first
      % run.
      %
      % Further futzing required: Since this is being put into the
      % token list \pageinfo@commands, the contents of which won't
      % actually be  executed until we enter horizontal mode (which
      % may well be in the first part of a parts environment), we need
      % to make sure that \@currentlabel is the number of the
      % question:
      \begingroup % to confine the change to \@currentlabel
%        \def\@currentlabel{\csname p@question\endcsname
%                           \csname thequestion\endcsname}%
        \def\@currentlabel{\thequestiontitle}%
        \label{\@queslabel}%
      \endgroup
      \set@counter@to@pageof{Curr@Page}{\@queslabel}%
      \expandafter\ifx\csname Contin@\theCurr@Page\endcsname\relax
        % We're the first \question, \part, \subpart, \subsubpart,
        % or choice on this page:
        \global\expandafter\edef
               \csname Contin@\theCurr@Page\endcsname{\relax}%
      \fi
      \the\pagepoint@commands
      \global \pageinfo@commands={}%
    }% pageinfo@commands
    \ifhmode
      % Remove any skips at the end of the previous paragraph
      % that might cause a blank line, and then end that paragraph:
      \unskip\unskip \par
    \fi
    \@doitem
  }% process@question
  \def\subpart{%
    \@bonusfalse
    \process@subpart
  }%
  \def\bonussubpart{%
    \@bonustrue
    \process@subpart
  }%
  \def\process@subpart{%
    \if@coverpages
      \cover@question@error
    \fi
    \@checkqueslevel{subpart}%
    \if@insolution
      % We don't count this subpart, so no addtocounter{numsubparts}.
      \temp@toks={%
        \questionobject@pluspagecheck
        \global \pageinfo@commands={}%
        % We omit the pagepoint@commands
      }% temp@toks
    \else
      \addtocounter{numsubparts}{1}%
      % Important: Don't leave any blank lines inside of
      % \pageinfo@commands!!  This token list will be dumped into
      % horizontal mode by \everypar, and so any blank lines will
      % cause paragraph breaks. 
      \temp@toks={%
        \edef\@subpartlabel{subpart@\arabic{question}%
          @\arabic{partno}@\arabic{subpart}}%
        \PgInfo@write{\@subpartlabel}%
        \addquestionobject
        % In addition to the \PgInfo@write we use an actual \label
        % command.  We do this in order to make the question numbers in
        % the grade tables into \ref's, so that if the user says
        % \usepackage{hyperref}, those question numbers will be clickable.
        % 
        % A further purpose of these labels (which we actually do for all
        % questions, parts, subparts, and subsubparts) is that if a
        % question (or part, etc.) is, e.g., moved from one page to
        % another, LaTeX will notice this and warn the user that LaTeX
        % must be run one more time to be sure everything is correct.
        % 
        % We need to do this even though we've already included code to
        % check when point totals change because questions (and parts,
        % etc.) know what page they're on from reading the info written to
        % the .aux file on the previous run.  Thus, if a question (or
        % part, etc.) is moved to a different page, then the pointsonpage
        % totals won't notice until the *second* subsequent run of LaTeX,
        % and so there'll be no warning to the user on the *first* run.
        % Including these labels gives the user a warning on that first
        % run.
        \label{\@subpartlabel}%
        \set@counter@to@pageof{Curr@Page}{\@subpartlabel}%
        \expandafter\ifx\csname Contin@\theCurr@Page\endcsname\relax
          % We're the first \question, \part, \subpart, \subsubpart,
          % or choice on this page:
          \global\expandafter\edef\csname
                         Contin@\theCurr@Page\endcsname{\arabic{question}}%
        \fi
        \the\pagepoint@commands
        \global \pageinfo@commands={}%
      }% temp@toks
    \fi
    \append@toklist \pageinfo@commands \temp@toks
    \ifhmode
      % Remove any skips at the end of the previous paragraph
      % that might cause a blank line, and then end that paragraph:
      \unskip\unskip \par
    \fi
    \@doitem
  }% process@subpart
  \def\subsubpart{%
    \@bonusfalse
    \process@subsubpart
  }%
  \def\bonussubsubpart{%
    \@bonustrue
    \process@subsubpart
  }%
  \def\process@subsubpart{%
    \if@coverpages
      \cover@question@error
    \fi
    \@checkqueslevel{subsubpart}%
    \if@insolution
      % We don't count this subsubpart, so no addtocounter{numsubsubparts}.
      \temp@toks={%
        \questionobject@pluspagecheck
        \global \pageinfo@commands={}%
        % We omit the pagepoint@commands
      }% temp@toks
    \else
      \addtocounter{numsubsubparts}{1}%
      % Important: Don't leave any blank lines inside of
      % \pageinfo@commands!!  This token list will be dumped into
      % horizontal mode by \everypar, and so any blank lines will
      % cause paragraph breaks. 
      \temp@toks={%
        \edef\@subsubpartlabel{subsubpart@\arabic{question}%
          @\arabic{partno}@\arabic{subpart}@\arabic{subsubpart}}%
        \PgInfo@write{\@subsubpartlabel}%
        \addquestionobject
        % In addition to the \PgInfo@write we use an actual \label
        % command.  We do this in order to make the question numbers in
        % the grade tables into \ref's, so that if the user says
        % \usepackage{hyperref}, those question numbers will be clickable.
        % 
        % A further purpose of these labels (which we actually do for all
        % questions, parts, subparts, and subsubparts) is that if a
        % question (or part, etc.) is, e.g., moved from one page to
        % another, LaTeX will notice this and warn the user that LaTeX
        % must be run one more time to be sure everything is correct.
        % 
        % We need to do this even though we've already included code to
        % check when point totals change because questions (and parts,
        % etc.) know what page they're on from reading the info written to
        % the .aux file on the previous run.  Thus, if a question (or
        % part, etc.) is moved to a different page, then the pointsonpage
        % totals won't notice until the *second* subsequent run of LaTeX,
        % and so there'll be no warning to the user on the *first* run.
        % Including these labels gives the user a warning on that first
        % run.
        \label{\@subsubpartlabel}%
        \set@counter@to@pageof{Curr@Page}{\@subsubpartlabel}%
        \expandafter\ifx\csname Contin@\theCurr@Page\endcsname\relax
          % We're the first \question, \part, \subpart, \subsubpart,
          % or choice on this page:
          \global\expandafter\edef\csname
                         Contin@\theCurr@Page\endcsname{\arabic{question}}%
        \fi
        \the\pagepoint@commands
        \global \pageinfo@commands={}%
      }% temp@toks
    \fi
    \append@toklist \pageinfo@commands \temp@toks
    \ifhmode
      % Remove any skips at the end of the previous paragraph
      % that might cause a blank line, and then end that paragraph:
      \unskip\unskip \par
    \fi
    \@doitem
  }% process@subsubpart
  \list{\question@number}%
    {\usecounter{question}%
    % We use the default definition of \makelabel
    % so as not to interfere with \qformat commands.
    % \def\makelabel##1{\hss\llap{##1}}%
    \settowidth{\leftmargin}{10.\hskip\labelsep}%
    \labelwidth\leftmargin\advance\labelwidth-\labelsep
    \partopsep=0pt
    \questionshook
    }%
  }% End of the first argument of \newenvironment{questions}
  {%
    \endlist
    % Write the number of points of the final question
    % to the .aux file:
    \if@filesw
      \ifnum \value{question} > 0\relax
        % First do the regular points:
        \immediate\write\@mainaux
          {\string\gdef\string\pointsofq@\romannumeral
                                \csname c@question\endcsname
            {\prtaux@hlfcntr{pointsof@thisquestion}}}%
        % See if this has changed from the last run of LaTeX:
        \CheckIfChanged@hlf{pointsof@thisquestion}%
                           {pointsofq@\romannumeral
                            \csname c@question\endcsname}%
        % Now do the bonus points:
        \immediate\write\@mainaux
          {\string\gdef\string\bonuspointsofq@\romannumeral
                                \csname c@question\endcsname
            {\prtaux@hlfcntr{bonuspointsof@thisquestion}}}%
        % See if this has changed from the last run of LaTeX:
        \CheckIfChanged@hlf{bonuspointsof@thisquestion}%
                           {bonuspointsofq@\romannumeral
                            \csname c@question\endcsname}%
      \fi
    \fi
  }% End of the second argument of \newenvironment{questions}
  
% \question@number is used as the label in the question list (instead
% of \questionlabel) so that if the user uses a \qformat command,
% we'll use the \@questionformat specified by the \qformat command:

\def\question@number{%
  \if@bonus
    \if@bonusqformat
      \makebox[\hsize][s]{\@bonusquestionformat}\hskip-\labelsep
    \else
      \questionlabel
    \fi
  \else
    \if@qformat
      \makebox[\hsize][s]{\@questionformat}\hskip-\labelsep
    \else
      \questionlabel
    \fi
  \fi
}
\newcommand\questionlabel{\thequestion.}
     
% We want the \part command to be defined *only* inside of a parts
% environment, so that the user can use the standard sectioning \part
% command inside of a questions environment (as long as it's outside of
% a parts environment).

\newenvironment{parts}{%
  \def\@queslevel{part}%
  % If the question numbers are being inserted via a \qformat,
  % and if a question is beginning with a parts environment, then
  % we need to enter horizonal mode to get the qformat printed
  % on the page, rather than saving up the question label (and
  % possible points) to be combined with the label of the first
  % part.  (\if@inlabel tells us if we are still waiting to enter
  % horizontal mode after seeing a \question command.)
  \if@bonus
    \if@bonusqformat
      \if@inlabel
        \leavevmode
        \@inlabelfalse
      \fi
      % The following is just in case the question had points,
      % in which case @placepoints will still be true.
      % (We used to do this inside of the \thepoints macro,
      % but that allowed for an error if the user specified points for
      % a question but had a \qformat that didn't mention \thepoints.)
      % We also set @placepoints to be false in the \question command,
      % in case one queation follows a previous one that had no parts.
      \global \@placepointsfalse
    \fi
  \else
    \if@qformat
      \if@inlabel
        \leavevmode
        \@inlabelfalse
      \fi
      % The following is just in case the question had points,
      % in which case @placepoints will still be true.
      % (We used to do this inside of the \thepoints macro,
      % but that allowed for an error if the user specified points for
      % a question but had a \qformat that didn't mention \thepoints.)
      % We also set @placepoints to be false in the \question command,
      % in case one queation follows a previous one that had no parts.
      \global \@placepointsfalse
    \fi
  \fi
  \def\part{%
    \@bonusfalse
    \process@part
  }%
  \def\bonuspart{%
    \@bonustrue
    \process@part
  }%
  \def\process@part{%
    \if@coverpages
      \cover@question@error
    \fi
    \@checkqueslevel{part}%
    \if@insolution
      % We don't count this part, so no addtocounter{numparts}.
      \temp@toks={%
        \questionobject@pluspagecheck
        \global \pageinfo@commands={}%
        % We omit the pagepoint@commands
      }% temp@toks
    \else
      \addtocounter{numparts}{1}%
      % Important: Don't leave any blank lines inside of
      % \pageinfo@commands!!  This token list will be dumped into
      % horizontal mode by \everypar, and so any blank lines will
      % cause paragraph breaks. 
      \temp@toks={%
        \edef\@partlabel{part@\arabic{question}@\arabic{partno}}%
        \PgInfo@write{\@partlabel}%
        \addquestionobject
        % In addition to the \PgInfo@write we use an actual \label
        % command.  We do this in order to make the question numbers in
        % the grade tables into \ref's, so that if the user says
        % \usepackage{hyperref}, those question numbers will be clickable.
        % 
        % A further purpose of these labels (which we actually do for all
        % questions, parts, subparts, and subsubparts) is that if a
        % question (or part, etc.) is, e.g., moved from one page to
        % another, LaTeX will notice this and warn the user that LaTeX
        % must be run one more time to be sure everything is correct.
        % 
        % We need to do this even though we've already included code to
        % check when point totals change because questions (and parts,
        % etc.) know what page they're on from reading the info written to
        % the .aux file on the previous run.  Thus, if a question (or
        % part, etc.) is moved to a different page, then the pointsonpage
        % totals won't notice until the *second* subsequent run of LaTeX,
        % and so there'll be no warning to the user on the *first* run.
        % Including these labels gives the user a warning on that first
        % run.
        \label{\@partlabel}%
        \set@counter@to@pageof{Curr@Page}{\@partlabel}%
        \expandafter\ifx\csname Contin@\theCurr@Page\endcsname\relax
          \global\expandafter\edef\csname
              Contin@\theCurr@Page\endcsname{\arabic{question}}%
        \fi
        \the\pagepoint@commands
        \global \pageinfo@commands={}%
      }% temp@toks
    \fi
    \append@toklist \pageinfo@commands \temp@toks
    \ifhmode
      % Remove any skips at the end of the previous paragraph
      % that might cause a blank line, and then end that paragraph:
      \unskip\unskip \par
    \fi
    \@doitem
  }% process@part
  \list{\partlabel}%
    {%
    \usecounter{partno}\def\makelabel##1{\hss\llap{##1}}%
    \settowidth{\leftmargin}{(m)\hskip\labelsep}%
    \labelwidth\leftmargin\advance\labelwidth-\labelsep
    \topsep=0pt
    \partopsep=0pt
    \partshook
    }%
  }% newenvironment{parts}
  {\endlist}
\newcommand\partlabel{(\thepartno)}
\def\thepartno{\alph{partno}}

\newenvironment{subparts}{%
  \def\@queslevel{subpart}%
  \list{\subpartlabel}%
    {%
    \usecounter{subpart}\def\makelabel##1{\hss\llap{##1}}%
    \settowidth{\leftmargin}{vii.\hskip\labelsep}%
    \labelwidth\leftmargin\advance\labelwidth-\labelsep
    \topsep=0pt
    \partopsep=0pt
    \subpartshook
    }%
  }%
  {\endlist}
\newcommand\subpartlabel{\thesubpart.}
\def\thesubpart{\roman{subpart}}

\newenvironment{subsubparts}{%
  \def\@queslevel{subsubpart}%
  \list{\subsubpartlabel}%
    {%
    \usecounter{subsubpart}\def\makelabel##1{\hss\llap{##1}}%
    \settowidth{\leftmargin}{($\psi$)\hskip\labelsep}%
    \labelwidth\leftmargin\advance\labelwidth-\labelsep
    \topsep=0pt
    \partopsep=0pt
    \subsubpartshook
    }%
  }%
  {\endlist}
\newcommand\subsubpartlabel{\thesubsubpart)}
\def\thesubsubpart{\greeknum{subsubpart}}




\pagepoint@commands={%
  \ifhlfcntr@pos{latest@points}%
    % We're putting a question (or part, etc.)
    % with points onto this page: 
    \ifnum \theCurr@Page > \thepageof@pagepoints\relax
      % These points go on a later page than
      % the points currently counted in @pagepoints:
      \ifnum \thepageof@pagepoints = 0\relax
        % Do nothing...
      \else
        \immediate\write\@mainaux
          {\string\gdef\string\pointsonpage@
           \romannumeral \csname c@pageof@pagepoints\endcsname
             {\prtaux@hlfcntr{@pagepoints}}}%
        % See if this has changed from the last run of LaTeX:
        \CheckIfChanged@hlf{@pagepoints}{pointsonpage@\romannumeral
                            \csname c@pageof@pagepoints\endcsname}%
      \fi
      % The following is a macro because \theCurr@Page and
      % \thepageof@pagepoints might differ by more than 1:
      \increment@pageof@pagepoints
      % The following label is so that we can make the page
      % numbers in a grade table indexed by page into \pageref's
      % so that \usepackage{hyperref} and pdflatex will
      % make them clickable:
      \label{firstpoints@onpage@\arabic{Curr@Page}}%
    \else
      % These points go on the same page as the points
      % currently counted in @pagepoints:
      \add@hlfcntrtohlfcntr{@pagepoints}{latest@points}%
      \set@hlfcntr{latest@points}{0}%
    \fi
  \fi
  \ifhlfcntr@pos{latest@bonuspoints}%
    % We're putting a question (or part, etc.)
    % with bonus points onto this page: 
    \ifnum \theCurr@Page > \thepageof@pagebonuspoints\relax
      % These bonus points go on a later page than
      % the points currently counted in @pagebonuspoints:
      \ifnum \thepageof@pagebonuspoints = 0\relax
        % Do nothing...
      \else
        \immediate\write\@mainaux
          {\string\gdef\string\bonuspointsonpage@
           \romannumeral \csname c@pageof@pagebonuspoints\endcsname
             {\prtaux@hlfcntr{@pagebonuspoints}}}%
        % See if this has changed from the last run of LaTeX:
        \CheckIfChanged@hlf{@pagebonuspoints}%
                           {bonuspointsonpage@\romannumeral
                            \csname c@pageof@pagebonuspoints\endcsname}%
      \fi
      % The following is a macro because \theCurr@Page and
      % \thepageof@pagebonuspoints might differ by more than 1:
      \increment@pageof@pagebonuspoints
      % The following label is so that we can make the page
      % numbers in a bonus grade table indexed by page into \pageref's
      % so that \usepackage{hyperref} and pdflatex will
      % make them clickable:
      \label{firstbonuspoints@onpage@\arabic{Curr@Page}}%
    \else
      % These points go on the same page as the points
      % currently counted in @pagebonuspoints:
      \add@hlfcntrtohlfcntr{@pagebonuspoints}{latest@bonuspoints}%
      \set@hlfcntr{latest@bonuspoints}{0}%
    \fi
  \fi
}% pagepoint@commands
\def\increment@pageof@pagepoints{%
  \addtocounter{pageof@pagepoints}{1}%
  \ifnum \theCurr@Page > \thepageof@pagepoints\relax
    \immediate\write\@mainaux
        {\string\gdef\string\pointsonpage@
         \romannumeral \csname c@pageof@pagepoints\endcsname{0}}%
    % See if this has changed from the last run of LaTeX:
    \@ifundefined{pointsonpage@\romannumeral
                        \csname c@pageof@pagepoints\endcsname}
      {\global\@pointschangedtrue}%
      {%
      % OK; it's defined.  See if it's changed:
      \begingroup
        \set@hlfcntr{tmp@hlfcntr}{\csname pointsonpage@\romannumeral 
                  \csname c@pageof@pagepoints\endcsname\endcsname}%
        \edef\othpt@check{\prtaux@hlfcntr{tmp@hlfcntr}}%
        \def\pt@check{0}%
        \ifx \pt@check \othpt@check
          % Do nothing
        \else
          \global\@pointschangedtrue
        \fi
      \endgroup
      }%
    \let\next@incr@pageof = \increment@pageof@pagepoints
  \else
    \copy@hlfcntr{@pagepoints}{latest@points}%
    \set@hlfcntr{latest@points}{0}%
    % \page@withpoints will be used to find the last
    % page that has points, which will be written to
    % the .aux file via \AtEndDocument:
    \global\edef\page@withpoints{\thepageof@pagepoints}%
    \let\next@incr@pageof = \relax
  \fi
  \next@incr@pageof
}% increment@pageof@pagepoints
\def\increment@pageof@pagebonuspoints{%
  \addtocounter{pageof@pagebonuspoints}{1}%
  \ifnum \theCurr@Page > \thepageof@pagebonuspoints\relax
    \immediate\write\@mainaux
        {\string\gdef\string\bonuspointsonpage@
         \romannumeral \csname c@pageof@pagebonuspoints\endcsname{0}}%
    % See if this has changed from the last run of LaTeX:
    \@ifundefined{bonuspointsonpage@\romannumeral
                        \csname c@pageof@pagebonuspoints\endcsname}
      {\global\@pointschangedtrue}%
      {%
      % OK; it's defined.  See if it's changed:
      \begingroup
        \set@hlfcntr{tmp@hlfcntr}{\csname bonuspointsonpage@\romannumeral 
                  \csname c@pageof@pagebonuspoints\endcsname\endcsname}%
        \edef\othpt@check{\prtaux@hlfcntr{tmp@hlfcntr}}%
        \def\pt@check{0}%
        \ifx \pt@check \othpt@check
          % Do nothing
        \else
          \global\@pointschangedtrue
        \fi
      \endgroup
      }%
    \let\next@incr@pageof = \increment@pageof@pagebonuspoints
  \else
    \copy@hlfcntr{@pagebonuspoints}{latest@bonuspoints}%
    \set@hlfcntr{latest@bonuspoints}{0}%
    % \page@withbonuspoints will be used to find the last
    % page that has bonus points, which will be written to
    % the .aux file via \AtEndDocument:
    \global\edef\page@withbonuspoints{\thepageof@pagebonuspoints}%
    \let\next@incr@pageof = \relax
  \fi
  \next@incr@pageof
}% increment@pageof@pagebonuspoints






\def\@checkqueslevel#1{%
  \begingroup
    \def\exam@temp{#1}%
    \ifx\exam@temp\@queslevel
      % Everything's fine; do nothing.
    \else
      \ClassError{exam}{%
        I found a #1 where I expected to find a
        \@queslevel\MessageBreak
      }{%
        Both #1 and \@queslevel \space can be used only inside the
        correct \MessageBreak \space \space
        environment and outside of any smaller environment
        \MessageBreak
      }%
    \fi
  \endgroup
}

\def\@doitem{\@ifnextchar[{\@readpoints}%
                          {\item@points@pageinfo}%
}

\def\@readpoints[#1]{%
% We use \def for \@points instead of \edef because we don't want
% \half (if present) to be expanded yet, so that the command \points
% can figure out how to deal with it:
  \def\@points{#1}%
  \global \@placepointstrue
  \if@addpoints
    \if@bonus
      \addto@hlfcntr{numbonuspoints}{\@points}%
      \addto@hlfcntr{bonuspointsof@thisquestion}{\@points}%
      % latest@bonuspoints is a holding area for bonus points to be
      % added to @pagepoints after we check whether they're
      % on the same page as the points currently counted
      % by @pagepoints:
      \addto@hlfcntr{latest@bonuspoints}{\@points}%
    \else
      \addto@hlfcntr{numpoints}{\@points}%
      \addto@hlfcntr{pointsof@thisquestion}{\@points}%
      % latest@points is a holding area for points to be
      % added to @pagepoints after we check whether they're
      % on the same page as the points currently counted
      % by @pagepoints:
      \addto@hlfcntr{latest@points}{\@points}%
    \fi
  \fi
  \item@points@pageinfo
}




% Bug fix, 5 April 2004: \item@points@pageinfo
% Appending \point@toks and \pageinfo@commands to \everypar:
% Instead of appending the contents of \point@toks and
% \pageinfo@commands to \everypar using \append@toklist,
% we instead want to append only the two tokens
%   \the\point@toks
% and the two tokens
%   \the\pageinfo@commands
% to \everypar.  We need to do this because if a questions environment
% immediately follows a \section command, then @nobreak will be true,
% and so the \if@nobreak inside of \everypar will *not* execute the
% \everypar={} that we had been counting on to keep the points from
% being inserted a second time in the second paragraph of a question.
% Since we've put the command \global \point@toks={} inside of 
% \point@toks and the command \pageinfo@commands={} inside of
% \pageinfo@commands, when the contents of \point@toks and of
% \pageinfo@commands are executed (when we enter horizontal mode and
% \everypar is dumped in), the contents of \point@toks and
% \pageinfo@commands will be made empty, and so if
% the second paragraph also gets \the\point@toks and
% \the\pageinfo@commands, it won't matter.

\def\item@points@pageinfo{%
  \item
  % Also: We need to do this here, *after* the \item command, rather
  % than inside the macro \@readpoints, because the \item command
  % puts the result of the \qformat command into an \hbox (with the
  % command ``\sbox\@tempboxa{\makelabel{#1}}%''), expanding the
  % argument of \qformat as it does so.  Thus, @placepoints will be
  % true when the argument of \qformat is expanded, and so if the
  % user put a \thepoints command inside that argument it will
  % correctly expand to the number of points.  (When @placepoints is
  % false, \thepoints expands to nothing at all).
  %
  % We also want to define \padded@point@block when @placepoints is
  % true even if qformat and bonusqformat are true just in case the
  % user, for some deranged reason, says \droppoints immediately
  % following a \question.
  %
  \if@placepoints
    % Since we want the user to be able to say \thepoints in the
    % argument to a \pointformat command, we need \@placepointstrue
    % when \point@block is expanded so that \thepoints will actually
    % print something.  (After setting up \point@toks, we do
    % \@placepointsfalse, but \point@block isn't actually expanded
    % until we enter horizontal mode.)  Thus, we define
    % \padded@point@block, and use that instead of \point@block.  We
    % put  \begingroup and \endgroup around this to confine the
    % effect of \@placepointstrue and also to confine the effect of
    % any declarations like, e.g., \bfseries that the user might put
    % in the argument of a \pointformat command.
    %
    % Note: We first tried using an \edef to expand \point@block right
    % here, while @placepoints is true, but that causes problems if
    % the user puts a \boldmath declaration in the argument of a
    % \pointformat command.  Apparently, expanding \boldmath (without 
    % executing anything) gives you bunches of undefined control
    % sequence errors.
    \if@bonus
      \def\padded@point@block{%
        \begingroup
          \@placepointstrue
          \bonuspoint@block
        \endgroup
      }%
    \else
      \def\padded@point@block{%
        \begingroup
          \@placepointstrue
          \point@block
        \endgroup
      }%
    \fi
    % \setup@point@toks puts commands into \point@toks to place
    % \padded@point@block at the correct spot.  It doesn't append
    % anything to \everypar (we do that in this macro, below). 
    %
    % If @qformat is true, and if we're currently doing a question (or
    % if @bonusqformat is true and we're doing a bonusquestion)
    % (rather than a part, subpart, or subsubpart), then we don't want
    % to set the points (if any), since the points of a question will
    % appear only if the user chooses to cause that by putting a
    % \thepoints in the argument of the \qformat command.
    \if@pointsdropped
      % Do nothing!
    \else
      \if@bonus
        \if@bonusqformat
          \ifx\ques@ref\@queslevel
            % Do nothing
          \else
            \setup@point@toks
          \fi
        \else
          \setup@point@toks
        \fi
      \else
        \if@qformat
          \ifx\ques@ref\@queslevel
            % Do nothing
          \else
            \setup@point@toks
          \fi
        \else
          \setup@point@toks
        \fi
      \fi
    \fi
    \global \@placepointsfalse
  \fi
  % We *don't* use \append@toklist; see the Bug fixnote above
  % (Bug fix, 5 April 2004).
  % We can append the tokens ``\the\point@toks'' whether or not we're
  % setting any points because if we're not setting them, \point@toks
  % will be empty.
  % Also: It's important to do this *after* the \item command above,
  % since the \item command discards the previous contents of
  % \everypar.
  % Version 2.218$\beta$, 2007/10/31 changes:
  % Instead of appending
  %   \the \pageinfo@commands \the \point@toks
  % to \everypar, we insert them into the box \@labels.  This corrects
  % the problem that arose when a question (or part, etc.) begins with
  % a list environment (including verbatim, flushleft, center,
  % flushright, and possibly others that are implemented as trivlist
  % environments).  The \item command in those environments throws
  % away the previous contents of \everypar, and so the tokens \the
  % \pageinfo@commands \the \point@toks didn't get inserted where we
  % expected.  List environments *do* preserve the contents of the box
  % \@labels, though.
  \global\setbox\@labels\hbox{\unhbox\@labels
    \the \pageinfo@commands
    \the \point@toks}%
  %   \edef\append@everypar{\noexpand\everypar={\the\everypar
  %                         \noexpand\the \noexpand\pageinfo@commands
  %                         \noexpand\the \noexpand\point@toks}}%
  %   \append@everypar
}







% Initialize \@points:
% (The only reason I think this is necessary is in case the user uses
% a \qformat command, puts \themarginpoints into the format (which is
% *not* the intended use of \themarginpoints), and then doesn't have
% any points for the first question.)
\def\@points{0}


\def\setup@point@toks{%
% We set the token list \point@toks equal to the sequence of commands
% needed to put \padded@point@block at the correct location, followed
% by the tokens ``\global \point@toks={}''.  The \question, \part,
% \subpart, or \subsubpart command then adds the two tokens
% ``\the\point@toks'' to \everypar.
%
% Note: It is not the *contents* of \point@toks that is added to
% \everypar; just the two tokens ``\the\point@toks''.  This difference
% is the bug fix of 2 April 2004, described above (the bug was that in
% earlier versions, we used to append the contents).
%
% The result of this is that whenever we finally enter horizontal mode
% (because we finally encountered the text of a question, part,
% subpart, or subsubpart) the contents of \point@toks will be dumped
% into horizontal mode and executed, and so the points will be placed
% and the token list \point@toks will be set to empty.  Thus, in the
% occasional circumstances in which \everypar is *not* set to empty
% after being added to the first paragraph (which occurs when a
% questions environment immediately follows a \section command), and
% so \everypar will still contain ``\the\point@toks'' when it
% encounters a possible second paragraph of the first question, the
% tokens ``\the\point@toks'' will insert an *empty* token list, which
% will do no harm.
%
  \if@pointstwosided
    % Set \csname \q@label \endcsname equal to the thing
    % that expands to the page number of the current (question or
    % part or subpart or subsubpar; whatever it is), but do it
    % carefully because, if we don't yet have page info, then it won't
    % be defined:
    \ifx\@queslevel\ques@ref
      \def\q@label{Pg@question@\arabic{question}}
    \else
      \ifx\@queslevel\part@ref
        \def\q@label{Pg@part@\arabic{question}@\arabic{partno}}
      \else
        \ifx\@queslevel\subpart@ref
          \def\q@label{Pg@subpart@\arabic{question}%
            @\arabic{partno}@\arabic{subpart}}
        \else
          \ifx\@queslevel\subsubpart@ref
            \def\q@label{Pg@subsubpart@\arabic{question}%
              @\arabic{partno}@\arabic{subpart}@\arabic{subsubpart}}
          \else
            \ClassError{exam}{%
              This can't happen in function \protect\setup@point@toks
              \MessageBreak
            }{%
              An unexplained error occurred in exam.cls;\MessageBreak
              please inform the package maintainer, and send along
              \MessageBreak
              the LaTeX file that shows the error.\MessageBreak
            }%
          \fi
        \fi
      \fi
    \fi
    % 
    \expandafter\ifx \csname \q@label \endcsname\relax
      % No page info yet; put it into the right margin
      \@pointsinrightmargintrue
      \@pointsinleftmarginfalse
    \else
      \ifodd \csname \q@label \endcsname\relax
        \if@pointsinoutsidemargin
          \@pointsinrightmargintrue
          \@pointsinleftmarginfalse
        \else
          \@pointsinrightmarginfalse
          \@pointsinleftmargintrue
        \fi
      \else
        \if@pointsinoutsidemargin
          \@pointsinrightmarginfalse
          \@pointsinleftmargintrue
        \else
          \@pointsinrightmargintrue
          \@pointsinleftmarginfalse
        \fi
      \fi
    \fi
  \fi
  % That ends the \if@pointstwosided.
  % Now we actually setup \point@toks:
  \if@pointsinleftmargin
    \point@toks={%
          \llap{\padded@point@block 
                \hskip\@totalleftmargin
                \hskip\marginpointssep
          }%
          \global \point@toks={}%
    }%
  \else
    \if@pointsinrightmargin
      \point@toks={%
            \rlap{\hskip-\@totalleftmargin
                  \hskip\textwidth
                  \hskip\@rightmargin
                  \hskip-\rightpointsmargin
                  \llap{\padded@point@block}%
            }%
            \global \point@toks={}%
      }%
    \else
      % The points just go after the question number:
      \point@toks={%
            \padded@point@block
            \enspace
            \global \point@toks={}%
      }%
    \fi
  \fi
}% setup@point@toks

\def\droppoints{%
  \leavevmode\unskip\nobreak\hfill
  \rlap{\hskip\rightmargin  % Defined by the list environment
        \hskip\@rightmargin % Defined by exam.cls
        \hskip-\rightpointsmargin
        \llap{\padded@point@block}%
  }% rlap
  \par
}

\def\droptotalpoints{%
  \leavevmode\unskip\nobreak\hfill
  \rlap{\hskip\rightmargin  % Defined by the list environment
        \hskip\@rightmargin % Defined by exam.cls
        \hskip-\rightpointsmargin
        \llap{\total@block}%
  }% rlap
  \par
}% droptotalpoints
\def\droptotalbonuspoints{%
  \leavevmode\unskip\nobreak\hfill
  \rlap{\hskip\rightmargin  % Defined by the list environment
        \hskip\@rightmargin % Defined by exam.cls
        \hskip-\rightpointsmargin
        \llap{\bonustotal@block}%
  }% rlap
  \par
}% droptotalbonuspoints

% The following is the default definition;
% it can be changed by a \totalformat command.
\def\total@block{%
  Total for Question \thequestion: \totalpoints\@marginpointname
}% total@block
\def\bonustotal@block{%
  Total for Question \thequestion: \totalbonuspoints\@marginbonuspointname
}% bonustotal@block

\def\totalformat#1{%
  \gdef\total@block{\begingroup #1\endgroup}%
}% totalformat
\def\bonustotalformat#1{%
  \gdef\bonustotal@block{\begingroup #1\endgroup}%
}% bonustotalformat
% The following is for use in the argument to a \totalformat command:
\def\totalpoints{\pointsofquestion{\arabic{question}}}
\def\totalbonuspoints{\bonuspointsofquestion{\arabic{question}}}



% @placepoints is set true when we encounter a question (or part, etc.)
% that has points.  It is set to false (1) when we set \point@toks equal
% to the sequence of commands required to put the properly formatted
% points onto the page (this happens only if @qformat is false or if
% @qformat is true but we're not doing a question), or (2) by a
% \question command or entering a parts environment (since if we're
% doing a question and @qformat is true, we need to leave @placepoints
% true so that the \thepoints command can tell if it should expand to
% points or to nothing, and encountering a \question command or parts
% environment tells us that we no longer have to deal with a possible
% \thepoints, since we won't be expanding a qformat).
\newif\if@placepoints
\@placepointsfalse


% \marginpointssep will be used if the user says
% \pointsinleftmargin.  It will be the distance from whatever encloses
% the points (parentheses, brackets, or a box) to the left margin:
\newlength\marginpointssep
\setlength{\marginpointssep}{5pt}

% \rightpointsmargin will be used if the user says \pointsinrightmargin.
% It will be the distance from whatever encloses the point (parentheses,
% brackets, or a box) to the right edge of the paper:
\newlength\rightpointsmargin
\setlength{\rightpointsmargin}{1cm}


\newif\if@pointsdropped
\newif\if@pointsinleftmargin
\newif\if@pointsinrightmargin
\newif\if@pointstwosided
\newif\if@pointsinoutsidemargin

% If we have \@pointstwosidedtrue and \@pointsinoutsidemarginfalse,
% then the points will be printed on the inside margin (left on odd
% numbered pages, right on even numbered pages).  If we have
% \@pointstwosidedfalse, then \if@pointsinoutsidemargin is ignored.

% If we have \@pointstwosidedtrue, then both \@pointsinleftmargin and
% \@pointsinrightmargin will be flipped back and forth, as needed, in
% \setup@point@toks.

\def\pointsinleftmargin{\global\@pointsinleftmargintrue 
                    \global\@pointsinrightmarginfalse
                    \global\@pointsdroppedfalse
                    \global\@pointstwosidedfalse
                    \gdef\pt@name{\@marginpointname}%
                    \gdef\bnspt@name{\@marginbonuspointname}}
\def\pointsinrightmargin{\global\@pointsinrightmargintrue
                         \global\@pointsinleftmarginfalse
                         \global\@pointsdroppedfalse
                         \global\@pointstwosidedfalse
                         \gdef\pt@name{\@marginpointname}%
                         \gdef\bnspt@name{\@marginbonuspointname}}
\def\nopointsinmargin{\global\@pointsinleftmarginfalse
                      \global\@pointsinrightmarginfalse
                      \global\@pointsdroppedfalse
                      \global\@pointstwosidedfalse
                      \gdef\pt@name{\@pointname}%
                      \gdef\bnspt@name{\@bonuspointname}}
\def\pointsdroppedatright{\global\@pointsdroppedtrue
                          \global\@pointsinleftmarginfalse
                          \global\@pointsinrightmarginfalse
                          \global\@pointstwosidedfalse
                          \gdef\pt@name{\@marginpointname}%
                          \gdef\bnspt@name{\@marginbonuspointname}}
\def\pointstwosided{\global\@pointstwosidedtrue
                    \global\@pointsinoutsidemargintrue
                    \global\@pointsdroppedfalse
                    \gdef\pt@name{\@marginpointname}%
                    \gdef\bnspt@name{\@marginbonuspointname}}
\def\pointstwosidedreversed{\global\@pointstwosidedtrue
                            \global\@pointsinoutsidemarginfalse
                            \global\@pointsdroppedfalse
                            \gdef\pt@name{\@marginpointname}%
                            \gdef\bnspt@name{\@marginbonuspointname}}
\let\pointsinmargin=\pointsinleftmargin
\let\nopointsinrightmargin=\nopointsinmargin
\let\nopointsinleftmargin=\nopointsinmargin

\nopointsinmargin


% Will the points be displayed inside parentheses (the default), or
% will they be boxed or bracketed, or customized using pointformat:
\def\boxedpoints{%
  \gdef\point@block{\fbox{\@points\pt@name}}%
  \gdef\bonuspoint@block{\fbox{\@points\bnspt@name}}%
}
\def\noboxedpoints{%
  \gdef\point@block{(\@points\pt@name)}%
  \gdef\bonuspoint@block{(\@points\bnspt@name)}%
}
\def\bracketedpoints{%
  \gdef\point@block{[\@points\pt@name]}%
  \gdef\bonuspoint@block{[\@points\bnspt@name]}%
}
\let\nobracketedpoints=\noboxedpoints

\def\pointformat#1{%
  % We don't have to worry about the user putting things
  % like \bfseries, etc. into \point@block, because
  % \padded@point@block encloses \point@block in a group,
  % which confines the effects of anything here:
  \gdef\point@block{#1}%
}

\def\bonuspointformat#1{%
  % We don't have to worry about the user putting things
  % like \bfseries, etc. into \point@block, because
  % \padded@point@block encloses \point@block in a group,
  % which confines the effects of anything here:
  \gdef\bonuspoint@block{#1}%
}

%Initialize:
\noboxedpoints




\def\pointname#1{\gdef\@pointname{#1}}
\def\bonuspointname#1{\gdef\@bonuspointname{#1}}
% Initialize to leave a space, and then the word `points':
%%\pointname{ points}
% The following improvement was contributed by 
% Mate Wierdl <mw@wierdlmpc.msci.memphis.edu> 
% If the number of points is ``1'', then the default value of
% \pointname will print `` point'' instead of `` points'' (and this
% version of the command doesn't generate an error message if the
% points entry is something other than a number):
% Note the space before the \points in the following; it's
% intentional!)
\pointname{ \points}
\bonuspointname{ \bonuspoints}
\newcommand\point@sing{point}
\newcommand\point@plur{points}
\newcommand\pointpoints[2]{%
  \renewcommand\point@sing{#1}%
  \renewcommand\point@plur{#2}%
}
%\newcommand\bonuspoint@sing{bonus point}
%\newcommand\bonuspoint@plur{bonus points}
\newcommand\bonuspoint@sing{point (bonus)}
\newcommand\bonuspoint@plur{points (bonus)}
\newcommand\bonuspointpoints[2]{%
  \renewcommand\bonuspoint@sing{#1}%
  \renewcommand\bonuspoint@plur{#2}%
}



% The command \points:
% We use \ifthenelse and \equal so that if the user types something
% other than a legit point value, there still won't be any error
% messages.  We rig it so that if the point value looks like it's
% intended to be One or one or ONE, or some strange way of attempting
% one half, then it will expand to the singular value.  Alas, this is
% only useful for English, but I'm hoping few or no users will try doing
% this anyway.

% 0 points, one half point, 1 point, 1 and a half points, etc.:
\newcommand\points{%
  \begingroup
    \let\half=\relax
    \edef\pt@string{\@points}%
    \ifthenelse{\equal{\pt@string}{1} \or \equal{\pt@string}{\half}}
          {\point@sing}{\point@plur}%
  \endgroup
}% \points
\newcommand\bonuspoints{%
  \begingroup
    \let\half=\relax
    \edef\pt@string{\@points}%
    \ifthenelse{\equal{\pt@string}{1} \or \equal{\pt@string}{\half}}
          {\bonuspoint@sing}{\bonuspoint@plur}%
  \endgroup
}% \bonuspoints
%\newcommand\points{%
%  \begingroup
%    \let\half=\relax
%    \edef\pt@string{\@points}%
%    \ifthenelse{\equal{\pt@string}{1} \or \equal{\pt@string}{\half} \or
%      \equal{\pt@string}{0\half} \or \equal{\pt@string}{0 \half}
%      \equal{\pt@string}{one} \or \equal{\pt@string}{One} \or
%      \equal{\pt@string}{ONE}}
%        {\point@sing}{\point@plur}%
%  \endgroup
%}

%\newcommand\points{\ifthenelse{\equal{\@points}{1}}{\point@sing}{\point@plur}}
% If we used the following line instead, then you'd get an error
% message if the point value contained something other than a valid
% integer:
%\pointname{ \ifthenelse{\@points = 1}{point}{points}}

% We used to define a command named \marks that works like \points,
% except that it expands to either ``mark'' or ``marks'', but that
% conflicts with some package or other.  Thus, we'll implement
% \marksnotpoints using the \pointpoints command instead:
\newcommand\marksnotpoints{%
  \pointpoints{mark}{marks}%
  \bonuspointpoints{mark (bonus)}{marks (bonus)}%
}% \marksnotpoints


% \@marginpointname is used in place of \@pointname if any of
% \@pointsinmargin, \@pointsinrightmargin, and \@pointsdropped are
% true:
\def\marginpointname#1{\gdef\@marginpointname{#1}}
\marginpointname{}
\def\marginbonuspointname#1{\gdef\@marginbonuspointname{#1}}
\marginbonuspointname{ (bonus)}


%--------------------------------------------------------------------
%         choices (for multiple choice) and checkboxes


\renewcommand\thechoice{\Alph{choice}}
\newcommand\choicelabel{\thechoice.}

% We will have \@correctchoicetrue when we're printing solutions
% and we're printing the correct choice of a choices or
% oneparchoices environment.
% We'll say \begingroup before saying \@correctchoicetrue
% and we'll say \endgroup at either the next \choice or \correctchoice
% or the end of the choices or oneparchoices environment.
% Thus, we'll never again need to say \@correctchoicefalse
\newif\if@correctchoice
\@correctchoicefalse

\newcommand\CorrectChoiceEmphasis[1]{%
  \def\CorrectChoice@Emphasis{#1}%
}
\CorrectChoiceEmphasis{\bfseries}
\let\correctchoiceemphasis\CorrectChoiceEmphasis

% Note: \do@choice@pageinfo is used in both the choices and
% the checkboxes environments.
\newtoks\choice@toks
\def\do@choice@pageinfo{%
  \choice@toks={%
    \questionobject@pluspagecheck
    \choice@toks={}%
  }%
  % Version 2.217-beta changes:
  % Instead of appending stuff to \everypar, we insert
  % \the \pageinfo@commands and \the \point@toks 
  % into the box \@labels:
  \global\setbox\@labels\hbox{\unhbox\@labels
    \the \choice@toks}%
  %   \edef\append@everypar{\noexpand\everypar={\the\everypar
  %                         \noexpand\the \noexpand\choice@toks}}%
  %   \append@everypar
}% do@choice@pageinfo



% Added 22 April 2004: Increased the \leftmargin by 2.5em,
% so the choices will be visibly indented.
\newenvironment{choices}%
  {\list{\choicelabel}%
     {\usecounter{choice}\def\makelabel##1{\hss\llap{##1}}%
       \settowidth{\leftmargin}{W.\hskip\labelsep\hskip 2.5em}%
       \def\choice{%
         \if@correctchoice
           \color@endgroup
           \endgroup
         \fi
         \item
         \do@choice@pageinfo
       } % choice
       \def\CorrectChoice{%
         \if@correctchoice
           \color@endgroup
           \endgroup
         \fi
         \ifprintanswers
           % We can't say \choice here, because that would
           % insert an \endgroup:
           % 2016/05/10: We say \color@begingroup in addition to
           % \begingroup in case \CorrectChoiceEmphasis involves color
           % and the text exactly fills the line (which would
           % otherwise create a blank line after this choice):
           % 2016/05/11: We leave hmode if we're in it,
           % i.e., if there's no blank line preceding this
           % \CorrectChoice command.  (Without this, the
           % \special created by a \color{whatever} command that might
           % be inserted by \CorrectChoice@Emphasis would be appended 
           % to the previous \choice, which could cause an extra
           % (blank) line to be inserted before this \CorrectChoice.)
           % Since \par and \endgraf seem to cancel \@totalleftmargin
           % (for reasons I don't understand), we'll do the following:
           % Motivated by  the def of \leavevmode, 
           %      \def\leavevmode{\unhbox\voidb@x}
           % we will now leave hmode (if we're in hmode):
           % 2018/05/13: We move the \item command to before the
           % \begingroup and we also put
           % \CorrectChoice@Emphasis\choicelabel (along with grouping)
           % into the argument of the \item.  We did this to correct
           % the bug that appears when there is no text in between
           % the \begin{choices} and the first item and that first
           % item is a \correctchoice.  The fact that a group had been
           % begun before the first \item caused the label for the
           % second item to appear in the position of the label for
           % the item following that second item. 
           \ifhmode \unskip\unskip\unvbox\voidb@x \fi
           % 2018/08/22: We changed \stepcounter to \refstepcounter:
           \refstepcounter{choice}%
           \item[{\color@begingroup \CorrectChoice@Emphasis
                  \choicelabel \color@endgroup}]%
           \begingroup \color@begingroup \@correctchoicetrue
           \CorrectChoice@Emphasis
         \else
            \item
         \fi
         \do@choice@pageinfo
       } % CorrectChoice
       \let\correctchoice\CorrectChoice
       \labelwidth\leftmargin\advance\labelwidth-\labelsep
       \topsep=0pt
       \partopsep=0pt
       \choiceshook
     }%
  }%
  {\if@correctchoice \color@endgroup \endgroup \fi \endlist}

\newenvironment{oneparchoices}%
  {%
    \setcounter{choice}{0}%
    \def\choice{%
      \if@correctchoice \endgroup \fi
      \refstepcounter{choice}%
      \ifnum\value{choice}>1\relax
        \penalty -50\hskip 1em plus 1em\relax
      \fi
      \choicelabel
      % No need to put the following into a token string; we just put
      % the choicelabel onto the page, so we're at the spot whose page
      % number we want to record:
      \questionobject@pluspagecheck
      \nobreak\enskip
    }% choice
    \def\CorrectChoice{%
      \if@correctchoice \endgroup \fi
      \refstepcounter{choice}%
      \ifprintanswers
        \begingroup \@correctchoicetrue 
        \CorrectChoice@Emphasis
      \fi
      \ifnum\value{choice}>1\relax
        \penalty -50\hskip 1em plus 1em\relax
      \fi
      \choicelabel
      % No need to put the following into a token string; we just put
      % the choicelabel onto the page, so we're at the spot whose page
      % number we want to record:
      \questionobject@pluspagecheck
      \nobreak\enskip
    }% CorrectChoice
    \let\correctchoice\CorrectChoice
    \let\par\@empty
    % If we're continuing the paragraph containing the question,
    % then leave a bit of space before the first choice:
    \ifvmode\else\enskip\fi
    \ignorespaces
  }%
  {\if@correctchoice \endgroup \fi}

\newcommand{\checkboxchar}[1]{\def\checkbox@char{#1}}
\newcommand{\checkedchar}[1]{\def\checked@char{#1}}
\checkboxchar{$\bigcirc$}
\checkedchar{$\surd$}

\newenvironment{checkboxes}%
  {\list{\checkbox@char}%
     {%
       \settowidth{\leftmargin}{W.\hskip\labelsep\hskip 2.5em}%
       \def\choice{%
         \if@correctchoice
           \color@endgroup \endgroup
         \fi
         \item
         \do@choice@pageinfo
       } % choice
       \def\CorrectChoice{%
         \if@correctchoice
           \color@endgroup \endgroup
         \fi
         \ifprintanswers
           % We can't say \choice here, because that would
           % insert an \endgroup.
           % 2016/05/10: We say \color@begingroup in addition to
           % \begingroup in case \CorrectChoiceEmphasis involves color
           % and the text exactly fills the line (which would
           % otherwise create a blank line after this choice):
           % 2016/05/11: We leave hmode if we're in it,
           % i.e., if there's no blank line preceding this
           % \CorrectChoice command.  (Without this, the
           % \special created by a \color{whatever} command that might
           % be inserted by \CorrectChoice@Emphasis would be appended 
           % to the previous \choice, which could cause an extra
           % (blank) line to be inserted before this \CorrectChoice.)
           % Since \par and \endgraf seem to cancel \@totalleftmargin
           % (for reasons I don't understand), we'll do the following:
           % Motivated by  the def of \leavevmode, 
           %      \def\leavevmode{\unhbox\voidb@x}
           % we will now leave hmode (if we're in hmode):
           % 2018/05/13: We move the \item[\checked@char] to before
           % the \begingroup and we also put \CorrectChoice@Emphasis
           % (along with grouping) into the argument of the \item.  We
           % did this to correct the bug that appears when there is no
           % text in between the \begin{checkboxes} and the first item
           % and that first item is a \correctchoice.  The fact that a
           % group had been begun before the first \item caused the
           % label for the second item to appear in the position of
           % the label for the item following that second item.
           \ifhmode \unskip\unskip\unvbox\voidb@x \fi
           \item[{\color@begingroup\CorrectChoice@Emphasis\checked@char
                 \color@endgroup}]%
           \begingroup \color@begingroup \@correctchoicetrue
           \CorrectChoice@Emphasis
         \else
           \item
         \fi
         \do@choice@pageinfo
       } % CorrectChoice
       \let\correctchoice\CorrectChoice
       \labelwidth\leftmargin\advance\labelwidth-\labelsep
       \topsep=0pt
       \partopsep=0pt
       \checkboxeshook
     }%
  }%
  {\if@correctchoice \color@endgroup \endgroup \fi \endlist}

\newenvironment{oneparcheckboxes}%
  {%
    % Although we're not printing numbers for the choices, we use the
    % choice counter to keep track of whether a choice is the first
    % one (in which case we don't leave any additional space) or a
    % later one (in which case we do leave additional space):    
    \setcounter{choice}{0}%
    \def\choice{%
      \if@correctchoice \endgroup \fi
      \stepcounter{choice}%
      \ifnum\value{choice}>1\relax
        \penalty -50\hskip 1em plus 1em\relax
      \fi
      \checkbox@char
      % No need to put the following into a token string; we just put
      % \checkbox@char onto the page, so we're at the spot whose page
      % number we want to record:
      \questionobject@pluspagecheck
      \nobreak\enskip
    }% choice
    \def\CorrectChoice{%
      \if@correctchoice \endgroup \fi
      \stepcounter{choice}%
      \ifprintanswers
        \begingroup \@correctchoicetrue 
        \CorrectChoice@Emphasis
      \fi
      \ifnum\value{choice}>1\relax
        \penalty -50\hskip 1em plus 1em\relax
      \fi
      \ifprintanswers
        \checked@char
      \else
        \checkbox@char
      \fi
      % No need to put the following into a token string; we just put
      % the choicelabel onto the page, so we're at the spot whose page
      % number we want to record:
      \questionobject@pluspagecheck
      \nobreak\enskip
    }% CorrectChoice
    \let\correctchoice\CorrectChoice
    \let\par\@empty
    % If we're continuing the paragraph containing the question,
    % then leave a bit of space before the first choice:
    \ifvmode\else\enskip\fi
    \ignorespaces
  }%
  {\if@correctchoice \endgroup \fi}


%--------------------------------------------------------------------
%             Answer Lines (for short answer questions)

% Note: \ques@ref is also used in \item@points@pageinfo, and all four
% of the following are used in \setup@point@toks

\def\ques@ref{question}
\def\part@ref{part}
\def\subpart@ref{subpart}
\def\subsubpart@ref{subsubpart}

% Note: \answerclearance is also used by \fillin

\newlength\answerlinelength
\newlength\answerskip
\newlength\answerclearance
\setlength\answerlinelength{1in}
\setlength\answerskip{2ex}
\setlength\answerclearance{0.2ex}

\newcommand\answerline[1][{}]{%
  % One optional argument, the default value of which is empty.
  \ifx\@queslevel\ques@ref
    \let\ans@l=\questionlabel
  \else
    \ifx\@queslevel\part@ref
      \let\ans@l=\partlabel
    \else
      \ifx\@queslevel\subpart@ref
        \let\ans@l=\subpartlabel
      \else
        \ifx\@queslevel\subsubpart@ref
          \let\ans@l=\subsubpartlabel
        \else
          % Oops; no question level defined.
          % We must be outide of the questions environment.
          % Just leave out the label, I guess:
          \def\ans@l{}%
        \fi
      \fi
    \fi
  \fi
  \par \nobreak \vskip \answerskip
  \hfill 
  \ifprintanswers
    \ans@l~\hbox to 0pt{\hbox to \answerlinelength{\hrulefill}\hss}%
    \raise \answerclearance\hbox to \answerlinelength{%
      % 2016/05/10: Added \color@begingroup and \color@endgroup:
      \color@begingroup
      \CorrectChoice@Emphasis \hfil #1\hss
      \color@endgroup}%
  \else
    \ans@l~\hbox to \answerlinelength{\hrulefill}%
  \fi
  \par
}% answerline

%--------------------------------------------------------------------
%               \fillin, for fill-in-the-blank questions

\newlength\fillinlinelength
\setlength\fillinlinelength{1in}

% \fillin can take two optional arguments.
%
% The first optional argument is the answer to be printed above the line
% when \printanswers is in effect; the default value is empty.  That
% line is printed a distance of \answerclearance below the baseline.
%
% The second optional argument is the length of the line that we print;
% the default value is \fillinlinelength.  The value of
% \fillinlinelength is set with the command
%
%   \setlength\fillinlinelength{1in}
%
% and can be changed by giving a new \setlength command.
%
% When answers are being printed, the optional argument is printed
% subject to the declarations in the argument of the last
% \CorrectChoiceEmphasis command.  It is centered on the line unless it
% is too long, in which case it extends to the right of the line.
%
% \fillin eats (and ignores) space characters appearing before the
% first optional argument.  It also eats (and ignores) space
% characters appearing after the first optional argument and before
% the second optional argument.  However, if exactly one optional
% argument appears, and if there are one or more space characters
% following that one optional argument, then those spaces are replaced
% by a single space character, but not eaten.

\newcommand\fillin[1][{}]{%
   \def\fillin@ans{#1}%
   \fillin@relay
}% fillin

\newcommand\fillin@relay{%
  % We use \exam@ifnextchar, a variation on \@ifnextchar.
  % If \exam@ifnextchar encounters one or more space characters
  % followed by a [, then those spaces are ignored (just as they would
  % be by \@ifnextchar).  However, if one or more space characters are
  % followed by a non-space character other than [, then
  % \exam@ifnextchar inserts a space following the
  % {\@fillin@relay[\fillinlinelength]} that is the third argument to
  % \exam@ifnextchar.
  \exam@ifnextchar[{\@fillin@relay}
                   {\@fillin@relay[\fillinlinelength]}%
}% fillin@relay

\def\@fillin@relay[#1]{%
  % The first argument is in \fillin@ans, the second is #1.
  \leavevmode
  \ifprintanswers
    \rlap{\raise -\answerclearance \hbox to #1{\hrulefill}}%
    \begingroup
      \setbox0 \hbox{\color@begingroup
             \CorrectChoice@Emphasis \fillin@ans \color@endgroup}%
      \ifdim\wd0 > #1\relax
        \hbox{\color@begingroup\CorrectChoice@Emphasis \fillin@ans
              \color@endgroup}%
      \else
        \hbox to #1{\color@begingroup\CorrectChoice@Emphasis 
                    \hfil \fillin@ans \hfil\color@endgroup}%
      \fi
    \endgroup
  \else
    \raise -\answerclearance \hbox to #1{\hrulefill}%
  \fi
}% @fillin@relay

% \exam@ifnextchar is used by \fillin.
% \exam@ifnextchar is a variation of \@ifnextchar that does not always
% ignore space tokens.  If \exam@ifnextchar encounters one or more
% space tokens, it makes note of that (with the command
% \@tempswatrue).  If the first non-space character encountered
% matches argument #1, then any spaces that had been encountered are
% ignored.  However, if one or more spaces are encountered and the
% first non-space character found does not match argument #1, then
% \exam@ifnextchar produces argument #3 followed by a space character.
% (This differs from the behavior of \new@ifnextchar in amsgen.sty,
% which does lookahead for any character, including a space.)  This
% code (as well as the idea for it) is due to Dan Luecking and Ulrich
% Diez.
\long\def\exam@ifnextchar#1#2#3{%
  \let\reserved@d=#1%
  \def\reserved@a{#2}%
  \def\reserved@b{#3}%
  % The following says we haven't yet seen any spaces:
  \@tempswafalse
  \futurelet\@let@token\exam@ifnch
}% exam@ifnextchar

\def\exam@ifnch{%
  \ifx\@let@token\@sptoken
    % Signal that we've found a space:
    \@tempswatrue
    \let\reserved@c\exam@xifnch % this gobbles the space
  \else
    \ifx\@let@token\reserved@d
      \let\reserved@c\reserved@a
    \else
      \if@tempswa
        \def\reserved@c{\expandafter\reserved@b\space}%
      \else 
        \let\reserved@c\reserved@b
      \fi
    \fi
  \fi
  \reserved@c
}% exam@ifnch

% The following defines \exam@xifnch so that it will eat a space
% following it and then call \exam@ifnch:
{% keep redefinition of \: local
  \def\:{\exam@xifnch}
  \expandafter\gdef\: {\futurelet\@let@token\exam@ifnch}
}

%--------------------------------------------------------------------
%                            \fillwithlines


% \fillwithlines takes one argument, which is either a length or \fill
% or \stretch{number}, and it fills that much vertical space with
% horizontal lines that run the length of the current line.  That is,
% they extend from the current left margin (which depends on whether
% we're in a question, part, subpart, or subsubpart) to the right
% margin.
%
% The distance between the lines is \linefillheight, whose default value
% is set with the command
%
% \setlength\linefillheight{.25in}
%
% This value can be changed by giving a new \setlength command.
%
% The thickness of the lines is \linefillthickness, whose default value
% is set with the command
%
% \setlength\linefillthickness{.1pt}
%
% This value can be changed by giving a new \setlength command.
%
% As of version 2.503, 2016/03/25, the lines drawn by the
% \fillwithlines command will be drawn in color if the user has given
% the command
%
%      \colorfillwithlines.
%
% The actual drawing of the lines is now done by the command
% \do@fillwithlines, after the \fillwithlines command decides whether
% they will be in color.  The default color is set by the command
%
%      \definecolor{FillWithLinesColor}{gray}{0.8}
%
% and the color can be changed by giving a new \definecolor command.
% You can return to black lines by giving the command
%
%      \nocolorfillwithlines

\newlength\linefillheight
\newlength\linefillthickness
\setlength\linefillheight{.25in}
\setlength\linefillthickness{0.1pt}




\newif\if@colorfillwithlines
\@colorfillwithlinesfalse
\def\colorfillwithlines{%
  \@ifundefined{definecolor}
  {%
    \ClassError{exam}{%
      You must load the color package with the command\MessageBreak
      \space\space\protect\usepackage{color}\MessageBreak
      in order to use the command \protect\colorfillwithlines
      \MessageBreak
      }{%
      This command makes use of the package color.sty,\MessageBreak
      and so you have to load color.sty before your\MessageBreak
      \protect\begin{document} command.\MessageBreak
      }%
  }%
  {%
    \definecolor{FillWithLinesColor}{gray}{0.8}
    \@colorfillwithlinestrue
  }%
}% \colorfillwithlines
\def\nocolorfillwithlines{\@colorfillwithlinesfalse}

\newcommand\fillwithlines[1]{%
  \if@colorfillwithlines
    \color@begingroup
      \color{FillWithLinesColor}%
      \do@fillwithlines{#1}%
    \color@endgroup
  \else
    \do@fillwithlines{#1}%
  \fi
}% \fillwithlines

\newcommand\linefill{\leavevmode
    \leaders\hrule height \linefillthickness \hfill\kern\z@}

% \do@fillwithlines is called only by \fillwithlines
\def\do@fillwithlines#1{%
  \begingroup
  \ifhmode
    \par
  \fi
  \hrule height \z@
  \nobreak
  \setbox0=\hbox to \hsize{\hskip \@totalleftmargin
          \vrule height \linefillheight depth \z@ width \z@
          \linefill}%
  % We use \cleaders (rather than \leaders) so that a given
  % vertical space will always produce the same number of lines
  % no matter where on the page it happens to start:
  \cleaders \copy0 \vskip #1 \hbox{}%
  \endgroup
}% \do@fillwithlines

%--------------------------------------------------------------------
%                         \fillwithdottedlines


% \fillwithdottedlines is similar to \fillwithlines, except that it
% fills the space with dotted lines (created by \dotfill) rather than
% with solid lines.

% \fillwithdottedlines takes one argument, which is either a length or
% \fill or \stretch{number}, and it fills that much vertical space
% with dotted lines that run the length of the current line.  That is,
% they extend from the current left margin (which depends on whether
% we're in a question, part, subpart, or subsubpart) to the right
% margin.
%
% The distance between the lines is \dottedlinefillheight, whose
% default value is set with the command
%
% \setlength\dottedlinefillheight{.25in}
%
% This value can be changed by giving a new \setlength command.

% As of version 2.503, 2016/03/25, the dotted lines drawn by the
% \fillwithdottedlines command will be drawn in color if the user has
% given the command
%
%      \colorfillwithdottedlines.
%
% The actual drawing of the lines is now done by the command
% \do@fillwithdottedlines, after the \fillwithdottedlines command
% decides whether they will be in color.  The default color is set by
% the command 
%
%      \definecolor{FillWithDottedLinesColor}{gray}{0.8}
%
% and the color can be changed by giving a new \definecolor command.
% You can return to black lines by giving the command
%
%      \nocolorfillwithdottedlines


\newlength\dottedlinefillheight
\setlength\dottedlinefillheight{.25in}

\newif\if@colorfillwithdottedlines
\@colorfillwithdottedlinesfalse
\def\colorfillwithdottedlines{%
  \@ifundefined{definecolor}
  {%
    \ClassError{exam}{%
      You must load the color package with the command\MessageBreak
      \space\space\protect\usepackage{color}\MessageBreak
      in order to use the command \protect\colorfillwithdottedlines
      \MessageBreak
      }{%
      This command makes use of the package color.sty,\MessageBreak
      and so you have to load color.sty before your\MessageBreak
      \protect\begin{document} command.\MessageBreak
      }%
  }%
  {%
    \definecolor{FillWithDottedLinesColor}{gray}{0.8}
    \@colorfillwithdottedlinestrue
  }%
}% \colorfillwithdottedlines
\def\nocolorfillwithdottedlines{\@colorfillwithdottedlinesfalse}

\newcommand\fillwithdottedlines[1]{%
  \if@colorfillwithdottedlines
    \color@begingroup
      \color{FillWithDottedLinesColor}%
      \do@fillwithdottedlines{#1}%
    \color@endgroup
  \else
    \do@fillwithdottedlines{#1}%
  \fi
}% \fillwithdottedlines

% \do@fillwithdottedlines is called only by \fillwithdottedlines
\def\do@fillwithdottedlines#1{%
  \begingroup
  \ifhmode
    \par
  \fi
  \hrule height \z@
  \nobreak
  \setbox0=\hbox to \hsize{\hskip \@totalleftmargin
          \vrule height \dottedlinefillheight depth \z@ width \z@
          \dotfill}%
  % We use \cleaders (rather than \leaders) so that a given
  % vertical space will always produce the same number of lines
  % no matter where on the page it happens to start:
  \cleaders \copy0 \vskip #1 \hbox{}%
  \endgroup
}% \do@fillwithdottedlines

%--------------------------------------------------------------------
%                            \fillwithgrid


% \fillwithgrid is similar to \fillwithlines, except that it
% fills the space with a grid.

% \fillwithgrid takes one argument, which is either a length or \fill
% or \stretch{number}, and it fills that much vertical space with a
% grid that runs the length of the current line.  That is, it extends
% from the current left margin (which depends on whether we're in a
% question, part, subpart, or subsubpart) to the right margin.
%
% The default grid size and grid line thickness were set by the
% commands
%
% \setlength{\gridsize}{5mm}
% \setlength{\gridlinewidth}{0.1pt}
%
% You can change either or both of those by giving new \setlength
% commands.  The period of the grid is \gridsize (both horizontally
% and vertically).  That is, the horizontal distance from the left
% edge of one vertical line to the left edge of the next vertical line
% is \gridsize, as is the vertical distance from the top edge of one
% horizontal line to the top edge of the next horizontal line.  Thus,
% each square has outer side length equal to \gridsize+\gridlinewidth.

% By default, the created grids are in black.  However, if you give the
% commands
%
% \usepackage{color}
% \colorgrids
%
% then the grids will be in color, by default a light gray.  That
% default color was defined by the command
%
% \definecolor{GridColor}{gray}{0.8}
%
% You can change the color by redefining the color GridColor by giving
% a new \definecolor command.

\newif\if@colorgrids
\newcommand\colorgrids{%
  \@ifundefined{definecolor}
  {%
    \ClassError{exam}{%
      You must load the color package with the command\MessageBreak
      \space\space\protect\usepackage{color}\MessageBreak
      in order to use the command \protect\colorgrids
      }{%
      This command makes use of the package color.sty,\MessageBreak
      and so you have to load color.sty before your\MessageBreak
      \protect\begin{document} command.\MessageBreak
      }%
  }%
  {%
    \definecolor{GridColor}{gray}{0.8}
    \@colorgridstrue
  }%
}% \colorgrids
\newcommand\nocolorgrids{\@colorgridsfalse}
\nocolorgrids

\newlength\gridsize
\newlength\gridlinewidth
\setlength{\gridsize}{5mm}
\setlength{\gridlinewidth}{0.1pt}

\def\fillwithgrid#1{%
  \begingroup
  \ifhmode
    \par
  \fi
  \hrule height \z@
  \nobreak

  % We first set box0 equal to an \hbox which, when printed, is a
  % square with width and height equal to \gridsize+\gridlinewidth,
  % but which has
  % width equal to \gridsize,
  % height equal to \gridsize, and
  % depth equal to 0pt.
  % When we put multiple copies of it together using \leaders or
  % \cleaders, the right edge will coincide with the left edge of the
  % next box and the bottom edge will coincide with the top edge of
  % the box below it.
  \setlength{\@tempdima}{\gridsize}
  \addtolength{\@tempdima}{\gridlinewidth}
  \setlength{\@tempdimb}{\gridsize}
  \addtolength{\@tempdimb}{-\gridlinewidth}
  \setbox0=\hbox{%
    \rlap{\vrule height \gridsize depth \gridlinewidth width \gridlinewidth}%
    \rlap{\vrule height \gridsize depth -\@tempdimb width \@tempdima}%
    \vrule height 0pt depth \gridlinewidth width \@tempdima
    \llap{\vrule height \gridsize depth \gridlinewidth width \gridlinewidth}%
  }%
  \wd0=\gridsize
  \dp0=0pt
  % Now we set box1 equal to an \hbox containing a single line of
  % copies of box0.  We use \leaders (instead of \cleaders) so that
  % if we use it twice on a page, once with a question and once
  % with a part, the boxes will line up vertically.  We add a kern of
  % \gridlinewidth at the right because the rightmost vertical line
  % appears to the right of where the \leaders command thinks that it
  % appears.
  \setbox1=\hbox to \textwidth{%
    \color@begingroup
    \if@colorgrids
      \color{GridColor}%
    \fi
    \hskip \@totalleftmargin \leaders\copy0\hfil \kern\gridlinewidth
    \color@endgroup
  }%
  % Finally: We create the grid, using \cleaders: We use \cleaders
  % (rather than \leaders) so that a given vertical space will always
  % produce the same number of lines no matter where on the page it
  % happens to start.  We add a kern of \gridlinewidth because the
  % bottommost horizontal line appears below where the \cleaders
  % command thinks that it appears.
  \cleaders \copy1 \vskip #1 \kern \gridlinewidth \hbox{}%
  \endgroup
}% fillwithgrid

%--------------------------------------------------------------------
%                            \makeemptybox

% \makeemptybox takes one argument, which is a length, and it creates
% an empty box of width the length of the current line and of height
% equal to the argument. That is, the box extends from the current
% left margin (which depends on whether we're in a question, part,
% subpart, or subsubpart) to the right margin.

% As of version 2.304, the argument of \makeemptybox can be either
% a length, or \fill, or \stretch{number}.

% \newcommand\makeemptybox[1]{
%   \par
%   \begingroup
%     \setlength{\fboxsep}{0pt}%
%     \framebox[\linewidth]{%
%       \vrule height 0pt depth #1 width 0pt
%     }%
%   \endgroup
% }

\newlength\minboxheight
\setlength\minboxheight{.1in}


% As of version 2.502, 2016/03/23, the frame drawn by the
% \makeemptybox command will be drawn in color if the user has given
% the command \colorsolutionboxes.  The actual drawing of the box is
% now done by the command \do@emptybox, after the \makeemptybox
% command decides whether it will be in color.

\newcommand\makeemptybox[1]{%
  \if@colorsolutionboxes
    \color@begingroup
      \color{SolutionBoxColor}%
      \do@emptybox{#1}%
    \color@endgroup
  \else
    \do@emptybox{#1}%
  \fi
}

% The command \do@emptybox is called only by \makeemptybox.
\newcommand\do@emptybox[1]{%
  \par
  \hbox to \hsize{\hskip\@totalleftmargin \leaders\hrule\hfill}%
  \nointerlineskip
  \begingroup
    \setbox0=\hbox to \hsize{\hskip\@totalleftmargin
                           \vrule height\minboxheight \hfill \vrule}%
    % The vertical size desired may not be an exact multiple of
    % \minboxheight, and so \cleaders might leave a gap between the
    % vertical lines and the horizontal lines above and below it.
    % Thus, we put a single copy of \box0 immediately below the
    % horizontal line above and we'll also put a single copy of \box0
    % immediately above the horizontal line below.
    \copy0
    \nobreak
    \vskip -\minboxheight
    \cleaders \copy0 \vskip #1
    \vskip -\minboxheight
    \nointerlineskip
    \copy0
  \endgroup
  \nointerlineskip
  \hbox to \hsize{\hskip\@totalleftmargin \leaders\hrule\hfill}%
}

%--------------------------------------------------------------------
%                      \uplevel and \fullwidth
%           and the EnvUplevel and EnvFullwidth environments:

% \uplevel is used to print text at the indentation level of the 
% enclosing environment.  For example, to precede a question with
% directions about how that question should be answered, you would
% say \uplevel{Answer this question correctly.}
% 
% \fullwidth is similar, but uses the full page of text on the page.

% The EnvUplevel environment is similar to the \uplevel command, but it
% has the advantage that you can include verbatim material (using, e.g.,
% the \verb command) in the environment.  (You can't include verbatim
% material in the argument of an \uplevel command.)

% The EnvFullwidth environment is similar to the \fullwidth command, but
% it has the advantage that you can include verbatim material (using,
% e.g., the \verb command) in the environment.  (You can't include
% verbatim material in the argument of an \fullwidth command.)


\long\def\uplevel#1{%
  \par\bigskip
  \vbox{%
    % We entered internal vertical mode, and so we get \parshape=0.
    % We set \leftskip to provide the correct left margin for whatever
    % is in the argument of the \uplevel command:
    \leftskip=\@totalleftmargin
    \advance\leftskip-\leftmargin
    % We adjust \@totalleftmargin and linewidth in case there's a
    % solution environment inside of the argument to the \uplevel:
    \advance\@totalleftmargin-\leftmargin
    \advance\linewidth\leftmargin
    #1%
  }% vbox
  \nobreak
}

\newenvironment{EnvUplevel}
  {\par\bigskip\vbox\bgroup
    % We set \leftskip to provide the correct left margin for whatever
    % is inside of the environment:
    \leftskip=\@totalleftmargin
    \advance\leftskip-\leftmargin
    % We adjust \@totalleftmargin (and linewidth?) in case there's a
    % solution environment inside of the environment:
    \advance\@totalleftmargin-\leftmargin
    \advance\linewidth\leftmargin
  }
  {\egroup\nobreak}


\long\def\fullwidth#1{%
  \par\bigskip
  \vbox{%
    % We entered internal vertical mode, and so we get \parshape=0.
    \leftskip=0pt \rightskip=0pt
    \advance\linewidth\@totalleftmargin
    \@totalleftmargin=0pt
    #1%
  }% vbox
  \nobreak
}

\newenvironment{EnvFullwidth}
  {\par\bigskip\vbox\bgroup
    % We entered internal vertical mode, and so we get \parshape=0.
    \leftskip=0pt \rightskip=0pt
    % We adjust \@totalleftmargin (and linewidth?) in case there's a
    % solution environment inside of the environment:
    \advance\linewidth\@totalleftmargin
    \@totalleftmargin=0pt
  }
  {\egroup\nobreak}


%--------------------------------------------------------------------
%--------------------------------------------------------------------
%
%                        ********************
%                        ** GRADING TABLES **
%                        ********************



\newcounter{@iterator}
\newlength\@cellwidth

\def\cellwidth#1{\@cellwidth=#1}
\def\gradetablestretch#1{\def\@gtblstretch{#1}}

% \settabletotalpoints allows the user to specify a total
% number of points to appear in a table that may be different
% from the sum of the points in the table:
\newcommand\prt@tablepoints{\prt@hlfcntr{tbl@points}}
\newcommand\settabletotalpoints[1]{%
  \def\prt@tablepoints{#1}%
}% \settabletotalpoints

% \settabletotalbonuspoints is similar to \settabletotalpoints:
\newcommand\prt@tablebonuspoints{\prt@hlfcntr{tbl@bonuspoints}}
\newcommand\settabletotalbonuspoints[1]{%
  \def\prt@tablebonuspoints{#1}%
}% \settabletotalbonuspoints

% All of the following that begin with `h' are for horizontal tables,
% and all of them that begin with `v' are for vertical tables:
\def\hqword#1{\def\@hqword{#1}}
\def\hpword#1{\def\@hpword{#1}}
\def\hsword#1{\def\@hsword{#1}}
\def\htword#1{\def\@htword{#1}}
\def\hpgword#1{\def\@hpgword{#1}}

\def\vqword#1{\def\@vqword{#1}}
\def\vpword#1{\def\@vpword{#1}}
\def\vsword#1{\def\@vsword{#1}}
\def\vtword#1{\def\@vtword{#1}}
\def\vpgword#1{\def\@vpgword{#1}}


% The following are the versions for bonusgradetable:
\def\bhqword#1{\def\@bhqword{#1}}
\def\bhpword#1{\def\@bhpword{#1}}
\def\bhsword#1{\def\@bhsword{#1}}
\def\bhtword#1{\def\@bhtword{#1}}
\def\bhpgword#1{\def\@bhpgword{#1}}

\def\bvqword#1{\def\@bvqword{#1}}
\def\bvpword#1{\def\@bvpword{#1}}
\def\bvsword#1{\def\@bvsword{#1}}
\def\bvtword#1{\def\@bvtword{#1}}
\def\bvpgword#1{\def\@bvpgword{#1}}

% The following are the versions for combinedgradetable:
\def\chqword#1{\def\@chqword{#1}}
\def\chpword#1{\def\@chpword{#1}}
\def\chbpword#1{\def\@chbpword{#1}}
\def\chsword#1{\def\@chsword{#1}}
\def\chtword#1{\def\@chtword{#1}}
\def\chpgword#1{\def\@chpgword{#1}}

\def\cvqword#1{\def\@cvqword{#1}}
\def\cvpword#1{\def\@cvpword{#1}}
\def\cvbpword#1{\def\@cvbpword{#1}}
\def\cvsword#1{\def\@cvsword{#1}}
\def\cvtword#1{\def\@cvtword{#1}}
\def\cvpgword#1{\def\@cvpgword{#1}}



% Initialize:
\cellwidth{2em}
\gradetablestretch{1.5}

\hqword{Question:}
\hpgword{Page:}
\hpword{Points:}
\hsword{Score:}
\htword{Total}
\vpword{Points}
\vsword{Score}
\vtword{Total:}
\vqword{Question}
\vpgword{Page}

\bhqword{Question:}
\bhpgword{Page:}
\bhpword{Bonus Points:}
\bhsword{Score:}
\bhtword{Total}
\bvqword{Question}
\bvpgword{Page}
\bvpword{Bonus Points}
\bvsword{Score}
\bvtword{Total:}

\chqword{Question:}
\chpgword{Page:}
\chpword{Points:}
\chbpword{Bonus Points:}
\chsword{Score:}
\chtword{Total}
\cvqword{Question}
\cvpgword{Page}
\cvpword{Points}
\cvbpword{Bonus Points}
\cvsword{Score}
\cvtword{Total:}

% Before we created multirow and multicolumn tables, he only commands
% here accessible to the user were \gradetable, \bonusgradetable,
% \combinedgradetable, \pointtable, \bonuspointtable,
% \combinedpointtable, \partialgradetable,
% \partialbonusgradetable, \partialcombinedtable, \partialpointtable,
% \partialbonuspointtable, \partialcombinedpointtable,
% \begingradingrange, \endgradingrange, \pointsinrange,
% \bonuspointsinrange, \firstqinrange, \lastqinrange, and
% \numqinrange.  The new user commands are
% 
% \def\multirowgradetable
% \def\multirowpointtable
% \def\multirowbonusgradetable
% \def\multirowbonuspointtable
% \def\multirowcombinedgradetable
% \def\multirowcombinedpointtable
% 
% \def\multirowpartialgradetable
% \def\multirowpartialpointtable
% \def\multirowpartialbonusgradetable
% \def\multirowpartialbonuspointtable
% \def\multirowpartialcombinedgradetable
% \def\multirowpartialcombinedpointtable
% 
% \def\multicolumngradetable
% \def\multicolumnpointtable
% \def\multicolumnbonusgradetable
% \def\multicolumnbonuspointtable
% \def\multicolumncombinedgradetable
% \def\multicolumncombinedpointtable
% 
% \def\multicolumnpartialgradetable
% \def\multicolumnpartialpointtable
% \def\multicolumnpartialbonusgradetable
% \def\multicolumnpartialbonuspointtable
% \def\multicolumnpartialcombinedgradetable
% \def\multicolumnpartialcombinedpointtable


% The possibilities are

%   \gradetable[v][questions]
%   \gradetable[v][pages]
%   \gradetable[h][questions]
%   \gradetable[h][pages]

%   \bonusgradetable[v][questions]
%   \bonusgradetable[v][pages]
%   \bonusgradetable[h][questions]
%   \bonusgradetable[h][pages]

%   \combinedgradetable[v][questions]
%   \combinedgradetable[v][pages]
%   \combinedgradetable[h][questions]
%   \combinedgradetable[h][pages]

%   \pointtable[v][questions]
%   \pointtable[v][pages]
%   \pointtable[h][questions]
%   \pointtable[h][pages]

%   \bonuspointtable[v][questions]
%   \bonuspointtable[v][pages]
%   \bonuspointtable[h][questions]
%   \bonuspointtable[h][pages]

%   \combinedpointtable[v][questions]
%   \combinedpointtable[v][pages]
%   \combinedpointtable[h][questions]
%   \combinedpointtable[h][pages]

%   \partialgradetable{whatever}[v][questions]
%   \partialgradetable{whatever}[v][pages]
%   \partialgradetable{whatever}[h][questions]
%   \partialgradetable{whatever}[h][pages]

%   \partialbonusgradetable{whatever}[v][questions]
%   \partialbonusgradetable{whatever}[v][pages]
%   \partialbonusgradetable{whatever}[h][questions]
%   \partialbonusgradetable{whatever}[h][pages]

%   \partialcombinedgradetable{whatever}[v][questions]
%   \partialcombinedgradetable{whatever}[v][pages]
%   \partialcombinedgradetable{whatever}[h][questions]
%   \partialcombinedgradetable{whatever}[h][pages]

%   \partialpointtable{whatever}[v][questions]
%   \partialpointtable{whatever}[v][pages]
%   \partialpointtable{whatever}[h][questions]
%   \partialpointtable{whatever}[h][pages]

%   \partialbonuspointtable{whatever}[v][questions]
%   \partialbonuspointtable{whatever}[v][pages]
%   \partialbonuspointtable{whatever}[h][questions]
%   \partialbonuspointtable{whatever}[h][pages]

%   \partialcombinedpointtable{whatever}[v][questions]
%   \partialcombinedpointtable{whatever}[v][pages]
%   \partialcombinedpointtable{whatever}[h][questions]
%   \partialcombinedpointtable{whatever}[h][pages]

%   \begingradingrange{whatever}
%   \endgradingrange{whatever}
%
%   \pointsinrange{whatever}
%   \bonuspointsinrange{whatever}
%
%    \firstqinrange{whatever}
%    \lastqinrange{whatever}
%    \numqinrange{whatever}
%
% where ``whatever'' is a label chosen by the user.
% 
% \def\multirowgradetable{numcols}[questions or pages]
% \def\multirowpointtable{numcols}[questions or pages]
% \def\multirowbonusgradetable{numcols}[questions or pages]
% \def\multirowbonuspointtable{numcols}[questions or pages]
% \def\multirowcombinedgradetable{numcols}[questions or pages]
% \def\multirowcombinedpointtable{numcols}[questions or pages]
% 
% \def\multirowpartialgradetable{numcols}{rangename}[questions or pages]
% \def\multirowpartialpointtable{numcols}{rangename}[questions or pages]
% \def\multirowpartialbonusgradetable{numcols}{rangename}[questions or pages]
% \def\multirowpartialbonuspointtable{numcols}{rangename}[questions or pages]
% \def\multirowpartialcombinedgradetable{numcols}{rangename}[questions or pages]
% \def\multirowpartialcombinedpointtable{numcols}{rangename}[questions or pages]
% 
% \def\multicolumngradetable{numrows}[questions or pages]
% \def\multicolumnpointtable{numrows}[questions or pages]
% \def\multicolumnbonusgradetable{numrows}[questions or pages]
% \def\multicolumnbonuspointtable{numrows}[questions or pages]
% \def\multicolumncombinedgradetable{numrows}[questions or pages]
% \def\multicolumncombinedpointtable{numrows}[questions or pages]

% \def\multicolumnpartialgradetable{numrows}{rangename}[questions or pages]
% \def\multicolumnpartialpointtable{numrows}{rangename}[questions or pages]
% \def\multicolumnpartialbonusgradetable{numrows}{rangename}[questions or pages]
% \def\multicolumnpartialbonuspointtable{numrows}{rangename}[questions or pages]
% \def\multicolumnpartialcombinedgradetable{numrows}{rangename}[questions or pages]
% \def\multicolumnpartialcombinedpointtable{numrows}{rangename}[questions or pages]


% If one or both optional arguments are omitted, the defaults are
% `[v]' and `[questions]'.

% \@scorestrue means we're doing \gradetable
% \@scoresfalse mans we're doing \pointtable
\newif\if@scores

% \@partialtrue means we're doing \partialgradetable,
% \partialbonusgradetable, \partialcombinedgradetable,
% \partialpointtable, \partialbonuspointtable, or
% \partialcombinedpointtable:
\newif\if@partial

% \@combinedtrue means we're doing \combinedgradetable,
% \combinedpointtable, \partialcombinedgradetable, or
% \partialcombinedpointtable:
\newif\if@combined

% It's OK to use the counter num@cols as a scratch counter
% in \begingradingrange and \endgradingrange because
% it's only used in typesetting tables:
\def\begingradingrange#1{%
  \setcounter{num@cols}{\value{question}}%
  \addtocounter{num@cols}{1}%
  \immediate\write\@mainaux
  {\string\expandafter\string\gdef
    \string\csname\space range@#1@firstq\string\endcsname
      {\arabic{num@cols}}}%
  \write\@mainaux
  {\string\expandafter\string\gdef
    \string\csname\space range@#1@firstp\string\endcsname
      {\thepage}}%
}% begingradingrange

\def\endgradingrange#1{%
  \setcounter{num@cols}{\value{question}}%
  \immediate\write\@mainaux
  {\string\expandafter\string\gdef
    \string\csname\space range@#1@lastq\string\endcsname
      {\arabic{num@cols}}}%
  \write\@mainaux
  {\string\expandafter\string\gdef
    \string\csname\space range@#1@lastp\string\endcsname
      {\thepage}}%
}% endgradingrange


% Now that grading tables may be for only part of the exam,
% we need the counter tbl@points to add up the total points
% for the questions (or pages) that appear on the table:
\new@hlfcntr{tbl@points}

% We'll use the counter tbl@bonuspoints to add up the total bonus
% points for the questions (or pages) that appear on the table:
\new@hlfcntr{tbl@bonuspoints}

%--------------------------------------------------------------------
% multirow tables, non-partial:

\def\multirowgradetable#1{%
  \@scorestrue
  \@bonusfalse
  \@partialfalse
  \@combinedfalse
  \setcounter{num@rows}{#1}%
  \i@gtable[h]%
}

\def\multirowpointtable#1{%
  \@scoresfalse
  \@bonusfalse
  \@partialfalse
  \@combinedfalse
  \setcounter{num@rows}{#1}%
  \i@gtable[h]%
}

\def\multirowbonusgradetable#1{%
  \@scorestrue
  \@bonustrue
  \@partialfalse
  \@combinedfalse
  \setcounter{num@rows}{#1}%
  \i@gtable[h]%
}

\def\multirowbonuspointtable#1{%
  \@scoresfalse
  \@bonustrue
  \@partialfalse
  \@combinedfalse
  \setcounter{num@rows}{#1}%
  \i@gtable[h]%
}

\def\multirowcombinedgradetable#1{%
  \@scorestrue
  \@bonusfalse
  \@partialfalse
  \@combinedtrue
  \setcounter{num@rows}{#1}%
  \i@gtable[h]%
}

\def\multirowcombinedpointtable#1{%
  \@scoresfalse
  \@bonusfalse
  \@partialfalse
  \@combinedtrue
  \setcounter{num@rows}{#1}%
  \i@gtable[h]%
}

%--------------------------------------------------------------------
% multirow tables, partial:

\def\multirowpartialgradetable#1#2{%
  \@scorestrue
  \@bonusfalse
  \@partialtrue
  \@combinedfalse
  \def\tbl@range{#2}%
  \setcounter{num@rows}{#1}%
  \i@gtable[h]%
}

\def\multirowpartialpointtable#1#2{%
  \@scoresfalse
  \@bonusfalse
  \@partialtrue
  \@combinedfalse
  \def\tbl@range{#2}%
  \setcounter{num@rows}{#1}%
  \i@gtable[h]%
}

\def\multirowpartialbonusgradetable#1#2{%
  \@scorestrue
  \@bonustrue
  \@partialtrue
  \@combinedfalse
  \def\tbl@range{#2}%
  \setcounter{num@rows}{#1}%
  \i@gtable[h]%
}

\def\multirowpartialbonuspointtable#1#2{%
  \@scoresfalse
  \@bonustrue
  \@partialtrue
  \@combinedfalse
  \def\tbl@range{#2}%
  \setcounter{num@rows}{#1}%
  \i@gtable[h]%
}

\def\multirowpartialcombinedgradetable#1#2{%
  \@scorestrue
  \@bonusfalse
  \@partialtrue
  \@combinedtrue
  \def\tbl@range{#2}%
  \setcounter{num@rows}{#1}%
  \i@gtable[h]%
}

\def\multirowpartialcombinedpointtable#1#2{%
  \@scoresfalse
  \@bonusfalse
  \@partialtrue
  \@combinedtrue
  \def\tbl@range{#2}%
  \setcounter{num@rows}{#1}%
  \i@gtable[h]%
}

%--------------------------------------------------------------------
%  multicolumn tables, non-partial:

\def\multicolumngradetable#1{%
  \@scorestrue
  \@bonusfalse
  \@partialfalse
  \@combinedfalse
  \setcounter{num@cols}{#1}%
  \i@gtable[v]%
}

\def\multicolumnpointtable#1{%
  \@scoresfalse
  \@bonusfalse
  \@partialfalse
  \@combinedfalse
  \setcounter{num@cols}{#1}%
  \i@gtable[v]%
}

\def\multicolumnbonusgradetable#1{%
  \@scorestrue
  \@bonustrue
  \@partialfalse
  \@combinedfalse
  \setcounter{num@cols}{#1}%
  \i@gtable[v]%
}

\def\multicolumnbonuspointtable#1{%
  \@scoresfalse
  \@bonustrue
  \@partialfalse
  \@combinedfalse
  \setcounter{num@cols}{#1}%
  \i@gtable[v]%
}

\def\multicolumncombinedgradetable#1{%
  \@scorestrue
  \@bonusfalse
  \@partialfalse
  \@combinedtrue
  \setcounter{num@cols}{#1}%
  \i@gtable[v]%
}

\def\multicolumncombinedpointtable#1{%
  \@scoresfalse
  \@bonusfalse
  \@partialfalse
  \@combinedtrue
  \setcounter{num@cols}{#1}%
  \i@gtable[v]%
}

%--------------------------------------------------------------------
% multicolumn tables, partial:

\def\multicolumnpartialgradetable#1#2{%
  \@scorestrue
  \@bonusfalse
  \@partialtrue
  \@combinedfalse
  \def\tbl@range{#2}%
  \setcounter{num@cols}{#1}%
  \i@gtable[v]%
}

\def\multicolumnpartialpointtable#1#2{%
  \@scoresfalse
  \@bonusfalse
  \@partialtrue
  \@combinedfalse
  \def\tbl@range{#2}%
  \setcounter{num@cols}{#1}%
  \i@gtable[v]%
}

\def\multicolumnpartialbonusgradetable#1#2{%
  \@scorestrue
  \@bonustrue
  \@partialtrue
  \@combinedfalse
  \def\tbl@range{#2}%
  \setcounter{num@cols}{#1}%
  \i@gtable[v]%
}

\def\multicolumnpartialbonuspointtable#1#2{%
  \@scoresfalse
  \@bonustrue
  \@partialtrue
  \@combinedfalse
  \def\tbl@range{#2}%
  \setcounter{num@cols}{#1}%
  \i@gtable[v]%
}

\def\multicolumnpartialcombinedgradetable#1#2{%
  \@scorestrue
  \@bonusfalse
  \@partialtrue
  \@combinedtrue
  \def\tbl@range{#2}%
  \setcounter{num@cols}{#1}%
  \i@gtable[v]%
}

\def\multicolumnpartialcombinedpointtable#1#2{%
  \@scoresfalse
  \@bonusfalse
  \@partialtrue
  \@combinedtrue
  \def\tbl@range{#2}%
  \setcounter{num@cols}{#1}%
  \i@gtable[v]%
}

%--------------------------------------------------------------------
% partial single row (and column) tables:

\def\partialgradetable#1{%
  \@scorestrue
  \@bonusfalse
  \@partialtrue
  \@combinedfalse
  \def\tbl@range{#1}%
  % We don't yet know if the table is vertical or horizontal, and so
  % we don't know if we need to set num@cols or num@rows.  We'll set
  % them both, and we'll later on just ignore the value of the one
  % that we didn't need to set here:
  \setcounter{num@cols}{1}%
  \setcounter{num@rows}{1}%
  % If the user doesn't include the optional argument
  % choosing between vertical and horizontal,
  % we give them vertical:
  \@ifnextchar[{\i@gtable}{\i@gtable[v]}%
}% partialgradetable

\def\partialbonusgradetable#1{%
  \@scorestrue
  \@bonustrue
  \@partialtrue
  \@combinedfalse
  \def\tbl@range{#1}%
  % We don't yet know if the table is vertical or horizontal, and so
  % we don't know if we need to set num@cols or num@rows.  We'll set
  % them both, and we'll later on just ignore the value of the one
  % that we didn't need to set here:
  \setcounter{num@cols}{1}%
  \setcounter{num@rows}{1}%
  % If the user doesn't include the optional argument
  % choosing between vertical and horizontal,
  % we give them vertical:
  \@ifnextchar[{\i@gtable}{\i@gtable[v]}%
}% partialbonusgradetable

\def\partialcombinedgradetable#1{%
  \@scorestrue
  \@bonusfalse
  \@partialtrue
  \@combinedtrue
  \def\tbl@range{#1}%
  % We don't yet know if the table is vertical or horizontal, and so
  % we don't know if we need to set num@cols or num@rows.  We'll set
  % them both, and we'll later on just ignore the value of the one
  % that we didn't need to set here:
  \setcounter{num@cols}{1}%
  \setcounter{num@rows}{1}%
  % If the user doesn't include the optional argument
  % choosing between vertical and horizontal,
  % we give them vertical:
  \@ifnextchar[{\i@gtable}{\i@gtable[v]}%
}% partialcombinedgradetable

\def\partialpointtable#1{%
  \@scoresfalse
  \@bonusfalse
  \@partialtrue
  \@combinedfalse
  \def\tbl@range{#1}%
  % We don't yet know if the table is vertical or horizontal, and so
  % we don't know if we need to set num@cols or num@rows.  We'll set
  % them both, and we'll later on just ignore the value of the one
  % that we didn't need to set here:
  \setcounter{num@cols}{1}%
  \setcounter{num@rows}{1}%
  % If the user doesn't include the optional argument
  % choosing between vertical and horizontal,
  % we give them vertical:
  \@ifnextchar[{\i@gtable}{\i@gtable[v]}%
}% partialpointtable

\def\partialbonuspointtable#1{%
  \@scoresfalse
  \@bonustrue
  \@partialtrue
  \@combinedfalse
  \def\tbl@range{#1}%
  % We don't yet know if the table is vertical or horizontal, and so
  % we don't know if we need to set num@cols or num@rows.  We'll set
  % them both, and we'll later on just ignore the value of the one
  % that we didn't need to set here:
  \setcounter{num@cols}{1}%
  \setcounter{num@rows}{1}%
  % If the user doesn't include the optional argument
  % choosing between vertical and horizontal,
  % we give them vertical:
  \@ifnextchar[{\i@gtable}{\i@gtable[v]}%
}% partialbonuspointtable

\def\partialcombinedpointtable#1{%
  \@scoresfalse
  \@bonusfalse
  \@partialtrue
  \@combinedtrue
  \def\tbl@range{#1}%
  % We don't yet know if the table is vertical or horizontal, and so
  % we don't know if we need to set num@cols or num@rows.  We'll set
  % them both, and we'll later on just ignore the value of the one
  % that we didn't need to set here:
  \setcounter{num@cols}{1}%
  \setcounter{num@rows}{1}%
  % If the user doesn't include the optional argument
  % choosing between vertical and horizontal,
  % we give them vertical:
  \@ifnextchar[{\i@gtable}{\i@gtable[v]}%
}% partialcombinedpointtable

%--------------------------------------------------------------------
% single row (and column) tables, non-partial:

\def\gradetable{%
  \@scorestrue
  \@bonusfalse
  \@partialfalse
  \@combinedfalse
  % We don't yet know if the table is vertical or horizontal, and so
  % we don't know if we need to set num@cols or num@rows.  We'll set
  % them both, and we'll later on just ignore the value of the one
  % that we didn't need to set here:
  \setcounter{num@cols}{1}%
  \setcounter{num@rows}{1}%
  % If the user doesn't include the optional argument
  % choosing between vertical and horizontal,
  % we give them vertical:
  \@ifnextchar[{\i@gtable}{\i@gtable[v]}%
}% gradetable

\def\bonusgradetable{%
  \@scorestrue
  \@bonustrue
  \@partialfalse
  \@combinedfalse
  % We don't yet know if the table is vertical or horizontal, and so
  % we don't know if we need to set num@cols or num@rows.  We'll set
  % them both, and we'll later on just ignore the value of the one
  % that we didn't need to set here:
  \setcounter{num@cols}{1}%
  \setcounter{num@rows}{1}%
  % If the user doesn't include the optional argument
  % choosing between vertical and horizontal,
  % we give them vertical:
  \@ifnextchar[{\i@gtable}{\i@gtable[v]}%
}% bonusgradetable

\def\combinedgradetable{%
  \@scorestrue
  \@bonusfalse
  \@partialfalse
  \@combinedtrue
  % We don't yet know if the table is vertical or horizontal, and so
  % we don't know if we need to set num@cols or num@rows.  We'll set
  % them both, and we'll later on just ignore the value of the one
  % that we didn't need to set here:
  \setcounter{num@cols}{1}%
  \setcounter{num@rows}{1}%
  % If the user doesn't include the optional argument
  % choosing between vertical and horizontal,
  % we give them vertical:
  \@ifnextchar[{\i@gtable}{\i@gtable[v]}%
}% bonusgradetable

\def\pointtable{%
  \@scoresfalse
  \@bonusfalse
  \@partialfalse
  \@combinedfalse
  % We don't yet know if the table is vertical or horizontal, and so
  % we don't know if we need to set num@cols or num@rows.  We'll set
  % them both, and we'll later on just ignore the value of the one
  % that we didn't need to set here:
  \setcounter{num@cols}{1}%
  \setcounter{num@rows}{1}%
  % If the user doesn't include the optional argument
  % choosing between vertical and horizontal,
  % we give them vertical:
  \@ifnextchar[{\i@gtable}{\i@gtable[v]}%
}% pointtable

\def\bonuspointtable{%
  \@scoresfalse
  \@bonustrue
  \@partialfalse
  \@combinedfalse
  % We don't yet know if the table is vertical or horizontal, and so
  % we don't know if we need to set num@cols or num@rows.  We'll set
  % them both, and we'll later on just ignore the value of the one
  % that we didn't need to set here:
  \setcounter{num@cols}{1}%
  \setcounter{num@rows}{1}%
  % If the user doesn't include the optional argument
  % choosing between vertical and horizontal,
  % we give them vertical:
  \@ifnextchar[{\i@gtable}{\i@gtable[v]}%
}% bonuspointtable

\def\combinedpointtable{%
  \@scoresfalse
  \@bonusfalse
  \@partialfalse
  \@combinedtrue
  % We don't yet know if the table is vertical or horizontal, and so
  % we don't know if we need to set num@cols or num@rows.  We'll set
  % them both, and we'll later on just ignore the value of the one
  % that we didn't need to set here:
  \setcounter{num@cols}{1}%
  \setcounter{num@rows}{1}%
  % If the user doesn't include the optional argument
  % choosing between vertical and horizontal,
  % we give them vertical:
  \@ifnextchar[{\i@gtable}{\i@gtable[v]}%
}% bonuspointtable

%--------------------------------------------------------------------

% \i@gtable and \ii@gtable insert any missing optional arguments
% (the defaults being [v] and [questions]) and then make sure
% that the user said \addpoints and that this isn't the
% first run of LaTeX.
% \find@p@or@q@range then branches, depending on whether the user
% selected [questions] or [pages].

\def\i@gtable[#1]{%
  % If the user doesn't include the second optional argument,
  % which chooses between questions and pages,
  % we give them questions:
  \@ifnextchar[{\ii@gtable{#1}}{\ii@gtable{#1}[questions]}%
}
\def\ii@gtable#1[#2]{%
  % We get here from \i@gtable.
  % We make sure the user said \addpoints, and then make sure
  % that this isn't the first run of LaTeX (by checking that
  % \exam@numpoints is defined).  If both of those are OK,
  % we go to \find@p@or@q@range to see whether we're doing a table
  % indexed by questions or by pages.
  \if@addpoints
    \@ifundefined{exam@numpoints}%
      {\ClassWarning{exam}%
        {%
          You must run LaTeX again to produce the
            table.\MessageBreak
        }%
        \fbox{Run \LaTeX{} again to produce the table}%
      }%
      {\find@p@or@q@range{#1}{#2}}%
  \else
    \ClassError{exam}{%
      You must give the command \protect\addpoints\MessageBreak
      \space\space in order to create a grade table.\MessageBreak
      }{%
      If you don't give the command \protect\addpoints\MessageBreak
      \space\space then we're not keeping track of point values.
      \MessageBreak
      }%
  \fi
}% ii@gtable

\def\@questionsref{questions}
\def\@pagesref{pages}
\def\find@p@or@q@range#1#2{%
  % We get here from \ii@gtable.
  % The first argument should be ``v'' or ``h'';
  % the second argument should be ``questions'' or ``pages''.
  % See whether we're doing a table indexed by
  % questions (in which case we go to \find@qrange) or by pages (in
  % which case we go to \find@prange):
  \begingroup
    % We've begun a group that will contain the construction of the
    % table, to confine the effect of any \def's that we use.
    \def\exam@temp{#2}%
    \ifx\exam@temp\@questionsref
      \tbl@pgsfalse
      \find@qrange{#1}%
    \else
      \ifx\exam@temp\@pagesref
        \tbl@pgstrue
        \find@prange{#1}%
      \else
        \ClassError{exam}{%
          Grade and point tables can be indexed\MessageBreak
          \space\space by either `questions' or `pages',\MessageBreak
          \space\space but not by `#2'.\MessageBreak
        }{%
          Grade tables and point tables can be indexed by questions or
          pages;\MessageBreak
          \space\space for others, you're on your own.\MessageBreak
        }%
        \fbox{\textbf{Error:} grade or point table: Invalid argument
              `#2' must be `questions' or `pages'.}%
      \fi
    \fi
  \endgroup
}% find@p@or@q@range

% \range@undefined can be called from either \find@qrange or
% \find@prange
\def\range@undefined{%
  \fbox{Warning: grading range `\tbl@range ' not defined;
                               run \LaTeX{} again.}%
  \ClassWarning{exam}{%
    Grading range `\tbl@range' not defined.\MessageBreak
    \space\space Run LaTeX again to produce the table.\MessageBreak
  }%
}% range@undefined


%--------------------------------------------------------------------
%--------------------------------------------------------------------
% Grade and point tables indexed by question numbers:

% When we get to \find@qrange, we know we're doing a table indexed by
% question numbers and that this is not the first run of latex.  The
% argument is either ``v'' or ``h''.  If we're not doing a partial
% table, then \find@qrange sets \tbl@firstq and \first@pq@index to 1
% and \tbl@lastq and \last@pq@index to \numquestions.  Otherwise,
% \find@qrange makes sure the grading range is defined and that its
% last question isn't before its first question.  \find@qrange then
% calls \tbl@v@or@h, passing along the argument that is either ``v''
% or ``h''.

\def\find@qrange#1{%
  % We get here from \find@p@or@q@range.
  % We're doing a table indexed by question numbers.
  \if@partial
    \@ifundefined{range@\tbl@range @firstq}%
      {%
        \range@undefined
      }%
      {%
        \@ifundefined{range@\tbl@range @lastq}%
          {%
            \range@undefined
          }%
          {%
            \edef\tbl@firstq{\csname range@\tbl@range @firstq\endcsname}%
            \edef\tbl@lastq{\csname range@\tbl@range @lastq\endcsname}%
            \let\first@pq@index=\tbl@firstq
            \let\last@pq@index=\tbl@lastq
            % Check that firstq precedes or equals lastq:
            \ifnum \tbl@firstq > \tbl@lastq\relax
              \fbox{\textbf{Error:} Grading Range `\tbl@range':
                      Last question precedes first question.}%
              \ClassError{exam}{%
                In grading range `\tbl@range',
                                the last question\MessageBreak
                \space\space comes before the first question.\MessageBreak
                }{%
                  \string\begingradingrange \space must precede
                  \string\endgradingrange \space by at
                             least one question.\MessageBreak
                }%
            \else
              \tbl@v@or@h{#1}%
            \fi
          }%
      }%
  \else
    \def\tbl@firstq{1}%
    \let\first@pq@index=\tbl@firstq
    % \numquestions is always defined, even if this is the first
    % run of LaTeX and \exam@numquestions isn't defined.
    % If it's the first run of LaTeX, then its value isn't useful,
    % but it's never used until a later run (when its value is useful).
    \def\tbl@lastq{\numquestions}%
    \let\last@pq@index=\tbl@lastq
    \tbl@v@or@h{#1}%
  \fi
}% find@qrange

\def\@vref{v}
\def\@href{h}
\def\tbl@v@or@h#1{%
  % \first@pq@index=\tbl@firstq or \tbl@firstp and
  % \last@pq@index=\tbl@lastq or \tbl@lastp have already been set.
  % The argument should be either `v' or `h', and we branch
  % accordingly.
  \def\exam@temp{#1}%
  \ifx\exam@temp\@vref
    \check@num@cols@v
  \else
    \ifx\exam@temp\@href
      \check@num@rows@h
    \else
      \ClassError{exam}{%
        Grade or point table: the argument `#1'\MessageBreak
        \space\space must be `v' or `h'.
        \MessageBreak
      }{%
        Grade tables and point tables can be either vertical or
        horizontal;\MessageBreak
        \space\space no diagonals allowed.\MessageBreak
      }%
      \fbox{\textbf{Error:} grade or point table: Invalid argument
            `#1' must be `v' or `h'.}%
    \fi
  \fi
}% tbl@v@or@h

%--------------------------------------------------------------------
%--------------------------------------------------------------------
% Grade and point tables indexed by page numbers:


% The only pages listed are those on which there are a nonzero number
% of points.  We check pages \tbl@firstp through \tbl@lastp
% Once we've checked that, e.g., \lastpage@withpoints and
% \pointsonpage@\romannumeral{\lastpage@withpoints} are defined, we
% can safely (we think) check \pointsonpage@\romannumeral{n} for all n
% between \tbl@firstp and \tbl@lastp without generating errors.
%
% Actually: Since we added the notion of half points and half counters
% (a long time ago), there won't be any errors even if
% \pointsonpage@\romannumeral{n} isn't defined, since it's tested by the
% lines:
%   \set@hlfcntr{tmp@hlfcntr}{\csname pointsonpage@\romannumeral
%                          \csname c@@iterator\endcsname\endcsname}%
%   \ifhlfcntr@pos{tmp@hlfcntr}%
% and if 
%   \csname pointsonpage@\romannumeral
%             \csname c@@iterator\endcsname\endcsname
% isn't defined, tmp@hlfcntr gets the value zero (because of the way
% that \set@hlfcntr is written).

% \find@prange makes sure the grading range is defined and that its
% last page isn't before its first page (if it's a partial table).  In
% any case, it then sets \tbl@firstp and \tbl@lastp, and calls
% \check@secondrun.

\def\find@prange#1{%
  % We get here from \find@p@or@q@range.
  % We're doing a table indexed by pages.
  % The argument is either ``v'' or ``h''.
  % We first determine the first and last page of the range, storing
  % those in \first@pq@index=\tbl@firstp and
  % \last@pq@index=\tbl@lastp. If not a partial table, we set
  % \first@pq@index=\tbl@firstp to 1 and \last@pq@index=\tbl@lastp to
  % the last page with the appropriate points (and so if it's a
  % combined table, it's the last page to have either bonus or
  % non-bonus points).
  % We then call \check@secondrun, passing it the argument that we
  % received (i.e., we say \check@secondrun{#1}) to make sure 
  % we've done at least two runs of latex (so that we'll have the
  % information we need about which pages have points on them).
  \if@partial
    \@ifundefined{range@\tbl@range @firstp}%
      {%
        \range@undefined
      }%
      {%
        \@ifundefined{range@\tbl@range @lastp}%
          {%
            \range@undefined
          }%
          {%
            \edef\tbl@firstp{\csname range@\tbl@range @firstp\endcsname}%
            \edef\tbl@lastp{\csname range@\tbl@range @lastp\endcsname}%
            \let\first@pq@index=\tbl@firstp
            \let\last@pq@index=\tbl@lastp
            % Check that firstp precedes or equals lastp:
            \ifnum \tbl@firstp > \tbl@lastp\relax
              \fbox{\textbf{Error:} Grading Range `\tbl@range ':
                      Last page precedes first page.}%
              \ClassError{exam}{%
                In grading range `\tbl@range', the last page\MessageBreak
                \space\space comes before the first page.\MessageBreak
                }{%
                  \string\begingradingrange \space must precede
                  \string\endgradingrange.\MessageBreak
                }%
            \else
              \check@secondrun{#1}%
            \fi
          }%
      }%
  \else
    % It's not a partial table:
    \def\tbl@firstp{1}%
    \let\first@pq@index=\tbl@firstp
    % We never get here on the first run of LaTeX, and
    % \lastpage@withbonuspoints is defined on the second and later runs.
    \def\tbl@lastp{\lastpage@withpoints}%
    \let\last@pq@index=\tbl@lastp
    \if@bonus
      \def\tbl@lastp{\lastpage@withbonuspoints}%
      \let\last@pq@index=\tbl@lastp
    \fi
    \if@combined
      \ifnum \lastpage@withbonuspoints > \lastpage@withpoints\relax
        \def\tbl@lastp{\lastpage@withbonuspoints}%
        \let\last@pq@index=\tbl@lastp
      \fi        
    \fi
    \check@secondrun{#1}%
  \fi
}% find@prange

\def\check@secondrun#1{%
  % The function \ii@gtable already made sure that this isn't the
  % first run of latex.  To do a table indexed by pages, though, we
  % have to also make sure it's not the second run of latex.
  % We get here from \find@prange; the argument is either ``v'' or
  % ``h''.
  % Check that there's enough info from the .aux file to do a page
  % indexed grade table.  If so, call \tbl@v@or@h{#1}:
  \@ifundefined{pointsonpage@\romannumeral
               \csname lastpage@withpoints\endcsname}%
    {\@ifundefined{bonuspointsonpage@\romannumeral
               \csname lastpage@withbonuspoints\endcsname}%
        {\ClassWarning{exam}{%
           You must run LaTeX again to produce the table.\MessageBreak}%
           \fbox{Run \LaTeX{} again to produce the table}%
        }%
        {\tbl@v@or@h{#1}%
        }%
    }%
    {\tbl@v@or@h{#1}%
    }%
}% check@secondrun

%--------------------------------------------------------------------
% Indexed by pages:

% For a table indexed by pages, we need to know how many pages there
% are with points on them.  The argument to \count@pgswpts should be
% the name of a counter; we set that counter equal to the number of
% pages with the appropriate kind of points.

\def\count@pgswpts#1{%
  % Set the counter #1 equal to the number of pages in the range with
  % the appropriate type of points.
  % We're called by \@computenumcols@h and \@computenumrows@v.
  \setcounter{#1}{0}%
  \setcounter{@iterator}{\tbl@firstp}%
  \addtocounter{@iterator}{-1}%
  \if@bonus
    \docount@pgswbpts{#1}%
  \else
    \if@combined
      \docount@pgswcpts{#1}%
    \else
      \docount@pgswpts{#1}%
    \fi
  \fi
}% count@pgswpts

\def\docount@pgswcpts#1{%
  % Called by \count@pgswpts
  % Count the number of pages in range with any kind of point (bonus
  % or non-bonus):
  \addtocounter{@iterator}{1}%
  \set@hlfcntr{tmp@hlfcntr}{\pointsonpage{\the@iterator}}%
  \ifhlfcntr@pos{tmp@hlfcntr}%
    \addtocounter{#1}{1}%
  \else
    \check@bnsptpage{#1}%
  \fi
  \ifnum \the@iterator < \tbl@lastp\relax
    \def\nextdocount@pgswcpts{\docount@pgswcpts{#1}}%
  \else
    \let\nextdocount@pgswcpts=\relax
  \fi
  \nextdocount@pgswcpts
}% docount@pgswcpts
\def\check@bnsptpage#1{%
  % We need to hide this inside of a macro because if \ifhlfcntr@pos
  % isn't expanded (because this stuff is being skipped in the outer
  % conditional), then TeX doesn't see the \ifnum hidden inside the
  % \ifhlfcntr@pos, but it does see the \fi, and so it get confused.
  \set@hlfcntr{tmp@hlfcntr}{\bonuspointsonpage{\the@iterator}}%
  \ifhlfcntr@pos{tmp@hlfcntr}%
    \addtocounter{#1}{1}%
  \fi
}% check@bnsptpage

\def\docount@pgswpts#1{%
  % Called by \count@pgswpts.
  % Count the number of pages in range with regular points.
  \addtocounter{@iterator}{1}%
  \set@hlfcntr{tmp@hlfcntr}{\pointsonpage{\the@iterator}}%
  \ifhlfcntr@pos{tmp@hlfcntr}%
    \addtocounter{#1}{1}%
  \fi
  \ifnum \the@iterator < \tbl@lastp\relax
    \def\nextdocount@pgswpts{\docount@pgswpts{#1}}%
  \else
    \let\nextdocount@pgswpts=\relax
  \fi
  \nextdocount@pgswpts
}% docount@pgswpts

\def\docount@pgswbpts#1{%
  % Called by \count@pgswpts
  % Count the number of pages in range with bonus points.
  \addtocounter{@iterator}{1}%
  \set@hlfcntr{tmp@hlfcntr}{\bonuspointsonpage{\the@iterator}}%
  \ifhlfcntr@pos{tmp@hlfcntr}%
    \addtocounter{#1}{1}%
  \fi
  \ifnum \the@iterator < \tbl@lastp\relax
    \def\nextdocount@pgswbpts{\docount@pgswbpts{#1}}%
  \else
    \let\nextdocount@pgswbpts=\relax
  \fi
  \nextdocount@pgswbpts
}% docount@pgswbpts

%--------------------------------------------------------------------
%--------------------------------------------------------------------
% Multirow horizontal tables, indexed by question numbers:

\newcounter{pq@index}% In tables indexed by page numbers, it holds a
% page number. In tables indexed by question numbers, it holds a
% question number.

\newcounter{pq@index@pts}% In horizontal tables, this holds either the
% current page number or the current question number as we put the
% point values for that page or question number into the table.  In
% vertical tables, this holds the index for the first column of the
% current row.

\newcounter{pq@index@bpts}% used to set bonus point values in
% horizontal tables.  Often used as scratch elsewhere.

\def\hidden@ampersand{&}% Needed because an ampersand can't appear in
% the replacement text of a conditional.

\newif\iftbl@pgs
% \tbl@pgstrue means a table indexed by page numbers
% \tbl@pgsfalse means a table indexed by question numbers

\newcounter{num@cols}
\newcounter{num@rows}
\newcounter{current@row}
\newcounter{cols@done}% Holds the number of columns done in the
% current row.

%--------------------------------------------------------------------
%--------------------------------------------------------------------
% Stuff to unify tables indexed by questions and tables indexed by
% pages:

% \first@pq@index and \last@pq@index will hold either \tbl@firstq and
% \tbl@lastq or \tbl@firstp and \tbl@lastp.

\def\increment@index#1{%
  % If we're doing a table indexed by question numbers, we increment
  % the counter #1.
  % If we're doing a table indexed by page numbers,
  % we increase the counter #1 by at least 1 to either the number of the
  % next page containing the appropriate kind of points, or to
  % something greater than \tbl@lastp.
  \iftbl@pgs
    \find@nextpagewithpoints{#1}%
  \else
    \addtocounter{#1}{1}%
  \fi
}% increment@index

\def\nextcolumn@index@v#1{%
  % Used only for multicolumn tables.
  % If we're doing a table indexed by question numbers, we increase
  % the counter #1 by num@cols.
  % If we're doing a table indexed by page numbers,
  % we use \find@nextcolumnpage@v to increment the counter #1 to either
  % the (num@rows)'th page number after #1 that contains the
  % appropriate kind of points or to a value greater than \tbl@lastp.
  \iftbl@pgs
    \find@nextcolumnpage@v{#1}%
  \else
    \addtocounter{#1}{\value{num@rows}}%
  \fi
}% nextcolumn@index@v

\def\pointsof@index#1{%
  \iftbl@pgs
    \pointsonpage{\arabic{#1}}%
  \else
    \pointsofquestion{\arabic{#1}}%
  \fi
}% pointsof@index

\def\bonuspointsof@index#1{%
  \iftbl@pgs
    \bonuspointsonpage{\arabic{#1}}%
  \else
    \bonuspointsofquestion{\arabic{#1}}%
  \fi
}% bonuspointsof@index

\def\refto@index#1{%
  \iftbl@pgs
    \if@combined
      % Need to hide this inside of a macro:
      \refto@comb@index{#1}%
    \else
      \if@bonus
        \pageref{firstbonuspoints@onpage@\arabic{#1}}%
      \else
        \pageref{firstpoints@onpage@\arabic{#1}}%
      \fi
    \fi
  \else
    \ref{question@\arabic{#1}}%
  \fi
}% refto@index

\def\refto@comb@index#1{%
  % We're called only by \refto@index.
  % We can't have the \ifhlfcntr@pos...\fi inside of another
  % conditional, so we're hiding it in this macro.
  \set@hlfcntr{tmp@hlfcntr}{\pointsonpage{\arabic{#1}}}%
  \ifhlfcntr@pos{tmp@hlfcntr}%
    \pageref{firstpoints@onpage@\arabic{#1}}%
  \else
    % In theory, there *must* be bonus points on this page, because
    % there aren't any plain points, but there are allegedly *some*
    % points.  We're being brave and assuming that's correct, and not
    % checking (which we'd have to hide inside a macro, because it
    % would use \ifhlfcntr@pos):
    \pageref{firstbonuspoints@onpage@\arabic{#1}}%
  \fi
}% refto@comb@index

%--------------------------------------------------------------------
%--------------------------------------------------------------------
% Multirow tables:


%--------------------------------------------------------------------
% Check that the number of rows is OK, and compute the number of
% columns:

\def\check@num@rows@h{%
  % We get here from \tbl@v@or@h.
  % We make sure the number of rows is a positive integer.  If it
  % is, we go on to \@computenumcols@h
  \ifnum \value{num@rows} < 1\relax
    \ClassError{exam}{%
      The number of rows in a table must be positive.\MessageBreak
    }{%
      The number of rows must be a positive integer.\MessageBreak
    }%
    \fbox{\textbf{Error:} Multirow table with no rows!}%
  \else
    \@computenumcols@h
  \fi
}% check@num@rows@h

\def\@computenumcols@h{%
  % We get here from \check@num@rows@h.
  % Compute the number of columns.
  % First: set num@cols to one more than either (the number of pages
  % with the appropriate type of points) or (the number of questions),
  % to have slots for the total along with the questions:
  \iftbl@pgs
    \count@pgswpts{num@cols}%
    \addtocounter{num@cols}{1}%
  \else
    \setcounter{num@cols}{\tbl@lastq}%
    \addtocounter{num@cols}{-\tbl@firstq}%
    \addtocounter{num@cols}{2}%
  \fi
  % Save the number of slots needed in pq@index (used for scratch), to
  % check for truncation:
  \setcounter{pq@index}{\value{num@cols}}%
  % Divide the number of slots needed by num@rows:
  \divide \csname c@num@cols\endcsname by
    \csname c@num@rows\endcsname
  % Division truncates: See if there was truncation.
  % Use @iterator as a scratch counter.
  \setcounter{@iterator}{\value{num@cols}}%
  \multiply \csname c@@iterator\endcsname by
    \csname c@num@rows\endcsname
  \ifnum \value{@iterator} < \value{pq@index}\relax
    % There was truncation; add a column to num@cols:
    \addtocounter{num@cols}{1}%
  \fi
  \@multirowtable
}% @computenumcols@h

%--------------------------------------------------------------------
% Construct the actual table:

\def\@multirowtable{%
  % We get here from \@computenumcols@h.
  % All multirow tables!
  \renewcommand\arraystretch{\@gtblstretch}%
  \set@hlfcntr{tbl@points}{0}%
  \set@hlfcntr{tbl@bonuspoints}{0}%
  \setcounter{pq@index}{\first@pq@index}%
  \addtocounter{pq@index}{-1}%
  \setcounter{pq@index@pts}{\value{pq@index}}%
  \setcounter{pq@index@bpts}{\value{pq@index}}%
  \setcounter{current@row}{0}%
  \begin{tabular}{|l|*{\value{num@cols}}{c|}}
    \hline
    \if@combined
      \do@comblines@h
    \else
      \do@lines@h
    \fi
}% @multirowtable


\def\do@lines@h{%
  % Called only by \@multirowtable.
  % It's either bonus or regular, but not combined:
  \addtocounter{current@row}{1}% Set to the number of the current row
  \iftbl@pgs
    \if@bonus
      \@bhpgword
    \else
      \@hpgword
    \fi
  \else
    \if@bonus
      \@bhqword
    \else
      \@hqword
    \fi
  \fi
  \setcounter{cols@done}{0}%
  \do@pq@indexloop@h
  % When we finish \do@pq@indexloop@h, either we've finished a
  % complete row of page numbers (or questions), or we've done all 
  % the page numbers (or questions) through \last@pq@index, or both:
  \ifnum \value{cols@done} < \value{num@cols}\relax
    % We've inserted all the page or question numbers, and there's
    % room remaining on the current line for \@htword (or \@bhtword):
    \ifnum \value{current@row} = \value{num@rows}\relax
      % This is the last row; put in the total:
      \do@htword@h
    \else
      % This isn't the last row.  We insert (\value{num@cols} -
      % \value{cols@done}) ampersands.
      \setcounter{@iterator}{\value{num@cols}}%
      \addtocounter{@iterator}{-\value{cols@done}}%
      \do@emptycols@h
    \fi
  \fi
  \\
  \hline
  % Point values go here!
  \setcounter{cols@done}{0}%
  \if@bonus
    \@bhpword
    \do@bptloop@h
  \else
    \@hpword
    \do@ptloop@h
  \fi
  % When we finish \do@ptloop@h or \do@bptloop@h, either
  % we've finished a complete row of point values, or we've done all
  % the question (or page) numbers through \last@pq@index, or both:  
  \ifnum \value{cols@done} < \value{num@cols}\relax
    % We've inserted all the point values, and there's room
    % remaining on the current line for Total Points:
    \ifnum \value{current@row} = \value{num@rows}\relax
      % This is the last row; put in the total:
      \if@bonus
        \do@totalbpts@h
      \else
        \do@totalpts@h
      \fi
    \else
      % This isn't the last row.  We insert (\value{num@cols} -
      % \value{cols@done}) ampersands.
      \setcounter{@iterator}{\value{num@cols}}%
      \addtocounter{@iterator}{-\value{cols@done}}%
      \do@emptycols@h
    \fi
  \fi
  % We hold off on putting in the "\\ \hline" because we may want to
  % immediately follow it with either an "\end{tabular}" or another
  % "\hline".
  % Scores?
  \if@scores
    \\
    \hline
    \if@bonus
      \@bhsword \hidden@ampersand
    \else
      \@hsword \hidden@ampersand
    \fi
    \setcounter{cols@done}{0}%
    \do@sloop@h
  \fi
  \ifnum \value{current@row} = \value{num@rows}\relax
    % This is the last line!  End the tabular:
    \\
    \hline
    \end{tabular}%
  \else
    % Don't end the tabular:
    \\
    \hline\hline
  \fi
  % Check if we should repeat:
  \ifnum \value{current@row} < \value{num@rows}\relax
    \let\nextdo@lines@h=\do@lines@h
  \else
    \let\nextdo@lines@h=\relax
  \fi
  \nextdo@lines@h
}% do@lines@h

\def\do@comblines@h{%
  % Called only by \@multirowtable.
  % Combined tables.
  \addtocounter{current@row}{1}% Set to the number of the current row
  \iftbl@pgs
    \@chpgword
  \else
    \@chqword
  \fi
  \setcounter{cols@done}{0}%
  \do@pq@indexloop@h
  % When we finish \do@pq@indexloop@h, either we've finished a
  % complete row of page (or question) numbers, or we've done all
  % the page (or question) numbers through \last@pq@index, or both: 
  \ifnum \value{cols@done} < \value{num@cols}\relax
    % We've inserted all the question (or page) numbers, and there's
    % room remaining on the current line for \@chtword:
    \ifnum \value{current@row} = \value{num@rows}\relax
      % This is the last row; put in the total:
      \do@htword@h
    \else
      % This isn't the last row.  We insert (\value{num@cols} -
      % \value{cols@done}) ampersands.
      \setcounter{@iterator}{\value{num@cols}}%
      \addtocounter{@iterator}{-\value{cols@done}}%
      \do@emptycols@h
    \fi
  \fi
  \\
  \hline
  % Point values go here!
  \@chpword
  \setcounter{cols@done}{0}%
  \do@ptloop@h
  % When we finish \do@ptloop@h, either we've finished a complete
  % row of point values, or we've done all the question (or page)
  % numbers through \last@pq@index, or both:   
  \ifnum \value{cols@done} < \value{num@cols}\relax
    % We've inserted all the point values, and there's room
    % remaining on the current line for Total Points:
    \ifnum \value{current@row} = \value{num@rows}\relax
      % This is the last row; put in the total:
      \do@totalpts@h
    \else
      % This isn't the last row.  We insert (\value{num@cols} -
      % \value{cols@done}) ampersands.
      \setcounter{@iterator}{\value{num@cols}}%
      \addtocounter{@iterator}{-\value{cols@done}}%
      \do@emptycols@h
    \fi
  \fi
  \\
  \hline
  % Bonus point values go here!
  \@chbpword
  \setcounter{cols@done}{0}%
  \do@bptloop@h
  % When we finish \do@bptloop@h, either
  % we've finished a complete row of point values, or we've done all
  % the question (or page) numbers through \last@pq@index, or both:  
  \ifnum \value{cols@done} < \value{num@cols}\relax
    % We've inserted all the point values, and there's room
    % remaining on the current line for Total Points:
    \ifnum \value{current@row} = \value{num@rows}\relax
      % This is the last row; put in the total:
      \do@totalbpts@h
    \else
      % This isn't the last row.  We insert (\value{num@cols} -
      % \value{cols@done}) ampersands.
      \setcounter{@iterator}{\value{num@cols}}%
      \addtocounter{@iterator}{-\value{cols@done}}%
      \do@emptycols@h
    \fi
  \fi
  % We hold off on putting in the "\\ \hline" because we may want to
  % immediately follow it with either an "\end{tabular}" or another
  % "\hline".
  % Scores?
  \if@scores
    \\
    \hline
    \@chsword \hidden@ampersand
    \setcounter{cols@done}{0}%
    \do@sloop@h
  \fi
  \ifnum \value{current@row} = \value{num@rows}\relax
    % This is the last line!  End the tabular:
    \\
    \hline
    \end{tabular}%
  \else
    % Don't end the tabular:
    \\
    \hline\hline
  \fi
  % Check if we should repeat:
  \ifnum \value{current@row} < \value{num@rows}\relax
    \let\nextdo@comblines@h=\do@comblines@h
  \else
    \let\nextdo@comblines@h=\relax
  \fi
  \nextdo@comblines@h
}% do@comblines@h

\def\do@pq@indexloop@h{%
  % Called by both \do@lines@h and \do@comblines@h.
  % We insert at most one row of pq@index:
  \increment@index{pq@index}%
  \ifnum \value{pq@index} > \last@pq@index\relax
    % Do nothing!
  \else
    \hidden@ampersand
    \refto@index{pq@index}%
    \addtocounter{cols@done}{1}%
  \fi
  \ifnum \value{pq@index} < \last@pq@index\relax
    \ifnum \value{cols@done} < \value{num@cols}\relax
      \let\nextdo@pq@indexloop@h=\do@pq@indexloop@h
    \else
      \let\nextdo@pq@indexloop@h=\relax
    \fi
  \else
    \let\nextdo@pq@indexloop@h=\relax
  \fi
  \nextdo@pq@indexloop@h
}% do@pq@indexloop@h

\def\do@ptloop@h{%
  % Called by both \do@lines@h and \do@comblines@h.
  % We insert at most one row of non-bonus point values:
  \increment@index{pq@index@pts}%
  \ifnum \value{pq@index@pts} > \last@pq@index\relax
    % Do nothing!
  \else
    \hidden@ampersand
    \addtocounter{cols@done}{1}%
    \pointsof@index{pq@index@pts}%
    \addto@hlfcntr{tbl@points}{\pointsof@index{pq@index@pts}}%
  \fi
  \ifnum \value{pq@index@pts} < \last@pq@index\relax
    \ifnum \value{cols@done} < \value{num@cols}\relax
      \let\nextdo@ptloop@h=\do@ptloop@h
    \else
      \let\nextdo@ptloop@h=\relax
    \fi
  \else
    \let\nextdo@ptloop@h=\relax
  \fi
  \nextdo@ptloop@h
}% do@ptloop@h

\def\do@bptloop@h{%
  % Called by both \do@lines@h and \do@comblines@h.
  % We insert at most one row of bonus point values:
  \increment@index{pq@index@bpts}%
  \ifnum \value{pq@index@bpts} > \last@pq@index\relax
    % Do nothing!
  \else
    \hidden@ampersand
    \addtocounter{cols@done}{1}%
    \bonuspointsof@index{pq@index@bpts}%
    \addto@hlfcntr{tbl@bonuspoints}{\bonuspointsof@index{pq@index@bpts}}%
  \fi
  \ifnum \value{pq@index@bpts} < \last@pq@index\relax
    \ifnum \value{cols@done} < \value{num@cols}\relax
      \let\nextdo@bptloop@h=\do@bptloop@h
    \else
      \let\nextdo@bptloop@h=\relax
    \fi
  \else
    \let\nextdo@bptloop@h=\relax
  \fi
  \nextdo@bptloop@h
}% do@bptloop@h

\def\do@htword@h{%
  % Called by both \do@lines@h and \do@comblines@h.
  % We insert (\value{num@cols} - \value{cols@done}) ampersands,
  % and then either \@htword or \@bhtword or \@chtword:
  \setcounter{@iterator}{\value{num@cols}}%
  \addtocounter{@iterator}{-\value{cols@done}}%
  \do@emptycols@h
  \if@combined
    \@chtword
  \else
    \if@bonus
      \@bhtword
    \else
      \@htword
    \fi
  \fi
}% do@htword@h

\def\do@totalpts@h{%
  % Called by both \do@lines@h and \do@comblines@h.
  % We insert (\value{num@cols} - \value{cols@done}) ampersands
  % and then the total points:
  \setcounter{@iterator}{\value{num@cols}}%
  \addtocounter{@iterator}{-\value{cols@done}}%
  \do@emptycols@h
  \prt@tablepoints
}% do@totalpts@h

\def\do@totalbpts@h{%
  % Called by both \do@lines@h and \do@comblines@h.
  % We insert (\value{num@cols} - \value{cols@done}) ampersands,
  % and then the total bonus points:
  \setcounter{@iterator}{\value{num@cols}}%
  \addtocounter{@iterator}{-\value{cols@done}}%
  \do@emptycols@h
  \prt@tablebonuspoints
}% do@totalbpts@h

\def\do@emptycols@h{%
  % Called by \do@lines@h, \do@comblines@h, \do@htword@h,
  % \do@totalpts@h, and \do@totalbpts@h.
  % We insert \value{@iterator} ampersands:
  \ifnum \value{@iterator} > 0\relax
    \hidden@ampersand
    \addtocounter{@iterator}{-1}%
    \let\nextdo@emptycols@h=\do@emptycols@h
  \else
    \let\nextdo@emptycols@h=\relax
  \fi
  \nextdo@emptycols@h
}% do@emptycols@h

\def\do@sloop@h{%
  % Called by both \do@lines@h and \do@comblines@h.
  % We assume that cols@done has been set to zero.
  % We insert num@cols \hbox to \@cellwidth,
  % separated by ampersands.
  \addtocounter{cols@done}{1}%
  \hbox to \@cellwidth{\hfill}%
  \ifnum \value{cols@done} < \value{num@cols}\relax
    \hidden@ampersand
    \let\nextdo@sloop@h=\do@sloop@h
  \else
    \let\nextdo@sloop@h=\relax
  \fi
  \nextdo@sloop@h
}% do@sloop@h


%--------------------------------------------------------------------
%--------------------------------------------------------------------
% Multicolumn tables


%--------------------------------------------------------------------
% Here's an example of a multicolumn grade table indexed by questions.

% Every line of \cline's is followed by a
% \noalign{\vskip\arrayrulewidth} to cancel the
% \noalign{\vskip-\arrayrulewidth} that ends the definition of
% \cline.

% \begin{tabular}{*2{|c|c|c|c}}
%   \cline{1-3} \cline{5-7}
%   \noalign{\vskip\arrayrulewidth}
%   Question%
%   & Points%
%   & Score%
%   & \hspace*{-\arrayrulewidth}\hspace*{\doublerulesep}%
%   & Question%
%   & Points%
%   & Score%
%   \\
%   \cline{1-3} \cline{5-7}
%   \noalign{\vskip\arrayrulewidth}
%   1%
%   & 5%
%   & \hbox to \@cellwidth{\hfill}%
%   & \hspace*{-\arrayrulewidth}\hspace*{\doublerulesep}%
%   & 4%
%   & 20%
%   & \hbox to \@cellwidth{\hfill}%
%   \\
%   \cline{1-3} \cline{5-7}
%   \noalign{\vskip\arrayrulewidth}
%   2%
%   & 10%
%   & \hbox to \@cellwidth{\hfill}%
%   & \hspace*{-\arrayrulewidth}\hspace*{\doublerulesep}%
%   & 5%
%   & 25%
%   & \hbox to \@cellwidth{\hfill}%
%   \\
%   \cline{1-3} \cline{5-7}
%   \noalign{\vskip\arrayrulewidth}
%   3%
%   & 15%
%   & \hbox to \@cellwidth{\hfill}%
%   & \hspace*{-\arrayrulewidth}\hspace*{\doublerulesep}%
%   & Total:%
%   & 75%
%   & \hbox to \@cellwidth{\hfill}%
%   \\
%   \cline{1-3} \cline{5-7}
%   \noalign{\vskip\arrayrulewidth}
% \end{tabular}
%--------------------------------------------------------------------
%--------------------------------------------------------------------
% Check that the number of cols is OK, and compute the number of rows:

\def\check@num@cols@v{%
  % We get here from \tbl@v@or@h.
  % We make sure the number of cols is between 1 and 10 (since we
  % can't handle more than 10 cols in a multicolumn table).
  % If it is, we go on to \@computenumrows@v
  \ifnum \value{num@cols} < 1\relax
    \ClassError{exam}{%
      The number of columns in a table must be positive.\MessageBreak
    }{%
      The number of columns must be a positive integer.\MessageBreak
    }%
    \fbox{\textbf{Error:} Multicolumn table with no columns!}%
  \else
    \ifnum \value{num@cols} > 10\relax
      \ClassError{exam}{%
        Multicolumn tables can have at most 10 columns.\MessageBreak
      }{%
        Multicolumn tables can have at most 10 columns.\MessageBreak
      }%
      \fbox{\textbf{Error:} Multicolumn table with more than 10 columns!}%
    \else
      \@computenumrows@v
    \fi
  \fi
}% check@num@cols@v

\def\@computenumrows@v{%
  % We get here from \check@num@cols@v.
  % Compute the number of rows.
  % First: set num@rows to one more than the number of either
  % (questions) or (pages with the appropriate type of points), to
  % have slots for the total along with the questions or page numbers:
  \iftbl@pgs
    \count@pgswpts{num@rows}%
    \addtocounter{num@rows}{1}%
  \else
    \setcounter{num@rows}{\last@pq@index}%
    \addtocounter{num@rows}{-\first@pq@index}%
    \addtocounter{num@rows}{2}%
  \fi
  % Save the number of slots needed, using pq@index@bpts as a scratch
  % counter, to check for truncation on division:
  \setcounter{pq@index@bpts}{\value{num@rows}}%
  % Divide the number of slots needed by num@cols:
  \divide \csname c@num@rows\endcsname by
    \csname c@num@cols\endcsname
  % Division truncates: See if there was truncation.
  % Use the counter @iterator as a scratch counter:
  \setcounter{@iterator}{\value{num@rows}}%
  \multiply \csname c@@iterator\endcsname by
    \csname c@num@cols\endcsname
  \ifnum \value{@iterator} < \value{pq@index@bpts}\relax
    % There was truncation; add one to num@rows:
    \addtocounter{num@rows}{1}%
  \fi
  \@multicolumntable
}% @computenumrows@v

%--------------------------------------------------------------------
% Construct the actual table:

\def\@multicolumntable{%
  % We get here from \@computenumrows@v.
  % Set \cline@stuff@v equal to the line of \cline's:
  \create@cline@stuff@v
  \renewcommand\arraystretch{\@gtblstretch}%
  \set@hlfcntr{tbl@points}{0}%
  \set@hlfcntr{tbl@bonuspoints}{0}%
  \if@combined
    \if@scores
      % combinedgradetable, possibly partial.
      % Note: We'll never use the final "c" in the format of the
      % tabular, but there's no harm in that. 
      \begin{tabular}{*{\value{num@cols}}{|c|c|c|c|c}}
      % We need to make sure that the \cline@stuff@v commands come
      % *immediately* following the \\ or \begin{tabular} (with no
      % conditionals evaluated, even if those conditionals expand to
      % the empty string)! 
      % Put in the row of column headings, with \cline@stuff@v above and
      % below:
      \cline@stuff@v  
      \setcounter{@iterator}{0}%
      \docolumn@heads@comb@v
      \\
      \cline@stuff@v
    \else
      % combinedpointtable, possibly partial.
      % Note: We'll never use the final "c" in the format of the
      % tabular, but there's no harm in that. 
      \begin{tabular}{*{\value{num@cols}}{|c|c|c|c}}
      % We need to make sure that the \cline@stuff@v commands come
      % *immediately* following the \\ or \begin{tabular} (with no
      % conditionals evaluated, even if those conditionals expand to
      % the empty string)! 
      % Put in the row of column headings, with \cline@stuff@v above and
      % below:
      \cline@stuff@v  
      \setcounter{@iterator}{0}%
      \docolumn@heads@comb@noscores@v
      \\
      \cline@stuff@v
    \fi
    % pq@index@pts will hold the question number (or page number) in
    % the first column of the row. 
    \setcounter{pq@index@pts}{\first@pq@index}%
    \iftbl@pgs
      % If we're indexed by pages, we need to make sure there are
      % points of the appropriate type on the first page listed:
      \addtocounter{pq@index@pts}{-1}%
      \find@nextpagewithpoints{pq@index@pts}%
    \fi
    \setcounter{current@row}{0}%
    \do@lines@v
  \else
    % It's not combined:
    \if@scores
      % Note: We'll never use the final "c" in the format of the
      % tabular, but there's no harm in that. 
      \begin{tabular}{*{\value{num@cols}}{|c|c|c|c}}
      % We need to make sure that the \cline@stuff@v commands come
      % *immediately* following the \\ or \begin{tabular} (with no
      % conditionals evaluated, even if those conditionals expand to
      % the empty string)! 
      % Put in the row of column headings, with \cline@stuff@v above and
      % below:
      \cline@stuff@v  
      \setcounter{@iterator}{0}%
      \docolumn@heads@v
      \\
      \cline@stuff@v
    \else
      % Note: We'll never use the final "c" in the format of the
      % tabular, but there's no harm in that. 
      \begin{tabular}{*{\value{num@cols}}{|c|c|c}}
      % We need to make sure that the \cline@stuff@v commands come
      % *immediately* following the \\ or \begin{tabular} (with no
      % conditionals evaluated, even if those conditionals expand to
      % the empty string)! 
      % Put in the row of column headings, with \cline@stuff@v above and
      % below:
      \cline@stuff@v  
      \setcounter{@iterator}{0}%
      \docolumn@heads@noscores@v
      \\
      \cline@stuff@v
    \fi
    % pq@index@pts will hold the question number (or page number) in
    % the first column of the row. 
    \setcounter{pq@index@pts}{\first@pq@index}%
    \iftbl@pgs
      % If we're indexed by pages, we need to make sure there are
      % points of the appropriate type on the first page listed:
      \addtocounter{pq@index@pts}{-1}%
      \find@nextpagewithpoints{pq@index@pts}%
    \fi
    \setcounter{current@row}{0}%
    \do@lines@v
  \fi
}% @multicolumntable

%--------------------------------------------------------------------
% \create@cline@stuff@v

% The function \create@cline@stuff@v defines \cline@stuff@v to be whatever's
% appropriate given the values of num@cols, \if@bonus, \if@combined, and
% \if@scores.

% We wimped out of generating \cline@stuff@v on the fly because we didn't
% see how to get the correct expansions/nonexpansions without using a
% primitive of e-TeX.

% \clines@ii@whatever is for tables in which a  logical column consists
% of two columns; it's used for pointtable and bonuspointtable.

\def\clines@ii@i{\cline{1-2}}
\def\clines@ii@ii{\cline{1-2} \cline{4-5}}
\def\clines@ii@iii{\cline{1-2} \cline{4-5} \cline{7-8}}
\def\clines@ii@iv{\cline{1-2} \cline{4-5} \cline{7-8} \cline{10-11}}
\def\clines@ii@v{\cline{1-2} \cline{4-5} \cline{7-8} \cline{10-11}
  \cline{13-14}}
\def\clines@ii@vi{\cline{1-2} \cline{4-5} \cline{7-8} \cline{10-11}
  \cline{13-14} \cline{16-17}}
\def\clines@ii@vii{\cline{1-2} \cline{4-5} \cline{7-8} \cline{10-11}
  \cline{13-14} \cline{16-17} \cline{19-20}}
\def\clines@ii@viii{\cline{1-2} \cline{4-5} \cline{7-8} \cline{10-11}
  \cline{13-14} \cline{16-17} \cline{19-20} \cline{22-23}}
\def\clines@ii@vix{\cline{1-2} \cline{4-5} \cline{7-8} \cline{10-11}
  \cline{13-14} \cline{16-17} \cline{19-20} \cline{22-23}
  \cline{25-26}}
\def\clines@ii@x{\cline{1-2} \cline{4-5} \cline{7-8} \cline{10-11}
  \cline{13-14} \cline{16-17} \cline{19-20} \cline{22-23}
  \cline{25-26} \cline{28-29}}

% \clines@iii@whatever is for tables in which a  logical column consists
% of three columns; it's are used for gradetable, bonusgradetable, and
% combinedpointtable:

\def\clines@iii@i{\cline{1-3}}
\def\clines@iii@ii{\cline{1-3} \cline{5-7}}
\def\clines@iii@iii{\cline{1-3} \cline{5-7} \cline{9-11}}
\def\clines@iii@iv{\cline{1-3} \cline{5-7} \cline{9-11} \cline{13-15}}
\def\clines@iii@v{\cline{1-3} \cline{5-7} \cline{9-11} \cline{13-15}
  \cline{17-19}}
\def\clines@iii@vi{\cline{1-3} \cline{5-7} \cline{9-11} \cline{13-15}
  \cline{17-19} \cline{21-23}}
\def\clines@iii@vii{\cline{1-3} \cline{5-7} \cline{9-11} \cline{13-15}
  \cline{17-19} \cline{21-23} \cline{25-27}}
\def\clines@iii@viii{\cline{1-3} \cline{5-7} \cline{9-11} \cline{13-15}
  \cline{17-19} \cline{21-23} \cline{25-27} \cline{29-31}}
\def\clines@iii@ix{\cline{1-3} \cline{5-7} \cline{9-11} \cline{13-15}
  \cline{17-19} \cline{21-23} \cline{25-27} \cline{29-31}
  \cline{33-35}}
\def\clines@iii@x{\cline{1-3} \cline{5-7} \cline{9-11} \cline{13-15}
  \cline{17-19} \cline{21-23} \cline{25-27} \cline{29-31}
  \cline{33-35} \cline{37-39}}


% \clines@iv@whatever is for tables in which a  logical column
% consists of four columns; it's used for combinedgradetable.

\def\clines@iv@i{\cline{1-4}}
\def\clines@iv@ii{\cline{1-4} \cline{6-9}}
\def\clines@iv@iii{\cline{1-4} \cline{6-9} \cline{11-14}}
\def\clines@iv@iv{\cline{1-4} \cline{6-9} \cline{11-14} \cline{16-19}}
\def\clines@iv@v{\cline{1-4} \cline{6-9} \cline{11-14} \cline{16-19}
  \cline{21-24}}
\def\clines@iv@vi{\cline{1-4} \cline{6-9} \cline{11-14} \cline{16-19}
  \cline{21-24} \cline{26-29}}
\def\clines@iv@vii{\cline{1-4} \cline{6-9} \cline{11-14} \cline{16-19}
  \cline{21-24} \cline{26-29} \cline{31-34}}
\def\clines@iv@viii{\cline{1-4} \cline{6-9} \cline{11-14} \cline{16-19}
  \cline{21-24} \cline{26-29} \cline{31-34} \cline{36-39}}
\def\clines@iv@ix{\cline{1-4} \cline{6-9} \cline{11-14} \cline{16-19}
  \cline{21-24} \cline{26-29} \cline{31-34} \cline{36-39}
  \cline{41-44}}
\def\clines@iv@x{\cline{1-4} \cline{6-9} \cline{11-14} \cline{16-19}
  \cline{21-24} \cline{26-29} \cline{31-34} \cline{36-39}
  \cline{41-44} \cline{46-49}}

% The definition of \cline ends with \noalign{\vskip-\arrayrulewidth},
% and so we want to throw in a \noalign{\vskip\arrayrulewidth} to
% cancel that.
\def\cline@correction{\noalign{\vskip\arrayrulewidth}}

\def\create@cline@stuff@v{%
  % Called by \@multicolumntable.
  \if@combined
    \if@scores
      \edef\cline@stuff@v{\expandafter\noexpand\csname
        clines@iv@\romannumeral \c@num@cols\endcsname
        \noexpand\cline@correction}%
    \else
      \edef\cline@stuff@v{\expandafter\noexpand\csname
        clines@iii@\romannumeral \c@num@cols\endcsname
        \noexpand\cline@correction}%
    \fi
  \else
    \if@scores
      \edef\cline@stuff@v{\expandafter\noexpand\csname
        clines@iii@\romannumeral \c@num@cols\endcsname
        \noexpand\cline@correction}%
    \else
      \edef\cline@stuff@v{\expandafter\noexpand\csname
        clines@ii@\romannumeral \c@num@cols\endcsname
        \noexpand\cline@correction}%
    \fi
  \fi
}% create@cline@stuff@v

%--------------------------------------------------------------------
% The various \docolumn@heads@something@v

\def\docolumn@heads@v{%
  % Called by \@multicolumntable.
  % multicolumngradetable or multicolumnbonusgradetable, possibly
  % partial.
    \iftbl@pgs
      \if@bonus
        \@bvpgword
      \else
        \@vpgword
      \fi
    \else
      \if@bonus
        \@bvqword
      \else
        \@vqword
      \fi
    \fi
  & \if@bonus
      \@bvpword
    \else
      \@vpword
    \fi
  & \if@bonus
      \@bvsword
    \else
      \@vsword
    \fi
  \addtocounter{@iterator}{1}%
  \ifnum \value{@iterator} < \value{num@cols}\relax
    \hidden@ampersand
    \hspace*{-\arrayrulewidth}\hspace*{\doublerulesep}%
    \hidden@ampersand
    \let\nextdocolumn@heads@v=\docolumn@heads@v
  \else
    \let\nextdocolumn@heads@v=\relax
  \fi
  \nextdocolumn@heads@v
}% docolumn@heads@v

\def\docolumn@heads@noscores@v{%
  % Called by \@multicolumntable.
  % multicolumnpointtable or multicolumnbonuspointtable, possibly
  % partial.
    \iftbl@pgs
      \if@bonus
        \@bvpgword
      \else
        \@vpgword
      \fi
    \else
      \if@bonus
        \@bvqword
      \else
        \@vqword
      \fi
    \fi
    &
    \if@bonus
      \@bvpword
    \else
      \@vpword
    \fi
  \addtocounter{@iterator}{1}%
  \ifnum \value{@iterator} < \value{num@cols}\relax
    \hidden@ampersand
    \hspace*{-\arrayrulewidth}\hspace*{\doublerulesep}%
    \hidden@ampersand
    \let\nextdocolumn@heads@noscores@v=\docolumn@heads@noscores@v
  \else
    \let\nextdocolumn@heads@noscores@v=\relax
  \fi
  \nextdocolumn@heads@noscores@v
}% docolumn@heads@noscores@v

\def\docolumn@heads@comb@v{%
  % Called by \@multicolumntable.
  % multicolumncombinedgradetable, possibly partial.
    \iftbl@pgs
      \@cvpgword
    \else
      \@cvqword
    \fi
  & \@cvpword
  & \@cvbpword
  &  \@cvsword
  \addtocounter{@iterator}{1}%
  \ifnum \value{@iterator} < \value{num@cols}\relax
    \hidden@ampersand
    \hspace*{-\arrayrulewidth}\hspace*{\doublerulesep}%
    \hidden@ampersand
    \let\nextdocolumn@heads@comb@v=\docolumn@heads@comb@v
  \else
    \let\nextdocolumn@heads@comb@v=\relax
  \fi
  \nextdocolumn@heads@comb@v
}% docolumn@heads@comb@v

\def\docolumn@heads@comb@noscores@v{%
  % Called by \@multicolumntable.
  % multicolumncombinedpointtable, possibly partial.
    \iftbl@pgs
      \@cvpgword
    \else
      \@cvqword
    \fi
  & \@vpword
  & \@bvpword
  \addtocounter{@iterator}{1}%
  \ifnum \value{@iterator} < \value{num@cols}\relax
    \hidden@ampersand
    \hspace*{-\arrayrulewidth}\hspace*{\doublerulesep}%
    \hidden@ampersand
    \let\nextdocolumn@heads@comb@noscores@v=\docolumn@heads@comb@noscores@v
  \else
    \let\nextdocolumn@heads@comb@noscores@v=\relax
  \fi
  \nextdocolumn@heads@comb@noscores@v
}% docolumn@heads@comb@noscores@v

%--------------------------------------------------------------------
% \do@lines@v is used by *all* multicolumn tables.
% It calls \do@oneline@v for all non-combined tables and
% \do@oneline@comb@v for all combined tables.

\def\do@lines@v{%
  % We get here from \@multicolumntable.
  % ALL MULTICOLUMN TABLES!!!!
  % pq@index@pts holds the question number or page number in the first
  % column of the current row.
  \addtocounter{current@row}{1}%
  \setcounter{pq@index}{\value{pq@index@pts}}%
  \setcounter{cols@done}{0}% Number of columns done
  % We're doing both grade tables and point tables!!
  \if@combined
    \do@oneline@comb@v
  \else
    \do@oneline@v
  \fi
  \increment@index{pq@index@pts}%
  % We need the "\\ \cline@stuff@v" to *immediately* precede the
  % \end{tabular} (i.e., with no \ifnum separating them), to avoid
  % having crap after the \cline@stuff@v that
  % causes there to be an extra row at the end of the table.  We also
  % need there to be nothing between \\ and \cline@stuff@v.
  \ifnum \value{current@row} = \value{num@rows}\relax
    \\
    \cline@stuff@v
    \end{tabular}%
    \let\nextdo@lines@v=\relax
  \else
    \\
    \cline@stuff@v
    \let\nextdo@lines@v=\do@lines@v
  \fi
  \nextdo@lines@v
}% do@lines@v

\def\do@oneline@v{%
  % Called by \do@lines@v.
  % Used for all multicolumn non-combined tables.
  % pq@index holds the question or page number we're about to do.
  \ifnum \value{pq@index} > \last@pq@index\relax
    % See if we're in the last column; use pq@index@bpts as a scratch
    % counter: 
    \setcounter{pq@index@bpts}{\value{cols@done}}%
    \addtocounter{pq@index@bpts}{1}%
    \ifnum \value{pq@index@bpts} = \value{num@cols}\relax
      % We're in the last column; are we in the last row?
      \ifnum \value{current@row} = \value{num@rows}\relax
        % We're in the last column, last row!
        % Print the total:
          \if@bonus
            \@bvtword
          \else
            \@vtword
          \fi
          \hidden@ampersand
        \if@scores
            \if@bonus
              \prt@tablebonuspoints
            \else
              \prt@tablepoints
            \fi
          \hidden@ampersand
            \hbox to \@cellwidth{\hfill}%
        \else
            \if@bonus
              \prt@tablebonuspoints
            \else
              \prt@tablepoints
            \fi
        \fi
      \else
        % Not last column last row; insert empty space:
          \hbox to \@cellwidth{\hfill}%
        \if@scores
          \hidden@ampersand
            \hbox to \@cellwidth{\hfill}%
        \fi
        \hidden@ampersand
          \hbox to \@cellwidth{\hfill}%
      \fi
    \else
      % Not last column; insert empty space:
      \hbox to \@cellwidth{\hfill}%
      \if@scores
        \hidden@ampersand
          \hbox to \@cellwidth{\hfill}%
      \fi
      \hidden@ampersand
        \hbox to \@cellwidth{\hfill}%
    \fi
  \else
    % We need to do question (or page) number pq@index:
      \refto@index{pq@index}%
    \hidden@ampersand
      \if@scores
        \if@bonus
          \bonuspointsof@index{pq@index}%
          \addto@hlfcntr{tbl@bonuspoints}{\bonuspointsof@index{pq@index}}%
        \else
          \pointsof@index{pq@index}%
          \addto@hlfcntr{tbl@points}{\pointsof@index{pq@index}}%
        \fi
      \hidden@ampersand
        \hbox to \@cellwidth{\hfill}%
    \else
      \if@bonus
        \bonuspointsof@index{pq@index}%
        \addto@hlfcntr{tbl@bonuspoints}{\bonuspointsof@index{pq@index}}%
      \else
        \pointsof@index{pq@index}%
        \addto@hlfcntr{tbl@points}{\pointsof@index{pq@index}}%
      \fi
    \fi
  \fi
  \addtocounter{cols@done}{1}% Number of columns done
  \ifnum \value{cols@done} < \value{num@cols}\relax
    \hidden@ampersand
      \hspace*{-\arrayrulewidth}\hspace*{\doublerulesep}%
      \nextcolumn@index@v{pq@index}%
    \hidden@ampersand
      \let\nextdo@oneline@v=\do@oneline@v
  \else
    \let\nextdo@oneline@v=\relax
  \fi
  \nextdo@oneline@v
}% do@oneline@v

\def\do@oneline@comb@v{%
  % Called by \do@lines@v.
  % All combined multicolumn tables.
  % pq@index holds the question (or page) we're about to do.
  \ifnum \value{pq@index} > \last@pq@index\relax
    % See if we're in the last column; use pq@index@bpts as a scratch
    % counter: 
    \setcounter{pq@index@bpts}{\value{cols@done}}%
    \addtocounter{pq@index@bpts}{1}%
    \ifnum \value{pq@index@bpts} = \value{num@cols}\relax
      % We're in the last column; are we in the last row?
      \ifnum \value{current@row} = \value{num@rows}\relax
        % We're in the last column, last row!
        % Print the total:
        \@cvtword
        \hidden@ampersand
          \prt@tablepoints
        \hidden@ampersand
        \if@scores
            \prt@tablebonuspoints
          \hidden@ampersand
            \hbox to \@cellwidth{\hfill}%
        \else
          \prt@tablebonuspoints
        \fi
      \else
        % Last column, but not last row; insert empty space:
          \hbox to \@cellwidth{\hfill}%
        \hidden@ampersand
          \hbox to \@cellwidth{\hfill}%
        \if@scores
          \hidden@ampersand
            \hbox to \@cellwidth{\hfill}%
        \fi
        \hidden@ampersand
          \hbox to \@cellwidth{\hfill}%
      \fi
    \else
      % Not last column; insert empty space:
        \hbox to \@cellwidth{\hfill}%
      \hidden@ampersand
        \hbox to \@cellwidth{\hfill}%
      \if@scores
        \hidden@ampersand
          \hbox to \@cellwidth{\hfill}%
      \fi
      \hidden@ampersand
        \hbox to \@cellwidth{\hfill}%
    \fi
  \else
    % We need to do question number pq@index:
      \refto@index{pq@index}%
    \hidden@ampersand
      \pointsof@index{pq@index}%
      \addto@hlfcntr{tbl@points}{\pointsof@index{pq@index}}%
    \hidden@ampersand
    \if@scores
        \bonuspointsof@index{pq@index}%
        \addto@hlfcntr{tbl@bonuspoints}{\bonuspointsof@index{pq@index}}%
      \hidden@ampersand
        \hbox to \@cellwidth{\hfill}%
    \else
      \bonuspointsof@index{pq@index}%
      \addto@hlfcntr{tbl@bonuspoints}{\bonuspointsof@index{pq@index}}%
    \fi
  \fi
  \addtocounter{cols@done}{1}% Number of columns done
  \ifnum \value{cols@done} < \value{num@cols}\relax
    \hidden@ampersand
    \hspace*{-\arrayrulewidth}\hspace*{\doublerulesep}%
    \nextcolumn@index@v{pq@index}%
    \hidden@ampersand
    \let\nextdo@oneline@comb@v=\do@oneline@comb@v
  \else
    \let\nextdo@oneline@comb@v=\relax
  \fi
  \nextdo@oneline@comb@v
}% do@oneline@comb@v

%--------------------------------------------------------------------
% \find@nextpagewithpoints and \find@nextcolumnpage@v:

\def\find@nextpagewithpoints#1{%
  % Called by \dofind@nextcolumnpage@v, \increment@index, and
  % \@multicolumntable.
  % The argument #1 should be the name of a counter with a nonnegative
  % value.
  % We increase #1 by at least 1 to either the number of the
  % next page containing the appropriate kind of points, or to something
  % greater than \tbl@lastp. 
  \addtocounter{#1}{1}%
  \if@combined
    \set@hlfcntr{tmp@hlfcntr}{\pointsonpage{\value{#1}}}%
    \addto@hlfcntr{tmp@hlfcntr}{\bonuspointsonpage{\value{#1}}}%
    % The sum is positive when at least one of them is positive.
  \else
    \if@bonus
      \set@hlfcntr{tmp@hlfcntr}{\bonuspointsonpage{\value{#1}}}%
    \else
      \set@hlfcntr{tmp@hlfcntr}{\pointsonpage{\value{#1}}}%
    \fi
  \fi
  \ifhlfcntr@pos{tmp@hlfcntr}%
    \let\nextfind@nextpagewithpoints=\relax
  \else
    \ifnum \value{#1} > \tbl@lastp\relax
      \let\nextfind@nextpagewithpoints=\relax
    \else
      \def\nextfind@nextpagewithpoints{\find@nextpagewithpoints{#1}}%
    \fi
  \fi
  \nextfind@nextpagewithpoints
}% find@nextpagewithpoints

\def\find@nextcolumnpage@v#1{%
  % Called by \nextcolumn@index@v.
  % This is used for all multicolumn tables that are indexed by
  % pages.
  % We use \find@nextpagewithpoints to increment #1 to either
  % the (num@rows)'th page number after #1 that contains the
  % appropriate kind of points or to a value greater than \tbl@lastp.
  % We use pq@index@bpts as a scratch counter.
  \setcounter{pq@index@bpts}{0}%
  \dofind@nextcolumnpage@v{#1}%
}% find@nextcolumnpage@v
\def\dofind@nextcolumnpage@v#1{%
  % Called only by \find@nextcolumnpage@v.
  \addtocounter{pq@index@bpts}{1}%
  \find@nextpagewithpoints{#1}%
  \ifnum \value{pq@index@bpts} = \value{num@rows}\relax
    \let\nextdofind@nextcolumnpage@v=\relax
  \else
    % The following test shouldn't be needed, in theory, because the
    % computation of num@cols should prevent trouble, but we're being
    % paranoid.
    \ifnum \value{#1} > \tbl@lastp\relax
      \let\nextdofind@nextcolumnpage@v=\relax
    \else
      % Note: this is a \def, and not a \let, because we need to put
      % in the argument #1:
      \def\nextdofind@nextcolumnpage@v{\dofind@nextcolumnpage@v{#1}}%
    \fi
  \fi
  \nextdofind@nextcolumnpage@v
}% dofind@nextcolumnpage@v

%--------------------------------------------------------------------
% \pointsinrange and \bonuspointsinrange, and then
% \firstqinrange, \lastqinrange, and \numqinrange.


% We say either \@bonusfalse or \@bonustrue, and then we check it only
% in \do@countloop:
\def\pointsinrange#1{%
  \@bonusfalse
  \def\tbl@range{#1}%
  \@ifundefined{exam@numpoints}%
    {\mbox{\normalfont\bfseries ??}}%
    {\read@range}%
}% pointsinrange

\def\bonuspointsinrange#1{%
  \@bonustrue
  \def\tbl@range{#1}%
  \@ifundefined{exam@numpoints}%
    {\mbox{\normalfont\bfseries ??}}%
    {\read@range}%
}% bonuspointsinrange

\def\bad@range{%
  % Called by \read@range, \firstqinrange, \lastqinrange, and
  % \numqinrange.
  {\mbox{\normalfont\bfseries ??}}%
  \ClassWarning{exam}{%
    Grading range `\tbl@range' not defined.\MessageBreak
    \space\space Run LaTeX again.\MessageBreak
  }%
}% bad@range

\def\read@range{%
  % Called by \pointsinrange and \bonuspointsinrange.
  \@ifundefined{range@\tbl@range @firstq}%
  {%
    \bad@range
  }%
  {%
    \@ifundefined{range@\tbl@range @lastq}%
    {%
      \bad@range
    }%
    {%
      \edef\tbl@firstq{\csname range@\tbl@range @firstq\endcsname}%
      \edef\tbl@lastq{\csname range@\tbl@range @lastq\endcsname}%
      % Check that firstq precedes or equals lastq:
      \ifnum \tbl@firstq > \tbl@lastq\relax
        \fbox{\textbf{Error:} Grading Range `\tbl@range ':
          Last question precedes first question.}%
        \ClassError{exam}{%
          In grading range `\tbl@range ',
          the last question\MessageBreak
          \space\space comes before the first question.\MessageBreak
        }{%
          \string\begingradingrange \space must precede
          \string\endgradingrange \space by at
          least one question.\MessageBreak
        }%
      \else
        \count@pointsinrange
      \fi
    }%
  }%
}% read@range

\def\count@pointsinrange{%
  % Used for both \pointsinrange and \bonuspointsinrange:
  \set@hlfcntr{tbl@points}{0}%
  \setcounter{@iterator}{\tbl@firstq}%
  \addtocounter{@iterator}{-1}\do@countloop
  \prt@hlfcntr{tbl@points}%
}% count@pointsinrange
\def\do@countloop{%
  % We check \if@bonus here when needed:
  \addtocounter{@iterator}{1}%
  \if@bonus
    \@ifundefined{bonuspointsofq@\romannumeral \c@@iterator}%
      {}%
      {\addto@hlfcntr{tbl@points}
         {\csname bonuspointsofq@\romannumeral \c@@iterator\endcsname}}%
  \else
    \@ifundefined{pointsofq@\romannumeral \c@@iterator}%
      {}%
      {\addto@hlfcntr{tbl@points}
         {\csname pointsofq@\romannumeral \c@@iterator\endcsname}}%
  \fi
  \ifnum \value{@iterator} < \tbl@lastq\relax
    \let\next@countloop=\do@countloop
  \else
    \let\next@countloop=\relax
  \fi
  \next@countloop
}% do@countloop

%--------------------------------------------------------------------
% \firstqinrange, \lastqinrange, and \numqinrange.

\newcommand{\firstqinrange}[1]{%
  \def\tbl@range{#1}%
  \@ifundefined{range@\tbl@range @firstq}%
  {\bad@range}%
  {\csname range@#1@firstq\endcsname}%
}% firstqinrange

\newcommand{\lastqinrange}[1]{%
  \def\tbl@range{#1}%
  \@ifundefined{range@\tbl@range @lastq}%
  {\bad@range}%
  {\csname range@#1@lastq\endcsname}%
}% lastqinrange

\newcommand{\numqinrange}[1]{%
  \def\tbl@range{#1}%
  \@ifundefined{range@#1@firstq}%
  {%
    \bad@range
  }%
  {%
    \@ifundefined{range@#1@lastq}%
    {%
      \bad@range
    }%
    {%
      \setcounter{@iterator}{\csname range@#1@lastq\endcsname}%
      \addtocounter{@iterator}{-\csname range@#1@firstq\endcsname}%
      \stepcounter{@iterator}%
      \arabic{@iterator}%
    }%
  }%
}% numqinrange


%--------------------------------------------------------------------
%--------------------------------------------------------------------
%
%                     ***************************
%                     ** SOLUTION ENVIRONMENTS **
%                     ***************************



% If the documentclass options include ``answers'', then the command
% \printanswerstrue is given at the beginning of the run.

% If the documentclass options include ``noanswers'', then the command
% \printanswersfalse is given at the beginning of the run.

\def\printanswers{\printanswerstrue}
\def\noprintanswers{\printanswersfalse}

% If the documentclass options include ``cancelspace'', then the
% command \cancelspacetrue is given at the beginning of the run.

% If the documentclass options include ``nocancelspace'', then the
% command \cancelspacefalse is given at the beginning of the run.

\def\cancelspace{\cancelspacetrue}
\def\nocancelspace{\cancelspacefalse}

% The command \unstarredvspace alters the solution environment so
% that, when solutions are not being printed, any optional space will
% be inserted with a \vspace{} command, instead of a \vspace*{}
% command.

\newif\if@unstarredvspace
\def\unstarredvspace{\@unstarredvspacetrue}
\def\nounstarredvspace{\@unstarredvspacefalse}
\nounstarredvspace


% \if@insolution will be true while we're inside of any of the
% solution environments.  This is used to supress \PgInfo@write and
% \label commands generated if there's a parts (or subparts, or
% subsubparts) environment inside of a solution.  (It won't suppress
% the labels for the question objects, since a question object is
% never a label that's been used before.)
\newif\if@insolution
\@insolutionfalse

\newcommand\SolutionEmphasis[1]{%
  \def\Solution@Emphasis{#1}%
}
\SolutionEmphasis{}

% If printanswers is true, we print the solution using a TheSolution
% environment.  If printanswers is false and cancelspace is false, we
% insert blank vertical space equal to the optional argument (the
% default value of which is 0pt).
\newenvironment{solution}[1][0pt]%
  {%
    \@insolutiontrue % cancelled by the end of the environment
    \@addpointsfalse % cancelled by the end of the environment
    \ifprintanswers
      \begingroup
      \Solution@Emphasis
      \begin{TheSolution}%
    \else
      \ifcancelspace
        % Do nothing
      \else
        \par
        \penalty 0
        \if@unstarredvspace
          \vspace{#1}%
        \else
          \vspace*{#1}%
        \fi
      \fi
      \setbox\z@\vbox\bgroup
    \fi
  }{%
    \ifprintanswers
      \end{TheSolution}%
      \endgroup
    \else
      \egroup
    \fi
  }%

% If printanswers is true, we print the solution using a TheSolution
% environment.  If printanswers is false and cancelspace is false,
% we insert an empty box of width the current line width and of
% height equal to the optional argument, which can be a length, or
% \fill, or \stretch{number}.  If the optional argument is omitted,
% then the box is entirely omitted when printanswers is false.
\newenvironment{solutionorbox}[1][-1pt]%
  {%
    \@insolutiontrue % cancelled by the end of the environment
    \@addpointsfalse % cancelled by the end of the environment
    \ifprintanswers
      \begingroup
      \Solution@Emphasis
      \begin{TheSolution}%
    \else
      \ifcancelspace
        % Do nothing
      \else
        \par
        % Note: It's important that the following test be
        % ``\ifdim 0pt > #1'' rather than ``\ifdim #1 < 0pt''
        % That's because if the user says
        % ``\begin{solutionorbox}{\stretch{1}}''
        % (or \stretch{anythingelse}), then this will expand to
        % ``\ifdim 0pt > \z@ plus 1fill\relax''.
        % The \ifdim will be ``\ifdim 0pt > \z@'', and we'll have
        % ``plus 1fill\relax'' left over.  This is OK because if the
        % \ifdim is false, that leftover stuff will be ignored,
        % and it will only be true if the user omitted the optional
        % argument, in which case there's no \stretch and thus no
        % left over part.
        % If we said ``\ifdim #1 < 0pt'', then we'd get an error
        % when the user used \stretch, since the leftover stuff
        % would appear when TeX was looking for <, =, or >.
        \ifdim 0pt > #1
          % do nothing
        \else
          \makeemptybox{#1}%
        \fi
      \fi
      \setbox\z@\vbox\bgroup
    \fi
  }{%
    \ifprintanswers
      \end{TheSolution}%
      \endgroup
    \else
      \egroup
    \fi
  }%
  
% If printanswers is true, we print the solution using a TheSolution
% environment.  If printanswers is false and cancelspace is false,
% we insert lined vertical space equal to the optional argument (the
% default value of which is 0pt).
\newenvironment{solutionorlines}[1][0pt]%
  {%
    \@insolutiontrue % cancelled by the end of the environment
    \@addpointsfalse % cancelled by the end of the environment
    \ifprintanswers
      \begingroup
      \Solution@Emphasis
      \begin{TheSolution}%
    \else
      \ifcancelspace
        % Do nothing
      \else
        \par
        \penalty 0
        \fillwithlines{#1}%
      \fi
      \setbox\z@\vbox\bgroup
    \fi
  }{%
    \ifprintanswers
      \end{TheSolution}%
      \endgroup
    \else
      \egroup
    \fi
  }%
  
% If printanswers is true, we print the solution using a TheSolution
% environment.  If printanswers is false and cancelspace is false,
% we insert dotted lined vertical space equal to the optional
% argument (the default value of which is 0pt).
\newenvironment{solutionordottedlines}[1][0pt]%
  {%
    \@insolutiontrue % cancelled by the end of the environment
    \@addpointsfalse % cancelled by the end of the environment
    \ifprintanswers
      \begingroup
      \Solution@Emphasis
      \begin{TheSolution}%
    \else
      \ifcancelspace
        % Do nothing
      \else
        \par
        \penalty 0
        \fillwithdottedlines{#1}%
      \fi
      \setbox\z@\vbox\bgroup
    \fi
  }{%
    \ifprintanswers
      \end{TheSolution}%
      \endgroup
    \else
      \egroup
    \fi
  }%

% If printanswers is true, we print the solution using a TheSolution
% environment.  If printanswers is false and cancelspace is false,
% we insert a grid occupying vertically the optional argument (the
% default value of which is 0pt).
\newenvironment{solutionorgrid}[1][0pt]%
  {%
    \@insolutiontrue % cancelled by the end of the environment
    \@addpointsfalse % cancelled by the end of the environment
    \ifprintanswers
      \begingroup
      \Solution@Emphasis
      \begin{TheSolution}%
    \else
      \ifcancelspace
        % Do nothing
      \else
        \par
        \penalty 0
        \fillwithgrid{#1}%
      \fi
      \setbox\z@\vbox\bgroup
    \fi
  }{%
    \ifprintanswers
      \end{TheSolution}%
      \endgroup
    \else
      \egroup
    \fi
  }%


% The environment TheSolution is called from the solution,
% solutionorbox, solutionorlines, solutionordottedlines, and
% solutionorgrid environments when printanswers is true.  It uses
% Donald Arseneau's framed.sty macros (included at the end of this
% file) to allow the solution to be broken across pages and have each
% piece enclosed in an fbox (or a colorbox, if the user has given the
% command \shadedsolutions), (or no box at all, if the user has given
% the command \unframedsolutions).

% Of course, the user can change TheSolution with a \renewenvironment
% command.
\newcommand{\solutiontitle}{\noindent\textbf{Solution:}\enspace}
\newenvironment{TheSolution}%
  {%
    \vspace{\parskip}%
    % If we don't set \leftskip and \rightskip to 0pt, then if we
    % appear inside of an \uplevel command we'd have indentation
    % inside of the solution box:
    \leftskip=0pt
    \rightskip=0pt
    % If the user said \unframedsolutions, then both
    % \if@framedsolutions and \if@shadedsolutions are false:
    \if@framedsolutions
      % We'll use the default \exam@FrameCommand
    \else
      \if@shadedsolutions
        \def\exam@FrameCommand{\colorbox{SolutionColor}}%
      \else
        % It's \unframedsolutions:
        \def\exam@FrameCommand{}%
      \fi
    \fi
    \exam@MakeFramed{\advance\hsize-\exam@width}%
    \solutiontitle
    \ignorespaces
  }%
  {%
    \unskip
    \endexam@MakeFramed
  }%

\newif\if@framedsolutions
\@framedsolutionstrue
\newif\if@shadedsolutions
\@shadedsolutionsfalse
% If the user said \unframedsolutions, then both
% \if@framedsolutions and \if@shadedsolutions are false.

\def\framedsolutions{\@framedsolutionstrue\@shadedsolutionsfalse}
\def\shadedsolutions{%
  \@ifundefined{definecolor}
  {%
    \ClassError{exam}{%
      You must load the color package with the command\MessageBreak
      \space\space\protect\usepackage{color}\MessageBreak
      in order to use the command \protect\shadedsolutions
      \MessageBreak
      }{%
      This command makes use of the package color.sty,\MessageBreak
      and so you have to load color.sty before your\MessageBreak
      \protect\begin{document} command.\MessageBreak
      }%
  }%
  {%
    \definecolor{SolutionColor}{gray}{0.8}
    \@shadedsolutionstrue
    \@framedsolutionsfalse
  }%
}
\def\unframedsolutions{\@framedsolutionsfalse\@shadedsolutionsfalse}


% The solutionbox environment is different from the other solution
% environments (solution, solutionorbox, solutionorlines,
% solutionordottedlines, and solutionorgrid), in that
%
%   (1) The box is always printed, whether answers are being printed
%   or not.
%
%   (2) The argument giving the size of the box is a required
%   argument, not an optional argument, and so it should be enclosed
%   in braces, not in brackets.  It can be either a length or
%   \stretch{number}.
%
%   (3) We make no use of the TheSolution environment; the solutionbox
%   environment is completely freestanding.
%
% If answers are not being printed then only the box is printed, with
% nothing in it.  If answers are being printed, then the solution is
% printed inside of the box.
%
% Note: It's the user's responsibility to be sure that the box is
% large enough to hold the solution!  If the solution takes up too
% much vertical space, then it will spill out of the bottom of the
% box, overwriting whatever follows the box.

% 2016/02/08: The solutionbox frame can now be printed in color, as
% long as you load color.sty in the preamble.
%
%  Usage: Say
%
% \usepackage{color}
%
% in the preamble, and then give the command
%
%   \colorsolutionboxes
%
% to have the frame around a solutionbox in color.  The default color
% was created by the command
%
%     \definecolor{SolutionBoxColor}{gray}{0.8}
%
% and you can change the color by giving a new \definecolor command
% (which must be done *after* the \colorsolutionboxes command).
%
% To cancel color solutionbox frames and return to black, give the
% command
%
%   \nocolorsolutionboxes

\newif\if@colorsolutionboxes
\@colorsolutionboxesfalse
\def\colorsolutionboxes{%
  \@ifundefined{definecolor}
  {%
    \ClassError{exam}{%
      You must load the color package with the command\MessageBreak
      \space\space\protect\usepackage{color}\MessageBreak
      in order to use the command \protect\colorsolutionboxes
      \MessageBreak
      }{%
      This command makes use of the package color.sty,\MessageBreak
      and so you have to load color.sty before your\MessageBreak
      \protect\begin{document} command.\MessageBreak
      }%
  }%
  {%
    \definecolor{SolutionBoxColor}{gray}{0.8}
    \@colorsolutionboxestrue
  }%
}
\def\nocolorsolutionboxes{\@colorsolutionboxesfalse}

\newbox\exam@box
\newenvironment{solutionbox}[1]{%
  \@insolutiontrue % cancelled by the end of the environment
  \@addpointsfalse % cancelled by the end of the environment
  \def\solutionbox@size{#1}% saved for end of environment
% Change, 2016/02/08: So that the solutionbox environment will work
% correctly inside of a tabular environment, we use \hsize instead of
% \textwidth:
%  \@tempdima=\textwidth
  \@tempdima=\hsize
  \advance\@tempdima -\@totalleftmargin
  \advance\@tempdima -6\fboxsep
  \advance\@tempdima -2\fboxrule
  % Confine the \Solution@Emphasis, as well as anything the user puts
  % into the solution (e.g., \color{red}, or whatever); don't say
  % \endgroup until after using \box\exam@box:
  \begingroup 
    \Solution@Emphasis
    % We save the solution in a box of the proper width.  We'll either
    % print it (if we're printing solutions) or throw it away by just
    % not using it before the environment ends:
    \setbox\exam@box=\vtop\bgroup
      \hsize=\@tempdima
      \leftskip=0pt
      \rightskip=0pt
      \vskip 2\fboxsep
% Change, 2016/05/09: We change \@totalleftmargin and \linewidth in
% case there are enumerate, itemize, or description environments
% inside the solution:
      \@totalleftmargin=0pt
      \linewidth=\hsize
      \solutiontitle
      \ignorespaces
  }%
  {%
    \unskip
    \egroup
    % OK, the solution is now inside \box\exam@box.
    % Set the height and depth to 0pt, so that if we use it we won't
    % be advancing our position on the page:
    \ht\exam@box=0pt
    \dp\exam@box=0pt
    \par
    \vspace{\parskip}
    \ifprintanswers
      % We enclose the \vtop in an \hbox to avoid having the
      % indentation of the enclosing list environment (implemented via
      % \parshape) shift us to the right when we enter horizontal
      % mode.  If we don't use this \hbox, then we'd have to comment
      % out the \hskip \@totalleftmargin:
      % 2016/02/08: Changed \textwidth to \hsize:
      \hbox to \hsize{%
        \noindent
        \hskip\@totalleftmargin
        \hskip3\fboxsep\hskip\fboxrule
        \box\exam@box\hfill
      }%
      \par\nointerlineskip
    \fi
  \endgroup % Finish confining the \Solution@Emphasis
% Starting in version 2.502, 2016/03/23,the decision of whether to
% color the box is made in the \makeemptybox command:
  \makeemptybox{\solutionbox@size}
  }% End of the second argument of \newenvironment{solutionbox}


%--------------------------------------------------------------------
%--------------------------------------------------------------------
% Added in version 2.502: 2016/03/23, \colorfbox

% The \colorfbox command is used in our modification of framed.sty
% that allows us to print the frame around the solution in color when
% the user has given the command \colorsolutionboxes.  It takes two
% arguments, the first being the color for the frame, and the second
% being the stuff to be framed.

% If we had assumed that xcolor.sty was used (instead of just
% color.sty), then the line that saves the current color in
% saved@color could have been just

%   \colorlet{saved@color}{.}

% but we wanted to make this work even if color.sty is being used.

% When you define a color mycolor using either color.sty or
% xcolor.sty, a macro \csname\string\color@ mycolor\endcsname is
% defined (i.e., the macro name is \\color@mycolor).
\newcommand{\colorfbox}[2]{%
  % Save the current color in saved@color:
  \expandafter\let\csname\string\color@saved@color\endcsname\current@color
  % Create the box in color #1, with the text in saved@color
  % (the braces are to confine the color change commands):
  {\color{#1}\fbox{\color{saved@color}#2}}%
}% colorfbox

%--------------------------------------------------------------------
%--------------------------------------------------------------------

% The following stuff is lifted from:
%
% framed.sty   v 0.8a   21-Jul-2003
% Copyright (C) 1992-2003 by Donald Arseneau
% These macros may be freely transmitted, reproduced, or modified
% provided that this notice is left intact.
%
% The modifications I made are marked with ``psh'' in a comment:
%
% Further modifications, 2017-09-21
% I changed the names of many commands by prepending ``exam@'', so
% that the user can use the framed.sty package with exam.cls and not
% have conflicts.  (I also renamed the framed, shaded, and leftbar
% environments to examframed, examshaded, and examleftbar.)  I didn't
% mark these name changes.
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create framed or shaded regions that can break across pages using 
% \begin{examframed} ... \end{examframed}    -- ordinary frame box
% (box at margin)
% \begin{examshaded} ... \end{examshaded}    -- shaded background
% (into margin)
%    ... examleftbar ...                 -- line on left side
% \begin{MakeFramed}{settings} ... \end{MakeFramed}
%                        -- generic frame (for new environments)
%
% The "examframed" environment puts the text into "\fbox" with the
% settings "\fboxrule=\exam@FrameRule" and "\fboxsep=\exam@FrameSep".
% You can change these lengths (using "\setlength") and you
% can even change the definition of "\exam@FrameCommand" to use
% much fancier boxes.
%
% In fact, the "shaded" environment just redefines "\exam@FrameCommand"
% to use "\colorbox{shadecolor}" (and you have to define the
% color "shadecolor": \newcolor{shadecolor}...).
%
% A page break is allowed, and even encouraged, before the framed
% environment.  If you want to attach some text (a box title) to the
% frame, then the text should be inserted by \exam@FrameCommand
%
% The contents of the framed regions are restricted: 
% Floats, footnotes, marginpars and head-line entries will be lost.
% (Some of these may be handled in a later version.)
% This package will not work with the page breaking of multicol.sty,
% or other systems that perform column-balancing.
%
% The MakeFramed environment does the work.  Its "settings" argument
% should contain any adjustments to the text width (applied to \hsize,
% and using the "\exam@width" of the frame itself) as well as a `restore' 
% command -- \@parboxrestore or \exam@FrameRestore or something similar.
% 
% Expert commands:
% \exam@MakeFramed, \endexam@MakeFramed: the "MakeFramed" environment
% \exam@FrameCommand: command to draw the frame around its argument
% \exam@FrameRestore: restore some text settings, but fewer than
% \@parboxrestore 
% \exam@FrameRule: length register; \fboxrule for default "framed".
% \exam@FrameSep: length register; \fboxsep for default "framed".
% \exam@frameHeightAdjust: macro; height of frame above baseline at
% top of page
% 
% This is still a `pre-production' version because I can think of many
% features/improvements that should be made.  Nevertheless, starting 
% with version 0.5 it should be bug-free.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%psh: Commented out \ProvidesPackage:
%\ProvidesPackage{framed}[2003/07/21 v 0.8a: 
%   framed or shaded text with page breaks]

%psh: Created \saved@totalleftmargin and \@sollistdepth:
\newdimen\saved@totalleftmargin
\newcount\@sollistdepth

\newenvironment{examframed}% using default \exam@FrameCommand
  {\exam@MakeFramed {\advance\hsize-\exam@width \exam@FrameRestore}}%
  {\endexam@MakeFramed}

\newenvironment{examshaded}{%
  \def\exam@FrameCommand{\colorbox{shadecolor}}%
  \exam@MakeFramed {\exam@FrameRestore}}%
 {\endexam@MakeFramed}

\newenvironment{examleftbar}{%
  \def\exam@FrameCommand{\vrule width 3pt \hspace{10pt}}%
  \exam@MakeFramed {\advance\hsize-\exam@width \exam@FrameRestore}}%
 {\endexam@MakeFramed}

\chardef\exam@FrameRestore=\catcode`\| % for debug
\catcode`\|=\catcode`\% % (debug: insert space after backslash)

\def\exam@MakeFramed#1{\par
 % measure added width and height; call result \exam@width and \exam@height
 \setbox\z@\vbox{\vskip-1in \hbox{\hskip-1in 
   \exam@FrameCommand{\hbox{\vrule \@height .7in \@depth.3in \@width 1in}}}%
   \vskip\z@skip}%
 \def\exam@width{\wd\z@}\def\exam@height{\ht\z@}%
 \edef\exam@fb@frw{\the\exam@width}\edef\exam@fb@frh{\the\exam@height}%
 % insert pre-penalties and skips
 \begingroup
 \skip@\lastskip
 \if@nobreak\else 
    \penalty9999 % updates \page parameters
    \ifdim\pagefilstretch=\z@ \ifdim\pagefillstretch=\z@
       \edef\@tempa{\the\skip@}%
       \ifx\@tempa\exam@zero@glue \penalty-30
       \else \vskip-\skip@ \penalty-30 \vskip\skip@
    \fi\fi\fi
    \penalty\z@
    % Give a stretchy breakpoint that will always be taken in preference
    % to the \penalty 9999 used to update page parameters.  The cube root
    % of 10000/100 indicates a multiplier of 0.21545, but the maximum 
    % calculated badness is really 8192, not 10000, so the multiplier
    % is 0.2301. 
    \advance\skip@ \z@ plus-.5\baselineskip
    \advance\skip@ \z@ plus-.231\exam@height
    \advance\skip@ \z@ plus-.231\skip@
    \advance\skip@ \z@ plus-.231\topsep
    \vskip-\skip@ \penalty 1800 \vskip\skip@
 \fi
 \addvspace{\topsep}%
 \endgroup
 % clear out pending page break
 \penalty\@M \vskip 2\baselineskip \vskip\exam@height
 \penalty9999 \vskip -2\baselineskip \vskip-\exam@height
 \penalty9999 % updates \pagetotal
|\message{After clearout, \pagetotal=\the\pagetotal, \pagegoal=\the\pagegoal. }%
 \exam@fb@adjheight 
%psh: Added commands:
  \advance\hsize-\@totalleftmargin
  \saved@totalleftmargin=\@totalleftmargin
  \@totalleftmargin=0pt
  \parshape 0
  \let\@listdepth=\@sollistdepth
  \@sollistdepth=0
  \leftmargin=0pt
%psh: end of added commands
 \setbox\@tempboxa\vbox\bgroup
   #1% Modifications to \hsize (can use \exam@width and \exam@height)
   \textwidth\hsize \columnwidth\hsize
%psh: added one line:
   \linewidth=\hsize
}

\def\endexam@MakeFramed{\par
     \kern\z@ \penalty-100 % put depth into height
 \egroup
 \begingroup \exam@put@frame \endgroup
%psh: Added one line:
 \@totalleftmargin=\saved@totalleftmargin
}

% \exam@put@frame takes the contents of \@tempboxa and puts all, or a
% piece, of it on the page with a frame (\exam@FrameCommand).  It
% recurses until all of \@tempboxa has been used up. (\@tempboxa must
% have zero depth.)

\def\exam@put@frame{\relax
 \ifdim\pagegoal=\maxdimen \pagegoal\vsize \fi
|   \message{=============== Entering putframe ====================^^J
|     \pagegoal=\the\pagegoal,  \pagetotal=\the\pagetotal. }%
 \ifinner \else
    \dimen@\pagegoal \advance\dimen@-\pagetotal % natural space left on page
  \ifdim\dimen@<2\baselineskip 
|   \message{Page has only \the\dimen@\space room left; eject. }%
    \eject \exam@fb@adjheight \exam@put@frame
  \else % there's appreciable room left on the page
|    \message{\string\pagetotal=\the\pagetotal,
|        \string\pagegoal=\the\pagegoal, 
|        \string\pagestretch=\the\pagestretch,
|        \string\pageshrink=\the\pageshrink,
|        \string\exam@fb@frh=\exam@fb@frh. \space}
|    \message{Box of size \the\ht\@tempboxa\space + \exam@fb@frh}%
     \begingroup % temporarily set \dimen@ to be...
     \advance\dimen@.8\pageshrink  % maximum space available on page
     \advance\dimen@-\exam@fb@frh\relax % space available for frame's contents
     \expandafter\endgroup
     % restore \dimen@ to real room left on page
     \ifdim\dimen@>\ht\@tempboxa % whole box does fit
|       \message{fits in \the\dimen@. }%
     \else % box must be split
|       \message{must be split to fit in \the\dimen@. }%
        \setbox\@tempboxa\vbox{% simulate frame and flexiblity of the page:
           \vskip \exam@fb@frh \@plus\pagestretch \@minus.8\pageshrink
           \kern137sp\kern-137sp\penalty-30
           \unvbox\@tempboxa}%
        \edef\exam@fb@resto@set{\boxmaxdepth\the\boxmaxdepth
          \splittopskip\the\splittopskip}%
        \boxmaxdepth\z@ \splittopskip\z@
        \setbox\tw@\vsplit\@tempboxa to\dimen@
        \setbox\tw@\vbox{\unvbox\tw@}% natural-sized
|       \message{Box of size \the\ht\@tempboxa\space split to \the\dimen@. 
|          Natural height of split box is \the\ht\tw@. }%
        % If the split-to size > (\vsize-\topskip), then set box to full size
        \begingroup
          \advance\dimen@\topskip
          \expandafter\endgroup
        \ifdim\dimen@>\pagegoal
|         \message{Frame is big -- Use up the full column. }%
          \dimen@ii\pagegoal
          \advance\dimen@ii -\topskip
          \advance\dimen@ii \exam@frameHeightAdjust\relax
        \else  % suspect this is wrong:
          % If the split-to size > feasible room_on_page, rebox it smaller.
          \advance\dimen@.8\pageshrink
          \ifdim\ht\tw@>\dimen@
|           \message{Box too tall; rebox it to \the\dimen@. }%
            \dimen@ii\dimen@
          \else % use natural size
            \dimen@ii\ht\tw@
          \fi
        \fi
        % Re-box contents to desired size \dimen@ii
        \advance\dimen@ii -\exam@fb@frh
        \setbox\tw@\vbox to\dimen@ii \bgroup
        % remove simulated frame and page flexibility:
        \vskip -\exam@fb@frh \@plus-\pagestretch \@minus-.8\pageshrink
        \unvbox\tw@ \unpenalty\unpenalty
        \ifdim\lastkern=-137sp % whole box went to next page
|          \message{box split at beginning! }%
           \egroup \exam@fb@resto@set \eject % (\vskip for frame size
                                             % was discarded)  
           \exam@fb@adjheight
        \else %
           \egroup \exam@fb@resto@set
           \ifvoid\@tempboxa % it all fit after all
|             \message{box split at end! }%
              \setbox\@tempboxa\box\tw@
           \else % it really did split
|             \message{box split as expected. Its reboxed height is \the\ht\tw@. }%
              \ifdim\wd\tw@>\z@
%psh: Changed the command that inserts the box:
%     Instead of \centerline, we shift right by \saved@totalleftmargin:
%              \centerline{\exam@FrameCommand{\box\tw@}}%  ??? \centerline bad idea
       \hbox{\hskip \saved@totalleftmargin\exam@FrameCommand{\box\tw@}}%
              \else
|               \message{Zero width means likely blank. Don't frame it (guess)}%
                \box\tw@
              \fi
              \hrule \@height\z@
              \eject
              \exam@fb@adjheight
              \exam@put@frame
  \fi\fi\fi\fi\fi
  \ifvoid\@tempboxa\else
%psh: Changed the command that inserts the box:
%     Instead of \centerline, we shift right by \saved@totalleftmargin:
%    \centerline{\exam@FrameCommand{\box\@tempboxa}}%
    \hbox{\hskip\saved@totalleftmargin\exam@FrameCommand{\box\@tempboxa}}%
    \nointerlineskip \null %{\showoutput \showlists}
    \penalty-30 \vskip\topsep
  \fi}

\def\exam@fb@adjheight{%
  \vbox to\exam@frameHeightAdjust{}% get proper baseline skip from above.
  \penalty\@M \nointerlineskip
  \vskip-\exam@frameHeightAdjust
  \penalty\@M} % useful for tops of pages

\edef\exam@zero@glue{\the\z@skip}

\catcode`\|=\exam@FrameRestore

% Provide configuration commands:
%psh: Version 2.502, 2016/03/23, changed \exam@FrameCommand so that the
%     frame is printed in color if the user has said
%     \colorsolutionboxes:
%\providecommand\exam@FrameCommand{\fboxrule=\exam@FrameRule
%\fboxsep=\exam@FrameSep \fbox}
\def\exam@FrameCommand{\fboxrule=\exam@FrameRule \fboxsep=\exam@FrameSep
  \if@colorsolutionboxes
    \def\box@it{\colorfbox{SolutionBoxColor}}%
  \else
    \def\box@it{\fbox}%
  \fi
  \box@it
}% \exam@FrameCommand

\@ifundefined{FrameRule}{\newdimen\exam@FrameRule \exam@FrameRule=\fboxrule}{}
\@ifundefined{FrameSep} {\newdimen\exam@FrameSep  \exam@FrameSep =3\fboxsep}{}

% Height of frame above first baseline when frame starts a page:
\providecommand\exam@frameHeightAdjust{6pt}

% \exam@FrameRestore has parts of \@parboxrestore.  See how it is used in the 
% "settings" argument of \MakeFrame.  Previous behavior can be restored by 
% using \@parboxrestore there, or redefining:
% \makeatletter \renewcommand\exam@FrameRestore{\@parboxrestore} \makeatother
\def\exam@FrameRestore{%
  \let\if@nobreak\iffalse
  \let\if@noskipsec\iffalse
%  \let\par\@@par  ??
  \let\-\@dischyph
  \let\'\@acci\let\`\@accii\let\=\@acciii
%  \parindent\z@ \parskip\z@skip    Definitely omit!
%  \everypar{}%  ??
  \linewidth\hsize
%  \@totalleftmargin\z@
%  \leftskip\z@skip \rightskip\z@skip \@rightskip\z@skip
%  \parfillskip\@flushglue \lineskip\normallineskip
%  \baselineskip\normalbaselineskip
  \sloppy
%  \let\\\@normalcr
}

%  Compatibility with previous versions (temporary!):
% psh: we'll remove this 2017-09-21
%\let\fram@d=\MakeFramed  \let\endfram@d=\endMakeFramed

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This ends the stuff that's lifted from:
% % framed.sty   v 0.8a   21-Jul-2003
% % Copyright (C) 1992-2003 by Donald Arseneau


%--------------------------------------------------------------------
%--------------------------------------------------------------------

\endinput
%---------------------------------------------------------------------
%---------------------------------------------------------------------
%---------------------------------------------------------------------
%---------------------------------------------------------------------
%---------------------------------------------------------------------
