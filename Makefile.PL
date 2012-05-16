
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Tapper - Tapper specific TAP handling",
  "AUTHOR" => "AMD OSRC Tapper Team <tapper\@amd64.org>",
  "BUILD_REQUIRES" => {
    "File::Slurp" => 0,
    "TAP::DOM" => 0,
    "Test::Deep" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Tapper-TAP-Harness",
  "EXE_FILES" => [],
  "LICENSE" => "open_source",
  "NAME" => "Tapper::TAP::Harness",
  "PREREQ_PM" => {
    "Archive::Tar" => 0,
    "Data::Dumper" => 0,
    "Directory::Scratch" => 0,
    "File::Temp" => 0,
    "IO::Scalar" => 0,
    "IO::String" => 0,
    "Moose" => 0,
    "TAP::Parser" => 0,
    "TAP::Parser::Aggregator" => 0,
    "YAML::Tiny" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "4.0.1",
  "test" => {
    "TESTS" => "t/*.t t/backcompat/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



