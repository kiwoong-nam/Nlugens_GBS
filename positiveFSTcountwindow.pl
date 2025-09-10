use strict;

my $input="/home/knam/work/Nlugens_GBS/Revision/FST/bg.windowed.weir.fst";
my $output="/home/knam/work/Nlugens_GBS/Revision/FST/bg.fsthigherthanzero.txt";

my $prechr='d';
my @FSTs;
my @FSTs_A;
my @FSTs_X;
my @FSTs_Y;

open my $fd,$input;
while(<$fd>)
{
	$_=~s/\n//g;
	my @single=split("\t",$_);
	push @FSTs,$single[4];

	if($single[0] eq 'chrX') {push @FSTs_X,$single[4]}
	elsif($single[0] eq 'chrY') {push @FSTs_Y,$single[4]}
	else {push @FSTs_A,$single[4]}
	
	if($single[0] ne $prechr)
	{
		pop @FSTs;
		pop @FSTs_X;
		pop @FSTs_Y;
		pop @FSTs_A;
		print "$single[0]\n";
		$prechr=$single[0];
	}
}

my $res="total\t".ck(@FSTs);#."\nAuto\t".ck(@FSTs_A)."\nX\t".ck(@FSTs_X)."\nY\t".ck(@FSTs_Y)."\n";

open my $fd,">$output";
print $fd $res;
close $fd;

sub ck
{
	(my @val)=(@_);
	my $ps=0;
	my $ns=0;
	foreach my $f (@val)
	{
		if($f > 0) {$ps++}
		else {$ns++}
	}
	my $total=$ps+$ns;
	my $prop=$ps/$total;
	return "$ps $total $prop";
}
	
