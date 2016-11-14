#!/usr/bin/perl -w

opendir(DIR,"demons/");
@tribes= grep { $_ ne '.' && $_ ne '..' } readdir(DIR);
foreach(@tribes){
	print $_." ";
}