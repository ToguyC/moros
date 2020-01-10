#!/bin/sh

set -e

dir=$(dirname "$0")
image="target/x86_64-moros/release/bootimage-moros.bin"
qemu="qemu-system-x86_64 -display curses -cpu max -nic model=rtl8139 -rtc base=localtime"

# Build image if needed
cd "$dir/.." && cargo bootimage --release

# Launch qemu inside cool-retro-term
cool-retro-term --fullscreen --profile "$dir/cool-retro-term.json" \
  --workdir "$dir/.." -e sh -c "$qemu $image 2>/dev/null"