---
name: web-design
description: "Design and build landing pages, web pages, and app screens that look made, not generated — and audit or redesign existing ones. Use when the user asks for a landing page, a web page, a redesign, a design audit, or a Figma mockup, or says a page looks generic, templated, or AI-made. Triggers: landing page, web page, redesign <path>, audit <path>, figma <link>."
argument-hint: "<prompt> | redesign <path> | audit <path> | figma <link>"
version: 1.0.0
---

# web-design

One merged skill for web design, built from three upstream skills: a hard floor with mechanical gates and 50 dealt themes, a
conversion-first landing-page system with a fixed visual system, and a kind-based page planner with a real-browser checker. The floor binds
every route. Above the floor the page is yours: you are a capable designer. Never invent a number, a quote, a logo, or a photograph's
subject.

## 1. The Floor

Binds every output in every harness. None of it is waivable, even when nothing else is read. A **Reflex** is a default a model falls into:
fix it, or waive it on the record with a real reason. A **Finish** check is craft detail: answered, never blocking.
(`references/hallmark/gates.md` § 1 and § 2.)

1. Every colour and every font goes through a token declared at `:root` (or a declared theme block). No literal colour or `font-family` past
   the token block.
2. Never `transition: all`. Never animate `width`, `height`, `top`, or `left`. Animate `transform` and `opacity` only.
3. Never italic, anywhere in the interface.
4. `overflow-x: clip` on both `html` and `body`. Never `hidden`, never `100vw`.
5. Image-bearing grid tracks use `minmax(0, 1fr)`; display heads carry `overflow-wrap: break-word; min-width: 0`.
6. Every interactive element has `:focus-visible`, appearing instantly.
7. Every animation has a `prefers-reduced-motion: reduce` fallback, and content is visible with scripting off.
8. Never an invented metric, testimonial, logo wall, case-study count, price, quote, or customer count. A fact nobody gave is absent, or a
   marked `{{placeholder}}` — never a plausible-looking invention.
9. Never an eyebrow, and never a label in tracked capitals or small caps: labels, captions, table heads, tags, and nav links are the body
   face (or the theme's label face), a step smaller, sentence or lower case, untracked.
10. Never middle-dot-joined meta strings, arrows glued to link text, or decorative status dots.
11. Never a purple-to-blue gradient, never violet or lavender in the page's own design (a real third-party logo keeps its own colours),
    never a card inside a card, never an emoji as an icon, never a hand-drawn browser or OS window.
12. No background gradients, ever — surfaces are flat. The single exception is the hero heading text gradient: dark `#FFFFFF` → `#9B9B9B`,
    light `#000000` → `#666666`.
13. The hero's headline, one sentence, and primary action are all visible at 1280 x 800 without scrolling.
14. About 80 words on any one screen; 450 visible words at most. The hero is a headline of seven words or fewer (50 characters, no periods),
    one sentence of twelve words or fewer, and one or two actions.
15. The container is capped and centred (1200–1280): at 1920 the gutters grow, the measure and the grids do not. Left and right content
    edges are equal.
16. The first non-empty line of the CSS source is the stamp, opening `/* Hallmark ·` and naming the skill, theme, deal, genre, job, and signature, then the critique line, then any
    waivers — all within the first 40 lines.
17. No hyphens inside copy, and no em or en dashes: use a comma, a colon, a full stop, or parentheses instead. No orphaned words (`text-wrap: balance` on headings, `text-wrap: pretty` on body). Sentence case for headings
    and buttons. Never write "revolutionize", "supercharge", "cutting edge", "effortless", "transform your workflow", "take it to the next
    level", "harness the power", or "world class" — say what the product does.
18. Every interactive element ships all six states — hover, active, focus, loading, empty, error. No dead links: a button pointing at `#` is
    linked or visibly disabled. The current page is indicated in the navigation.

### Where the three sources disagreed

- **Italics:** one source bans them everywhere; the floor takes the ban.
- **Eyebrow:** banned outright. The Figma exception (only when the user explicitly asks, or an uploaded inspiration image shows one) applies
  in Route E only, recorded as a waiver.
- **Heading weight:** Semibold on the web (named styles, § 3); Regular in Figma (`references/upstream/figma-designer.md`). The one weight
  difference.
- **Scroll motion:** no scroll reveals, fade-ins, or parallax. The one permitted scroll-triggered effect is the tagline word-by-word colour
  reveal (§ 3, B11), which moves no element.
- **Direction:** a theme build deals a theme (`scripts/theme.mjs`); a free build deals palette, pairing, and hero (`scripts/start.mjs`,
  `assets/layout/deal.mjs`). Never both on one run.
- **Word budget:** the 80-per-screen and 450-per-page caps bind every route, including the landing-page section menu — pick the sections the
  material supports and keep the FAQ short.
- **Fonts:** on a theme build the theme's faces win; on a free build use Geist, Manrope, Geist Mono, or Poppins. Never Inter, Roboto, Arial,
  Open Sans, or Helvetica — unless a real brand's own type demands it (`references/hallmark/brand-truth.md`).
- **Dark surfaces:** theme paper wins on theme builds; free dark builds use the dark ramp in § 3.

### Theme contract (summary)

A theme is a material, nothing else: paper, ink, faces, rules, radius, depth, texture, controls, motion, voice. It never says what the page
contains, in what order, in what shape, or how much room anything gets, and it never ships a component, a section sequence, a nav, a footer,
a hero, or copy. Space, section composition, and hero size belong to `references/hallmark/layout.md` and bind every theme alike. Each theme
file opens with a header block — name, slug, genre, paper band with L and hue, display class and face, accent band and hue, posture
(`restrained`, `committed`, `full-palette`, `drenched`), 10–25 lowercase keywords, one material line, photo treatment — then a body of
3,000–8,000 bytes in ten ordered parts: feel, tokens (`:root` in OKLCH), type, surfaces, range, controls, motion, voice, do-nots, build
hint. Every theme ships `<slug>.jpg` beside its file: a first screen and one lower screen of a finished page built in the theme.
`scripts/theme.mjs validate <file>` checks the contract; `scripts/theme.mjs index` compiles `references/hallmark/themes/index.json`, which
the deal reads — never the files. Where a theme and a shape, genre, or craft file disagree on material, controls, or motion, the theme wins;
the Floor and the user's own words beat both.

## 2. Route picker

Read the prompt, pick one route, and say which. Do not mix routes on one run.

### Route A — Landing page (new)

For a new landing page or marketing page. Strategy first, then the visual system. Load `references/upstream/landing-page-design.md` in full.

1. **Pre-flight.** Read the project before asking anything: a `design.md` or `DESIGN.md` at the root is a locked system and overrides
   everything below; `.hallmark/brand-spec.md` or a prompt naming a real brand runs `references/hallmark/brand-truth.md` (never theme a real
   brand from memory); the project's fonts, palette, spacing, and framework; the product itself — a URL, a running dev server, or a folder
   the build captures with `scripts/capture.mjs` (`references/hallmark/imagery.md` § 4). Cache the result in `.hallmark/preflight.json`.
2. **Ask once.** One message: (1) **Material** — screenshots or a recording, photos, real numbers, a quote with a name, logos the page may
   use; without photos the page uses stand-ins from the photo library that the client replaces later, and no number, quote, or logo is ever
   invented. (2) **Audience** — who uses this and what do they care about. (3) **Use** — the one action the page drives. (4) **Tone** — pick
   an extreme (editorial, brutalist, soft, utilitarian, luxury, playful, technical, austere); "clean and modern" is not a tone. Plus the
   vibe in 4–8 words and an anchor colour if any. Also take the intake the strategy file needs: the exact offer, what counts as a
   conversion, top three objections, traffic source, proof points, guarantees. Or the user says **go ahead**: infer, state the inferences in
   one line at the top of the reply, stamp them, and ask no follow-ups. Facts are never inferred.
3. **Strategy.** One offer → one audience → one primary action. Pick the section menu from the strategy file (hero; problem to solution;
   benefits, three to five, outcome driven; how it works, three steps; social proof; FAQ; risk reversal; final CTA identical to the top) and
   trim it to six to nine sections including hero and footer, inside the Floor's word caps. Pick a layout type — A classic hero plus
   sections, B long-form story, C minimal conversion page, D comparison page — and say why. Write the output format first: page outline,
   hero copy, benefits, how it works, FAQ, SEO/AEO (index or noindex, title and meta if indexed), layout recommendation. Match message to
   source; one primary CTA, never competing CTAs above the fold; benefit first, specific, with proof beside the claim it supports; at least
   one risk reversal.
4. **Direction.** First match wins: user named a theme → build it; user asked for custom → `references/hallmark/direction.md` (replaces the
   draw, the shapes, `layout.md`, the genre file, and the composition and fold rules; the Floor, the gates, and the sweep hold); everything
   else deals a theme: `node scripts/theme.mjs deal --genre <genre> --prompt "<the prompt>"` deals three that fit the prompt and clear the
   log — look at the three pictures, pick the one whose material can carry the prompt, say which and why, and load only
   `references/hallmark/themes/<slug>.md`. Re-deal only when asked. No Node: pick from `references/hallmark/themes/index.json` by hand and
   stamp `deal: manual`. **Genre,** silently: AI tool, generative, music, video, voice, dark, atmospheric → `atmospheric`; SaaS, enterprise,
   API, platform, developer tool, infra, B2B → `modern-minimal`; playful, fun, friendly, soft, kids, games, community → `playful`; otherwise
   `editorial`. Once a theme is dealt, its genre wins.
5. **Load.** Exactly these: `references/hallmark/layout.md`, `references/hallmark/anatomy.md` (the job's part),
   `references/hallmark/imagery.md`, `references/hallmark/craft.md`, `references/hallmark/genres/<genre>.md`,
   `references/hallmark/themes/<slug>.md` and its picture, `references/hallmark/gates.md` § 1 to § 4. Only when needed, one file each from
   `references/hallmark/`: a macrostructure, `microinteractions.md`, `interaction-and-states.md`, `responsive.md`, `texture.md`,
   `scroll-choreography.md`, `dark-mode.md`, `data-viz.md`, `fonts.md`, `comp.md`, `design-md.md`. Loading more is the largest avoidable
   cost.
6. **Picks block, once.** The run's only recital of its decisions, and the user's redirect window — shape and draw, theme dealt (n/3) with
   its material line, chrome (nav, footer), hero posture, signature (the strongest real thing, shown at its best on the first screen),
   sections, material (real / pictures / absent), sweep. Then one quiet line, skipped in component scope or when `design.md` exists: _System
   portable? Say `lock the system` for a `design.md`._
7. **Build.** Start from the scaffold: `node scripts/theme.mjs scaffold <slug>` writes `tokens.css` and `base.css` beside the project's
   stylesheet and prints the stamp skeleton. Write only the page. Read `references/hallmark/patterns.md` once: controls in all eight states,
   a slot, a missing fact, a form that posts nowhere yet, one reveal, figures that compare. **Hero first:** nav and hero, nothing below them
   yet, then `node scripts/sloplint.mjs <file> --render --stage hero` and the hero review (`references/hallmark/gates.md` § 6). Build the
   sections once the hero ships. One idea per screen, set big. Include the mandatory tagline reveal section (§ 3, B11) somewhere in the
   mid-page argument, never stacked directly under the hero. Show, do not describe: the page shows the real thing — user pictures,
   screenshots of the real product, the product built at full fidelity only when it cannot be reached, or library photographs (`node
scripts/theme.mjs photos "<subject>" --theme <slug>`), big, in the theme's treatment, each library photo credited in the footer. Pictures
   take at most a third of the page below the hero, never two photograph-led sections in a row. Page invariants: one primary button style,
   one container width, one column gap below the hero, one radius per nesting level, never more centred heading groups than left-aligned
   ones. Log the build: `node scripts/theme.mjs log --entry '<json>'` atop `.hallmark/log.json`.

### Route B — Any web page

For a company, product, shop, place, service, or app screen that is not a landing page. Load `references/taste/system.md`,
`references/taste/sections.md`, `references/taste/layout-v4.md`, and `references/taste/copy.md` in full before the first page.

1. **Declare the kind** on the plan's first line and on the page: `<html data-type>`, `<meta name="page-type">` (same value), and `<meta
name="site-kind">`; a place adds `<meta name="page-kind" content="place">`. App, SaaS, AI, developer tool, fintech, or studio selling its
   own software → `software`; a game → `software` / gaming; hardware or a tech device → `product` / tech; any other physical product or
   brand → `product`; people hired (clinic, law firm, agency, studio, trade) → `service`; people come to it (cafe, bakery, restaurant,
   guesthouse, shop, gym) → `place`. A maker that also opens its door or teaches is a **place**; its web shop becomes the goods section.
2. **Plan by kind** (`references/taste/sections.md`). Place: photographs lead, 12–20 on the full page, hero a photograph whenever a frame
   fits, visit block on screen two. Product and service: the product, the people, the rooms, the work — two or more pictures a screen. Every
   product page: the product **big** where it stands whole, a different picture each section, every headline promise pictured, the swatch
   changes the picture, no fact twice. Tech: the client's own subject leads at true size — software shows its own UI as live HTML in one
   `app-frame`, never a generic dashboard; hardware shows its photographs, else its render; a game shows its name in the h1 and its world as
   full-bleed key art. By deal: **one effect** and **one or two moments** in their own sections; four live WebGL contexts at most. One
   object never carries the page: the hero object leads at most two more sections.
3. **Deal, never choose by taste.** Each command keeps a history, so pages differ (`library/palettes.json` and `library/type.json` are the
   deal tables; per-run state lives in `.taste-skill/`):

    ```bash
    node assets/layout/deal.mjs --type <page type> --has <photo,ui,object,film> --history .taste-skill/layout-history.json
    node scripts/start.mjs deal --page <kind> --history .taste-skill/history.json
    node scripts/start.mjs css --page <kind> --palette <id> --type <id> --radius soft --history .taste-skill/history.json
    node scripts/start.mjs brand --page place --bg "#.." --ink "#.." --accent "#.." --type <id> --radius soft
    ```

A place takes its own colours (`brand`, always). Radius: `sharp` for fintech and developer tools, `soft` by default, `round` for consumer
apps, square on a place. Never violet: deal again. Keep the `:root` block as printed. Effects, scenes, moments, loops, counts, CSS grounds,
dark pages, and dark heroes are tech only — an other page is photographs, flat colour, type, real icons, and the hover layer. 4. **Build** from `assets/starter.html` with `assets/system.css` and `assets/system.js`: set `<html data-type data-radius data-buttons
   data-motion>` and the three metas, the nav class; copy only the dealt hero section from `assets/layout/hero-<id>.html`; build each
section to its recipe in `references/taste/sections-library.md`, one `.wrap`, its h2 first, `--h: 1` or `2`. Paste UI from
`assets/ui/<name>/fragment.html` and rewrite every name, number, and logo to the client's. Run `scripts/icons.mjs scan index.html --out
   assets/icons --colour` last, so every icon the page names is a local file. Credits: the one footer line from `scripts/photos.mjs
   credits`, once the markup uses the photographs. No caption or description under any image, render, or visual. Every visual renders, never
an empty ground, at 1440, 1024, 768, and 390. Addresses: street and district only; no house number, postcode, or coordinates; no register
or VAT numbers; no phone in a real format; contacts on `.example`. 5. **Sweep** (§ 4) — the taste checker is mandatory on this route.

### Route C — Redesign / audit

For work on an existing page. Read `references/hallmark/redesign.md` first.

- `redesign <path>`: a full redesign keeping the content and the wiring. Record before: `node scripts/sloplint.mjs <path> --before`,
  rebuild, then check kept: `node scripts/sloplint.mjs <path> --kept`. Any other change to an existing design is not a redesign run: do it
  as asked, in the project's own system.
- `audit <path>`: a report, no edits. Run sloplint (static tier, plus `--render` when a browser is available), the taste checker (§ 4, step
  4), and the quick checklist in `references/upstream/landing-page-design.md`; check contrast (body 4.5:1, large text and UI parts 3:1).
  Report every finding with file and line, judged false positives on the record.
- Never delete or edit the kit's own files (`assets/`, `scripts/`, `references/`) to clear a check: a check that flags a kit file is
  reported, and the page is checked again after any change.

### Route D — Taste pass

Check only, no rebuild. For a page the user wants judged, or that "looks generic / templated / AI-made". Run sloplint's static tier, then
the taste checker (§ 4, step 4) against the page as it stands. Judge it on the Floor plus the taste rules that matter most: one section per
screen, equal edges, every visual draws, no caption under any image, the right things for the kind (no effect, print, scene, or moment
outside tech; the product big and whole; real icons in their own colours; flat grounds on other), motion that answers the pointer and never
tilts, one system (one button pair, one card style, one radius scale, one link look), copy that names things, fast (no FAIL row in
`scripts/perf.mjs`), clean at 820, 768, and 390. Report the failures with file and line. Fix nothing unless asked.

### Route E — Figma (optional, gated)

Only when the user shares a Figma link or asks for a Figma mockup. **Gate:** this route needs the upstream Figma skills (`figma-use`,
`figma-generate-design`, `figma-generate-library`). If any is missing, stop and say which is missing — do not improvise Figma calls. Load
`references/upstream/figma-designer.md` and follow its workflow: check the file first and reuse what exists; set up foundations if missing
(spacing and radius variables, the two colour layers `Core Colors` then `Color System` with Light and Dark modes, the named text styles) and
show them on a `Foundations` frame; build section by section, hero first, screenshot after each section and fix before moving on; auto
layout everywhere; bind, don't type — every fill, stroke, radius, padding, and gap bound to a variable, every text layer on a text style,
designs bound to `Color System` tokens only. For a landing page in Figma, also follow `references/upstream/landing-page-design.md` Part A
for structure and copy, with the B11 tagline section shown as a prototype interaction. Route E never runs sloplint; its gate is the Figma
checklist at the end of `references/upstream/figma-designer.md`.

## 3. Shared visual system

Every visual value resolves through these rules instead of being invented ad hoc. When a rule here conflicts with a framework default, this
file wins. When the user's explicit prompt conflicts with a rule, the user wins.

### Type scale

Always resolve font sizes to the Tailwind type scale. Never leave an arbitrary value (`text-[19px]`, `font-size: 22px`, `1.4rem`). A size
between steps snaps to the closest step **below**, taking its paired line height. Steps, as size / line height: `text-xs` 12/16 · `text-sm`
14/20 · `text-base` 16/24 · `text-lg` 18/28 · `text-xl` 20/28 · `text-2xl` 24/32 · `text-3xl` 30/36 · `text-4xl` 36/40 · `text-5xl` 48/1 ·
`text-6xl` 60/1 · `text-7xl` 72/1 · `text-8xl` 96/1 · `text-9xl` 128/1.

### Named text styles

Every piece of text uses one of these named styles, exactly as written. Define each once as a reusable class or token in kebab case
(`heading-1`, `body-4`, `button-md`, `caption-2`) and apply that. A new style adds the next number in its group (e.g. Body 7), built from a
scale step — never a new name or an off-scale size. Headings are Semibold on the web; in Figma they are Regular
(`references/upstream/figma-designer.md`).

- **Heading** (page and section headings; Heading 1 is the hero): H1 `text-6xl` 60/60 · H2 `text-5xl` 48/48 · H3 `text-4xl` 36/40 · H4
  `text-3xl` 30/36 · H5 `text-2xl` 24/32 · H6 `text-xl` 20/28 — Semibold.
- **Title** (card titles, list item titles, labels that lead a block, nav items): T1 `text-xl` 20/28 · T2 `text-lg` 18/28 · T3 `text-base`
  16/24 · T4 `text-sm` 14/20 · T5 `text-xs` 12/16 — Medium.
- **Body** (running text; within each size, 1 is the strongest weight, the last is regular): B1 `text-base` 16/24 Semibold · B2 16/24 Medium
  · B3 16/24 Regular · B4 `text-sm` 14/20 Semibold · B5 14/20 Medium · B6 14/20 Regular.
- **Button** (text inside buttons only; main buttons Button-md, small header buttons Button-sm): lg `text-lg` 18/28 · md `text-base` 16/24 ·
  sm `text-sm` 14/20 · Xsm `text-xs` 12/16 — Semibold.
- **Caption** (metadata, helper text, badges, timestamps, fine print): C1 `text-sm` 14/20 Medium · C2 14/20 Regular · C3 `text-xs` 12/16
  Semibold · C4 12/16 Medium · C5 12/16 Regular.

Hero heading and subheading cap at 680px, with line breaks at meaningful points — break where the thought breaks, never mid-phrase. One
typeface per site; a second face only when the prompt explicitly asks for it. Geist Mono is allowed beside the main font only for code,
data, or numeric UI. Never ultra-bold weights (900/black): cap at Semibold or Bold.

### Spacing

Only these values, in pixels — nothing between them, nothing outside them: 0 · 2 · 4 · 8 · 12 · 16 · 24 · 32 · 40 · 48 · 64 · 80 · 96
(tokens Spacing-0, -25, -50, -75, -100, -200, -300, -400, -500, -600, -700, -800, -900). Main buttons: 8px vertical padding, 12px
horizontal.

### Corner radius

Tailwind radius values only. **Nested radius formula:** when a shape sits inside another and the gap between them is less than 32px, `inner
radius = outer radius − gap`, applied only when the result is greater than 2 — below that, leave the inner shape square or unchanged.
Example: an outer card at 16px with 8px of internal padding gives an inner element an 8px radius. Never apply a border to only one side of a
card; borders go all the way around or not at all. To divide rows, use a 1px rule filled with a border token, not a one-side stroke.

### Dark mode background ramp

Free dark builds use only these: `#000000` · `#181818` · `#1F1F1F` · `#272727` · `#313131` · `#131209`. On a theme build the theme's paper
wins. One accent colour, kept below 80% saturation.

### Icons — the split

- **UI icons:** Phosphor, Solar, or Iconamoon — one set per page, one stroke weight across the whole page. Never Material Icons or Material
  Symbols.
- **Brand, product, and tool icons:** the real full-colour mark, fetched with `scripts/icons.mjs` — never a drawn look-alike, never redrawn
  from primitives. Brand icons are trademarks: use only marks the client may use.
- Small diagram visuals in cards (a hub with branches; one input, a main processor, three parallel lanes; pulses running along the lines)
  come from `assets/diagrams` (`references/taste/diagrams.md`).

### Motion

Base curve `cubic-bezier(0.22, 1, 0.36, 1)`: `duration-500` for layout and position changes, `duration-300` for colour and opacity on hover,
never shorter than 200ms. Never a browser default curve (`ease`, `linear`, `ease-in-out`). Hover layer: a linked card lifts 2px, a photo
zooms 1.02–1.03 inside its frame, buttons step on hover and press on click, underlines draw, card loops cycle in 2.5–4s, repeat and restart
on hover. Never strip or override the motion layer. No tilt, no carousels, no timed tabs. No scroll reveals, no parallax, no fade-in on
scroll — except the tagline reveal below. Navigation: a compact bar floating off the top edge, translucent over a background blur; the menu
toggle transforms between its two states; the mobile menu opens as a full-height panel; links inside it arrive one after another, each
rising 24px while fading in, stepped 60ms apart, capped at 400ms total. Reveal work uses `IntersectionObserver` (or `whileInView`); never an
unthrottled scroll listener. Under `prefers-reduced-motion`, movement becomes a plain opacity change and nothing stays hidden.

**Tagline reveal (B11, mandatory on Route A).** Every landing page includes one large type section stating the core benefit or tagline,
separate from the hero, further down the page as its own moment. Minimum two lines of text. Heading 3 to Heading 1 depending on line count,
max width capped like the hero. Text starts at roughly 25–35% opacity of the base text colour; as the section scrolls into view each word
transitions individually to the full text colour, in reading order, one at a time as it crosses a trigger line — never the whole block
flipping at once. Base curve, never a linear fade. Under `prefers-reduced-motion`, show the final text at full colour right away, with no
word-by-word animation.

### States

Every interactive element ships: **Hover** (background shift, slight scale, or translate) · **Active** (`scale(0.98)` or `translateY(1px)`)
· **Focus** (a visible ring — an accessibility requirement, not optional) · **Loading** (skeleton loaders shaped like the real layout, not
circular spinners) · **Empty** (a composed "getting started" view, never a blank panel) · **Error** (inline and specific; never
`window.alert()`). System messages are calm and specific ("Invoice sent to Dana"); errors say what failed and what to do next ("Upload
failed. The file is over 20 MB."). No cute interjections, no exclamation marks. Never rely on colour alone to show state — pair it with an
icon, label, or weight change. Touch targets are at least 44 × 44 on mobile.

### Ship list

Things that get forgotten and make a page feel unfinished: privacy policy and terms links in the footer · a custom, branded 404 ·
client-side form validation for email format and required fields · a skip-to-content link for keyboard users · cookie consent where the
jurisdiction requires it · a branded favicon · `<title>`, meta description, `og:image`, and social sharing tags · alt text on every
meaningful image · semantic HTML (`nav`, `main`, `article`, `aside`, `section`) · a way back from every page · a check at 390px wide (no
horizontal overflow, buttons keep their text inside, the primary action visible in the first screen) · photo credits in one footer line
(Wikimedia Commons photos are credited there, with their licence).

## 4. Build order and sweep

Build section by section, in this order: hero, benefits, how it works, proof, FAQ, final CTA. Never rebuild the whole page on each
iteration. On Route B the order is the plan's section order, one line per section: its id, its one idea, its picture and its kind, its
screens (1 or 2).

### Sweep

1. `node scripts/sloplint.mjs <files> --genre <genre> --render` (`--scope component` or `--scope app` where it applies; `--stage hero` for
   the hero pass; in a framework project, `--url http://localhost:<port>/<route>` with the dev server running). With a browser available the
   render tier runs and writes the screenshots — never drive a browser by hand. Without a browser it degrades gracefully to the static tier,
   which is still binding: note the tier in the report. Fix every `FAIL` and re-run until clean; fix or waive every `REFLEX` (waivers on the
   record, with a real reason).
2. Load `references/hallmark/gates.md` § 5 and walk the J and R/J gates. Confirm or dismiss every WARN. Fix every open Floor finding; fix or
   waive every Reflex one; answer every Finish one.
3. The finish review in fresh context (`references/hallmark/gates.md` § 6; `references/hallmark/review-finish.md` and
   `references/hallmark/review-hero.md`): act on its first word (`recapture`, `rebuild`, `fix`, `ship`) and score the fixes yourself.
4. The taste checker (mandatory on Routes A, B, and D):

    ```bash
    node scripts/consistency.mjs index.html --widths 1440,1024,820,768,390 --rhythm-widths 1440,820,768,390 --profile <dir> --page <kind> --category "<what is sold>" --primary "<main action>"
    node assets/layout/check.mjs --url index.html --profile <dir> --sizes 1440x900,1024x768,820x1180,768x1024,390x844 --shots shots/layout
    node scripts/shoot.mjs --url index.html --w 1440 --out shots/1440.png --profile <dir>
    node scripts/perf.mjs index.html --profile <dir>
    ```

Shoot 1024, 820x1180, 768x1024, and 390 as well. Every `check.mjs` finding fails the page. Fix every FAIL (one judged false goes in the
report with its reason), shoot again, and read every screenshot against the checklist. Each checker serves the page file itself over http on
127.0.0.1 (never `file://`); for a built page whose links start at the site root, pass `--root` with the build folder. Only the skill's
scripts, each running one headless Chrome with WebGL on the CPU, closed by its own PID, one at a time; never a windowed browser or a browser
tool. 5. Close with the report: the kind, the deal (palette, pairing, hero, grounds, effect, moments, scene); the checker, layout, and perf
results; what could not be checked; every assumed price, hour, or address; the photographs and art the client must supply and every
stand-in frame among them; every client slot, its file, and its stand-in; the material ask — every slot, its size, what belongs there,
then the one piece of material that would most improve the page. 6. Update the Picks block: any row the build changed, and the last row with the outcome (`Floor 0 FAIL · Reflex 2 (1 waived) ·
   finish-review: 3 resolved`). A fabricated pass is itself slop.

Verification is budgeted: one batched inspection, one fix batch, at most one confirming round; each review adds one fix batch and its
recapture.

Per-run state lives in the project, never in the skill folder: `.hallmark/` (`preflight.json`, `log.json`, `before.json`, `shots/`) and
`.taste-skill/` (`history.json`, `layout-history.json`, Chrome profiles). The skill folder is read-only at runtime.

## 5. Install and runtime

- **Install:** copy this folder as `web-design` into the harness's skills directory — `.claude/skills/` or `.agents/skills/` (or the
  equivalent skills folder of the harness in use). Do not run `scripts/install.mjs`: it installs the upstream skill under its own name.
- **Requires Node 22+** (sloplint alone runs on Node 18+). Chrome, Edge, or Chromium for `--render` and the taste checker; without a
  browser, sloplint still runs its static tier and the taste checker reports what it could not check. ffmpeg is optional.
- **No API keys. No npm dependencies, no build step.** Network only for photographs (Wikimedia Commons via `scripts/photos.mjs`; theme
  photos via `scripts/theme.mjs photos`) and font files; everything else runs offline. Photo credits go in the single footer line.
- **What lives where:** `references/hallmark/` is the floor, gates, genre files, macrostructures, and the 50 themes (plus
  `themes/index.json`); `references/themes` is a symlink to `references/hallmark/themes` — the one layout shim the kit needs, so
  `scripts/theme.mjs` finds the themes where it expects them; no vendored file is modified. `references/taste/` is the kind system, section plans and recipes, copy, motion, photos, icons, and checker rules;
  `references/upstream/` holds the two AI-design skills verbatim as design references; `scripts/` merges both kits' scripts (sloplint,
  theme, capture, picture, and the taste checker/dealer scripts) with no filename collisions; `assets/` is the taste kit (starter, system,
  layouts, effects, moments, scenes, objects, UI, icons); `library/` is the taste deal tables (`library/palettes.json`,
  `library/type.json`). `LICENSES.md` carries all three upstream MIT notices; `README.md` is the install and route summary.

### Reference index (load order)

- Floor and gates: `references/hallmark/gates.md`, `references/hallmark/flow.md`, `references/hallmark/layout.md`,
  `references/hallmark/craft.md`, `references/hallmark/anatomy.md`, `references/hallmark/imagery.md`, `references/hallmark/patterns.md`
- Direction: `references/hallmark/direction.md`, `references/hallmark/themes/index.json`, `references/hallmark/themes/<slug>.md` (+
  `<slug>.jpg`), `references/hallmark/genres/<genre>.md`, `references/hallmark/macrostructures.md` and the 21 files in
  `references/hallmark/macrostructures/`
- Branches: `references/hallmark/redesign.md`, `references/hallmark/brand-truth.md`, `references/hallmark/dark-mode.md`,
  `references/hallmark/data-viz.md`, `references/hallmark/fonts.md`, `references/hallmark/texture.md`, `references/hallmark/responsive.md`,
  `references/hallmark/scroll-choreography.md`, `references/hallmark/microinteractions.md`, `references/hallmark/interaction-and-states.md`,
  `references/hallmark/comp.md`, `references/hallmark/design-md.md`, `references/hallmark/export-formats.md`,
  `references/hallmark/review-hero.md`, `references/hallmark/review-finish.md`
- Taste: `references/taste/system.md`, `references/taste/sections.md`, `references/taste/sections-library.md`, `references/taste/copy.md`,
  `references/taste/layout-v4.md`, `references/taste/photos.md`, `references/taste/icons.md`, `references/taste/motion.md`,
  `references/taste/cards.md`, `references/taste/diagrams.md`, `references/taste/backgrounds.md`, `references/taste/effects-usage.md`,
  `references/taste/effects-creative.md`, `references/taste/effects-objects.md`, `references/taste/moments.md`,
  `references/taste/scenes.md`, `references/taste/perf.md`
- Upstream: `references/upstream/landing-page-design.md`, `references/upstream/figma-designer.md`
- Scripts: `scripts/sloplint.mjs`, `scripts/theme.mjs`, `scripts/capture.mjs`, `scripts/picture.mjs`, `scripts/start.mjs`,
  `scripts/consistency.mjs`, `scripts/shoot.mjs`, `scripts/perf.mjs`, `scripts/photos.mjs`, `scripts/icons.mjs`, `scripts/validate.sh`
- Kit: `assets/starter.html`, `assets/system.css`, `assets/system.js`, `assets/layout/deal.mjs`, `assets/layout/check.mjs`,
  `library/palettes.json`, `library/type.json`
