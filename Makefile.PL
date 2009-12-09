use inc::Module::Install;
name 'Object-InterfaceType';
all_from 'lib/Object/InterfaceType.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
