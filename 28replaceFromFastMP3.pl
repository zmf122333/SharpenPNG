#!/usr/bin/perl -w
use File::Basename;

my $suffix="mp3_fast";    #pic txt suffix.
my $type="FAST";			#HD,SMOOTH,FAST
my $destDir="C:\\proj.unity";
my $basedir=dirname(__FILE__);
my $dir="C:\\Users\\Administrator\\Desktop\\sharpenning"; #work dir

my $s1="03020_";

open(FILE,"<","$dir\\$suffix.txt")||die"cannot open the file: $!\n";
while (<FILE>){
	chomp;
	
	$_=~s/\Q$s1\E\Q$type\E\.png/\Q$s1\E!\Q$type\E\.png/;
	
	my $resource = '"'.$_.'"';

	print "$resource\n";
	
	#change root dir
	$_=~s/^.*\Q$suffix\E/$destDir/;
	$_=~s/\Q$type\E\.png/\.png/;
	$destination = '"'.$_.'"';
	
	print "$destination\n";
	#change work dir
	chdir($basedir);
	
	#replace shenling ordinary png from HD sharpened png.
	system("copy /y $resource $destination");

}
close FILE;