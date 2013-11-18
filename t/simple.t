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
  return "Hello $name";
}

package main;

use Test::More;

my $obj = MyGreeter->new;
isa_ok $obj, 'MyGreeter';
is $obj->greet('Joel'), 'Hello JOEL';

done_testing;


