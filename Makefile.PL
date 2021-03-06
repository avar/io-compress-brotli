use 5.014000;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME             => 'IO::Compress::Brotli',
	VERSION_FROM     => 'lib/IO/Compress/Brotli.pm',
	ABSTRACT         => 'Read Brotli buffers/streams',
	AUTHOR           => 'Marius Gavrilescu <marius@ieval.ro>',
	MIN_PERL_VERSION => '5.14.0',
	LICENSE          => 'perl',
	SIGN             => 1,
	EXE_FILES        => [ 'bin/bro-perl' ],
	PREREQ_PM        => {
		'File::Slurp'  => '9999.19',
		'Getopt::Long' => '2.45',
		'Time:HiRes'   => '1.9728'
	},
	BUILD_REQUIRES   => {},
	INC              => '-Ibrotli',
	MYEXTLIB         => 'brotli/libbrotli$(LIB_EXT)',
	clean            => { FILES => 'brotli/libbrotli$(LIB_EXT)' },
	META_ADD         => {
		dynamic_config => 0,
		resources      => {
			repository   => 'https://git.ieval.ro/?p=io-compress-brotli.git',
		},
	}
);

sub MY::postamble {
'
$(MYEXTLIB): brotli/Makefile
	cd brotli && CFLAGS=-fPIC $(MAKE) lib
'
}
