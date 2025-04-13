# You should only have to modify RELEASED and SOLUTIONS.
# Also change SRC once per semester.

RELEASED = mentor012
SOLUTIONS = mentor012

DST = made
SRC = src/sp25

DEPEND = python3 make_dependency.py
TEX = pdflatex
TEX_FLAGS = -halt-on-error -output-directory ../../$(DST)

SOURCES = $(wildcard $(SRC)/*.tex)
HANDOUT = $(SOURCES:$(SRC)/%.tex=%)
HANDOUT_SOL = $(addsuffix -sol, $(HANDOUT))
HANDOUT_META = $(addsuffix -meta, $(HANDOUT))
HANDOUT_ALL_PDFS = $(addsuffix -pdfs, $(HANDOUT))
HANDOUT_PY = $(addsuffix -py, $(HANDOUT))
HANDOUT_PY_SOL_ONLY = $(addsuffix -py-sol, $(HANDOUT))
HANDOUT_PY_NO_SOL = $(addsuffix -py-no-sol, $(HANDOUT))
HANDOUT_ALL = $(addsuffix -all, $(HANDOUT))
HANDOUT_ALL_TARGETS = $(HANDOUT) $(HANDOUT_SOL) $(HANDOUT_META) $(HANDOUT_ALL_PDFS) $(HANDOUT_PY) $(HANDOUT_PY_SOL_ONLY) $(HANDOUT_PY_NO_SOL) $(HANDOUT_ALL)

#################################################################
# User-friendly targets: use the following to publish material. #
#################################################################

.PHONY: all clean $(HANDOUT_ALL_TARGETS)

all: $(RELEASED) $(addsuffix -all, $(SOLUTIONS));

clean:
	find . -name "deps" -type d -prune -exec rm -rf {} \;
	find . -name "*.pyc" -exec rm -rf {} \;
	rm -rf $(DST)/*

$(HANDOUT_ALL): %-all: %-pdfs %-py;
$(HANDOUT_PY): %-py: %-py-sol %-py-no-sol;
$(HANDOUT_PY_SOL_ONLY): %-py-sol: $(DST) $(DST)/%_sol.py;
$(HANDOUT_PY_NO_SOL): %-py-no-sol: $(DST) $(DST)/%.py;
$(HANDOUT_ALL_PDFS): %-pdfs: % %-sol %-meta;
$(HANDOUT): %: $(DST) $(DST)/%.pdf;
$(HANDOUT_SOL): %-sol: $(DST) $(DST)/%_sol.pdf;
$(HANDOUT_META): %-meta: $(DST) $(DST)/%_meta.pdf;

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

$(DST)/%.py: $(SRC)/%.tex scripts/latex_to_py.py
	python3 scripts/latex_to_py.py -f $<

$(DST)/%_sol.py: $(SRC)/%.tex scripts/latex_to_py.py
	python3 scripts/latex_to_py.py -f $< -s

$(DST):
	mkdir -p $@

# Include dependencies that are created by $(DEPEND). These
# dependencies are primarily based on \subimport directives.
-include $(SOURCES:%=deps/%.d)
