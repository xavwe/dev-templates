[private]
default:
  just --list

# watch for changes and test script
test-watch:
  ls ./src/backup | entr doas bats ./test/test.bats

# test script
test:
  bats ./test/test.bats

# run script
run:
  ./src/run.sh
