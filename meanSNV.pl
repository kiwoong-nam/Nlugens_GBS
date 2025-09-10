use strict;

my $fI='/home/knam/work/Nlugens_GBS/Revision/FST/bg.windowed.weir_untruncated.fst';
my $fO='/home/knam/work/Nlugens_GBS/Revision/FST/meanSNV.txt';

my $B=1000;
my @val;

open my $fd,$fI;
while(<$fd>)
{
	my @s=split("\t",$_);
	push @val,$s[3];
}
close $fd;

my $bg=M(@val);

my @bts;
for(my $b=0;$b<$B;$b++)
{
	my @bv;
	for(my $i=0;$i<=$#val;$i++)
	{
		push @bv,$val[int rand $#val]
	}
	my $bs=M(@bv);
	push @bts,$bs
}

my $nw=$#val+1;
@bts=sort {$a <=> $b} @bts;

my $res="$bg $bts[25] $bts[975] $nw";

print $res;


sub M
{
	(my @va)=(@_);
	
	my $s;
	my $n;

	foreach my $v (@va)
	{
		$n++;
		$s+=$v;
	}
	my $m=$s/$n;
	return $m;
}

