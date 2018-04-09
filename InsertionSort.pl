use strict;
use warnings;

my @li = (31, 46, 10, 6, 23, 9, 29, 19, 3, 46);
sub InsertionSort{
	my $i = 1;
	while($i < scalar @li){
		my $j = $i;
		while($j>0 && $li[$j-1] > $li[$j]){
			use Data::Alias;
			alias @li[$j,$j-1] = @li[$j-1,$j];
			#$li[$j], $li[$j-1] = $li[$j-1], $li[$j];
			$j = $j-1;
		}
		$i = $i+1;
	}
}

InsertionSort(@li);
foreach my $i (@li){
	print $i, "\n";
}