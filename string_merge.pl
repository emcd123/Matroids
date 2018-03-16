use strict;
use warnings;

my @edge_set = ('AB', 'BC','AC');
my @vertices = ('A', 'B', 'C', 'D');
my $index = 0;

my @connected_components = [];
my $discoveredSize = 0;

sub DFS{
	my @discovered = ('A');
	my @components = ();
	my $startvertex = $vertices[$index];
	foreach my $e (@edge_set){
		my @edge = split(//, $e);
		if($startvertex eq $edge[0]){
			push @discovered, $edge[1];
			push @components, @edge;
		}
	}
	push @connected_components, @components;
	$discoveredSize = @discovered;
}


$index = $index +1;
#print $index;
for(my $i=0; $i< @connected_components; $i++){
	print $connected_components[$i];
}
foreach my $j (@connected_components){
	my $componentsSize = $j;
	if($discoveredSize = $componentsSize - 1){
		print "Acyclic";
		#return 0;
	}
	else{
		print "Not Acyclic";
		#return 1;
	}
}

while($index <= 3){
DFS(@edge_set,@vertices);
}