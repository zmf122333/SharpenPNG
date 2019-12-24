#!/usr/bin/perl -w
use File::Basename;


my $suffix1="tga_no_alpha";    #pic suffix.
my $type="tga";
my $dir="C:\\Users\\Administrator\\Desktop\\sharpenning"; #work dir

my $basedir=dirname(__FILE__);
my $path1=$dir."\\".$suffix1;


my $destDir1;
my $destFile1;

my $file = "$dir\\$suffix1".".txt";

open(FILE,"<","$file")||die"cannot open the file: $!\n";

while (<FILE>){
	chomp;
	
	
	next if $_ !~ /\.\Q$type\E/i;

	$_ = $1 if $_=~/(\Q$dir\E.*\.\Q$type\E)/ig;
	print "$_\n";

	my $resource = '"'.$_.'"';
	#print "$_\n";

	

	#print "$_\n";
    $_ =~ s/(\Q$dir\E)\\\Q$type\E/$1\\\Q$suffix1\E/gi;
	$_ =~ s/(.*)\\.*\.tga/$1/gi;
	#PSD dir
	my $destination1 = $_;
    $destDir1 = $destination1;
	$destination1 = '"'.$destination1.'"';
	`md $destination1` if(!(-e $destDir1));

	print "$resource\t$destination1\n";
	
	#change work dir
	chdir($basedir);
	
	#filter some sharpening error png.
	#if($resource =~ /newtown_terrain\.png/) { next;};
	
	#1.copy the png and backup.
	system("copy /y $resource $destination1");

}
close FILE;
