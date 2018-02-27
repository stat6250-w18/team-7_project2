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

proc sql outobs=5;
    select Eth_grad_1415.DISTRICT,
	       Eth_grad_1516.TOTAL-Eth_grad_1516.WHITE as TOT_WHI1516,
		   Eth_grad_1415.TOTAL-Eth_grad_1415.WHITE as TOT_WHI1415,
		   ((TOT_WHI1516-TOT_WHI1415)/TOT_WHI1415) as Percentage_Changes format=6.2
        from Eth_grad_1415, Eth_grad_1516
        where Eth_grad_1415.DISTRICT=Eth_grad_1516.DISTRICT
        group by Eth_grad_1415.DISTRICT;
Quit;  
title;
footnote;




title1
'Research Question: What are the top 10 schools experienced the largest difference bewteen drop-out and enrollment in 2015/2016'
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

Proc sql outobs=10;
    select Enrollment1516.CDS_CODE, Enrollment1516.ENR_TOTAL,
           Race_dropout1516.DTOT,Enrollment1516.ENR_Total-Race_dropout1516.DTOT
           as ENR_subtract_DRP
        from Enrollment1516, Race_dropout1516
        where Enrollment1516.CDS_CODE=Race_dropout1516.CDS_CODE
        group by Enrollment1516.CDS_CODE;
QUIT;
title;
footnote;





title1
'Research Question: Which race experienced the largest difference between drop out and enrollment in 2015/2016?'
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
Proc sql;
    select Enrollment1516.ETHNIC, Enrollment1516.ENR_TOTAL,
           Race_dropout1516.DTOT,Enrollment1516.ENR_Total-Race_dropout1516.DTOT as ENR_Subtract_DRP
        from Enrollment1516, Race_dropout1516
        where Enrollment1516.ETHNIC=Race_dropout1516.ETHNIC
        group by Enrollment1516.ETHNIC;
QUIT;
title;
footnote;


