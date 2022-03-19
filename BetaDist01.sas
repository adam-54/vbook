*[1] Start CAS session and assign user libarary CASUSER to the session;
cas mySession sessopts=(caslib=casuser);

*[2] Associate library with CASUSER CASLIB using CAS engine;
libname myCas cas caslib=casuser;

*[3] Pdf and Cdf functions;
data mycas.d01;
	do x=0 to 1 by 0.01; 
	y_pdf=pdf('beta',x,2,5); *pdf;
	y_cdf=cdf('beta',x,2,5); *cdf;
	output; 
	end;
run;

*[4] Figure;
proc sgplot data=mycas.d01;
 series x=x y=y_cdf;
run;


