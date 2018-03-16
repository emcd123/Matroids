use strict;
use warnings;

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
print Dumper(\%FOREST);

my %TEMP;
tie %TEMP, 'Tie::IxHash';
foreach my $k (@E){
	$TEMP{$k} = $WEIGHTS{$k};
}
#print Dumper(\%TEMP);

my $vertex_count = @V;
my $temp_edge = 'OO';
while ($vertex_count > 1) {
	sub MinWeightEdge{
		my $min_weight_edge = $MAX_WEIGHT;
		my $min_key = 0;
		foreach my $var (keys %TEMP) {
			if (($TEMP{$var} < $min_weight_edge)) {
				#if(acyclic(%FOREST) == 0){
					$min_weight_edge = $TEMP{$var};
					$min_key = $var;		
				#}
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
print Dumper(\%FOREST);
if(acyclic(%FOREST,@V) == 0){
	print "Acyclic";
}

sub acyclic {
	my @Discovered = ();
	my @edge_set = ();
	foreach my $vertex (keys %FOREST){
		my $length = scalar( @{ $FOREST{$vertex} } );
		for ( my $m = 0; $m < $length; $m++) {
			push @edge_set, $FOREST{$vertex}[$m];
		}
	}
	my @uniq_edgeset = uniq(@edge_set);
	my @vertices = @V;
	my $index = 0;

	sub DFS{
		my @discovered = ($vertices[$index]);
		my @components = ();
		my $startvertex = $vertices[$index];
		foreach my $e (@uniq_edgeset){
			my @edge = split(//, $e);
			if($startvertex eq $edge[0]){
				push @discovered, $edge[1];
				push @components, @edge;
			}
		}
		my $discoveredSize = @discovered;
		my $componentsSize = @components;

		$index = $index +1;
		#print $index;
		if($discoveredSize = $componentsSize - 1){
			#print "Acyclic";
			return 0;
		}
		else{
			#print "Not Acyclic";
			return 1;
		}
	}
	while($index <= 3){
	DFS(@uniq_edgeset,@vertices);
	}
}
exit;