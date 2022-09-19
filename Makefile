# You should only have to modify RELEASED and SOLUTIONS.
# Also change SRC once per semester.

RELEASED = mentor06
SOLUTIONS = mentor06

DST = made
SRC = src/fa22

DEPEND = python3 make_dependency.py
TEX = pdflatex
TEX_FLAGS = -halt-on-error -output-directory ../../$(DST)

SOLUTIONS_SUFFIX = -sol
META_SUFFIX = -meta
PYTHON_SUFFIX = -py
ALL_SUFFIX = -all

SOURCES = $(wildcard $(SRC)/*.tex)
HANDOUT = $(SOURCES:$(SRC)/%.tex=%)
HANDOUT_SOL = $(addsuffix $(SOLUTIONS_SUFFIX), $(HANDOUT))
HANDOUT_META = $(addsuffix $(META_SUFFIX), $(HANDOUT))
HANDOUT_PY = $(addsuffix $(PYTHON_SUFFIX), $(HANDOUT))
HANDOUT_ALL = $(addsuffix $(ALL_SUFFIX), $(HANDOUT))
HANDOUT_ALL_TARGETS = $(HANDOUT) $(HANDOUT_SOL) $(HANDOUT_META) $(HANDOUT_PY) $(HANDOUT_ALL)

#################################################################
# User-friendly targets: use the following to publish material. #
#################################################################

.PHONY: all clean $(HANDOUT_ALL_TARGETS)

all: $(RELEASED) $(addsuffix -all, $(SOLUTIONS));

clean:
	find . -name "deps" -type d -prune -exec rm -rf {} \;
	find . -name "*.pyc" -exec rm -rf {} \;
	rm -rf $(DST)/*

$(HANDOUT_ALL): %$(ALL_SUFFIX): $(DST) % %$(SOLUTIONS_SUFFIX) %$(META_SUFFIX) %$(PYTHON_SUFFIX);
$(HANDOUT_PY): %$(PYTHON_SUFFIX): $(DST) $(DST)/%.py
$(HANDOUT) $(HANDOUT_SOL) $(HANDOUT_META): %: $(DST) $(DST)/%.pdf

$(DST)/%.pdf: $(SRC)/%.tex commonheader.sty
	$(DEPEND) $* $< deps
	cd $(SRC); $(TEX) $(TEX_FLAGS) $*.tex;
	@-rm $(DST)/*.aux $(DST)/*.log $(DST)/*.out
	#open $(DST)/$*.pdf

$(DST)/%$(SOLUTIONS_SUFFIX).pdf: $(SRC)/%.tex commonheader.sty
	$(DEPEND) $* $< deps
	cd $(SRC); $(TEX) $(TEX_FLAGS) -jobname="$*$(SOLUTIONS_SUFFIX)" "\def\discussionsolutions{}\input{$*}"
	@-rm $(DST)/*.aux $(DST)/*.log $(DST)/*.out
	#open $(DST)/$*$(SOLUTIONS_SUFFIX).pdf

$(DST)/%$(META_SUFFIX).pdf: $(SRC)/%.tex commonheader.sty
	$(DEPEND) $* $< deps
	cd $(SRC); $(TEX) $(TEX_FLAGS) -jobname="$*$(META_SUFFIX)" "\def\discussionsolutions{}\def\discussionmetas{}\input{$*}"
	@-rm $(DST)/*.aux $(DST)/*.log $(DST)/*.out
	#open $(DST)/$*$(META_SUFFIX).pdf

$(DST)/%.py: $(SRC)/%.tex scripts/latex_to_py.py
	python3 scripts/latex_to_py.py -f $< -s

$(DST):
	mkdir -p $@

# Include dependencies that are created by $(DEPEND). These
# dependencies are primarily based on \subimport directives.
-include $(SOURCES:%=deps/%.d)