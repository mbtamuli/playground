#!./test/libs/bats/bin/bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

@test "Should install git as prerequisite" {
  run sudo apt-get purge -y git
  run sudo bash setup_bats.sh global
  run git --version
  assert_success
}

@test "Should install bats globally" {
  run sudo bash setup_bats.sh global
  run bats --version
  assert_success
}

@test "Should install bats locally" {
  run mkdir -p /tmp/new
  run pushd /tmp/new > /dev/null
  run git init
  run sudo bash setup_bats.sh
  run ./test/libs/bats/bin/bats --version
  assert_success
}
