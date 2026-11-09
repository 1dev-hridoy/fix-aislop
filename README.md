# web-design

A single merged skill for web design: landing pages, web pages, app screens,
redesigns, audits, and Figma mockups — built to look made, not generated.

Built by **1dev-hridoy**.

## What it is

Three upstream design skills merged into one front door (`SKILL.md`), one
shared visual system, and one sweep:

- **A hard floor with mechanical gates and 50 dealt themes** — a 16-point
  floor that binds every output, a `sloplint` gate checker with a render tier,
  judged gates, a finish review, and a theme dealer that deals three
  directions so consecutive builds do not converge.
  Source: `github.com/Nutlope/hallmark` — 48,914 stars, MIT.
- **A conversion-first landing-page system** — intake, page structure, layout
  selection, conversion copywriting, SEO/AEO, plus a strict visual system
  (Tailwind type scale, named text styles, spacing tokens, nested-radius
  formula, dark ramp, icon rules, motion curve, states, ship list) and the
  mandatory tagline reveal. The Figma companion skill ships alongside it as
  a gated route.
  Source: `github.com/elayadesign/ai-design-skills` — 14,393 stars, MIT.
- **A kind-based page planner with a real-browser checker** — the kind of
  business decides everything (software, gaming, tech, product, service,
  place), dealt palettes/pairings/heroes, a starter kit with effects, moments
  and scenes for tech pages, and a checker that enforces it in a real
  browser.
  Source: `github.com/Leonxlnx/taste-skill` — 110,806 stars, MIT.

Star counts checked 2026-11-06. All three upstream licences are reproduced
verbatim in `LICENSES.md`; photo and icon credit rules are there too.

## Route picker

| Route | Trigger | What happens |
|---|---|---|
| **A — Landing page** | a new landing/marketing page | Strategy (one offer, one audience, one action) → deal a theme → hero first → sweep |
| **B — Any web page** | company, product, shop, place, service, app screen | Declare the kind → plan by kind → deal palette/hero → build from the starter kit → sweep |
| **C — Redesign / audit** | `redesign <path>` / `audit <path>` | Full redesign keeping content and wiring, or a report only — no edits on audit |
| **D — Taste pass** | "looks generic / AI-made" | Check only: sloplint static tier + the real-browser checker, failures with file and line |
| **E — Figma** | a Figma link or mockup ask | Gated on the upstream Figma skills (`figma-use`, `figma-generate-design`, `figma-generate-library`); stops and says so if any is missing |

Every route ends in the same sweep: `sloplint --render` (degrades to the
static tier without a browser) → judged gates → finish review → taste
checker → report.

## Install

Copy this folder as `web-design` into the harness's skills directory:

```bash
cp -r web-design ~/.claude/skills/web-design
# or
cp -r web-design ~/.agents/skills/web-design
```

Do not run `scripts/install.mjs` — it installs the upstream skill under its
own name.

## Runtime requirements

- **Node 22+** (sloplint alone runs on Node 18+).
- **Chrome, Edge, or Chromium** for `--render` and the taste checker. Without
  a browser, sloplint still runs its static tier and the taste checker reports
  what it could not check.
- **No API keys. No npm dependencies, no build step.** Network only for
  photographs (Wikimedia Commons) and font files; everything else runs
  offline.
- ffmpeg is optional.
- Per-run state lives in the project (`.hallmark/`, `.taste-skill/`); the
  skill folder is read-only at runtime.

## Layout

```
web-design/
  SKILL.md                 # front door (~390 lines): Floor, routes A–E, visual system, sweep
  README.md                # this file
  LICENSES.md              # all three upstream MIT notices + photo/icon credit rules
  references/
    hallmark/              # floor, gates, genres, macrostructures, 50 themes + index.json
    themes -> hallmark/themes  # symlink shim: scripts/theme.mjs expects references/themes
    taste/                 # kind system, sections, copy, motion, photos, icons, checker rules
    upstream/              # landing-page-design.md + figma-designer.md, verbatim
  scripts/                 # sloplint, theme, capture, picture + taste checker/dealer scripts
  assets/                  # starter kit: starter.html, system.css/js, layouts, effects,
                           # moments, scenes, objects, UI, icons, diagrams
  library/                 # deal tables: palettes.json, type.json
```

## Validate

```bash
bash scripts/validate.sh
```

Checks the frontmatter, every path `SKILL.md` references, `node --check` on
all vendored `.mjs` scripts, the theme count against `index.json`, the three
copyright notices in `LICENSES.md`, and that no absolute home paths leak into
`SKILL.md` or `references/`.
