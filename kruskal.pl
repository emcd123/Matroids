use strict;
use warnings;

use Data::Dumper qw(Dumper);
use Tie::IxHash;

my $MAX_WEIGHT = 10;
#Implementing Kruskal's algorithm
#Finding a minimal weight spanning tree in a undirected weighted graph

my @V = ('A', 'B', 'C', 'D');
my @E = ('AB', 'AC', 'AD', 'BD', 'BC', 'CD');

my %WEIGHTS;
tie %WEIGHTS, 'Tie::IxHash';
foreach my $i (@E){
  	my $range = $MAX_WEIGHT;
  	my $random_number = int(rand($range));
	$WEIGHTS{$i} =  $random_number;
}
print Dumper(\%WEIGHTS);

my %FOREST;
tie %FOREST, 'Tie::IxHash';
foreach my $j (@V){
	$FOREST{$j} = [];
}
print Dumper(\%FOREST);

my %TEMP;
tie %TEMP, 'Tie::IxHash';
foreach my $k (@E){
	$TEMP{$k} = $WEIGHTS{$k};
}
print Dumper(\%TEMP);

my $vertex_count = @V;

my $temp_edge = 'OO';
while ($vertex_count > 1) {
	sub MinWeightEdge{
		my $min_weight_edge = $MAX_WEIGHT;
		my $min_key = 0;
		foreach my $var (keys %TEMP) {
			if ($TEMP{$var} < $min_weight_edge) {
				$min_weight_edge = $TEMP{$var};
				$min_key = $var;		
				#print $min_key;
			}
		}
		delete $TEMP{$min_key};
		$vertex_count = $vertex_count - 1;
		return $min_key;
	}	
	$temp_edge = MinWeightEdge(%TEMP, %FOREST);

	sub MatchVertexEdge{
		my $ver_edge = $temp_edge;
		print $ver_edge;
		my @edge_components = split(//, $ver_edge);
		foreach my $vertex (@edge_components){
			push @{$FOREST{$vertex}}, $ver_edge;
		}
	}
	MatchVertexEdge($temp_edge, %FOREST);
}
print Dumper(\%FOREST);
#print Dumper(\%TEMP);
acyclic(%FOREST);

sub acyclic {
	my @Discovered = ();
	my @edge_set = ();
	foreach my $vertex (keys %FOREST){
		my $length = scalar( @{ $FOREST{$vertex} } );
		for ( my $m = 0; $m < $length; $m++) {
			push @edge_set, $FOREST{$vertex}[$m];
		}
	}
}
exit;