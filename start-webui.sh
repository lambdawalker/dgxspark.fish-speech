#!/bin/sh
set -eu

# Resolve checkpoints and uv's project environment relative to this script.
cd -- "$(dirname -- "$0")"

export TORCHINDUCTOR_CACHE_DIR="${TORCHINDUCTOR_CACHE_DIR:-$HOME/.cache/fish-speech/inductor}"
export GRADIO_SERVER_NAME=0.0.0.0
# Disable public sharing even if it was enabled in the parent shell.
export GRADIO_SHARE=False

mkdir -p -- "$TORCHINDUCTOR_CACHE_DIR"

exec uv run --locked --extra cu130 python tools/run_webui.py --device cuda --compile "$@"
