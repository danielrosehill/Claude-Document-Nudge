---
description: Install the document-nudge snippet into ~/.claude/CLAUDE.md (idempotent)
---

You are installing the Claude-Document-Nudge snippet into the user's home-level `CLAUDE.md`.

Steps:

1. Read the snippet at `${CLAUDE_PLUGIN_ROOT}/snippet.md`. If `CLAUDE_PLUGIN_ROOT` is unset, abort with a clear error — do not fall back to a hard-coded path (the plugin must be portable across install layouts).
2. Extract the content between `<!-- BEGIN: claude-document-nudge -->` and `<!-- END: claude-document-nudge -->` (inclusive of the markers).
3. Read `~/.claude/CLAUDE.md`. If it doesn't exist, create it.
4. If the file already contains `<!-- BEGIN: claude-document-nudge -->`, replace the existing block (between the markers) with the freshly-read snippet. Otherwise append the snippet to the end of the file with a leading blank line.
5. Confirm to the user with: the path written, whether it was an install or update, and the byte count delta.

Do not ask for confirmation — just do it. Don't reformat surrounding content. Don't touch any other section of `CLAUDE.md`.
