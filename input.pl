use strict;

my $input='/home/kiwoong/Projects/Nlugens_GBS/Revision/SNV/BPH454_0.5.vcf.gz';
my $output='/home/kiwoong/Projects/Nlugens_GBS/Revision/hierfst/input/geno.txt';

my @geno;
my $j=0;
open my $fd,"zcat $input |";
L:while(<$fd>)
{
	if($_=~/#/) {next}
	$_=~s/\n//;
	my @s=split("\t",$_);
	for(my $i=0;$i<9;$i++) {shift @s};	

	for(my $i=0;$i<=$#s;$i++)
	{
		my $si=$s[$i];
		$si=~s/\:.*$//;
		$si=~s/\///;
		if($si=~/\./) {$si='NA'}
		$geno[$i].="$si\t";
	}
	$j++;
	if($j%100==0) {	print "$j\n";}
}

my $GN=join("\n",@geno);
$GN=~s/\t\n/\n/g;

open my $fd,">$output";
print $fd $GN;
close $fd;



