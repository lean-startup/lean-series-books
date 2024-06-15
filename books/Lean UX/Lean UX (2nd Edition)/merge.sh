#!/usr/bin/env bash

# Run this script to merge the parts of the "Lean UX (2nd Edition)" book.

CURDIR=$(dirname "$(realpath "$0")")

BOOK_NAME="Lean UX (2nd Edition)"
BOOK_NAME_PDF=$BOOK_NAME.pdf

cd "$CURDIR"
find -name "$BOOK_NAME_PDF.part**" -print0 | sort -z | xargs -0 cat > "$BOOK_NAME_PDF" && echo "Merged PDF file: \"$(realpath "$BOOK_NAME_PDF")\""