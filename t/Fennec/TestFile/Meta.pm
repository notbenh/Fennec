package TEST::Fennec::TestFile::Meta;
use strict;
use warnings;
use Fennec;

tests load => sub {
    require_ok( 'Fennec::TestFile::Meta' );
};

tests meta_stash {
   is_deeply( $self->fennec_meta->stash, {}, q{blank stash by default} );

   ok( $self->fennec_meta->stash(this => 1, that => 2), q{able to define the stash} );
   is( $self->fennec_meta->stash->{'this'}, 1, q{this checks out, accessed as hash key} );
   is( $self->fennec_meta->stash('that'), 2, q{that checks out, accessed as param} );

   ok( $self->fennec_meta->stash(this => 10), q{able to update the stash} );
   is( $self->fennec_meta->stash->{this}, 10, q{updated this value} );
   is( $self->fennec_meta->stash('that'), 2 , q{that value says the same} );

   ok( delete $self->fennec_meta->stash->{that}, q{delete as a hash} );
   ok(!exists $self->fennec_meta->stash->{that}, q{that does not exist any more} );

}

1;
