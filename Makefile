#
# Makefile
# Makefile to systematically compile the john_DEGREE.tex to produce
# john_DEGREE.pdf (and clean up temporary files).
# 
# In order to create the PDF file, just type
#
# make 
#
# This and other associated files are distributed in the hope that it will 
# be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
# DO NOT send your questions, comments and/or concerns about this template to 
# Michigan Tech's Graduate School staff. Instead, please contact
#
# Gowtham
# Director of Research Computing, IT
# Adj. Asst. Professor, Physics/ECE
# Michigan Technological University
# Email: g@mtu.edu

#
# File suffixes
.SUFFIXES: .tex .dvi .eps .ps .pdf .jpg .jpg.bb .gif .gif.bb

#
# Basic variables
SHELL    = /bin/sh
RM       = rm
MV       = mv
AWK      = awk
SED      = sed
LATEX    = latex
BIBTEX   = bibtex
DVIPS    = dvips
DVIPDF   = dvipdf
PS2PDF   = ps2pdf
SLEEP    = sleep
MAINFILE = $(shell ls *_*.tex | awk -F '.' '{ print $$1}')

#
# List of folders
FOLDERS = Appendices Chapters FrontMatter References

#
# List of files
TEXFILES = FrontMatter/Abstract.tex         \
           FrontMatter/Acknowledgments.tex  \
           FrontMatter/Dedication.tex       \
           FrontMatter/Preface.tex          \
     	   Chapters/Chapter1.tex            \
     	   Chapters/Chapter2.tex            \
     	   Chapters/Chapter3.tex            \
           References/References.tex        \
           References/References.bib        \
     	   Appendices/AppendixA.tex         \
     	   Appendices/AppendixB.tex         \
     	   Appendices/AppendixC.tex

#
# List of temporary file types
TMPFILES = acr \
           alg \
           aux \
           bbl \
           bcf \
           blg \
           blx \
           brf \
           dvi \
           fdb_latexmk \
           fls \
           glg \
           glo \
           gls \
           idx \
           ilg \
           ind \
           ist \
           loa \
           lof \
           log \
           lol \
           lot \
           maf \
           mtc \
           mtc0 \
           nav \
           nlo \
           out \
           pdfsync  \
           ps \
           pyg \
           run.xml \
           sagetex.py \
           sagetex.sage \
           sagetex.scmd \
           snm \
           sout \
           sympy \
           synctex.gz \
           tdo \
           thm \
           toc \
           vrb \
           xdy

#
# Default target
all: $(MAINFILE).pdf clean

$(MAINFILE): $(MAINFILE).dvi

$(MAINFILE).aux:
	-if [ ! -f $(MAINFILE).aux ]; then touch $(MAINFILE).aux; fi

$(MAINFILE).dvi: $(MAINFILE).tex $(STYFILE) $(TEXFILES)
	@echo
	@echo "  Making DVI document"
	-$(LATEX)  $(MAINFILE)
	-$(LATEX)  $(MAINFILE)
	-$(BIBTEX) $(MAINFILE)
	-$(BIBTEX) $(MAINFILE)
	-$(LATEX)  $(MAINFILE)
	-$(LATEX)  $(MAINFILE)

$(MAINFILE).bbl: $(MAINFILE).bib
	-if [ ! -f $(MAINFILE).aux ]; then touch $(MAINFILE).aux; fi
	-$(BIBTEX) $(MAINFILE)

$(MAINFILE).pdf: $(MAINFILE).ps
	@echo
	@echo "  Making PDF document (embedded fonts)"
	@echo
	$(PS2PDF) -dPDFSETTINGS=/prepress -dSubsetFonts=true -dEmbedAllFonts=true -dMaxSubsetPct=100 $< $@
	@echo
	@echo

$(MAINFILE).ps: $(MAINFILE).dvi
	@echo
	@echo "  Making PostScript document"
	@echo
	$(DVIPS) -R0 -Ppdf -G0 -t letter -o $@ $<
	@echo
	@echo

clean:
	@echo
	@echo "  Removing temporary files"
	@echo
	for tmpfile in $(TMPFILES); do ( $(RM) -f $(MAINFILE).$$tmpfile* ); done
	@echo
	for folder in $(FOLDERS); do ( cd $$folder; for tmpfile in $(TMPFILES); do ( $(RM) -f *.$$tmpfile* ); done ); done
	@echo
