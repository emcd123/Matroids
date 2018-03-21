use strict;
#use warnings;

use Data::Dumper qw(Dumper);
use Tie::IxHash;
use List::MoreUtils qw(uniq);

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
#print Dumper(\%FOREST);

my %TEMP;
tie %TEMP, 'Tie::IxHash';
foreach my $k (@E){
	$TEMP{$k} = $WEIGHTS{$k};
}

sub Kruskal{
	my $vertex_count = @V;
	my $temp_edge = 'OO';
	while ($vertex_count > 1) {
		sub MinWeightEdge{
			my $min_weight_edge = $MAX_WEIGHT;
			my $min_key = 0;
			foreach my $var (keys %TEMP) {
				if (($TEMP{$var} < $min_weight_edge)) {
						$min_weight_edge = $TEMP{$var};
						$min_key = $var;		
				}
			}
			delete $TEMP{$min_key};
			$vertex_count = $vertex_count - 1;
			return $min_key;
		}	
		$temp_edge = MinWeightEdge(%TEMP, %FOREST);

		sub MatchVertexEdge{
			my $ver_edge = $temp_edge;
			my @edge_components = split(//, $ver_edge);
			foreach my $vertex (@edge_components){
				push @{$FOREST{$vertex}}, $ver_edge;
			}
		}
		MatchVertexEdge($temp_edge, %FOREST);
	}
	
	if(AcyclicCheck() == 0){
			print Dumper(\%FOREST);
	    return "This Graph is Acyclic \n";
	}
	else{
		Kruskal();
	}
}
print Kruskal();

sub AcyclicCheck {
	my @edge_set = ();
	foreach my $vertex (keys %FOREST){
		my $length = scalar( @{ $FOREST{$vertex} } );
		for ( my $m = 0; $m < $length; $m++) {
			push @edge_set, $FOREST{$vertex}[$m];
		}
	}
	my @uniq_edgeset = uniq(@edge_set);
	sub Acyclic{
		my @edge_set = @uniq_edgeset;
		my @vertices = @V;
		my @discovered = ('A');
		my $index = 0;
		my $start = 'A';
		my @connected_component = ();

		sub DFS{
			foreach my $e (@edge_set){
				my @edge = split(//, $e);
				if($discovered[$index] eq $edge[0]){
					my $edge = $edge[1];
					if ( grep( /^$edge$/, @discovered ) ) {
						push @connected_component, $e;
					}
					else{
						push @discovered, $edge;
						push @connected_component, $e;
					}	
				}
			}
			$index = $index + 1;
			$start = $discovered[$index];
			if($index < scalar @vertices + 1){
				return DFS();
			}
		}
		DFS();
		if(scalar @discovered > scalar @connected_component){
			return 0;
		}
		else{
			return 1;
		}
	}
	return Acyclic();
}	
exit;
