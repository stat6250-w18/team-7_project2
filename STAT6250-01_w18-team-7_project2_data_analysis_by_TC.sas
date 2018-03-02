**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding college-preparation trends at CA public K-12 schools

* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file;
%include '.\STAT6250-01_w18-team-7_project2_data_preparation.sas';


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What are the top 5 school experienced the most percentage change of graduates in minority (non-white) from 2014/2015 to 2015/2016?'
;

title2
'Rationale: It helps find out if there’s any significant change of number of graduates in certain schools.'
;

footnote1
'Based on the result, percentage changes of number of miniority graduates are various positively and negatively.'
;

footnote2
'The largest positive change is 9100% for Diego Springs Academy, which was 92 times more miniority graduates than year 14/15 in year 15/16. '
;

footnote3
'One of the reasons could be that the school offers job training throughout the program. It caters a lot of minority who mighht not have high educations and career trainings.'
;

footnote4
'Five school have the most negative change in number of miniority graduates. The most interesting fact is that one of them is Mountain View High School in Silicon Valley.'
;

footnote5
''
*
Methodology:

Limitations:

Possible Follow-up Steps:
;

proc sql OUTOBS=5;
    title 'Positive Change in number of minority graduates';
    select CDS_CODE,SCHOOL, (minYr1516-minYr1415)/minYr1415*100 as PercentChange 
    from Eth_Diff
	where (minYr1516-minYr1415)/minYr1415 is not NULL
	order by abs((minYr1516-minYr1415)/minYr1415) desc
	;
Quit;
proc sql OUTOBS=5;
    title 'Negative Change in number of minority graduates';
    select CDS_CODE,SCHOOL,(minYr1516-minYr1415)/minYr1415*100 as PercentChange 
    from Eth_Diff
	where (minYr1516-minYr1415)/minYr1415 is not NULL and (minYr1516-minYr1415)/minYr1415 < 0
	order by abs((minYr1516-minYr1415)/minYr1415) desc
	;
Quit;
title;
footnote;
