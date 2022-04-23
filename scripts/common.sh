set -euo pipefail

if [ ! -f /.dockerenv ]; then
  cd "$(dirname $0)/../"
  docker build -t "psliwka/vim-dirtytalk-builder:latest" scripts/
  exec docker run -v "$(pwd):/cwd" -w "/cwd" "psliwka/vim-dirtytalk-builder:latest" "scripts/$(basename $0)"
fi

output_file="$(basename $0 | sed -n 's/update-//p').words"
output_path="$(dirname $0)/../wordlists/$output_file"
output_truncated=0

truncate_output_if_needed () {
  if [ $output_truncated != 1 ]; then
    echo "Updating \"$output_file\"..." >&2
    echo "# This file is generated automatically by \`scripts/$(basename $0)\`. Please do not edit it directly." > "$output_path"
    output_truncated=1
  fi
}

emit_header () {
  truncate_output_if_needed
  (echo; echo "# $1") >> "$output_path"
}

emit_words () {
  truncate_output_if_needed
  sort | uniq | grep -v '^$' | sed -e 's/\/\([^\?]\|$\)/,\1/g' >> "$output_path"
}
