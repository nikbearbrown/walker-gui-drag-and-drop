# Walker — Drag and Drop

**What this is.** An independent copy of Godot's `gui/drag_and_drop` demo: nine
color swatches in a grid. Drag one swatch onto another to copy its color; click
a swatch to edit its color by hand. It is a tech demo, not a game: there is no
goal or ending. The whole behavior is one short script built on Godot's three
drag-and-drop methods.

**Why it is in Walker.** It is one of the upstream Godot demos Walker has copied
and checked headless; two native-4K Liam films are pending for it. Its exact
purpose inside Walker has not been written down yet (see
`design/decisions.md`, Q-01).

**What was found and verified.** The production title is the only change.
Godot 4.7.2 headless import and 120-frame runtime exit cleanly. Corrected
viewport-local input routing now passes 16 synthetic drag/drop state checks.
Rendered preview and popup color editing remain unverified.

## How to run

Open `godot/project.godot` in Godot 4.7 (the logs record 4.7.2) and run the main
scene, `drag_and_drop.tscn`.

Controls (mouse only; no custom input actions):

- Press on a swatch and drag onto another swatch to copy the color over.
- Click a swatch to open its color picker and adjust its color.

## Design

- [`GDD.md`](GDD.md) — the recovered game design document (identical copy of
  `design/GDD.md`). It was reverse-engineered from the code by Walker's Zelda GDD
  skill in silent mode on 2026-09-27. It describes what exists; it is **not an
  approved design**, and no design gate is signed.
- [`design/DECK.html`](design/DECK.html) — slide version for review.
- [`design/IMPLEMENTATION-MAP.md`](design/IMPLEMENTATION-MAP.md) — every feature
  mapped to its real scene nodes, script methods and line numbers.
- [`design/decisions.md`](design/decisions.md) — open questions (purpose,
  audience, goals, scope, films, visual QA).

## Source & license

Independent copy of Godot `gui/drag_and_drop`, source commit
`a3b5c113112f77291d5f3d1360f33a882fdc52f7`. Original README, assets, UIDs,
import settings and root MIT LICENSE.md retained. Production title changed only.

## Status

- Godot 4.7.2 headless import and 120-frame runtime exit cleanly.
- Corrected viewport-local input routing now passes 16 synthetic drag/drop state
  checks.
- Rendered preview and popup color editing remain unverified.
- Both native-4K Liam films remain pending; no human approval.

See FRICTIONAL.md.

Repository: https://github.com/nikbearbrown/walker-gui-drag-and-drop
