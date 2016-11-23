#!/usr/bin/perl -w

$checkfolder = "output/herald";

opendir(DIR,$checkfolder);
@heralds= grep { $_ ne '.' && $_ ne '..'} readdir(DIR);
closedir(DIR);

foreach(@heralds){
	$herald = $_;
	open(FILE,$checkfolder."/".$herald);
	while($line = <FILE>){
		if($line =~ /"profile"/){
			print "}"."\n";
			last;
		}elsif($line =~ /("notes".*")/){
			print "\t".$1."\n";
		}elsif($line =~/tribe/){
			print "\t\"tribe\"\: \""."herald"."\",\n";
		}else{
			print $line;
		}
	}
	close FILE;
}