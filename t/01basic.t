#!/usr/bin/perl -w

use strict;
use Test;
use constant DEBUG => 0;
BEGIN { plan tests => 27 };
use Lingua::Strfname;
ok(1); # If we made it this far, we're ok.

#########################

my @names = qw(Clinton William Jefferson Mr. JD "Bill");

my %tests = ( "%f% m% l" => 'William Jefferson Clinton',
	      "%p% f% M% l%, s" => 'Mr. William J. Clinton, JD',
	      "%f% a% l" => 'William "Bill" Clinton',
	      "%l,% F%M" => 'Clinton, W.J.',
	      "%a% l,% s" => '"Bill" Clinton, JD',
	      '%l%, f% m' => 'Clinton, William Jefferson',
	      '%l%, f% M' => 'Clinton, William J.',
	      '%l%, f' => 'Clinton, William',
	      '%l%, F% m' => 'Clinton, W. Jefferson',
	      '%f% l' => 'William Clinton',
	      '%f% M% l' => 'William J. Clinton',
	      '%F%M% l' => 'W.J. Clinton',
	      '%F% m% l' => 'W. Jefferson Clinton',
);

while (my ($f, $r) = each %tests) {
    DEBUG && print "$f:\n$r\n", strfname($f, @names), "\n\n";
    ok( strfname($f, @names) eq $r );
}

@names[2,5] = ('', '');

%tests = ( "%f% m% l" => 'William Clinton',
	   "%p% f% M% l%, s" => 'Mr. William Clinton, JD',
	   "%f% a% l" => 'William Clinton',
	   "%l,% F%M" => 'Clinton, W.',
	   "%a% l,% s" => ' Clinton, JD',
	   '%l%, f% m' => 'Clinton, William',
	   '%l%, f% M' => 'Clinton, William',
	   '%l%, f' => 'Clinton, William',
	   '%l%, F% m' => 'Clinton, W.',
	   '%f% l' => 'William Clinton',
	   '%f% M% l' => 'William Clinton',
	   '%F%M% l' => 'W. Clinton',
	   '%F% m% l' => 'W. Clinton',
);

while (my ($f, $r) = each %tests) {
    DEBUG && print "$f:\n$r\n", strfname($f, @names), "\n\n";
    ok( strfname($f, @names) eq $r );
}

__END__
