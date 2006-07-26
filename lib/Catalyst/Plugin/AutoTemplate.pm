package Catalyst::Plugin::AutoTemplate;

use 5.008006;
use strict;
use warnings;

use base qw/Catalyst::Base/;

our $VERSION = '0.01';

sub end : ActionClass('RenderView') {
	my ($self, $c) = @_;

	if (!$c->stash->{'template'}) {
		$c->stash->{'template'} = $c->req->match;

		if ($c->config->{'template_extension'}) {
			$c->stash->{'template'} .= '.' . $c->config->{'template_extension'};
		}
	}
}


1;
__END__
=head1 NAME

Catalyst::Plugin::AutoTemplate - Catalyst plugin for automatic discovery of templates

=head1 SYNOPSIS

  package My::App;
  use Catalyst::Runtime '5.70';
  use Catalyst qw/-Debug ConfigLoader Static::Simple AutoTemplate/;
  
  ...

=head1 DESCRIPTION

This Catalyst plugin rids the programmer of hardcoding template names in the
stash at the end of actions.

For example, if an action "/knob/frobnicate" was called, the plugin will look
for the "root/knob/frobnicate.mhtml" template.

Why "mhtml"? Here's the fun part. YOU get to adjust what extension is used.
Just define "template_extension" in your app config, and you're golden!

=head1 AUTHOR

Max Afonov, E<lt>max.afonov@mlb.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2006 by Max Afonov

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
