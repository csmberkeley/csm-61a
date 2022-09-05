# csm-61a

The central repository for CSM 61A worksheets.

The repository is split up into two subsections. `src` denotes the current set
of worksheet templates which draw their questions from the pool of `topics`.

The style is provided by `commonheader.sty`.

## Making Handouts

To make an individual worksheet, run the following command in the repository's
root directory.

    make mentor00

To make multiple worksheets at once, modify the `Makefile` by adding the names
of the worksheets you'd like to make, and the solutions as necessary.

    RELEASED = mentor00 mentor01 mentor02
    SOLUTIONS = mentor00 mentor01

Then, run `make all` to build all the worksheets in the `made` directory.

If necessary, clean the local files with `make clean`.

## Generating Python Skeletons

To convert a worksheet into a `.py` file containing skeleton code for students to fill out:
1. In `scripts/latex_to_py.py`, ensure that `worksheet_source` is set to the folder containing the current semester's source files (for example, `src/su21`).
2. In the base repo directory, run `python3 scripts/latex_to_py.py -f <filename>`, where `<filename>` looks something like `mentor01.tex`. To generate a solutions file as well, pass in the `-s` flag.
3. The output file can be found in `src/<current-semester>/mentor<##>.py`. There may be some small formatting issues or missing docstrings, so make sure to review the file before release.
