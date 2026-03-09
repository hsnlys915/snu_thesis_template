# snu_thesis_template: A Master's Thesis Template for SNU
This is master's thesis template for Department of Political Science and International Relations, Seoul National University

## Cautionary Notes
### General
#### Compiler setting
The packages used here for Korean 'luatexko' depends on the compiler engine "Lualatex."

Please change compiler setting to "Lualatex" in order to compile PDF files.

### Titlepage
#### Abstract
The template sets different linespacing for the abstract: one-half spacing for Korean version, and single spacing for English version. Linespacing for the abstract environment can be adjusted as liking by changing numbers in `\setstretch` command (The `\setstretch` command for abstract environment is at line 89 in Korean version, and line 96 in English version).

#### Expand to Doctoral Dissertation
The template is intended to be used as a template for the Master's thesis, therefore the seals needed are set to 3.

You can manually adjust the number of committee seals by expanding rows of tabular environment in title page file (The tabular environment starts from line 76 in Korean version, and line 83 in English version).


## Version
Patch: v1.0.1

Date: Mar. 9, 2026