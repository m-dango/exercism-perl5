package Sieve;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<find_primes>;

sub find_primes {
    my ($limit) = @_;
    my %numbers = map { $_ => 1 } 2 .. $limit;
    my @primes;

    while (%numbers) {
        push @primes, [ sort { $a <=> $b } keys %numbers ]->[0];

        my $i = $primes[-1];
        while ( $i <= $limit ) {
            delete $numbers{$i};
            $i += $primes[-1];
        }
    }

    return [@primes];
}

1;
