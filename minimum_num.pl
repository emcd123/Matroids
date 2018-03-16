use warnings;
use strict;

my @arr = (1,3,4,6,2,3,9);

my $min_edge = 10;
foreach my $i (@arr){
	if( $i < $min_edge){
		$min_edge = $i;
	}
}
#print $min_edge;

my $temp_edge = 'AB';
sub MatchVertexEdge{
	my $ver_edge = $temp_edge;
	my @edge_components = split(//, $ver_edge);
	#print @edge_components;
	foreach my $vertex (@edge_components){
		push @{$FOREST{$vertex}}, 
	}
}
MatchVertexEdge($temp_edge);
