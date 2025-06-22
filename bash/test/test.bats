setup() {
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'
}

@test "run script" {
  run ./src/main.sh -h
  assert_output -p 'Hello World!'
}
