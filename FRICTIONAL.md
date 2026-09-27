# Verification and friction — 2026-09-27 01:06 UTC heartbeat

Read complete source README, project, script and scene. No source gui AGENTS.md
found. No active Godot/ffmpeg workers observed before creating independent copy
at previously absent destination. Title is the only production change.

Import and ordinary 120-frame headless runtime exit 0. Evidence:
import-20260927.log and runtime-20260927.log.

test_drag.gd instantiates actual scene with a 1024x600 root and attempts three
mouse press/move/release paths (0→8, 4→2, 6→1). All three fail to start dragging
and fail target color-copy checks. Source colors stay unchanged and drag is
inactive afterward, but these observations are NOT successful drop tests.
13 assertions total, six failures. No direct _get_drag_data/_drop_data calls,
force_drag injection or simulated color copying were used to make results pass.

Preserved attempts: drag-20260927.log (push_input), drag-hover-20260927.log
(initial hover and button mask), drag-parsed-20260927.log (parse_input_event).
All fail the same six assertions. Cause remains unresolved: investigate root
input routing, actual control geometry and event delivery before attributing
this to production code. Test is retained as failing, not marked verified.

Next resume this harness investigation. Popup editing, rejected drops, rendered
drag preview and human use remain unverified. Both films remain pending existing
visible-capture constraint; no windows reopened, footage fabricated or approval
signed. Preserve originals and pending film pair. Required film skills and
adjacent code/result capture remain outstanding.

## 01:36 UTC input-routing follow-up

Geometry diagnostics show root window 1024x600 but canvas scene 1152x675.
Input.parse_input_event produced no observed button gui_input signals in this
headless run. Switching the harness to root.push_input(event, true) explicitly
routes viewport-local positions; button GUI events then arrive at expected local
centers (48,32), and all original 13 checks pass. This fixes the harness, not
production code. Log drag-routing-20260927.log preserves the failed diagnostic;
drag-local-20260927.log records the passing original checks.

Expanded drag-local-expanded-20260927.log passes 16 checks: the same three
source/target routes plus an actual drag released over empty space, verifying
the drag ends without changing any button color. Only normal synthetic mouse
input is injected, no callback calls or forced drag/color state. No warnings
observed. These are headless state checks, not footage or human interaction.
Popup editing and visible preview remain unverified; both films still pending
existing capture constraint. Next feasible item may proceed without retiring
this pair. Source and production script unchanged.
