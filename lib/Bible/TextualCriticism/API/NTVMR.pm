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

use HTTP::Request;
use LWP::UserAgent;
use XML::XPath;

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

  $self->{ua} = LWP::UserAgent->new();

  return $self;

} #_}
sub manuscripts { #_{
#_{ POD

=head2 new

    my @manuscripts = $ntvmr -> manuscripts;

Returns the list of manuscripts.

The elements in C<< @manuscripts >> are references to a hash with the following keys:

    for my $doc (@manuscripts) {

      $doc->{docID};
      $doc->{primaryName}; # e.g. P19, 02, 212, l 1, sa 8, Syr1, Eth1, Arm1, ms.or.377, Ra 2038 etc.
      $doc->{gaNum};       # The Gregory Aland number (P1 etc.)
      $doc->{orig};        # e.g. III, VI/VII, III(A) etc. orig seems to indicate the century of assumed(?) writing the manuscript.
      $doc->{lang};        # e.g. grc.  The language of the manuscript.

    }

=cut

#_}

  my $self = shift;
  my $resp = $self->_request('metadata/liste/get/');


  my $xp = XML::XPath->new(xml => $resp->content);

# my $manuscript_count = $xp->findvalue('/manuscripts/@count');
# print "manuscript_count = $manuscript_count\n";

  my @ret;
  my @doc_nodes = $xp->findnodes('/manuscripts/manuscript');

  for my $doc_node (@doc_nodes) {

    my $doc = {};
    for my $attrib_name (qw(docID primaryName gaNum orig v11n lang)) { # Apparently, the attributes userID, groupID and v11n are always empty

      my $attrib_value = $doc_node->findvalue("\@$attrib_name");
#     print "$attrib_name -> $attrib_value\n" if $attrib_value eq 'userID'  and $attrib_value;
#     print "$attrib_name -> $attrib_value\n" if $attrib_value eq 'groupID' and $attrib_value;
#     print "$attrib_name -> $attrib_value\n" if $attrib_value eq 'v11n' and $attrib_value;

      $doc->{$attrib_name} = $attrib_value;
    }
    push @ret, $doc;

  }

  return @ret;

} #_}
sub _request { #_{
#_{ POD

=head2 _request

    my $resp = $self->_request('metadata/liste/get/)'; 

Internal function to request a resource.

=cut

#_}
  
  my $self = shift;
  my $path = shift;

  my $req  = HTTP::Request->new(GET=>"http://ntvmr.uni-muenster.de/community/vmr/api/$path");
  my $resp = $self->{ua}->request($req);

  if ($resp->code != 200) {
    croak "path $path caused " . $resp->code . " " . $resp->message;
    return;
  }

# resp is a HTTP::Response
# print "resp = $resp\n";

  return $resp;

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
