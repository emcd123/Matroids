use strict;
use warnings;

my @edge_set = ('AB', 'BC','AC');
my @vertices = ('A', 'B', 'C', 'D');
my $index = 0;

sub DFS{
my @discovered = ($vertices[$index]);
my @components = ();
my $startvertex = $vertices[$index];
foreach my $e (@edge_set){
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
	print "Acyclic";
	return 0;
}
else{
	print "Not Acyclic";
	return 1;
}
}

while($index <= 3){
DFS(@edge_set,@vertices);
}