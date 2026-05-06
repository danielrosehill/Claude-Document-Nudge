# Claude-Document-Nudge

A snippet (and thin plugin wrapper) that nudges Claude to **document decisions, todos, sprints, and handovers as we work** — without being asked each time.

## Why

In planning-phase conversations, useful context (chosen stack, rejected alternatives, rationale) often only lives in chat. It's lost across sessions, and Claude re-explores the same ground. This snippet sets the default behaviour: when we compare options or make a choice, the artefact gets written to a structured `planning/` tree in the repo.

## What it does

Drops a `<documentation_nudge>` block into your home-level `~/.claude/CLAUDE.md` that:

- Defines the canonical `planning/` folder structure.
- Tells Claude **when** to write decision files, todos, sprints, handovers.
- Specifies the decision-file format (numbered, with options/rationale/consequences).
- Tells Claude to write artefacts in the same turn as the discussion — not later.

## Folder structure

```
planning/
  decisions/         # one numbered file per decision
  todo/              # active task lists
  sprints/
    active/
    deferred/
    done/
  handovers/         # session handover notes
```

## Install

### Option A — copy the snippet manually

Open [`snippet.md`](./snippet.md), copy the block between the `BEGIN` / `END` markers into `~/.claude/CLAUDE.md`.

### Option B — use the plugin

Install the plugin (e.g. via your Claude-Controller marketplace), then:

```
/nudge-install        # injects/updates the snippet in ~/.claude/CLAUDE.md
/nudge-scaffold       # seeds the planning/ tree in the current repo
/nudge-scaffold path  # …or in a specific repo
```

`/nudge-install` is idempotent — re-running updates the existing block in place.

### Option C — just the scaffold script

```bash
./scaffold.sh           # seeds planning/ in cwd
./scaffold.sh /some/repo
```

## Layout

```
Claude-Document-Nudge/
├── README.md
├── .claude-plugin/plugin.json
├── snippet.md            # the CLAUDE.md snippet (between BEGIN/END markers)
├── scaffold.sh           # standalone folder-tree seeder
└── commands/
    ├── nudge-install.md
    └── nudge-scaffold.md
```

The repo root *is* the plugin root — `${CLAUDE_PLUGIN_ROOT}` resolves here post-install, so all assets stay self-contained (no parent-directory traversal, no hard-coded paths). Works identically for public-marketplace consumers and Daniel's networked plugin store.
