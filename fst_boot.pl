use strict;
use List::Util qw(shuffle); 


my $B=1000;
my $invcf='/home/kiwoong/Projects/Nlugens_GBS/SNV/BPH454_0.4.vcf.gz';
my $OD='/home/kiwoong/Projects/Nlugens_GBS/FST/rand';
my $P1F='/home/kiwoong/Projects/Nlugens_GBS/FST/Pop1.txt';
my $P2F='/home/kiwoong/Projects/Nlugens_GBS/FST/Pop2.txt';
my $rP1F='/home/kiwoong/Projects/Nlugens_GBS/FST/rand/Pop1.txt';
my $rP2F='/home/kiwoong/Projects/Nlugens_GBS/FST/rand/Pop2.txt';

my @ids;

my $np1=0;
open my $fd,$P1F;
while(<$fd>)
{
	if($_=~/\w/)
	{
		push @ids,$_;
		$np1++;	
	}
}
close $fd;

open my $fd,$P2F;
while(<$fd>)
{
	if($_=~/\w/) { push @ids,$_;}
}
close $fd;

for(my $b=0;$b<$B;$b++)
{
	print "$b\n\n\n\n\n\n\n";
	
	@ids = shuffle(@ids); 
	my @rBP1=@ids[0..($np1-1)];
	my @rBP2=@ids[($np1)..($#ids)];
	
	open my $fd,">$rP1F";
	print $fd @rBP1;
	close $fd;
	
	open my $fd,">$rP2F";
	print $fd @rBP2;
	close $fd;

	`vcftools --gzvcf $invcf --weir-fst-pop $rP1F --weir-fst-pop $rP2F --out /home/kiwoong/Projects/Nlugens_GBS/FST/rand/rand.$b --fst-window-size 1000000000`;
	`rm $rP1F $rP2F /home/kiwoong/Projects/Nlugens_GBS/FST/rand/rand.$b.windowed.weir.fst`;

}



