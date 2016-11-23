#!/usr/bin/perl -w

$checkfolder = "output/herald";

opendir(DIR,$checkfolder);
@heralds= grep { $_ ne '.' && $_ ne '..'} readdir(DIR);
closedir(DIR);

foreach(@heralds){
	print $_."\n";
}