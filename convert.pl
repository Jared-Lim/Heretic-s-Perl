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
	$outfold = "output/".$tribe;
	#checks if folder is created, if not create
	if(-e $outfold){
		print "-----------------\n";
		print $tribe."\n";
		print "-----------------\n";
	}else{
		mkdir $outfold;
		print "created ".$tribe."\n";
	}
	usleep(250000);
	#----------------------------------
	



}