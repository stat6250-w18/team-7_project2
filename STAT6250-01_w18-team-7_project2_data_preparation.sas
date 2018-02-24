*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
[Dataset 1 Name] Eth_grad_1415

[Dataset Description] Graduates by Ethnicity and Gender Data, AY2014-15

[Experimental Unit Description] California public K-12 schools in AY2014-15

[Number of Observations] 2491
                    
[Number of Features] 16

[Data Source] http://dq.cde.ca.gov/dataquest/dlfile/dlfile.aspx?cLevel=School&
cYear=2014-15&cCat=GradEth&cPage=filesgrad.asp 

[Data Dictionary] https://www.cde.ca.gov/ds/sd/sd/fsgrad09.asp

[Unique ID Schema] The unique id column CDS_CODE 

--

[Dataset 2 Name] Eth_grad_1516

[Dataset Description] Graduates by Ethnicity and Gender Data, AY2015-16

[Experimental Unit Description] California public K-12 schools in AY2015-16

[Number of Observations] 2522
                    
[Number of Features] 16

[Data Source] http://dq.cde.ca.gov/dataquest/dlfile/dlfile.aspx?cLevel=School&
cYear=2014-15&cCat=GradEth&cPage=filesgrad.asp 

[Data Dictionary] https://www.cde.ca.gov/ds/sd/sd/fsgrad09.asp

[Unique ID Schema] The unique id column CDS_CODE 

--

[Dataset 3 Name] Enrollment1516

[Dataset Description] Enrollment by racial/ethnic designation, gender, and 
grade AY2015-2016

[Experimental Unit Description] California public K-12 schools in AY2015-16

[Number of Observations] 65535
                    
[Number of Features] 23

[Data Source] http://dq.cde.ca.gov/dataquest/dlfile/dlfile.aspx?cLevel=School&
cYear=2015-16&cCat=Dropouts&cPage=filesdropouts

[Data Dictionary] https://www.cde.ca.gov/ds/sd/sd/fsenr.asp

[Unique ID Schema] The column CDS_CODE is a unique id.

--

[Dataset 4 Name] Race_dropout1516

[Dataset Description] Grade seven through twelve dropouts and enrollment by 
race/ethnic designation and gender by school in AY2015-2016 

[Experimental Unit Description] California public K-12 schools in AY2015-16

[Number of Observations] 58876
                    
[Number of Features] 20

[Data Source] http://dq.cde.ca.gov/dataquest/dlfile/dlfile.aspx?cLevel=School
&cYear=2015-16&cCat=Enrollment&cPage=filesenr.asp

[Data Dictionary] https://www.cde.ca.gov/ds/sd/sd/fsdropouts.asp

[Unique ID Schema] The column CDS_CODE is a unique id.

----
;

*setup environmental parameters;

%let inputDataset1URL = 
https://github.com/stat6250/team-7_project2/blob/master/Data/Eth_grad_1415.xls?raw=true
;

%let inputDataset1Type = XLS;
%let inputDataset1DSN = Eth_grad_1415;


%let inputDataset2URL = 
https://github.com/stat6250/team-7_project2/blob/master/Data/Eth_grad_1516.xls?raw=true
;

%let inputDataset2Type = XLS;
%let inputDataset2DSN = Eth_grad_1516;


%let inputDataset3URL = 
https://github.com/stat6250/team-7_project2/blob/master/Data/Enrollment1516.xls?raw=true
;

%let inputDataset3Type = XLS;
%let inputDataset3DSN = Enrollment1516;


%let inputDataset4URL = 
https://github.com/stat6250/team-7_project2/blob/master/Data/Race_dropout1516.xls?raw=true
;

%let inputDataset4Type = XLS;
%let inputDataset4DSN = Race_dropout1516;



* load raw FRPM dataset over the wire;

%macro loadDataIfNotAlreadyAvailable(dsn,url,filetype);
    %put &=dsn;
    %put &=url;
    %put &=filetype;
    %if
        %sysfunc(exist(&dsn.)) = 0
    %then
        %do;
            %put Loading dataset &dsn. over the wire now...;
            filename tempfile "%sysfunc(getoption(work))/tempfile.xlsx";

            proc http

                method="get"
                url="&url."
                out=tempfile
                ;

            run;
            proc import
                file=tempfile
                out=&dsn.
                dbms=&filetype.;

            run;

            filename tempfile clear;

        %end;
    %else
        %do;
            %put Dataset &dsn. already exists. Please delete and try again.;
        %end;

%mend;

%loadDataIfNotAlreadyAvailable(
    &inputDataset1DSN.,
    &inputDataset1URL.,
    &inputDataset1Type.
)

%loadDataIfNotAlreadyAvailable(
    &inputDataset2DSN.,
    &inputDataset2URL.,
    &inputDataset2Type.
)

%loadDataIfNotAlreadyAvailable(
    &inputDataset3DSN.,
    &inputDataset3URL.,
    &inputDataset3Type.
)

%loadDataIfNotAlreadyAvailable(
    &inputDataset4DSN.,
    &inputDataset4URL.,
    &inputDataset4Type.
)

* sort and check raw data sets for duplicates with respect to primary keys,
  data contains no blank rows so no steps to remove blanks is needed;


proc sort

        nodupkey
        data=Eth_grad_1415
        out=Eth_grad_1415_sorted(where=(not(missing(CDS_CODE))))
    ;
    by
        CDS_CODE
        County
    ;

run;

proc sort

        nodupkey
        data=Eth_grad1516
        out=Eth_grad1516_sorted(where=(not(missing(CDS_CODE))))
    ;
    by
        CDS_CODE
    ;

run;

proc sort

        nodupkey
        data=Race_dropout1516
        out=Race_dropout1516_sorted(where=(not(missing(CDS_CODE))))
    ;
    by
        CDS_CODE
        ETHNIC
    ;

run;

proc sort

        nodupkey
        data=Erollment1516
        out=Erollment1516_sorted(where=(not(missing(CDS_CODE))))
    ;
    by

        CDS_CODE
        ETHNIC
    ;

run;
