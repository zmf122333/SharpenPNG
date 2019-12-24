#!/usr/bin/perl -w
use File::Basename;


my $suffix1="png";    #pic suffix.
my $total=4835;		  #pic number.
my $firstLine="D:\\proj.unity\\Assets\\00000000000051.png";
my $suffix2="png_hd";
my $suffix3="png_smooth";
my $suffix4="png_fast";
my $dir="C:\\Users\\Administrator\\Desktop\\sharpenning"; #work dir

my $basedir=dirname(__FILE__);
my $path1=$dir."\\".$suffix1;
my $path2=$dir."\\".$suffix2;
my $path3=$dir."\\".$suffix3;
my $path4=$dir."\\".$suffix4;
`md "$path1"`  if !(-e "$path1");
`md "$path2"`  if !(-e "$path2");
`md "$path3"`  if !(-e "$path3");
`md "$path4"`  if !(-e "$path4");
my $destDir1;
my $destFile1;
my $destDir2;
my $destFile2;
my $destDir3;
my $destFile3;
my $destDir4;
my $destFile4;
my $line;
my $line_file;


sub hd_version($$$){
	my ($srcDir,$desDir,$file) = @_;
	my $fileName=$file;
	$fileName =~ s/\.png//i;
	my $srcPng = '"'.$srcDir."\\".$file.'"';
	my $tmpPng = $srcDir."\\".$fileName."HD.png";
	
	print "HD:srcPng:\t$srcPng\n";
	print "HD:tmpPng:\t$tmpPng\n";
	if($file eq '1010.png'){
		print "1010.png\n";
		system("$dir\\pngquant.exe --force --speed=1 --quality=80-100  $srcPng --ext HD.png");
		return;
	}	
	if($file eq 'skill_17.png'){
		print "skill_17.png\n";
		system("$dir\\pngquant.exe --force --speed=1 --quality=80-100  $srcPng --ext HD.png");
		return;
	}
	if($file eq '102_206_80.png'){
		print "102_206_80.png\n";
		system("$dir\\pngquant.exe --force --speed=3 --quality=65-100  $srcPng --ext HD.png");
		return;
	}
	
	print "HD 1,100\n";
	system("$dir\\pngquant.exe --force --speed=1 --quality=100  $srcPng --ext HD.png");
	if(!(-e $tmpPng)){
		print "HD 1,100 crush, reduce quality min to 80\n";
		system("$dir\\pngquant.exe --force --speed=1 --quality=80-100  $srcPng --ext HD.png");
		if(!(-e $tmpPng)){
			print "HD 1,80-100 crush, reduce speed to 11\n";
			system("$dir\\pngquant.exe --force --speed=11 --quality=80-100  $srcPng --ext HD.png");
			if(!(-e $tmpPng)){
				print "HD 11,80-100 crush, reduce quality min to 70\n";
				system("$dir\\pngquant.exe --force --speed=1 --quality=70-100  $srcPng --ext HD.png");
				if(!(-e $tmpPng)){
					print "HD 1,70-100 crush, reduce speed to 11\n";
					system("$dir\\pngquant.exe --force --speed=11 --quality=70-100  $srcPng --ext HD.png");
					if(!(-e $tmpPng)){
						print "HD 11,70-100 crush, reduce quality min to 60\n";
						system("$dir\\pngquant.exe --force --speed=1 --quality=60-100  $srcPng --ext HD.png");
						if(!(-e $tmpPng)){
							print "HD 1,60-100 crush, reduce speed to 11\n";
							system("$dir\\pngquant.exe --force --speed=11 --quality=60-100  $srcPng --ext HD.png");
							if(!(-e $tmpPng)){
								print "HD 11,60-100 crush, reduce quality min to 55\n";
								system("$dir\\pngquant.exe --force --speed=1 --quality=55-100  $srcPng --ext HD.png");
								if(!(-e $tmpPng)){
									print "HD Fail at:\t$srcPng\n";
								}
							}
						}
					}
				}
			}
		}
	}
	if(-e $tmpPng){
		print "Sharpen HD OK!\n";
		`move "$tmpPng" "$desDir"`;
	}
}

sub smooth_version($$$){
	my ($srcDir,$desDir,$file) = @_;
	my $fileName=$file;
	$fileName =~ s/\.png//i;
	my $srcPng = '"'.$srcDir."\\".$file.'"';
	my $tmpPng = $srcDir."\\".$fileName."SMOOTH.png";
	
	print "SMOOTH:srcPng:\t$srcPng\n";
	print "SMOOTH:tmpPng:\t$tmpPng\n";
	
	print "SMOOTH 1,50\n";
	system("$dir\\pngquant.exe --force --speed=1 --quality=50  $srcPng --ext SMOOTH.png");
	if(!(-e $tmpPng)){
			print "SMOOTH 1,50 crush, reduce quality min to 40\n";
			system("$dir\\pngquant.exe --force --speed=1 --quality=40-50  $srcPng --ext SMOOTH.png");
			if(!(-e $tmpPng)){
				print "SMOOTH 1,40-50 crush, reduce speed to 11\n";
				system("$dir\\pngquant.exe --force --speed=11 --quality=40-50  $srcPng --ext SMOOTH.png");
				if(!(-e $tmpPng)){
					print "SMOOTH 11,40-50 crush, reduce quality min to 30\n";
					system("$dir\\pngquant.exe --force --speed=1 --quality=30-50  $srcPng --ext SMOOTH.png");
					if(!(-e $tmpPng)){
						print "SMOOTH 1,30-50 crush, reduce speed to 11\n";
						system("$dir\\pngquant.exe --force --speed=11 --quality=30-50  $srcPng --ext SMOOTH.png");
						if(!(-e $tmpPng)){
							print "SMOOTH 11,30-50 crush, reduce quality min to 20\n";
							system("$dir\\pngquant.exe --force --speed=1 --quality=20-50  $srcPng --ext SMOOTH.png");
							if(!(-e $tmpPng)){
								print "SMOOTH 1,20-50 crush, reduce speed to 11\n";
								system("$dir\\pngquant.exe --force --speed=11 --quality=20-50  $srcPng --ext SMOOTH.png");
								if(!(-e $tmpPng)){
									print "SMOOTH 11,20-50 crush, reduce quality min to 10\n";
									system("$dir\\pngquant.exe --force --speed=1 --quality=10-50  $srcPng --ext SMOOTH.png");
									if(!(-e $tmpPng)){
										print "SMOOTH 1,10-50 crush, reduce speed to 11\n";
										system("$dir\\pngquant.exe --force --speed=11 --quality=10-50  $srcPng --ext SMOOTH.png");
										if(!(-e $tmpPng)){
											print "SMOOTH Fail at:\t$srcPng\n";
										}
									}
								}
							}
						}
					}
				}
			}
	}
	if(-e $tmpPng){
		print "Sharpen SMOOTH OK!\n";
		`move "$tmpPng" "$desDir"`;
	}
}

sub fast_version($$$){
	my ($srcDir,$desDir,$file) = @_;
	my $fileName=$file;
	$fileName =~ s/\.png//i;
	my $srcPng = '"'.$srcDir."\\".$file.'"';
	my $tmpPng = $srcDir."\\".$fileName."FAST.png";
	
	print "FAST:srcPng:\t$srcPng\n";
	print "FAST:tmpPng:\t$tmpPng\n";
	
	print "FAST 1,3\n";
	system("$dir\\pngquant.exe --force --speed=1 --quality=3  $srcPng --ext FAST.png"); 
	if(-e $tmpPng){
		print "Sharpen FAST OK!\n";
		`move "$tmpPng" "$desDir"`;
	}else{
		print "FAST Fail at:\t$srcPng\n";
	}
}

if(open(NUM_READ,"<","$dir\\$suffix1"."_line.txt")){
	my $num = <NUM_READ>;
	chomp($num);
	$num =~ /^(\d+)\t(.*)$/;
	$line=$1;
	$line_file=$2;
	if($line == $total){
		$line=1;
		$line_file=$firstLine;
	}
}else{
	$line=1;
	$line_file=$firstLine;
}
close NUM_READ;

open(FILE,"<","$dir\\$suffix1.txt")||die"cannot open the file: $!\n";
my $i=0;
while (<FILE>){
	chomp;
	$i++;
	if(($_ ne $line_file) && ($i<$line) ){
		next;
	}
	
	print "$i\t$_\n";
	#log the last task point.
	open(NUM_WRITE,">","$dir\\$suffix1"."_line.txt")||die"cannot open the file: $!\n";
	print NUM_WRITE "$i\t$_";
	close NUM_WRITE;
	my $resource = '"'.$_.'"';
	if($_=~/^(.*\\)(.*)$/){
		$destFile1 = $2;
		if($destFile1 eq "03020_.png"){
			$destFile1 = "03020_!.png";
			$resource =~ s/03020_\.png/03020_!\.png/;
		}
	}

	$_=~s/^(.*)\\.*?\.\Q$suffix1\E$/$1/i;
	$_=~s/^.*proj\.unity\\//;
	
	#PNG dir
	my $destination1 = $dir."\\".$suffix1."\\".$_;
	if($resource =~ /(AA.*effect.*00987.png)/){
		$destination1=$dir."\\".$suffix1."\\Assets\\TEX\\";
		$destDir1 = $dir."\\".$suffix1."\\Assets\\TEX\\";
		$destFile1 = $1;
	}
    $destDir1 = $destination1;
	$destination1 = '"'.$destination1.'"';
	`md $destination1` if(!(-e $destDir1));

	#PNG_HD dir
	my $destination2 = $dir."\\".$suffix2."\\".$_;
	if($resource =~ /(AA.*effect.*00987.png)/){
		$destination2=$dir."\\".$suffix2."\\Assets\\TEX\\";
		$destDir2 = $dir."\\".$suffix2."\\Assets\\TEX\\";
	}
    $destDir2 = $destination2;
	$destination2 = '"'.$destination2.'"';
	`md $destination2` if(!(-e $destDir2));

	#PNG_SMOOTH dir
	my $destination3 = $dir."\\".$suffix3."\\".$_;
	if($resource =~ /(AA.*effect.*00987.png)/){
		$destination3=$dir."\\".$suffix3."\\Assets\\TEX\\";
		$destDir3 = $dir."\\".$suffix3."\\Assets\\TEX\\";
	}
    $destDir3 = $destination3;
	$destination3 = '"'.$destination3.'"';
	`md $destination3` if(!(-e $destDir3));
	
	#PNG_FAST dir
	my $destination4 = $dir."\\".$suffix4."\\".$_;
	if($resource =~ /(AA.*effect.*00987.png)/){
		$destination4=$dir."\\".$suffix4."\\Assets\\TEX\\";
		$destDir4 = $dir."\\".$suffix4."\\Assets\\TEX\\";
	}
    $destDir4 = $destination4;
	$destination4 = '"'.$destination4.'"';
	`md $destination4` if(!(-e $destDir4));
	
	
	#change work dir
	chdir($basedir);
	
	#filter some sharpening error png.
	if($resource =~ /newtown_terrain\.png/) { next;};
	
	#1.copy the png and backup.
	system("copy /y $resource $destination1");
	#2.PNG_HD sharpening.
   # hd_version($destDir1,$destDir2,$destFile1);
	#3.PNG_SMOOTH sharpening.
   # smooth_version($destDir1,$destDir3,$destFile1);
	#4.PNG_FAST sharpening.
    fast_version($destDir1,$destDir4,$destFile1);
}
close FILE;
