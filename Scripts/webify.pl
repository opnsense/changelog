#!/usr/bin/env perl

# Copyright (c) 2015-2021 Franco Fichtner <franco@opnsense.org>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

use strict;
use warnings;
use autodie;

my $path = shift; $path //= 'uknown'; die "not a file: $path" if not -f $path;
my $fmt = shift; $fmt //= 'html'; die 'invalid format: $fmt' if $fmt !~ /^(html|text)$/;

my @lines;
my %links;
my $doc;

# collect link replacement helpers
for my $link ( glob './Links/*' ) {
	open $doc, "<", $link;
	my $content = <$doc>;
	chomp $content;
	close $doc;

	my ($url, $regex) = split /\s/, $content, 2;
	$link =~ s/.*\///;

	$links{$link} = { url => $url, regex => $regex };
}

open $doc, "<", $path;

while (<$doc>) { push @lines, $_; }

my $date;
my %refs;

# first pass: sanitise input
for ( @lines ) {
	if ( $fmt eq 'text' ) {
		# only collect links
		$refs{$1} = $2 if $_ =~ /^\[(\d*?)\]\s*(.*)\s*$/;
		# and collect date
		$date = $1 if $_ =~ s/^@\s*(.*)\s*$//g;
		next;
	}

	# remove newline
	chomp;
	# collect links
	$refs{$1} = $2 if $_ =~ s/^\[(\d*?)\]\s*(.*)\s*$//g;
	# collect date
	$date = $1 if $_ =~ s/^@\s*(.*)\s*$//g;
	# remove comment lines
	$_ =~ s/^--.*$//g;
	# remove trailing noise
	$_ =~ s/\s+$//g;
	# webify special characters
	$_ =~ s/\</&lt;/g;
	$_ =~ s/\>/&gt;/g;
}

# replace links so we do not have to
for my $ref ( keys %refs ) {
	my ($link, $version) = split /:/, $refs{$ref}, 2;

	next if not exists $links{$link};

        my $rewrite = $links{$link};

	if ( defined $rewrite->{regex} ) {
		$_ = $version;
		eval $rewrite->{regex};
	        $version = $_;
	}
	$refs{$ref} = $rewrite->{url};
	if ( $refs{$ref} =~ /%s/ ) {
		$refs{$ref} = sprintf $refs{$ref}, $version;
	}
}

# run sanity checks on link replacements
for my $ref ( keys %refs ) {
	die 'unknown link ' . $refs{$ref} if $refs{$ref} !~ /^http/i;
}

# extract version info from path
my @vers = split '/', $path;

# print json metadata to standard error
say STDERR "{\"series\":\"$vers[-2]\",\"version\":\"$vers[-1]\",\"date\":\"$date\"}" if $fmt eq 'html';

# initialise tag states for:
# paragraph
my $pp = '<p>';
# bullet list
my $bl = '';
# literals
my $li = '';
# start of text
my $start = 0;

# add empty line to flush paragaph
push @lines, '';

# second pass: webify all the text!
for ( @lines ) {
	if ( $fmt eq 'text' ) {
		# remove blocks as we do not render them
	        $_ =~ s/^#\s//g;

		# replace reference links now
		foreach my $key ( keys %refs ) {
			$_ =~ s/^\[$key\]\s+.*/[$key] $refs{$key}/g;
		}

		# make sure to skip all leading empty lines
		if ( $start == 0 and $_ !~ /^$/ ) {
			$start = 1;
		}

		# render text now and go to next line
		print STDOUT $_ if $start == 1;
		next;
	}

	# transform literal URLs into hyperlinks
	$_ =~ s/(http[s]?:\/\/\S*)/<a target="_blank" href="$1">$1<\/a>/g;

        # extra break for our signature line
	$_ = '<br>' . $_ . '<br>' if $_ =~ /(stay safe|may the force|upgrade responsibly|live long|happy holidays).*,$/i;

	# fixup newline for preformatted block
        $_ .= "\n" if /^#/;

	# transform references into hyperlinks
	foreach my $key ( keys %refs ) {
		$_ =~ s/\[$key\]/[<a target="_blank" href="$refs{$key}">$key<\/a>]/g;
	}

	# bullet list continuation
	if ( $bl ne '' && $_ =~ s/^\s+//g ) {
		$pp =~ s/<\/li>$/ /g;
	}

	# literal block transformation
	if ( $_ =~ s/^#\s//g ) {
		if ( $pp eq '<p>' && $li eq '' ) {
			$li = '</pre>';
			$pp .= '<pre>';
		}
	# bullet list transformation
	} elsif ( $_ =~ s/^o\s+//g ) {
		if ( $pp eq '<p>' && $bl eq '' ) {
			$bl = '</ul>';
			$pp .= '<ul>';
		}
		$pp .= '<li>';
	}

	# ignores empty lines
	if ( $pp ne '<p>' ) {
		# end of the paragraph
		if ( $_ eq '' ) {
			# adjust last newline for literal block end
			chop $pp if $li ne '';
			# print paragraph trailer
			print STDOUT $pp . $li . $bl . '</p>';
			# reset tag states
			$pp = '<p>';
			$bl = '';
			$li = '';
		# text continuation
		} else {
			# ignore literal block embedded newline
			if ( $li ne '' ) {
			# bullet list list item end
			} elsif ( $bl ne '' ) {
				$_ .= "</li>";
			# normal text append
			} else {
				$pp .= ' ';
			}
		}
	}

	# merge the transformed line
	$pp .= $_;
}
