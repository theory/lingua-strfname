use Module::Build;

my $build = Module::Build->new
  ( module_name        => 'Lingua::Strfname',
    license            => 'perl',
    create_makefile_pl => 'passthrough',
  );
$build->create_build_script;
