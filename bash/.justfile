set quiet
set positional-arguments

file := 'src/main.sh'
test := 'test/test.bats'

[private]
default:
  just --list

[private]
chore:
  chmod +x ./src/main.sh
  chmod +x ./scripts/test.sh
  chmod +x ./scripts/run.sh
  git submodule init
  git submodule update

# test script
test *args:
  @just chore
  {{justfile_directory()}}/scripts/test.sh --just-test "{{justfile_directory()}}/{{test}}" --just-file "{{justfile_directory()}}/{{file}}" {{args}}

# run script
run *args:
  @just chore
  {{justfile_directory()}}/scripts/run.sh --just-file "{{justfile_directory()}}/{{file}}" {{args}}
