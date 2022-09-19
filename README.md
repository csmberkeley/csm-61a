# csm-61a

The central repository for CSM 61A worksheets. 

There are three kinds of documents produced by this repository
- Worksheets, which contain questions.
- Solutions, which contain questions and answers.
- Metas (formerly known as guides), which contains questions, answers, and information to help mentors teach the worksheet. 

Documentation for this repository is provided in the [Wiki](https://github.com/csmberkeley/csm-61a/wiki).

## Repository organization 
The repository is split up into two sections. `src` contains each semester's set
of worksheet templates, which draw their questions from the pool of `topics`. `topics` is divided into topical subdirectories, each of which is further divided into subfolders based on difficulty. 

Worksheet styling is provided by `commonheader.sty`. 

## Getting Started
Clone this repository to your local machine. You will need to have LaTeX installed; some popular distributions include [TeXworks](https://tug.org/texworks/#Getting_TeXworks) and [MiKTeX](https://miktex.org/). For our workflow to function properly, `latex2pdf.exe` must be in your machine's `PATH` variable, which should hopefully be handled automatically on installation.

Windows users will need to be able to use `make`. We recommend [installing Git Bash](https://inst.eecs.berkeley.edu/~cs61b/fa16/docs/setting-up-git.html) and then [installing `make`](https://inst.eecs.berkeley.edu/~cs61b/sp20/docs/make-install.html).

You can verify that you have correctly set up the repository by attempting to make a worksheet, as described in the next section.

## Making Handouts

To make an individual worksheet, run the following command in the repository's
root directory.

    make mentor00
    
You will find the made file in the `made` directory. 

Suffixes allow you to make different types of content: 

    make mentor00-meta # Makes the meta
    make mentor00-sol # Makes the solutions
    make mentor00-py # Makes both the Python file and the Python solutions file
    make mentor00-py-sol # Makes the Python solutions file
    make mentor00-py-no-sol # Makes the Python file (without solutions) only
    
    make mentor00-pdfs # Makes all PDFs
    make mentor00-all # Makes all content for the week

Multiple `make` targets can also be combined into a single command: 

    make mentor00-all mentor01-all mentor02-py

If necessary, clean (delete) the local files with `make clean`.
