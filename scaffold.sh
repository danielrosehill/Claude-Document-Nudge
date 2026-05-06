#!/usr/bin/env bash
# Seed the planning/ folder tree in the current repo.
# Usage: ./scaffold.sh [target-dir]   (default: cwd)
set -euo pipefail

target="${1:-$PWD}"
cd "$target"

dirs=(
  "planning/decisions"
  "planning/todo"
  "planning/sprints/active"
  "planning/sprints/deferred"
  "planning/sprints/done"
  "planning/handovers"
)

for d in "${dirs[@]}"; do
  mkdir -p "$d"
  # Drop a .gitkeep so empty dirs survive commits
  [[ -f "$d/.gitkeep" ]] || touch "$d/.gitkeep"
done

# Seed a README at planning/ root if missing
if [[ ! -f planning/README.md ]]; then
  cat > planning/README.md <<'EOF'
# planning/

Working notes, decisions, and sprint state for this repo.

- `decisions/` — one numbered file per decision (`001-...`). Captures *why*.
- `todo/` — active task lists by topic.
- `sprints/active/` — current sprint plans. Move to `done/` or `deferred/` as state changes.
- `handovers/` — session handover notes (`YYYY-MM-DD-<slug>.md`).

Seeded by Claude-Document-Nudge.
EOF
fi

echo "Scaffolded planning/ tree at: $target"
