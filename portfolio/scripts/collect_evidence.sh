#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT_DIR="$ROOT_DIR/portfolio/evidence/generated"
mkdir -p "$OUT_DIR"

cd "$ROOT_DIR"

echo "[1/3] Exporting author commit log..."
git log --author='yuyao' --pretty=format:'%h|%ad|%an|%ae|%s' --date=short > "$OUT_DIR/author_commits.txt"

echo "[2/3] Exporting compact commit stats..."
for c in $(git log --author='yuyao' --pretty=format:'%h'); do
  {
    echo "===== $c ====="
    git show --stat --oneline "$c"
    echo
  } >> "$OUT_DIR/author_commit_stats.txt"
done

echo "[3/3] Exporting training metric excerpts..."
LOG_CANDIDATES=(
  "CGM_baseline/logs/train.out"
  "CGM_baseline/logs/trainQwen.out"
  "CGM_baseline/logs/ltrain_log"
  "CGM_baseline/logs/nohup.out"
  "train.out"
  "trainQwen.out"
  "ltrain_log"
  "nohup.out"
)

EXISTING_LOGS=()
for f in "${LOG_CANDIDATES[@]}"; do
  if [[ -f "$f" ]]; then
    EXISTING_LOGS+=("$f")
  fi
done

if [[ ${#EXISTING_LOGS[@]} -gt 0 ]]; then
  rg -n "Loading dataset|Training completed|train_loss|eval_loss|train_runtime|eval_runtime" \
    "${EXISTING_LOGS[@]}" > "$OUT_DIR/training_metric_excerpts.txt" || true
else
  echo "No raw training log files found. Keep logs under CGM_baseline/logs/ to regenerate excerpts." \
    > "$OUT_DIR/training_metric_excerpts.txt"
fi

echo "Done. Files generated in: $OUT_DIR"
