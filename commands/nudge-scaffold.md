---
description: Seed the planning/ folder tree in the current repo
argument-hint: "[target-dir]"
---

Run the scaffold script to create the `planning/` tree in the target directory (default: current working directory).

Execute:

```bash
bash "${CLAUDE_PLUGIN_ROOT}/scaffold.sh" "${1:-$PWD}"
```

If `CLAUDE_PLUGIN_ROOT` is unset, abort with a clear error — do not fall back to a hard-coded path.

After it runs, list the created tree (one level deep) and report which directories were newly created vs already present. Don't ask first — just scaffold.
