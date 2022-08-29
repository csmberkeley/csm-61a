# csm-61a

The central repository for CSM 61A worksheets. 

There are three kinds of documents produced by this repository
- Worksheets, which contain questions.
- Solutions, which contain questions and answers.
- Metas, which contains questions, answers, and information to help mentors teach the worksheet. 

## Repository organization 
The repository is split up into two sections. `src` contains each semester's set
of worksheet templates, which draw their questions from the pool of `topics`. `topics` is divided into topical subdirectories, each of which is further divided into subfolders based on difficulty. 

Worksheet styling is provided by `commonheader.sty`. 

## Getting Started
Clone this repository to your local machine. You will need to have LaTeX installed; some popular distributions include [TeXworks](https://tug.org/texworks/#Getting_TeXworks) and [MiKTeX](https://miktex.org/). For our workflow to function properly, `latex2pdf.exe` must be in your machine's `PATH` variable, which should hopefully be handled automatically on installation.

You can verify that you have correctly set up the repository by attempting to make a worksheet, as described in the next section.

## Making Handouts

To make an individual worksheet, run the following command in the repository's
root directory.

    make mentor00

To make multiple worksheets at once, modify the `Makefile` by adding the names
of the worksheets you'd like to make, and the solutions as necessary.

    RELEASED = mentor00 mentor01 mentor02
    SOLUTIONS = mentor00 mentor01

Then, run `make all` to build all the worksheets in the `published` directory.

If necessary, clean the local files with `make clean`.

## Generating Python Skeletons

To convert a worksheet into a `.py` file containing skeleton code for students to fill out:
1. In `scripts/latex_to_py.py`, ensure that `worksheet_source` is set to the folder containing the current semester's source files (for example, `src/su21`).
2. In the base repo directory, run `python3 scripts/latex_to_py.py -f <filename>`, where `<filename>` looks something like `mentor01.tex`. To generate a solutions file as well, pass in the `-s` flag.
3. The output file can be found in `src/<current-semester>/mentor<##>.py`. There may be some small formatting issues or missing docstrings, so make sure to review the file before release.
