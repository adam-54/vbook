*[1] Start CAS session and assign user libarary CASUSER to the session;
cas mySession sessopts=(caslib=casuser);

*[2] Associate library with CASUSER CASLIB using CAS engine;
libname myCas cas caslib=casuser;

*[3] Pdf and Cdf functions;
proc ds2 sessref=mySession;
data d01 / overwrite=yes;
   dcl double x y_pdf y_cdf;
   method run();
     do x=-4 to 4 by 0.1; 
	   y_pdf=pdf('normal',x,0,1); *[pdf];
	   y_cdf=cdf('normal',x,0,1); *[cdf];
	  output; 
     end;
   end;
enddata;
run;
quit;

*[4] Figure;
proc sgplot data=mycas.d01;
 series x=x y=y_pdf;
 yaxis label="f(x)";
run;



