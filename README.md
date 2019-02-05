LaTeX: Michigan Tech MS/PhD Template
================

What is this?
-------------------

A LaTeX template for writing MS thesis/report or PhD dissertation (for 
double-sided printing) in compliance with the [guidelines from the Graduate 
School in Michigan Technological University](http://www.mtu.edu/gradschool/administration/academics/thesis-dissertation/pdfs/guide.pdf).

First started in March 2007 when the author was typsetting PhD dissertation, 
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

  1. Ability to accommodate up to two advisors

  2. Ability to accommodate up to four advisory committee members

  3. Embdedded fonts -- the PDF looks the same when printed as it looks 
     when it’s viewed on computer

  4. If using Linux/UNIX or Mac, the process of generating the PDF could 
     be as simple as typing ```make```

  5. Ability to make a timestamp-based snapshot of the entire folder via
     the command ```make snapshot```

Neither this template nor its author, however, will typeset your report,
thesis or dissertation for you. You are responsible for it.


What all does one need to get started?
-------------------

  1. As complete an installation of LaTeX as possible.

     1. [TeXLive](http://www.tug.org/texlive/) for Linux and Mac, and
        [MiKTeX](http://miktex.org/) for Windows

     2. [TeXMaker](http://www.xm1math.net/texmaker/) -- a LaTeX-aware text 
        editor -- for Linux, Mac and Windows

  2. This template in its entirety

  3. Basic understanding of how LaTeX works


Which files should one edit?
-------------------

  1. Rename (not just copy over) ```john_DEGREE.tex``` by substituting ```john``` with your Michigan Tech ISO username, and ```DEGREE``` with either ```MS``` or ```PhD```

  2. Open the renamed ```john_DEGREE.tex```

     1. Iff writing a MS thesis, then change ```\documentclass[Degree=PhD]{MichiganTech}``` to ```\documentclass[Degree=MS]{MichiganTech}```

     2. Comment the lines marked ```% Optional``` under ```Front Matter``` section if there is a need

     3. Remove some or add more chapters under ```Chapters``` section as needed

     4. Remove some or add more appendices under ```Appendices``` section as needed

  3. Update ```Personalize/Personalize.tex``` with relevant information

     One may use the relevant sample ```Personalize_*.tex``` as a starting point OR refer to the list of [departments](http://www.mtu.edu/departments/) and [programs](http://www.mtu.edu/gradschool/programs/degrees/a-z/)

  4. Update ```FrontMatter/Abbreviations.tex```, ```FrontMatter/Abstract.tex```, ```FrontMatter/Acknowledgments.tex```, ```FrontMatter/Dedication.tex```, ```FrontMatter/Definitions.tex``` and ```FrontMatter/Preface.tex``` with relevant information

  5. Update ```Chapters/Chapter?.tex``` with relevant information

  6. Save all references in ```References/References.bib``` with relevant information

  7. Change ```\bibliographystyle{jpc}``` in ```References/References.tex``` to something else to produce the required format for references

  8. Update ```Appendices/Appendix?.tex``` with relevant information

  9. Place all figures in ```Figures``` folder

  10. Update ```MichiganTech.cls``` and/or ```Packages/*.sty``` iff there is a need, and iff there is an understanding of how the LaTeX class/style file works


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
latex --shell-escape john_DEGREE
bibtex john_DEGREE
latex --shell-escape john_DEGREE
latex --shell-escape john_DEGREE
dvips -R0 -Ppdf -t letter -o john_DEGREE.ps john_DEGREE.dvi
ps2pdf -dPDFSETTINGS=/prepress -dSubsetFonts=true -dEmbedAllFonts=true -dMaxSubsetPct=100 john_DEGREE.ps john_DEGREE.pdf
```

**Mac using ```TeXMaker``` application:**

Navigate to ```TeXMaker » Preferences » Quick Build » Quick Build Command » User``` and enter the following

```
"/usr/texbin/latex" -interaction=nonstopmode %.tex | 
"/usr/texbin/bibtex" %.aux | 
"/usr/texbin/latex" -interaction=nonstopmode %.tex | 
"/usr/texbin/latex" -interaction=nonstopmode %.tex | 
"/usr/texbin/dvips" -Ppdf -o %.ps %.dvi | 
"/usr/local/bin/ps2pdf" -dPDFSETTINGS=/prepress -dEmbedAllFonts=true -dSubsetFonts=true -dMaxSubsetPct=100 %.ps
```

**Windows using ```TeXMaker``` application:**

Navigate to ```TeXMaker » Options » Configure TeXMaker » Quick Build » Quick Build Command » User``` (a recent and stable version of GhostScript, GhostPCL, GhostXPS and MuPDF can be downloaded from http://ghostscript.com/; check the path to ```gswin32c.exe```; thanks to Henriette Groenvik for bringing a typographical error to author's attention) and enter the following

```
latex -interaction=nonstopmode %.tex | 
bibtex % | 
latex -interaction=nonstopmode %.tex | 
latex -interaction=nonstopmode %.tex | 
dvips -Ppdf -o %.ps %.dvi | 
"C:/Program Files (x86)/gs/gs9.00/bin/gswin32c.exe" -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -r600 -dCompatibilityLevel=1.4 
-dPDFSETTINGS=/printer -dEmbedAllFonts=true -dSubsetFonts=true -dMaxSubsetPct=100 -sOutputFile="%.pdf" "%.ps"
```

What if one needs colored text?
-------------------

The template provides the following 140 named colors (given with their hexadecimal notation; color scheme adopted from http://www.w3schools.com/html/html_colorvalues.asp). Example usage: 

```\textcolor{Color}{colored text}```


| Hex code | Color             | Hex code | Color                |
|:---------|:------------------|:---------|:---------------------|
| #000000  | ![#000000](https://placehold.it/15/f03c15/000000?text=+)  Black             | #BA55D3  | ![#BA55D3](https://placehold.it/15/f03c15/000000?text=+)  MediumOrchid         |
| #000080  | ![#000080](https://placehold.it/15/f03c15/000000?text=+)  Navy              | #BC8F8F  | ![#BC8F8F](https://placehold.it/15/f03c15/000000?text=+)  RosyBrown            |
| #00008B  | ![#00008B](https://placehold.it/15/f03c15/000000?text=+)  DarkBlue          | #BDB76B  | ![#BDB76B](https://placehold.it/15/f03c15/000000?text=+)  DarkKhaki            |
| #0000CD  | ![#0000CD](https://placehold.it/15/f03c15/000000?text=+)  MediumBlue        | #C0C0C0  | ![#C0C0C0](https://placehold.it/15/f03c15/000000?text=+)  Silver               |
| #0000FF  | ![#0000FF](https://placehold.it/15/f03c15/000000?text=+)  Blue              | #C71585  | ![#C71585](https://placehold.it/15/f03c15/000000?text=+)  MediumVioletRed      |
| #006400  | ![#006400](https://placehold.it/15/f03c15/000000?text=+)  DarkGreen         | #CD5C5C  | ![#CD5C5C](https://placehold.it/15/f03c15/000000?text=+)  IndianRed            |
| #008000  | ![#008000](https://placehold.it/15/f03c15/000000?text=+)  Green             | #CD853F  | ![#CD853F](https://placehold.it/15/f03c15/000000?text=+)  Peru                 |
| #008080  | ![#008080](https://placehold.it/15/f03c15/000000?text=+)  Teal              | #D2691E  | ![#D2691E](https://placehold.it/15/f03c15/000000?text=+)  Chocolate            |
| #008B8B  | ![#008B8B](https://placehold.it/15/f03c15/000000?text=+)  DarkCyan          | #D2B48C  | ![#D2B48C](https://placehold.it/15/f03c15/000000?text=+)  Tan                  |
| #00BFFF  | ![#00BFFF](https://placehold.it/15/f03c15/000000?text=+)  DeepSkyBlue       | #D3D3D3  | ![#D3D3D3](https://placehold.it/15/f03c15/000000?text=+)  LightGray            |
| #00CED1  | ![#00CED1](https://placehold.it/15/f03c15/000000?text=+)  DarkTurquoise     | #D8BFD8  | ![#D8BFD8](https://placehold.it/15/f03c15/000000?text=+)  Thistle              |
| #00FA9A  | ![#00FA9A](https://placehold.it/15/f03c15/000000?text=+)  MediumSpringGreen | #DA70D6  | ![#DA70D6](https://placehold.it/15/f03c15/000000?text=+)  Orchid               |
| #00FF00  | ![#00FF00](https://placehold.it/15/f03c15/000000?text=+)  Lime              | #DAA520  | ![#DAA520](https://placehold.it/15/f03c15/000000?text=+)  GoldenRod            |
| #00FF7F  | ![#00FF7F](https://placehold.it/15/f03c15/000000?text=+)  SpringGreen       | #DB7093  | ![#DB7093](https://placehold.it/15/f03c15/000000?text=+)  PaleVioletRed        |
| #00FFFF  | ![#00FFFF](https://placehold.it/15/f03c15/000000?text=+)  Aqua              | #DC143C  | ![#DC143C](https://placehold.it/15/f03c15/000000?text=+)  Crimson              |
| #00FFFF  | ![#00FFFF](https://placehold.it/15/f03c15/000000?text=+)  Cyan              | #DCDCDC  | ![#DCDCDC](https://placehold.it/15/f03c15/000000?text=+)  Gainsboro            |
| #191970  | ![#191970](https://placehold.it/15/f03c15/000000?text=+)  MidnightBlue      | #DDA0DD  | ![#DDA0DD](https://placehold.it/15/f03c15/000000?text=+)  Plum                 |
| #1E90FF  | ![#1E90FF](https://placehold.it/15/f03c15/000000?text=+)  DodgerBlue        | #DEB887  | ![#DEB887](https://placehold.it/15/f03c15/000000?text=+)  BurlyWood            |
| #20B2AA  | ![#20B2AA](https://placehold.it/15/f03c15/000000?text=+)  LightSeaGreen     | #E0FFFF  | ![#E0FFFF](https://placehold.it/15/f03c15/000000?text=+)  LightCyan            |
| #228B22  | ![#228B22](https://placehold.it/15/f03c15/000000?text=+)  ForestGreen       | #E6E6FA  | ![#E6E6FA](https://placehold.it/15/f03c15/000000?text=+)  Lavender             |
| #2E8B57  | ![#2E8B57](https://placehold.it/15/f03c15/000000?text=+)  SeaGreen          | #E9967A  | ![#E9967A](https://placehold.it/15/f03c15/000000?text=+)  DarkSalmon           |
| #2F4F4F  | ![#2F4F4F](https://placehold.it/15/f03c15/000000?text=+)  DarkSlateGray     | #EE82EE  | ![#EE82EE](https://placehold.it/15/f03c15/000000?text=+)  Violet               |
| #32CD32  | ![#32CD32](https://placehold.it/15/f03c15/000000?text=+)  LimeGreen         | #EEE8AA  | ![#EEE8AA](https://placehold.it/15/f03c15/000000?text=+)  PaleGoldenRod        |
| #3CB371  | ![#3CB371](https://placehold.it/15/f03c15/000000?text=+)  MediumSeaGreen    | #F08080  | ![#F08080](https://placehold.it/15/f03c15/000000?text=+)  LightCoral           |
| #40E0D0  | ![#40E0D0](https://placehold.it/15/f03c15/000000?text=+)  Turquoise         | #F0E68C  | ![#F0E68C](https://placehold.it/15/f03c15/000000?text=+)  Khaki                |
| #4169E1  | ![#4169E1](https://placehold.it/15/f03c15/000000?text=+)  RoyalBlue         | #F0F8FF  | ![#F0F8FF](https://placehold.it/15/f03c15/000000?text=+)  AliceBlue            |
| #4682B4  | ![#4682B4](https://placehold.it/15/f03c15/000000?text=+)  SteelBlue         | #F0FFF0  | ![#F0FFF0](https://placehold.it/15/f03c15/000000?text=+)  HoneyDew             |
| #483D8B  | ![#483D8B](https://placehold.it/15/f03c15/000000?text=+)  DarkSlateBlue     | #F0FFFF  | ![#F0FFFF](https://placehold.it/15/f03c15/000000?text=+)  Azure                |
| #48D1CC  | ![#48D1CC](https://placehold.it/15/f03c15/000000?text=+)  MediumTurquoise   | #F4A460  | ![#F4A460](https://placehold.it/15/f03c15/000000?text=+)  SandyBrown           |
| #4B0082  | ![#4B0082](https://placehold.it/15/f03c15/000000?text=+)  Indigo            | #F5DEB3  | ![#F5DEB3](https://placehold.it/15/f03c15/000000?text=+)  Wheat                |
| #556B2F  | ![#556B2F](https://placehold.it/15/f03c15/000000?text=+)  DarkOliveGreen    | #F5F5DC  | ![#F5F5DC](https://placehold.it/15/f03c15/000000?text=+)  Beige                |
| #5F9EA0  | ![#5F9EA0](https://placehold.it/15/f03c15/000000?text=+)  CadetBlue         | #F5F5F5  | ![#F5F5F5](https://placehold.it/15/f03c15/000000?text=+)  WhiteSmoke           |
| #6495ED  | ![#6495ED](https://placehold.it/15/f03c15/000000?text=+)  CornflowerBlue    | #F5FFFA  | ![#F5FFFA](https://placehold.it/15/f03c15/000000?text=+)  MintCream            |
| #66CDAA  | ![#66CDAA](https://placehold.it/15/f03c15/000000?text=+)  MediumAquaMarine  | #F8F8FF  | ![#F8F8FF](https://placehold.it/15/f03c15/000000?text=+)  GhostWhite           |
| #696969  | ![#696969](https://placehold.it/15/f03c15/000000?text=+)  DimGray           | #FA8072  | ![#FA8072](https://placehold.it/15/f03c15/000000?text=+)  Salmon               |
| #6A5ACD  | ![#6A5ACD](https://placehold.it/15/f03c15/000000?text=+)  SlateBlue         | #FAEBD7  | ![#FAEBD7](https://placehold.it/15/f03c15/000000?text=+)  AntiqueWhite         |
| #6B8E23  | ![#6B8E23](https://placehold.it/15/f03c15/000000?text=+)  OliveDrab         | #FAF0E6  | ![#FAF0E6](https://placehold.it/15/f03c15/000000?text=+)  Linen                |
| #708090  | ![#708090](https://placehold.it/15/f03c15/000000?text=+)  SlateGray         | #FAFAD2  | ![#FAFAD2](https://placehold.it/15/f03c15/000000?text=+)  LightGoldenRodYellow |
| #778899  | ![#778899](https://placehold.it/15/f03c15/000000?text=+)  LightSlateGray    | #FDF5E6  | ![#FDF5E6](https://placehold.it/15/f03c15/000000?text=+)  OldLace              |
| #7B68EE  | ![#7B68EE](https://placehold.it/15/f03c15/000000?text=+)  MediumSlateBlue   | #FF0000  | ![#FF0000](https://placehold.it/15/f03c15/000000?text=+)  Red                  |
| #7CFC00  | ![#7CFC00](https://placehold.it/15/f03c15/000000?text=+)  LawnGreen         | #FF00FF  | ![#FF00FF](https://placehold.it/15/f03c15/000000?text=+)  Fuchsia              |
| #7FFF00  | ![#7FFF00](https://placehold.it/15/f03c15/000000?text=+)  Chartreuse        | #FF00FF  | ![#FF00FF](https://placehold.it/15/f03c15/000000?text=+)  Magenta              |
| #7FFFD4  | ![#7FFFD4](https://placehold.it/15/f03c15/000000?text=+)  Aquamarine        | #FF1493  | ![#FF1493](https://placehold.it/15/f03c15/000000?text=+)  DeepPink             |
| #800000  | ![#800000](https://placehold.it/15/f03c15/000000?text=+)  Maroon            | #FF4500  | ![#FF4500](https://placehold.it/15/f03c15/000000?text=+)  OrangeRed            |
| #800080  | ![#800080](https://placehold.it/15/f03c15/000000?text=+)  Purple            | #FF6347  | ![#FF6347](https://placehold.it/15/f03c15/000000?text=+)  Tomato               |
| #808000  | ![#808000](https://placehold.it/15/f03c15/000000?text=+)  Olive             | #FF69B4  | ![#FF69B4](https://placehold.it/15/f03c15/000000?text=+)  HotPink              |
| #808080  | ![#808080](https://placehold.it/15/f03c15/000000?text=+)  Gray              | #FF7F50  | ![#FF7F50](https://placehold.it/15/f03c15/000000?text=+)  Coral                |
| #87CEEB  | ![#87CEEB](https://placehold.it/15/f03c15/000000?text=+)  SkyBlue           | #FF8C00  | ![#FF8C00](https://placehold.it/15/f03c15/000000?text=+)  DarkOrange           |
| #87CEFA  | ![#87CEFA](https://placehold.it/15/f03c15/000000?text=+)  LightSkyBlue      | #FFA07A  | ![#FFA07A](https://placehold.it/15/f03c15/000000?text=+)  LightSalmon          |
| #8A2BE2  | ![#8A2BE2](https://placehold.it/15/f03c15/000000?text=+)  BlueViolet        | #FFA500  | ![#FFA500](https://placehold.it/15/f03c15/000000?text=+)  Orange               |
| #8B0000  | ![#8B0000](https://placehold.it/15/f03c15/000000?text=+)  DarkRed           | #FFB6C1  | ![#FFB6C1](https://placehold.it/15/f03c15/000000?text=+)  LightPink            |
| #8B008B  | ![#8B008B](https://placehold.it/15/f03c15/000000?text=+)  DarkMagenta       | #FFC0CB  | ![#FFC0CB](https://placehold.it/15/f03c15/000000?text=+)  Pink                 |
| #8B4513  | ![#8B4513](https://placehold.it/15/f03c15/000000?text=+)  SaddleBrown       | #FFD700  | ![#FFD700](https://placehold.it/15/f03c15/000000?text=+)  Gold                 |
| #8FBC8F  | ![#8FBC8F](https://placehold.it/15/f03c15/000000?text=+)  DarkSeaGreen      | #FFDAB9  | ![#FFDAB9](https://placehold.it/15/f03c15/000000?text=+)  PeachPuff            |
| #90EE90  | ![#90EE90](https://placehold.it/15/f03c15/000000?text=+)  LightGreen        | #FFDEAD  | ![#FFDEAD](https://placehold.it/15/f03c15/000000?text=+)  NavajoWhite          |
| #9370DB  | ![#9370DB](https://placehold.it/15/f03c15/000000?text=+)  MediumPurple      | #FFE4B5  | ![#FFE4B5](https://placehold.it/15/f03c15/000000?text=+)  Moccasin             |
| #9400D3  | ![#9400D3](https://placehold.it/15/f03c15/000000?text=+)  DarkViolet        | #FFE4C4  | ![#FFE4C4](https://placehold.it/15/f03c15/000000?text=+)  Bisque               |
| #98FB98  | ![#98FB98](https://placehold.it/15/f03c15/000000?text=+)  PaleGreen         | #FFE4E1  | ![#FFE4E1](https://placehold.it/15/f03c15/000000?text=+)  MistyRose            |
| #9932CC  | ![#9932CC](https://placehold.it/15/f03c15/000000?text=+)  DarkOrchid        | #FFEBCD  | ![#FFEBCD](https://placehold.it/15/f03c15/000000?text=+)  BlanchedAlmond       |
| #9ACD32  | ![#9ACD32](https://placehold.it/15/f03c15/000000?text=+)  YellowGreen       | #FFEFD5  | ![#FFEFD5](https://placehold.it/15/f03c15/000000?text=+)  PapayaWhip           |
| #A0522D  | ![#A0522D](https://placehold.it/15/f03c15/000000?text=+)  Sienna            | #FFF0F5  | ![#FFF0F5](https://placehold.it/15/f03c15/000000?text=+)  LavenderBlush        |
| #A52A2A  | ![#A52A2A](https://placehold.it/15/f03c15/000000?text=+)  Brown             | #FFF5EE  | ![#FFF5EE](https://placehold.it/15/f03c15/000000?text=+)  SeaShell             |
| #A9A9A9  | ![#A9A9A9](https://placehold.it/15/f03c15/000000?text=+)  DarkGray          | #FFF8DC  | ![#FFF8DC](https://placehold.it/15/f03c15/000000?text=+)  Cornsilk             |
| #ADD8E6  | ![#ADD8E6](https://placehold.it/15/f03c15/000000?text=+)  LightBlue         | #FFFACD  | ![#FFFACD](https://placehold.it/15/f03c15/000000?text=+)  LemonChiffon         |
| #ADFF2F  | ![#ADFF2F](https://placehold.it/15/f03c15/000000?text=+)  GreenYellow       | #FFFAF0  | ![#FFFAF0](https://placehold.it/15/f03c15/000000?text=+)  FloralWhite          |
| #AFEEEE  | ![#AFEEEE](https://placehold.it/15/f03c15/000000?text=+)  PaleTurquoise     | #FFFAFA  | ![#FFFAFA](https://placehold.it/15/f03c15/000000?text=+)  Snow                 |
| #B0C4DE  | ![#B0C4DE](https://placehold.it/15/f03c15/000000?text=+)  LightSteelBlue    | #FFFF00  | ![#FFFF00](https://placehold.it/15/f03c15/000000?text=+)  Yellow               |
| #B0E0E6  | ![#B0E0E6](https://placehold.it/15/f03c15/000000?text=+)  PowderBlue        | #FFFFE0  | ![#FFFFE0](https://placehold.it/15/f03c15/000000?text=+)  LightYellow          |
| #B22222  | ![#B22222](https://placehold.it/15/f03c15/000000?text=+)  FireBrick         | #FFFFF0  | ![#FFFFF0](https://placehold.it/15/f03c15/000000?text=+)  Ivory                |
| #B8860B  | ![#B8860B](https://placehold.it/15/f03c15/000000?text=+)  DarkGoldenRod     | #FFFFFF  | ![#FFFFFF](https://placehold.it/15/f03c15/000000?text=+)  White                |


Got questions? Need help?
-------------------

Refer to the [Guide to completing a graduate degree and preparing and submitting a dissertation, thesis, or report at Michigan Technological University](http://www.mtu.edu/gradschool/administration/academics/thesis-dissertation/pdfs/guide.pdf) and the [Chicago Manual Style](http://www.chicagomanualofstyle.org/). 

DO NOT send your questions, comments and/or concerns about this template to 
the Graduate School. [Google](http://google.com/) search often provides a 
quick and reliable answer. If all else fails, then contact the author.


Don't like this template OR have an idea to improve?
-------------------

Feel free to clone/fork this repository and make changes to fit your needs. 
You have my explicit permission to do so. This template and/or the changes 
you make may very well work for you (or your institution). Please note that
if you decide to do so, you are doing so entirely at your very own discretion 
and that neither the author nor Michigan Technological University is 
responsible for any/all damage -- intellectual and/or otherwise.


Author
-------------------

Dr. Gowtham, PhD          
Director of Research Computing, IT             
Adj. Asst. Professor, Physics/ECE               
Michigan Technological University                 
Email: g@mtu.edu             
http://sgowtham.com
