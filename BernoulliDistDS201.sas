*[1] Start CAS session and assign user libarary CASUSER to the session;
cas mySession sessopts=(caslib=casuser);

*[2] Associate library with CASUSER CASLIB using CAS engine;
libname myCas cas caslib=casuser;

*[3] Pdf and Cdf functions;
proc ds2 sessref=mySession;
data d01 / overwrite=yes;
   dcl double x y_pdf y_cdf;
   method run();
     do x=0 to 1 by 1; 
	   y_pdf=pdf('bern',x,0.2); *[pdf];
	   y_cdf=cdf('bern',x,0.2); *[cdf];
	  output; 
     end;
   end;
enddata;
run;
quit;

*[4.1] Figure - PDF;
proc sgplot data=mycas.d01 noautolegend;
 needle x=x y=y_pdf / lineattrs=(color=blue) 
	markers markerattrs=( color=blue symbol=circlefilled);
 yaxis min=0 max=1 label='f(x)';
run;

*[4.2] Figure - CDF;
proc sgplot data=mycas.d01 noautolegend;
 step x=x y=y_cdf / lineattrs=(color=blue)  ;
 scatter x=x y=y_cdf / markerattrs=(color=blue);
 yaxis min=0 max=1 label='f(x)';
run;


