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
				$line2=$1;
				if($line2=~ /^(\w*)\": /){
					print $1." ";
				}else{
					print $line2." ";
				}
			}
		}
		close FILE;
		print "\n";
	}
}