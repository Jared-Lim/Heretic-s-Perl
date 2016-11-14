#!/usr/bin/perl -w

use Time::HiRes qw(usleep nanosleep);

#check for output folder
if(-e "output/"){
}else{
	mkdir "output";
	print "------------------------\n";
	print "created output directory\n";
	print "------------------------\n";
}
usleep(1000000);
#------------------------------------------

#open demon directory
opendir(DIR,"demons");
@tribes= grep { $_ ne '.' && $_ ne '..'} readdir(DIR);
closedir(DIR);
#-----------------------------------------------------------
foreach(@tribes){
	$tribe = $_;
	$outfold = "output/".$tribe;
	#checks if folder is created, if not create
	if(-e $outfold){
	}else{
		mkdir $outfold;
		print "creating\t";
	}
	print "----------------------------\n";
	print $tribe."\n";
	print "----------------------------\n";
	#----------------------------------

	#open tribe directory
	opendir(DIR,"demons/".$tribe);
	@demons = grep { $_ ne '.' && $_ ne '..'} readdir(DIR);
	closedir(DIR);
	#-------------------------------------------------------
	foreach(@demons){
		$demon = $_;
		if(-e $outfold."/".$demon){
		}else{
			print "\tcreating\t";
		}
		print $demon."\n";



		usleep(200000);
	}
	usleep(500000);


}