Michigan Tech MS/PhD LaTeX Template
================

What is this?
-------------------

A LaTeX template for writing MS thesis/PhD dissertation (for double-sided 
printing) in compliance with the guidelines from the Graduate School in 
Michigan Technological University.

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

**Mac using ```TeXMaker``` application:**

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

**Windows using ```TeXMaker``` application:**

Navigate to ```TeXMaker » Options » Configure TeXMaker » Quick Build » Quick Build Command » User``` (check the path to ```gs2in32c.exe```) and enter the following

```
latex -interaction=nonstopmode %.tex | 
latex -interaction=nonstopmode %.tex | 
bibtex % | 
bibtex % | 
latex -interaction=nonstopmode %.tex | 
latex -interaction=nonstopmode %.tex | 
dvips -Ppdf -o %.ps %.dvi | 
"C:/Program Files (x86)/gs/gs9.00/bin/gswin32c.exe" -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -r600 -dCompatibilityLevel=1.4 
-dPDFSETTINGS=/printer -dEmbedAllFonts=true -dSubsetFonts=true -dMaxSubsetPct=100 -sOutputFile="%.pdf" "%.ps"
```

What if one needs colored text?
-------------------

The template provides the following 140 named colors (given with their hexadecimal notation; color scheme adopted from http://www.w3schools.com/html/html_colorvalues.asp):

```
#000000  Black
#000080  Navy
#00008B  DarkBlue
#0000CD  MediumBlue
#0000FF  Blue
#006400  DarkGreen
#008000  Green
#008080  Teal
#008B8B  DarkCyan
#00BFFF  DeepSkyBlue
#00CED1  DarkTurquoise
#00FA9A  MediumSpringGreen
#00FF00  Lime
#00FF7F  SpringGreen
#00FFFF  Aqua
#00FFFF  Cyan
#191970  MidnightBlue
#1E90FF  DodgerBlue
#20B2AA  LightSeaGreen
#228B22  ForestGreen
#2E8B57  SeaGreen
#2F4F4F  DarkSlateGray
#32CD32  LimeGreen
#3CB371  MediumSeaGreen
#40E0D0  Turquoise
#4169E1  RoyalBlue
#4682B4  SteelBlue
#483D8B  DarkSlateBlue
#48D1CC  MediumTurquoise
#4B0082  Indigo
#556B2F  DarkOliveGreen
#5F9EA0  CadetBlue
#6495ED  CornflowerBlue
#66CDAA  MediumAquaMarine
#696969  DimGray
#6A5ACD  SlateBlue
#6B8E23  OliveDrab
#708090  SlateGray
#778899  LightSlateGray
#7B68EE  MediumSlateBlue
#7CFC00  LawnGreen
#7FFF00  Chartreuse
#7FFFD4  Aquamarine
#800000  Maroon
#800080  Purple
#808000  Olive
#808080  Gray
#87CEEB  SkyBlue
#87CEFA  LightSkyBlue
#8A2BE2  BlueViolet
#8B0000  DarkRed
#8B008B  DarkMagenta
#8B4513  SaddleBrown
#8FBC8F  DarkSeaGreen
#90EE90  LightGreen
#9370DB  MediumPurple
#9400D3  DarkViolet
#98FB98  PaleGreen
#9932CC  DarkOrchid
#9ACD32  YellowGreen
#A0522D  Sienna
#A52A2A  Brown
#A9A9A9  DarkGray
#ADD8E6  LightBlue
#ADFF2F  GreenYellow
#AFEEEE  PaleTurquoise
#B0C4DE  LightSteelBlue
#B0E0E6  PowderBlue
#B22222  FireBrick
#B8860B  DarkGoldenRod
#BA55D3  MediumOrchid
#BC8F8F  RosyBrown
#BDB76B  DarkKhaki
#C0C0C0  Silver
#C71585  MediumVioletRed
#CD5C5C  IndianRed
#CD853F  Peru
#D2691E  Chocolate
#D2B48C  Tan
#D3D3D3  LightGray
#D8BFD8  Thistle
#DA70D6  Orchid
#DAA520  GoldenRod
#DB7093  PaleVioletRed
#DC143C  Crimson
#DCDCDC  Gainsboro
#DDA0DD  Plum
#DEB887  BurlyWood
#E0FFFF  LightCyan
#E6E6FA  Lavender
#E9967A  DarkSalmon
#EE82EE  Violet
#EEE8AA  PaleGoldenRod
#F08080  LightCoral
#F0E68C  Khaki
#F0F8FF  AliceBlue
#F0FFF0  HoneyDew
#F0FFFF  Azure
#F4A460  SandyBrown
#F5DEB3  Wheat
#F5F5DC  Beige
#F5F5F5  WhiteSmoke
#F5FFFA  MintCream
#F8F8FF  GhostWhite
#FA8072  Salmon
#FAEBD7  AntiqueWhite
#FAF0E6  Linen
#FAFAD2  LightGoldenRodYellow
#FDF5E6  OldLace
#FF0000  Red
#FF00FF  Fuchsia
#FF00FF  Magenta
#FF1493  DeepPink
#FF4500  OrangeRed
#FF6347  Tomato
#FF69B4  HotPink
#FF7F50  Coral
#FF8C00  DarkOrange
#FFA07A  LightSalmon
#FFA500  Orange
#FFB6C1  LightPink
#FFC0CB  Pink
#FFD700  Gold
#FFDAB9  PeachPuff
#FFDEAD  NavajoWhite
#FFE4B5  Moccasin
#FFE4C4  Bisque
#FFE4E1  MistyRose
#FFEBCD  BlanchedAlmond
#FFEFD5  PapayaWhip
#FFF0F5  LavenderBlush
#FFF5EE  SeaShell
#FFF8DC  Cornsilk
#FFFACD  LemonChiffon
#FFFAF0  FloralWhite
#FFFAFA  Snow
#FFFF00  Yellow
#FFFFE0  LightYellow
#FFFFF0  Ivory
#FFFFFF  White
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
http://sgowtham.com
