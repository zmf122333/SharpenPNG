#!/usr/bin/perl -w
use File::Basename;

my $suffix="png_smooth";        #pic suffix.
my $type="";			#HD,SMOOTH,FAST
my $destDir="C:\\Users\\Administrator\\Desktop\\sharpenPNG\\png2";
my $basedir=dirname(__FILE__);
my $dir="C:\\Users\\Administrator\\Desktop\\sharpenPNG"; #work dir

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
