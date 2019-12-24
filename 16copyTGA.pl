#!/usr/bin/perl -w
use File::Basename;


my $suffix1="tga";    #pic suffix.
my $dir="C:\\Users\\Administrator\\Desktop\\sharpenning"; #work dir

my $basedir=dirname(__FILE__);
my $path1=$dir."\\".$suffix1;

`md "$path1"`  if !(-e "$path1");

my $destDir1;
my $destFile1;



open(FILE,"<","$dir\\$suffix1.txt")||die"cannot open the file: $!\n";

while (<FILE>){
	chomp;




	my $resource = '"'.$_.'"';


	$_=~s/^(.*)\\.*?\.\Q$suffix1\E$/$1/i;
	$_=~s/^.*proj\.unity\\//;
	
	#PSD dir
	my $destination1 = $dir."\\".$suffix1."\\".$_;
	if($resource =~ /AA.*effect.*00987\.tga/){
		$destination1=$dir."\\".$suffix1."\\Assets\\TEX\\";
		$destDir1 = $dir."\\".$suffix1."\\Assets\\TEX\\";

	}
    $destDir1 = $destination1;
	$destination1 = '"'.$destination1.'"';
	`md $destination1` if(!(-e $destDir1));



	
	#change work dir
	chdir($basedir);
	
	#filter some sharpening error png.
	#if($resource =~ /newtown_terrain\.png/) { next;};
	
	#1.copy the png and backup.
	system("copy /y $resource $destination1");

}
close FILE;
