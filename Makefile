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
.SUFFIXES: .tex .dvi .eps .ps .pdf .jpg .gif

#
# Basic variables
SHELL    = /bin/sh
CP       = cp
RM       = rm
MV       = mv
AWK      = awk
SED      = sed
ZIP      = zip
MKDIR    = mkdir
SLEEP    = sleep
LATEX    = latex
BIBTEX   = bibtex
DVIPS    = dvips
DVIPDF   = dvipdf
PS2PDF   = ps2pdf
MAINFILE = $(shell ls *_*.tex | awk -F '.' '{ print $$1}')
DATETIME = $(shell date +"%Y%m%d_%H%M%S")

#
# List of class and style files
CLASSFILE  = MichiganTech.cls
STYLEFILES = Packages/MS.sty  \
             Packages/PhD.sty

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
all:
	make clean
	make dvi
	make ps
	make pdf
	make clean

dvi: $(MAINFILE).tex $(TEXFILES) $(CLASSFILE) $(STYLEFILES)
	@echo
	@echo "  LaTeX --> DVI"
	$(LATEX)  $(MAINFILE)
	$(LATEX)  $(MAINFILE)
	$(BIBTEX) $(MAINFILE)
	$(BIBTEX) $(MAINFILE)
	$(LATEX)  $(MAINFILE)
	$(LATEX)  $(MAINFILE)

ps: $(MAINFILE).dvi
	@echo
	@echo "  DVI --> PS"
	@echo
	$(DVIPS) -R0 -Ppdf -t letter -o $(MAINFILE).ps $<
	@echo
	@echo "  Fixing any Gnuplot mess"
	@echo
	$(SED) -i '/^SDict begin \[$$/,/^end$$/d' $(MAINFILE).ps

pdf: $(MAINFILE).ps
	@echo
	@echo "  PS --> PDF (embedded fonts)"
	@echo
	$(PS2PDF) -dPDFSETTINGS=/prepress -dSubsetFonts=true -dEmbedAllFonts=true -dMaxSubsetPct=100 $< $(MAINFILE).pdf
	@echo
	@echo

snapshot:
	@echo
	@echo "  Making a snapshot of all files and folders"
	$(MKDIR) -p Snapshots/$(DATETIME)
	rsync -a --exclude '*.swp' --exclude '.git' --exclude 'Snapshots' ./ Snapshots/$(DATETIME)/
	cd Snapshots/ ; $(ZIP) -qr $(DATETIME).zip $(DATETIME)
	cd Snapshots/ ; $(RM) -rf $(DATETIME)
	@echo

clean:
	@echo
	@echo "  Removing temporary files"
	@echo
	for tmpfile in $(TMPFILES); do ( $(RM) -f $(MAINFILE).$$tmpfile* ); done
	@echo
	for folder in $(FOLDERS); do ( cd $$folder; for tmpfile in $(TMPFILES); do ( $(RM) -f *.$$tmpfile* ); done ); done
	@echo
