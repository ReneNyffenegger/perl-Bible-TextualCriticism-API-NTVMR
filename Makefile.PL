#!/usr/bin/perl
use 5.006;
use strict;
use warnings;
use utf8;

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Bible::TextualCriticism::API::NTVMR',
    AUTHOR           => q{René Nyffenegger <rene.nyffenegger@adp-gmbh.ch>},
    VERSION_FROM     => 'lib/Bible/TextualCriticism/API/NTVMR.pm',
    ABSTRACT_FROM    => 'lib/Bible/TextualCriticism/API/NTVMR.pm',
    LICENSE          => 'artistic_2',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    PREREQ_PM => {
#     '' => 0
    },
    BUILD_REQUIRES => {
        'Test::Simple' => 0,
        'Test::More'   => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Bible-TextualCriticism-API-NTVMR-*' },
);
