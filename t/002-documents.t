use warnings;
use strict;

use Test::More tests => 4;

use Bible::TextualCriticism::API::NTVMR;

my $ntvmr = Bible::TextualCriticism::API::NTVMR->new();

my @documents = $ntvmr->documents;

ok(scalar @documents >= 6042);

for my $doc (@documents) {

  if ($doc->{docID} == 10001) {

    is($doc->{primaryName}, 'P1' );
    is($doc->{gaNum      }, 'P1' );
    is($doc->{orig       }, 'III');

  }

}
