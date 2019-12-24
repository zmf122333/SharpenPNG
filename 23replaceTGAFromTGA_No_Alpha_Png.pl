#!/usr/bin/perl -w
use File::Basename;

my $suffix="tga_no_alpha_png";    #pic txt suffix.
my $type="tga_no_alpha";			#HD,SMOOTH,FAST
my $destDir='C:\\proj.unity';
my $basedir=dirname(__FILE__);
my $dir="C:\\Users\\Administrator\\Desktop\\sharpenning"; #work dir

my $path =$dir."\\".$type;

open(FILE,"<","$dir\\$suffix.txt")||die"cannot open the file: $!\n";
while (<FILE>){
	chomp;
	
	my $resource = '"'.$_.'"';
	print "$resource\n";
	
	$_=~s/\Q$path\E/$destDir/ig;
	my $destination = '"'.$_.'"';
	print "$destination\n";
	
	#change work dir
	chdir($basedir);
	
	#replace shenling ordinary png from HD sharpened png.
	system("copy /y $resource $destination");

}
close FILE;