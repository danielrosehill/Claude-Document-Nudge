<!--
  Claude-Document-Nudge — snippet for ~/.claude/CLAUDE.md
  Paste between the BEGIN/END markers into your home-level CLAUDE.md.
  The /nudge-install command does this automatically.
-->

<!-- BEGIN: claude-document-nudge -->
<documentation_nudge>
  <summary>
  Default to writing planning/decision artefacts into the repo's `planning/` tree as we work. Don't wait to be asked. The point is to leave a durable trail of *why* choices were made so future sessions (and I) don't relitigate them.
  </summary>

  <folder_structure>
  Every repo I work in should have, at the root:

  ```
  planning/
    decisions/         # one file per decision — chosen option, alternatives, rationale
    todo/              # active task lists
    sprints/
      active/          # current sprint plan(s)
      deferred/        # parked / postponed sprints
      done/            # completed sprints (archive)
    handovers/         # session handover notes
  ```

  If the tree is missing, create it on first write — don't ask. The `/nudge-scaffold` command (from the Claude-Document-Nudge plugin) seeds it in one shot.
  </folder_structure>

  <when_to_write>
    <trigger>We compare two or more options for a stack, library, schema, architecture, or approach — even informally. → write `planning/decisions/NNN-short-slug.md`.</trigger>
    <trigger>A choice is made (explicit or implicit) that future-me would want the rationale for. → same.</trigger>
    <trigger>We sketch out work to be done across multiple steps. → write `planning/todo/<topic>.md` or update an existing list.</trigger>
    <trigger>We plan a sprint / batch of related work. → `planning/sprints/active/<slug>.md`. Move to `done/` or `deferred/` when state changes.</trigger>
    <trigger>The session is wrapping up with non-trivial in-flight work. → `planning/handovers/YYYY-MM-DD-<slug>.md`.</trigger>
  </when_to_write>

  <decision_file_format>
  ```
  # <decision title>

  **Date:** YYYY-MM-DD
  **Status:** chosen | superseded by <file> | revisited

  ## Context
  What we were trying to do and the constraints.

  ## Options considered
  - **Option A** — pros / cons
  - **Option B** — pros / cons

  ## Decision
  What we picked and the one-line reason.

  ## Consequences
  What this commits us to / rules out.
  ```
  Number files sequentially: `001-...`, `002-...`. Don't renumber on insert.
  </decision_file_format>

  <rules>
    <rule>Write the artefact **as part of the same turn** the discussion happens — not "I'll save that later". The user shouldn't have to ask "can you save this".</rule>
    <rule>Brief mention in chat that you've written/updated the file (path + one line), then continue. Don't paste the whole file back.</rule>
    <rule>Update existing decision files instead of duplicating when a topic is revisited; mark status `superseded by <new file>` if the choice changes.</rule>
    <rule>Lowercase-kebab filenames. ASCII only. No timestamps in filenames except handovers.</rule>
    <rule>If the user explicitly says "don't document this" or "scratch that", skip the write for that exchange — don't argue.</rule>
    <rule>This nudge is about *capturing rationale*, not generating busywork. A one-line decision file is fine. Don't pad.</rule>
  </rules>
</documentation_nudge>
<!-- END: claude-document-nudge -->
