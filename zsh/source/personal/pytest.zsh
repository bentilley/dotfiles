# Functions for helping to use pytest

pywatch() {
  fswatch -o tests service | \
    (while read; do \
    pytest -v $1; \
  done)
}
