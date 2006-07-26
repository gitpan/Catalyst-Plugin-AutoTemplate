use 5.008;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME              => 'Catalyst::Plugin::AutoTemplate',
    VERSION_FROM      => 'lib/Catalyst/Plugin/AutoTemplate.pm',
    PREREQ_PM         => {
	    Catalyst => 5.70
    },
    ($] >= 5.005 ?
      (ABSTRACT_FROM  => 'lib/Catalyst/Plugin/AutoTemplate.pm',
       AUTHOR         => 'Max Afonov <max.afonov@mlb.com>') : ()),
);
