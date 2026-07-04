#!/bin/sh
# Launch tw-btx-miner with the bundled CUDA runtime on the library path.
cd "$(dirname "$0")" || exit 1
exec env LD_LIBRARY_PATH="$PWD:$LD_LIBRARY_PATH" ./btx-miner "$@"
