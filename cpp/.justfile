[private]
default:
  just --list

# compile project
compile:
  mkdir -p build
  cmake -S . -B ./build
  cmake --build ./build --parallel

# run project
run:
  [ -x ./build/example ] || just compile
  [ -x ./build/example ] && ./build/example
