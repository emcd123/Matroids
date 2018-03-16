my @arr = ('A','B');

my $edge = 'D';
if ( grep( /^$edge$/, @arr ) ) {
	print "found it";
}
else{
	print "Not there";
}