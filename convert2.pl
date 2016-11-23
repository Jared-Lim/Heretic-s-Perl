#!/usr/bin/perl -w

opendir(DIR,"output");
@tribes= grep { $_ ne '.' && $_ ne '..'} readdir(DIR);
closedir(DIR);

foreach(@tribes){
	print $_."\n";
}
