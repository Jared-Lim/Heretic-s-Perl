#!/usr/bin/perl -w

use Time::HiRes qw(usleep nanosleep);

#check for output folder
if(-e "output/"){
}else{
	mkdir "output";
	print "created output directory\n";
	print "------------------------\n";
}
usleep(1000000);
#------------------------------------------

#open demon directory
opendir(DIR,"demons/");
@tribes= grep { $_ ne '.' && $_ ne '..'} readdir(DIR);
closedir(DIR);
#-----------------------------------------------------------
foreach(@tribes){
	$tribe = $_;
	#checks if folder is created, if not create
	if(-e "output/".$tribe){
		print "-----------------\n";
		print $tribe."\n";
		print "-----------------\n";
	}else{
		mkdir "output/".$tribe;
		print "created ".$tribe."\n";
	}
	#----------------------------------
	usleep(250000);
}