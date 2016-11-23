#!/usr/bin/perl -w

opendir(DIR,"output");
@tribes= grep { $_ ne '.' && $_ ne '..'} readdir(DIR);
closedir(DIR);

foreach(@tribes){
	$tribe = $_;
	if(-e "output/".$tribe){
		print "folder ".$tribe."exists\n";
	}else{
		mkdir("output2/".$tribe);
		print $tribe." made\n";
	}
}