# You should only have to modify RELEASED and SOLUTIONS.
# Also change SRC once per semester.

RELEASED = mentor12
SOLUTIONS = mentor12

DST = made
SRC = src/fa22

DEPEND = python3 make_dependency.py
TEX = pdflatex
TEX_FLAGS = -halt-on-error -output-directory ../../$(DST)

SOURCES = $(wildcard $(SRC)/*.tex)
HANDOUT = $(SOURCES:$(SRC)/%.tex=%)
HANDOUT_SOL = $(addsuffix _sol, $(HANDOUT))
HANDOUT_META = $(addsuffix _meta, $(HANDOUT))

#################################################################
# User-friendly targets: use the following to publish material. #
#################################################################

all: $(RELEASED) $(addsuffix _sol, $(SOLUTIONS)) $(addsuffix _meta, $(SOLUTIONS))

clean:
	find . -name "deps" -type d -prune -exec rm -rf {} \;
	find . -name "*.pyc" -exec rm -rf {} \;
	rm -rf $(DST)/*

.SECONDEXPANSION:
$(HANDOUT) $(HANDOUT_SOL) $(HANDOUT_META): $(DST) $(DST)/$$@.pdf

$(DST)/%.pdf: $(SRC)/%.tex commonheader.sty
	$(DEPEND) $* $< deps
	cd $(SRC); $(TEX) $(TEX_FLAGS) $*.tex;
	@-rm $(DST)/*.aux $(DST)/*.log $(DST)/*.out
	#open $(DST)/$*.pdf

$(DST)/%_sol.pdf: $(SRC)/%.tex commonheader.sty
	$(DEPEND) $* $< deps
	cd $(SRC); $(TEX) $(TEX_FLAGS) -jobname="$*_sol" "\def\discussionsolutions{}\input{$*}"
	@-rm $(DST)/*.aux $(DST)/*.log $(DST)/*.out
	#open $(DST)/$*_sol.pdf

$(DST)/%_meta.pdf: $(SRC)/%.tex commonheader.sty
	$(DEPEND) $* $< deps
	cd $(SRC); $(TEX) $(TEX_FLAGS) -jobname="$*_meta" "\def\discussionsolutions{}\def\discussionmetas{}\input{$*}"
	@-rm $(DST)/*.aux $(DST)/*.log $(DST)/*.out
	#open $(DST)/$*_meta.pdf

$(DST):
	mkdir -p $@

# Include dependencies that are created by $(DEPEND). These
# dependencies are primarily based on \subimport directives.
-include $(SOURCES:%=deps/%.d)
