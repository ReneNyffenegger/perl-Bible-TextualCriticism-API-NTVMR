# Encoding and name #_{

=encoding utf8
=head1 NAME

Bible::TextualCriticism::API::NTVMR - Access the API of the I<New Testament Virtiual Manuscript Room>.

=cut
package Bible::TextualCriticism::API::NTVMR;
#_}
#_{ use …
use warnings;
use strict;

use utf8;
use Carp;

#_}
our $VERSION = 0.01;
#_{ Synopsis

=head1 SYNOPSIS

    …

=cut
#_}
#_{ Overview

=head1 OVERVIEW

…

=cut

#_}
#_{ Methods

=head1 METHODS
=cut

sub new { #_{
#_{ POD

=head2 new

    my $ntvmr = Bible::TextualCriticism::API::NTVMR->new();

=cut

#_}

  my $class = shift;

  my $self = {};
  bless $self, $class;

  return $self;

} #_}

#_}
#_{ POD: Author

=head1 AUTHOR

René Nyffenegger

=cut

#_}
#_{ POD: Copyright and license

=head1 COPYRIGHT AND LICENSE

Copyright © 2017 René Nyffenegger, Switzerland. All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at: L<http://www.perlfoundation.org/artistic_license_2_0>

=cut

#_}
#_{ POD: Source Code

=head1 Source Code

The source code is on L<< github|https://github.com/ReneNyffenegger/perl-Bible-TextualCriticism-API-NTVMR >>. Meaningful pull requests are welcome.

=cut

#_}

'tq84';
