Michigan Tech MS/PhD LaTeX Template
================

What is this?
-------------------

A LaTeX template for writing MS thesis/PhD dissertation (for double-sided 
printing) in compliance with the guidelines from the Graduate School in 
Michigan Technological University.


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

  1. First off, rename (not just copy over) ```john_DEGREE.tex``` by
     substituting ```john``` with your Michigan Tech ISO username, and
     ```DEGREE``` with either ```MS``` or ```PhD```.

  2. Open the renamed ```john_DEGREE.tex```

     1. Iff writing a MS thesis, then change 
        ```\documentclass[Degree=PhD]{MichiganTech}``` to
        ```\documentclass[Degree=MS]{MichiganTech}```.

     2. Comment the lines marked ```% Optional``` under ```Front Matter```
        section if there is a need.


How does one compile?
-------------------



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

