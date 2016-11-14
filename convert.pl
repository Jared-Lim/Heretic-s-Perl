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
#usleep(1000000);
#-----------------------------------------

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
		print "creating";
	}
	print "    ".$tribe."\n";
	print "----------------------\n";
	#----------------------------------

	#open tribe directory
	opendir(DIR,"demons/".$tribe);
	@demons = grep { $_ ne '.' && $_ ne '..'} readdir(DIR);
	closedir(DIR);
	#-------------------------------------------------------
	foreach(@demons){
		$demon = $_."on";
		$demonfile = "demons/".$tribe."/".$_;
		$outfile = $outfold."/".$demon;
		#check if demon json is created, if not convert
		if(-e $outfile){
			print $demon."\n";
		}else{
			print "  creating ----> ".$demon."\n";
			open(FILE1,$demonfile);
			open(FILE2,'>'.$outfile);
			print FILE2 "{\n";
			while($line=<FILE1>){
				if($line !~ /registerDemon\(\{/ && $line !~ /\}\)\;/ && $line !~ /\/\/*/){
					print FILE2 $line;
				}
			}
			print FILE2 "}\n";
			close FILE1;
			close FILE2;
		}
		#usleep(200000);
		#------------------------------------------------
	}
	#usleep(500000);
}