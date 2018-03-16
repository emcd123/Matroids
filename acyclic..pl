sub AcyclicCheck {
	my @edge_set = ();
	foreach my $vertex (keys %FOREST){
		my $length = scalar( @{ $FOREST{$vertex} } );
		for ( my $m = 0; $m < $length; $m++) {
			push @edge_set, $FOREST{$vertex}[$m];
		}
	}
	my @uniq_edgeset = uniq(@edge_set);
	my @vertices = @V;

	sub Acyclic{
		my @discovered = ('A');
		my $index = 0;
		my $start = 'A';
		my @connected_component = ();
		sub DFS{
			foreach my $e (@uniq_edgeset){
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
	if(scalar @discovered == scalar @connected_component - 1){
		return 0;
	}
	else{
		return 1;
	}
	}
	Acyclic();
}	
exit;