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

Then, run `make all` to build all the worksheets in the `published` directory.

If necessary, clean the local files with `make clean`.
