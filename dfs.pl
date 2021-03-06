use strict;

my @edge_set = ('AB','AC', 'EF');
my @vertices = ('A', 'B', 'C', 'D', 'E', 'F');

my @discovered = ('A');

my $index = 0;
my $start = 'A';
my @connected_component = ();
sub DFS{
=begin comment
	  procedure DFS(G,v):
      label v as discovered
      for all edges from v to w in G.adjacentEdges(v) do
          if vertex w is not labeled as discovered then
              recursively call DFS(G,w)
=end comment
=cut
	foreach my $e (@edge_set){
		my @edge = split(//, $e);
		if($discovered[$index] eq $edge[0]){
			my $edge = $edge[1];
			#print $edge;
			if ( grep( /^$edge$/, @discovered ) ) {
				push @connected_component, $e;
 	#			print "found it";
			}
			else{
	#			print "Add to discovered";
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
foreach my $i (@discovered){
	print $i, "\n";
}

foreach my $c (@connected_component){
	print $c, "\n";
}
if(scalar @discovered > scalar @connected_component){
	print "Acyclic";
}
else{
	print "Not acyclic";
}