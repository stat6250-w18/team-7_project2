*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding college-preparation trends at CA public K-12 schools

Dataset Name: Eth_grad_1415_file created in external file
STAT6250-02_s17-team-7_project2_data_preparation.sas, which is assumed to be
in the same directory as this file

See included file for dataset properties
;

* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file 
%include '.\STAT6250-01_w18-team-7_project2_data_preparation.sas';


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;
*

title1
'Research Question: What are the top five schools that experienced the biggest increase in "TOTAL" between Eth_grad_1415 and Eth_grad_1516?'
;

title2
'Rationale: This should help identify schools, which may can accommodate more students based upon increasing total graduated numbers.'
;

footnote1
"Of the five schools with the greatest increases in between Eth_grad_1415 and Eth_grad_1516 is 940, the greatest decrease in between Eth_grad_1415 and Eth_grad_1516 is -1021."
;

footnote2
"Given the magnitude of these changes, further investigation should be performed to ensure no data errors are involved."
;

footnote3
"However, assuming there are no data issues underlying this analysis."
;

*
Note: This compares the column "TOTAL" from Eth_grad_1415
to the column of the same name from Eth_grad_1516.

Methodology: When combining Eth_grad_1415 with Eth_grad_1516 during data 
preparation, take the difference of values of "TOTAL" for each
school and create a new variable called TOTAL_change_2014_to_2015. Here,
use proc sort to create a temporary sorted table in descending by
TOTAL_change_2014_to_2015 and then proc print to display the first five
rows of the sorted dataset.

Limitations: This methodology does not account for schools with situation
such as the loaction, the people intensity, and whether the school is famous
or not.

Followup Steps: More carefully to do the research the location, whether can 
attractive more student go to study or not.
;

proc print
        data=Eth_grad_1415_file(obs=5)
    ;
    id
        School_Name
    ;
    var
        TOTAL_change_2014_to_2015
    ;
run;

title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;
*

title1
'Research Question: What are the top five schools that experienced the biggest increase in "TWO_MORE_RACES" between Eth_grad_1415 and Eth_grad_1516?
;

title2
'Rationale: This would help inform the schools, whihc would like the international schools and can attractive more internaional students to enroll the schools.'
;

footnote1
"Of the five schools with the greatest increases in between Eth_grad_1415 and Eth_grad_1516 is 66, the greatest decrease in between Eth_grad_1415 and Eth_grad_1516 is -78."
;

footnote2
"Given the magnitude of these changes, further investigation should be performed to ensure no data errors are involved."
;

footnote3
"However, assuming there are no data issues underlying this analysis."
;

*
Note: This compares the column "TWO_MORE_RACES" from Eth_grad_1415
to the column "TWO_MORE_RACES" Eth_grad_1516.

Methodology: Use proc sort to create a temporary sorted table in descending by
TWO_MORE_RACES_change_2014_to_2015 and then proc print to display the first 
five rows of the sorted dataset.

Limitations: Even though predictive modeling is specified in the research
questions, this methodology solely relies on the data, which the school has 
two more races students. 

Followup Steps: A possible follow-up to this approach could need others source
to help to support the prediction.
;

proc print
        data=Eth_grad_1415_file(obs=5)
    ;
    id
        School_Name
    ;
    var
        Two_MORE_RACES_change_2014_to_2015
    ;
run;

title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What are the top ten schools were the minimum numbers of dropouts15-16 with highest enrollment15-16 numbers?'
;

title2
"Rationale: This would help identify schools with significant performance of education level can keep more stduents until graduated."
;

footnote1
"All ten schools listed appear to have extremely large numbers of enrollment15-16 with 0 numbers of dropouts15-16."
;

footnote2
"Given the magnitude of these numbers, further investigation should be performed to ensure no data errors are involved."
;

footnote3
"However, assuming there are no data issues underlying this analysis."
;

*

Note: This compares the column "DTOT" from Race_dropouts15-16 to the column 
"ENR_TOTAL" from enrollment15-16.

Methodology: When combining Race_dropouts15-16 and enrollment15-16 during data 
preparation, take the difference between "DTOT" in Race_dropouts15-16 and 
"ENR_TOTAL" in enrollment15-16 for the school has same CDS_CODE.Then
proc print to display the first 10 rows of the sorted dataset.

Limitations: This methodology does not account for schools with whole CDS_CODD.
Some CDS_CODE are not existing in the two data as same time.

Followup Steps: We need more information and resource to judge whtere is great 
school or not for the internation student.
;

proc sort
        data=Eth_grad_1415_file
        out=Eth_grad_1415_file_sorted
    ;
    by descending ENR_TOTAL;
run;

proc print data=Eth_grad_1415_file_sorted(obs=10)
  ;
  id 
      CDS_CODE
  ;
  var 
      ENR_TOTAL
  ;
run;

title;
footnote;
