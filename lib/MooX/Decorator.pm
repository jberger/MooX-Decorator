package MooX::Decorator;

use strict;
use warnings;

use Keyword::Simple;

sub import {
  Keyword::Simple::define( 'decorate' => sub {
    my $code = shift;
    my $name = $$code =~ /sub (\w+)/ ? $1 : die 'Could not determine the method to decorate';
    substr($$code, $-[0], 0) = ';';
    substr($$code, 0, 0) = "around '$name' => ";
  });
}

sub unimport {
  Keyword::Simple::undefine('decorate');
}

1;

