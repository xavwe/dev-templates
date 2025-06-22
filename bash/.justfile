set quiet
set positional-arguments

file := 'src/main.sh'
test := 'test/test.bats'

[private]
default:
  just --list

init:
  git init
  git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support
  git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert
  chmod +x ./src/main.sh
  chmod +x ./scripts/test.sh
  chmod +x ./scripts/run.sh
  git submodule init
  git submodule update

# test script
test *args:
  {{justfile_directory()}}/scripts/test.sh --just-test "{{justfile_directory()}}/{{test}}" --just-file "{{justfile_directory()}}/{{file}}" {{args}}

# run script
run *args:
  {{justfile_directory()}}/scripts/run.sh --just-file "{{justfile_directory()}}/{{file}}" {{args}}
