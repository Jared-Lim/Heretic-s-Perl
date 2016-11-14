#!/usr/bin/perl -w

if(!"output/"){
	print "WAH\n";
}else{
	print "wey\n";
}

opendir(DIR,"demons/");
@tribes= grep { $_ ne '.' && $_ ne '..' } readdir(DIR);
closedir(DIR);
foreach(@tribes){
	$tribe = $_;
	#------------------------------------------
	#checks if folder is created, if not create
	#------------------------------------------
	if(-e "output/".$tribe){
		print $tribe."\n---tribe exists\n";
	}else{
		mkdir "output/".$tribe;
		print "created ".$tribe."\n";
	}
	#------------------------------------------

}