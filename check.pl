#!/usr/bin/perl -w

use Time::HiRes qw(usleep nanosleep);

opendir(DIR,'output');
@tribes= grep { $_ ne '.' && $_ ne '..'} readdir(DIR);
closedir(DIR);

foreach(@tribes){
	$tribe = $_;
	print $tribe."\n";
	opendir(DIR,'output/'.$tribe);
	@demons = grep { $_ ne '.' && $_ ne '..'} readdir(DIR);
	closedir(DIR);
	foreach(@demons){
		$demon = $_;
		print "---".$demon."\n";
		open(FILE,'output/'.$tribe.'/'.$demon);
		while($line = <FILE>){
			if($line =~ /^\t\"(.*)\"/){
				print $1."\n";
			}
		}
		close FILE;
		print "\n";
		usleep(1000000);
	}
}