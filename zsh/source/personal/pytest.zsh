# Functions for helping to use pytest

pywatch() {
  fswatch -o $2 $3 | \
    (while read; do \
    pytest --disable-pytest-warnings -v $1; \
  done)
}
