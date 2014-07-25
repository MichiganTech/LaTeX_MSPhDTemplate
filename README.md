Michigan Tech MS/PhD LaTeX Template
================

What is this?
-------------------

A LaTeX template for writing MS thesis/PhD dissertation (for double-sided 
printing) in compliance with the guidelines from the Graduate School in 
Michigan Technological University.

First started in March 2007 when the author was working on PhD dissertation,
this template has undergone many many revisions over the last several years.
Attempts will be made to keep it updated as and when the time and resources
permit.


Disclaimer
-------------------

This and other associated files are distributed in the hope that they will 
be useful, but without any warranty; without even the implied warranty of 
merchantability or fitness for a particular purpose.

Using this template is not a substitute for learning LaTeX and/or 
understanding its how it works. Also, using this template does not 
necessarily guarantee that the Graduate School will approve the 
thesis/dissertation. The Graduate School reserves every right to request 
changes in the future that are not covered by this template yet. 


Features
-------------------

Apart from modularizing the document preparation process, and producing title 
and signature pages, etc. in compliance with the Graduate School requirements, 
the template provides the following:

  1. Ability to accommodate up to two advisors.

  2. Ability to accommodate up to four advisory committee members.

  3. Embdedded fonts -- the PDF looks the same when printed as it looks 
     when it’s viewed on computer.

  4. If using Linux/UNIX or Mac, the process of generating the PDF could 
     be as simple as typing ```make```.

  5. Ability to make a timestamp-based snapshot of the entire folder via
     the command ```make snapshot```.


What all does one need to get started?
-------------------

  1. As complete an installation of LaTeX as possible.

     1. [TeXLive](http://www.tug.org/texlive/) for Linux and Mac, and
        [MiKTeX](http://miktex.org/) for Windows. 

     2. [TeXMaker](http://www.xm1math.net/texmaker/) -- a LaTeX-aware text 
        editor -- for Linux, Mac and Windows.

  2. This template in its entirety.

  3. Basic understanding of how LaTeX works.


Which files should one edit?
-------------------

  1. Rename (not just copy over) ```john_DEGREE.tex``` by substituting ```john``` with your Michigan Tech ISO username, and ```DEGREE``` with either ```MS``` or ```PhD```.

  2. Open the renamed ```john_DEGREE.tex```

     1. Iff writing a MS thesis, then change ```\documentclass[Degree=PhD]{MichiganTech}``` to ```\documentclass[Degree=MS]{MichiganTech}```.

     2. Comment the lines marked ```% Optional``` under ```Front Matter``` section if there is a need.

     3. Remove some or add more chapters under ```Chapters``` section as needed.

     4. Remove some or add more appendices under ```Appendices``` section as needed.

  3. Update ```Personalize/Personalize.tex``` with relevant information.

  4. Update ```FrontMatter/Abstract.tex```, ```FrontMatter/Acknowledgments.tex```, ```FrontMatter/Dedication.tex``` and ```FrontMatter/Preface.tex``` with relevant information.

  5. Update ```Chapters/Chapter?.tex``` with relevant information.

  6. Save all references in ```References/References.bib``` with relevant information. 

  7. Change ```\bibliographystyle{jpc}``` in ```References/References.tex``` to something else to produce the required format for references.

  8. Update ```Appendices/Appendix?.tex``` with relevant information.

  9. Place all figures in ```Figures``` folder.

  10. Update ```MichiganTech.cls``` and/or ```Packages/*.sty``` iff there is a need, and iff there is an understanding of how the LaTeX class/style file works.


How does one compile?
-------------------

**Linux (or Mac) from a terminal using the command line, using ```Makefile```:**

```
cd LaTeX_MSPhDTemplate
make
```

**Linux (or Mac) from a terminal using the command line, without using ```Makefile```:**

```
cd LaTeX_MSPhDTemplate
latex john_DEGREE
latex john_DEGREE
bibtex john_DEGREE
bibtex john_DEGREE
latex john_DEGREE
latex john_DEGREE
dvips -R0 -Ppdf -t letter -o john_DEGREE.ps john_DEGREE.dvi
ps2pdf -dPDFSETTINGS=/prepress -dSubsetFonts=true -dEmbedAllFonts=true -dMaxSubsetPct=100 john_DEGREE.ps john_DEGREE.pdf
```

**Mac using ```TeXMaker`` application:**

Navigate to ```TeXMaker » Preferences » Quick Build » Quick Build Command » User``` and enter the following

```
"/usr/texbin/latex" -interaction=nonstopmode %.tex | 
"/usr/texbin/latex" -interaction=nonstopmode %.tex | 
"/usr/texbin/bibtex" %.aux | 
"/usr/texbin/bibtex" %.aux | 
"/usr/texbin/latex" -interaction=nonstopmode %.tex | 
"/usr/texbin/latex" -interaction=nonstopmode %.tex | 
"/usr/texbin/dvips" -Ppdf -o %.ps %.dvi | 
"/usr/local/bin/ps2pdf" -dPDFSETTINGS=/prepress -dEmbedAllFonts=true -dSubsetFonts=true -dMaxSubsetPct=100 %.ps
```

Got questions? Need help?
-------------------

DO NOT send your questions, comments and/or concerns about this template to 
the Graduate School. Instead, contact the author.


Author
-------------------

Gowtham          
Director of Research Computing, IT             
Adj. Asst. Professor, Physics/ECE               
Michigan Technological University                 
Email: g@mtu.edu             
http://sgowtham.com/
