# You should only have to modify RELEASED and SOLUTIONS.
RELEASED =
SOLUTIONS =

DST = published
SRC = src

DEPEND = python make_dependency.py
TEX = pdflatex
TEX_FLAGS = -halt-on-error -output-directory ../$(DST)

SOURCES = $(wildcard $(SRC)/*.tex)
HANDOUT = $(SOURCES:$(SRC)/%.tex=%)
HANDOUT_SOL = $(addsuffix _sol, $(HANDOUT))

#################################################################
# User-friendly targets: use the following to publish material. #
#################################################################

all: $(RELEASED) $(addsuffix _sol, $(SOLUTIONS))

clean:
	find . -name "deps" -type d -prune -exec rm -rf {} \;
	find . -name "*.pyc" -exec rm -rf {} \;
	rm -rf $(DST)/*

.SECONDEXPANSION:
$(HANDOUT) $(HANDOUT_SOL): $(DST) $(DST)/$$@.pdf

$(DST)/%.pdf: $(SRC)/%.tex commonheader.sty
	$(DEPEND) $* $< deps
	cd $(SRC); $(TEX) $(TEX_FLAGS) $*.tex;
	@-rm $(DST)/*.aux $(DST)/*.log $(DST)/*.out

$(DST)/%_sol.pdf: $(SRC)/%.tex commonheader.sty
	$(DEPEND) $* $< deps
	cd $(SRC); $(TEX) $(TEX_FLAGS) -jobname="$*_sol" "\def\discussionsolutions{}\input{$*}"
	@-rm $(DST)/*.aux $(DST)/*.log $(DST)/*.out

$(DST):
	mkdir -p $@

# Include dependencies that are created by $(DEPEND). These
# dependencies are primarily based on \subimport directives.
-include $(SOURCES:%=deps/%.d)
