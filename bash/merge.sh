#!/usr/bin/env bash

CURDIR=$(dirname "$(realpath "$0")")
REPO_ROOT_DIR=$(realpath "$CURDIR/../")

BOOKS=(
    "$REPO_ROOT_DIR/books/PDF/Lean UX/Lean UX (2nd Edition)/Lean UX (2nd Edition).pdf"
)

function merge-book {
    local MERGED_BOOK_PATH=$(realpath "$1")
    local MERGED_BOOK_DIR=$(dirname "$MERGED_BOOK_PATH")

    find "$MERGED_BOOK_DIR" -maxdepth 1 -name "$(basename "$MERGED_BOOK_PATH").part*" -print0 | sort -z | xargs -0 cat > "$MERGED_BOOK_PATH" && echo "Merged book: \"$MERGED_BOOK_PATH\""

    return $?
}

for BOOK in "${BOOKS[@]}"; do
    merge-book "$BOOK"
done