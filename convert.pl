#!/usr/bin/perl -w

opendir(DIR,"demons/");
@tribes= grep { $_ ne '.' && $_ ne '..' } readdir(DIR);
foreach(@tribes){
	if(-e "output/".$_){
		print "exists\t";
	}else{
		print "nope\t";
	}
	print $_."\n";
}