#!/usr/bin/perl -w
use File::Basename;


my $suffix1="psd";    #pic suffix.
my $type="png";
my $dir="C:\\Users\\Administrator\\Desktop\\sharpenning"; #work dir

my $basedir=dirname(__FILE__);
my $path1=$dir."\\".$suffix1;

my $unity="C:\\proj.unity";

my $destDir1;
my $destFile1;

my $file = "$dir\\$suffix1"."_".$type.".txt";

open(FILE,"<","$file")||die"cannot open the file: $!\n";

while (<FILE>){
	chomp;




	my $resource = '"'.$_.'"';
	print "$_\n";

	$_=~s/^\Q$dir\E\\\Q$suffix1\E\\//i;

	print "$_\n";

	#PSD dir
	my $destination1 = $unity."\\".$_;
    $destDir1 = $destination1;
	$destination1 = '"'.$destination1.'"';

	print "$resource\t$destination1\n";
	
	#change work dir
	chdir($basedir);
	
	#filter some sharpening error png.
	#if($resource =~ /newtown_terrain\.png/) { next;};
	
	#1.copy the png and backup.
	system("copy /y $resource $destination1");

}
close FILE;
