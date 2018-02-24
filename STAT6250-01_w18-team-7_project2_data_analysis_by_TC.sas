**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding college-preparation trends at CA public K-12 schools

* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file 
%include '.\STAT6250-01_w18-team-7_project2_data_preparation.sas';


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What are the top 5 districts experienced the most percentage change of graduates in minority (non-white) from 2014/2015 to 2015/2016?'
;

title2
'Rationale: It helps find out if there’s any significant change of number of graduates in certain districts.' 
;

footnote1
''
;
*
Methodology: 

Limitations: 

Possible Follow-up Steps: 
;


title;
footnote;




title1
'Research Question: What are the top 10 schools experienced the highest number of drop out and lowest enrollment in 2015/2016'
;

title2
'Rationale: It helps find out what some of the school experience imbalance number of students.' 
;

footnote1
''
;
*
Methodology: 

Limitations: 

Possible Follow-up Steps: 
;	

title;
footnote;





title1
'Research Question: Which race experienced the highest number of drop out and lowest enrollment in 2015/2016?'
;

title2
'Rationale: It helps find out what race experienced the largest dispersion number of enrollment and dropout in schools.'
;

footnote1
''
;
*
Methodology: 

Limitations: 

Possible Follow-up Steps:  
;

title;
footnote;


