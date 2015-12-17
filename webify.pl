#!/usr/bin/env perl

# Copyright (c) 2015 Franco Fichtner <franco@opnsense.org>
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

my $ver = shift;
my @lines;
my $doc;

open $doc, "<", "doc/" . $ver;

while (<$doc>) { push @lines, $_; }

my $date;
my %refs;

# first pass: read date, build table, strip stuff
for ( @lines ) {
	chomp;
	$refs{$1} = $2 if $_ =~ s/^\[(\d*?)\]\s*(.*)\s*$//g;
	$date = $1 if $_ =~ s/^@\s*(.*)\s*$//g;
	$_ =~ s/^--.*$//g;
	$_ =~ s/\s*$//g;
}

# print json metadata to standard error
say STDERR "{version: \"$ver\", date: \"$date\"}";

my $pp = '<p>';
my $bl = '';
my $li = '';
my $in = 0;

push @lines, '';

# second pass: webify all the text!
for ( @lines ) {
	$_ =~ s/(http[s]?:\/\/\S*)/<a target="_blank" href="$1">$1<\/a>/g;
	foreach my $key ( keys %refs ) {
		$_ =~ s/\[$key\]/[<a target="_blank" href="$refs{$key}">$key<\/a>]/g;
	}

	if ( $bl ne '' && $_ =~ s/^\s+//g ) {
		$pp =~ s/<\/li>\n$/ /g;
	}

	if ( $_ =~ s/^#\s//g ) {
		if ( $li eq '' ) {
			$li = '</pre>';
			$pp .= '<pre>';
		}
	} elsif ( $_ =~ s/^o\s+//g ) {
		if ( $bl eq '' ) {
			$bl = '</ul>';
			$pp .= '<ul>';
		}
		$pp .= '<li>';
	}

	if ( $pp ne '<p>' ) {
		if ( $_ eq '' ) {
			chop $pp if $li ne '';
			print STDOUT $pp . $li . $bl . '</p>' . "\n";
			$pp = '<p>';
			$bl = '';
			$li = '';
		} else {
			if ( $li ne '' ) {
				$_ .= "\n";
			} elsif ( $bl ne '' ) {
				$_ .= "</li>\n";
			} else {
				$pp .= ' ';
			}
		}
	}

	$pp .= $_;
}
