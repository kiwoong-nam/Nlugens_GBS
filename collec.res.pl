use strict;

my $WD='/home/knam/work/Nlugens_GBS/Revision/SweeD/res';
my $fO="$WD/mergedres.txt";

my @chrs;
for(my $i=1;$i<15;$i++) {push @chrs,$i}
push @chrs,"X";

my %POS;
opendir my $D,$WD;
while(readdir($D))
{
	unless($_=~/SweeD_Report.P(\d).(\w+)/) {next}

	my $gr="group$1";
	my $chro=$2;

	open my $fd,"$WD/$_";
	while(<$fd>)
	{
		unless($_=~/^\d+/) {next}
		$_=~s/\n//g;
		my @s=split("\t",$_);
		my $p=shift @s;
		my $l=shift @s;
		my $ky="$gr\t$chro";
		$POS{$ky}.="$gr\tchr$chro\t$p\t$l\n";
	}
	close $fd;
}

my $res="group\tchrN\tpos\tl\n";
foreach my $ch (@chrs)
{
	my $k="group1\t$ch";
	$res.="$POS{$k}\n";
}

foreach my $ch (@chrs)
{
	my $k="group2\t$ch";
	$res.="$POS{$k}\n";
}

$res=~s/\n\n/\n/g;
$res=~s/\n$//g;

open my $fd,">$fO";
print $fd $res;
close $fd;
