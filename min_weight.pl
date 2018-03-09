use strict;
use warnings;

use Data::Dumper qw(Dumper);
use Tie::IxHash;

my $MAX_WEIGHT = 10;
#Implementing Kruskal's algorithm
#Finding a maximal weight spanning tree in a undirected weighted graph

my @V = ('A', 'B', 'C', 'D');
my @E = ('ab', 'ac', 'ad', 'bd', 'bc', 'cd');

my %WEIGHTS;
tie %WEIGHTS, 'Tie::IxHash';
foreach my $i (@E){
  	my $range = $MAX_WEIGHT;
  	my $random_number = int(rand($range));
	$WEIGHTS{$i} =  $random_number;
}
print Dumper(\%WEIGHTS);

my %TEMP;
tie %TEMP, 'Tie::IxHash';
foreach my $k (@E){
	$TEMP{$k} = $WEIGHTS{$k};


sub MinWeightEdge{
	my $min_weight_edge = $MAX_WEIGHT;
	my $min_key = 0; 
	foreach my $var (keys %TEMP) {
		if ($TEMP{$var} < $min_weight_edge) {
			$min_weight_edge = $TEMP{$var};
			$min_key = $var;		
			print $min_key;
		}
	#print "\n" ,'Min weight: ', $min_weight_edge;
	#push @{$FOREST{$index}}, $min_weight_edge;
	#print $TEMP{$min_key};
	delete $TEMP{$min_key};
	#print Dumper(\%TEMP);
	}
}


MinWeightEdge(%TEMP);

exit;
