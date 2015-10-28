#!/usr/bin/env perl

use strict;
use warnings;
use v5.14;

use File::Slurp::Tiny qw(read_lines);

my $file_name = shift || "place-language.csv";

my @rows=read_lines($file_name);

die "Nada por aquí" if !@rows;

shift @rows;

my %devs;

for my $r (@rows) {
  chomp($r);
  my ( $scope, $language ) = split(",", $r );
  $devs{$scope}{$language}++
}

for my $k ( keys %devs ) {
  for my $q ( keys %{$devs{$k}} ) {
    say "$k,$q,$devs{$k}{$q}";
  }
}
