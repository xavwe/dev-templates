[private]
default:
  just --list

compile:
  mkdir -p ./build
  pdflatex -output-directory=build ./src/test.tex
