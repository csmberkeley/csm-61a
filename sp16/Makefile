# tutorussions. You should only have to modify RELEASED and SOLUTIONS.
RELEASED_TUTOR =
RELEASED_TUTOR_SOL =

TUTOR_SRC = tutor/src
TUTOR_DST = $(DST)/tutor

TUTOR_DEPEND = python tutor/make_dependency.py
TEX = pdflatex
ifeq ($(GIT_BRANCH), master)
	# Hide (most) compiler output
	TUTOR_TEX_FLAGS = -interaction=batchmode -output-directory ../../$(TUTOR_DST)
else
	TUTOR_TEX_FLAGS = -output-directory ../../$(TUTOR_DST)
endif

TUTOR_SOURCES = $(wildcard $(TUTOR_SRC)/*.tex)
TUTOR = $(TUTOR_SOURCES:$(TUTOR_SRC)/%.tex=%)
TUTOR_SOL = $(addsuffix _sol, $(TUTOR))

#################################################################
# User-friendly targets: use the following to publish material. #
#################################################################

all: $(RELEASED_TUTOR) $(addsuffix _sol, $(RELEASED_TUTOR_SOL))

tutor: $(RELEASED_TUTOR) $(addsuffix _sol, $(RELEASED_TUTOR_SOL))

.SECONDEXPANSION:
$(TUTOR) $(TUTOR_SOL): $(TUTOR_DST) $(TUTOR_DST)/$$@.pdf

$(TUTOR_DST)/%.pdf: $(TUTOR_SRC)/%.tex tutor/commonheader.sty
	$(TUTOR_DEPEND) $* $< tutor/deps
	cd $(TUTOR_SRC); $(TEX) $(TUTOR_TEX_FLAGS) $*.tex;
	@-rm $(TUTOR_DST)/*.aux $(TUTOR_DST)/*.log $(TUTOR_DST)/*.out

$(TUTOR_DST)/%_sol.pdf: $(TUTOR_SRC)/%.tex tutor/commonheader.sty
	$(TUTOR_DEPEND) $* $< tutor/deps
	cd $(TUTOR_SRC); $(TEX) $(TUTOR_TEX_FLAGS) -jobname="$*_sol" "\def\discussionsolutions{}\input{$*}"
	@-rm $(TUTOR_DST)/*.aux $(TUTOR_DST)/*.log $(TUTOR_DST)/*.out

$(TUTOR_DST):
	mkdir -p $@

# Include dependencies that are created by $(TUTOR_DEPEND). These
# dependencies are primarily based on \subimport directives.
-include $(TUTOR_SOURCES:%=tutor/deps/%.d)
