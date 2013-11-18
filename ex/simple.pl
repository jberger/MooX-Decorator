#!/usr/bin/env perl

use strict;
use warnings;

package MyGreeter; 
use Moo;
use MooX::Decorator;

sub capitalize {
  return sub {
    my $orig = shift;
    my $self = shift;
    return $self->$orig(map {uc} @_);
  }
}

decorate capitalize
sub greet {
  my ($self, $name) = @_;
  print "Hello $name\n";
}

package main;

my $obj = MyGreeter->new;
$obj->greet('Joel');

