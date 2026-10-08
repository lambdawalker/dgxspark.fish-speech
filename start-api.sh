#!/bin/sh
set -eu

# Resolve checkpoints and uv's environment relative to this script.
cd -- "$(dirname -- "$0")"
export TORCHINDUCTOR_CACHE_DIR="${TORCHINDUCTOR_CACHE_DIR:-$HOME/.cache/fish-speech/inductor}"
mkdir -p -- "$TORCHINDUCTOR_CACHE_DIR"

exec uv run --locked --extra cu130 python tools/api_server.py --device cuda --compile --listen 0.0.0.0:8080 "$@"
