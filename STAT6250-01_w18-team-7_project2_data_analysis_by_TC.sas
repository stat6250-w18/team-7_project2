**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding college-preparation trends at CA public K-12 schools

Dataset Name: Enrollment1516, Eth_grad_1415, Eth_grad_1516 and Race_dropout1516
created in 
;


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
'Based on the result, the percentage changes of number of miniority graduates are various positively and negatively.'
;

footnote2
'The largest positive change is 9100% for Diego Springs Academy, which was 92 times more miniority graduates than year 14/15 in year 15/16. '
;

footnote3
'One of the reasons could be that the school offers job training throughout the program. It caters a lot of minority who mighht not have high educations and career trainings.'
;

footnote4
'The most negative change in number of miniority graduates is 100%. However, the number difference is not significant'
;

*
Note: Compare columns minYr1415 and minYr1516 from Eth_Diff. minYr1415 and
minYr1516 represent the number of difference of White graduates and other race
graduates from Eth_grad_1415 and Eth_grad_1516. 

Methodology: Use Proc Sql to extract values from Eth_Diff and create a new 
variable to calculate the number difference of White and other race graduates
from 1415 to 1516. Also, I computed the percentage changes of the difference. 
I created two tables for positive change and negative change. 

Limitations: This could not show which districts experience the dramatic boost 
or drop in miniority graduates, which would show a bigger picture issue. 

Possible Follow-up Steps: Get rid of the CDS_CODE from 
Eth_grad_1415 and Eth_grad_1516 and group by district to show the percent 
change for each district. 
;

proc sql OUTOBS=5;
    title 'Positive Change in Number of Minority Graduates';
    select CDS_CODE,SCHOOL,DISTRICT, minYr1516-minYr1415 as NumberDifferent,
           (minYr1516-minYr1415)/minYr1415*100 as PercentChange 
    from Eth_Diff
    where (minYr1516-minYr1415)/minYr1415 is not NULL
    order by abs((minYr1516-minYr1415)/minYr1415) desc
    ;
quit;
proc sql OUTOBS=5;
    title 'Negative Change in Number of Minority Graduates';
    select CDS_CODE,DISTRICT,SCHOOL,minYr1516-minYr1415 as NumberDifferent,
           (minYr1516-minYr1415)/minYr1415*100 as PercentChange  
    from Eth_Diff
    where (minYr1516-minYr1415)/minYr1415 is not NULL 
    and (minYr1516-minYr1415)/minYr1415 < 0
    order by abs((minYr1516-minYr1415)/minYr1415) desc
    ;
quit;

title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What are the top 10 schools experienced the largest difference bewteen drop-out and enrollment from grade 7 to grade 12 in 2015/2016?'
;

title2
'Rationale: It helps find out what some of the school experience imbalance number of students.' 
;

footnote1
'Based on the result, the negative sign represents that the number of enrolled student is less than the dropout number.'
;

footnote2
'Two schools from Centinela high school have the negative number of enrollment to dropout. This should bring up the awareness to the district.'
;

*
Note: Compare columns of Enr_Total and Drop_Total from tables ENR_SUM and
DROP_SUM. 

Methodology:I used proc sql to calculate the total number of enrollment and
dropout for all the schools from two tables Enrollment1516 and
Race_dropout1516. And created a variable for the 
difference between enrollment and dropout. 

Limitations:This does not show which grade has the biggest difference. 

Possible Follow-up Steps: I should calculate the enrollment and dropout 
grouped by school and then each grade. 
;

proc sql OUTOBS=10;
    select ENR_SUM.CDS_CODE, ENR_SUM.DISTRICT, ENR_SUM.SCHOOL,
           ENR_SUM.Enr_Total, DROP_SUM.Drop_Total,
           ENR_SUM.Enr_Total-DROP_SUM.Drop_Total as ENRminusDROP
    from ENR_SUM, DROP_SUM
    where ENR_SUM.CDS_CODE=DROP_SUM.CDS_CODE
    order by ENR_SUM.Enr_Total-DROP_SUM.Drop_Total;
quit;

title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: Which race experienced the largest difference between drop out and enrollment in 2015/2016?'
;

title2
'Rationale: It helps find out what race experienced the largest dropout and enrollment in schools.'
;

footnote1
'Based on the result, Hispanic(5) has the highest enrollent and dropout number. It can be due to the large population of hispanics.'
;

*
Note: Compare Enr_Total and Drop_Total from tables Enr_race_sum and
Drop_race_sum

Methodology:Used proc sql to create a table calculating enrollment 
and dropout number for all the race. 

Limitations:This does not show which grade has the biggest difference
in certain race and grade.

Possible Follow-up Steps: I should calculate the enrollment and dropout 
grouped by school and then each grade. And then group by each race. 
;

proc sql;
    select Enr_race_sum.ETHNIC,Enr_race_sum.ENR_Total,Drop_race_sum.Drop_Total,
           Enr_race_sum.ENR_Total-Drop_race_sum.Drop_Total as ENR_Subtract_DRP
    from Enr_race_sum, Drop_race_sum
    where Enr_race_sum.ETHNIC=Drop_race_sum.ETHNIC
    order by Enr_race_sum.ENR_Total-Drop_race_sum.Drop_Total desc;
quit;

title;
footnote;


