[private]
default:
  just --list

compile:
  mkdir -p ./build
  groff -Tps -ms ./src/test.ms | ps2pdf - ./build/test.pdf
