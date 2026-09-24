# DHANISHTA — PORTFOLIO UI SPECIFICATION
## Complete Design System & Page Blueprint
### Version 2.0 | April 2026

---

## 01. DESIGN PHILOSOPHY

**Aesthetic Direction:** Elite / Architectural / Commanding
**NOT:** Editorial, Magazine, Decorative
**Feeling:** A senior PM's thinking — sharp, structured, no fluff
**One-liner:** "Every pixel earns its place."

---

## 02. COLOR SYSTEM

### Dark Mode (Default)
```
--bg:           #0A0A0A    → Primary background
--bg2:          #111111    → Secondary background (ribbon, surface areas)
--surface:      #1A1A1A    → Cards, stats bar
--border:       #2A2A2A    → All dividers, card borders
--text:         #F5F5F5    → Primary text
--text-muted:   #666666    → Secondary text, descriptions
--text-dim:     #3A3A3A    → Labels, metadata, very quiet text
--accent:       #E07A3A    → Primary accent (deep orange)
--accent2:      #B85C1A    → Secondary accent (darker rust)
--green:        #4ADE80    → Open to Roles only
--green-glow:   rgba(74, 222, 128, 0.12)
```

### Light Mode (Moody Beige)
```
--bg:           #EFEDEA    → Primary background
--bg2:          #E8E5E1    → Secondary background
--surface:      #DDD9D4    → Cards, stats bar
--border:       #C8C3BC    → All dividers
--text:         #1A1A1A    → Primary text
--text-muted:   #6B6560    → Secondary text
--text-dim:     #B0AAA4    → Labels, metadata
--accent:       #B85C1A    → Deep rust (same family)
--accent2:      #8B4010    → Darker rust
--green:        #2D7A4F    → Forest green (Open to Roles)
--green-glow:   rgba(45, 122, 79, 0.12)
```

### Accent Consistency Rule
Orange/rust works across both modes. Green shifts electric→forest. Same identity, different temperature.

---

## 03. TYPOGRAPHY SYSTEM

### Font Imports (Google Fonts)
```css
@import url('https://fonts.googleapis.com/css2?
  family=Instrument+Serif:ital@0;1
  &family=Lora:ital,wght@0,400;0,500;0,600;1,400;1,500
  &family=Inter:wght@300;400;500;600
  &family=DM+Mono:wght@300;400;500
  &display=swap');
```

### Font Roles
```
--font-display: 'Instrument Serif', serif
  → Hero headline, page titles, case study titles, section big text
  → High-contrast transitional serif, sharp hairlines
  → Use italic variant for accent/emphasis lines

--font-body: 'Lora', serif
  → Case study body copy, teardown body copy, summaries
  → Paragraph text inside content sections
  → Never smaller than 17px

--font-ui: 'Inter', sans-serif
  → ALL UI labels (DOMAIN, CASE STUDY, DEPLOYMENT)
  → Navigation items
  → Tags/chips
  → Button text
  → Meta text (dates, categories)
  → Stats bar labels
  → Section eyebrows

--font-mono: 'DM Mono', monospace
  → Ribbon ONLY
  → Clock display
  → Nowhere else
```

### Type Scale
```
Hero Headline:         clamp(64px, 10vw, 128px)  | Instrument Serif | weight 400
                       Line height: 0.92
                       "I find the gaps" → normal weight
                       "others ship past." → italic, slightly lighter opacity

Page Title (cases):    clamp(48px, 7vw, 96px)    | Instrument Serif | weight 400
                       Line height: 0.95

Section Title:         clamp(32px, 4vw, 56px)    | Instrument Serif | weight 400
                       e.g. "What I Built"

Card Title:            clamp(22px, 2.5vw, 38px)  | Instrument Serif | weight 400
                       e.g. "The IHCL Strategy"

Body/Summary:          19–20px                   | Lora | weight 400
                       Line height: 1.8

Nav Name:              16px                      | Instrument Serif | weight 400

UI Label (eyebrow):    9px                       | Inter | weight 500
                       Letter spacing: 0.2em
                       Text transform: uppercase
                       e.g. "DISTRIBUTION & GTM"

UI Label (table head): 9px                       | Inter | weight 500
                       Letter spacing: 0.15em
                       Text transform: uppercase
                       e.g. "DOMAIN", "CASE STUDY"

Tags/Chips:            8–9px                     | Inter | weight 500
                       Letter spacing: 0.15em
                       Text transform: uppercase

Meta text (dates):     10–11px                   | Inter | weight 400
                       e.g. "Q4 2025", "Live MVP"

Stats Value:           40px                      | Instrument Serif | weight 400
                       Color: --accent

Stats Label:           9px                       | Inter | weight 500
                       Letter spacing: 0.15em
                       Uppercase

Ribbon text:           22px                      | DM Mono | weight 400
                       Font style: italic
                       DO NOT CHANGE

Clock:                 10px                      | DM Mono | weight 300
                       Letter spacing: 0.15em
```

---

## 04. SPACING SYSTEM

```
Page horizontal padding:    48px (desktop) | 24px (mobile)
Section vertical padding:   100px top/bottom
Content grid gap:           80px (label vs content)
Card padding:               28px 32px
Stats bar cell padding:     36px 40px
Nav padding:                28px 48px
Tag padding:                7px 16px
Button padding:             14px 36px
```

---

## 05. CURSOR SYSTEM

### Default Cursor
```
Shape:          Small square (6×6px)
Color:          --accent
Mix-blend-mode: difference
Position:       Fixed, pointer-events: none
Transition:     transform 0.08s ease
```

### Trail Cursor
```
Shape:          Larger square (28×28px), 1px border only (hollow)
Color:          rgba(224, 122, 58, 0.25) border
Lag:            0.12 lerp factor — follows smoothly behind
```

### Card Hover State — READ cursor
```
When hovering IHCL / Govr / Zomato / Groww cards:
- Square cursor scales up to 56×56px
- Word "READ" appears centered inside cursor square
- Font: Inter, 7px, letter-spacing 0.2em, uppercase
- Color inverts (mix-blend-mode: difference)
- No READ button anywhere on cards
```

### Contact Section Cursor
```
- Square cursor grows to 12×12px
- Leaves fading trail (3 ghost squares behind, opacity 0.3→0)
- Trail updates on mousemove, fades out in 0.4s
```

### Magnetic Email
```
Radius:         120px
Pull strength:  0.3 × distance
Transition:     none (direct transform for smoothness)
On hover:       Liquid fill — accent color floods bottom-to-top in 0.4s
On click:       Flash white for 0.15s → mailto opens
```

---

## 06. NAVIGATION

### Structure
```
Position:       Fixed, top: 0, full width, z-index: 100
Background:     transparent (no backdrop — content scrolls behind)
Padding:        28px 48px
Layout:         flex, space-between
```

### Left Side — Brand
```
Name:           "Dhanishta"
Font:           Instrument Serif, 16px, weight 400
Color:          --text
Link:           → index.html

Subtitle:       REMOVED COMPLETELY
```

### Right Side — Nav Items
```
Layout:         flex-column, align-items: flex-end, gap: 8px

Item 1:         → INDEX
Symbol:         ↗ (arrow, 12px, Inter)
Font:           Inter, 10px, weight 500, letter-spacing 0.15em, uppercase
Color default:  --text-muted
Color hover:    --text
Effect:         Symbol rotates 360° on hover (0.4s ease)
                Underline draws left→right on hover (0.3s)

Item 2:         → WHAT I FOUND
Symbol:         ↗ (same arrow)
Same treatment as Item 1

Item 3:         → OPEN TO ROLES
Color:          --green always
Dot:            7×7px circle, --green
                Sonar pulse: ::before and ::after rings
                Scale 1→4, opacity 0.8→0, 2.5s infinite
                Second ring: animation-delay 1.25s
Text effect:    Breathing glow animation
                text-shadow cycles: 0→[0 0 12px green-glow]→0
                Duration: 3s infinite ease-in-out
                Color: --green, always lit
```

---

## 07. LIVE CLOCK

```
Position:       Fixed, bottom: 28px, left: 48px
Font:           DM Mono, 10px, weight 300, letter-spacing 0.15em
Color:          --text-dim
Format:         "11:42:07 PM IST"
Update:         Every 1000ms via setInterval
z-index:        50
```

---

## 08. DARK/LIGHT TOGGLE

```
Position:       Fixed, bottom: 28px, right: 48px
z-index:        50
Layout:         Two symbols side by side with sliding indicator

Symbol 1:       ☽  (moon — dark mode)
Symbol 2:       ☀  (sun — light mode)
Font:           Inter, 12px
Gap:            4px between symbols
Indicator:      2px × 100% underline that slides between active symbol
Active color:   --accent
Inactive color: --text-dim

Transition on toggle:
- All CSS variables update via data-theme attribute on <html>
- Background color transitions: 0.8s ease
- Text transitions: 0.5s ease
- Everything bleeds smoothly — no harsh flash
```

---

## 09. HOMEPAGE — INDEX.HTML

### Section 01: HERO

```
Layout:         min-height: 100vh, flex-column, justify: flex-end
Padding:        0 48px 80px

Eyebrow:
  Text:         "PRODUCT & STRATEGY"  ← REMOVED
  REPLACED BY:  nothing. Hero goes straight to headline.

Headline:
  Line 1:       "I find the gaps"
  Font:         Instrument Serif, clamp(64px, 10vw, 128px)
  Weight:       400 (normal)
  Color:        --text
  Animation:    Each word fades+slides up, staggered 0.15s per word
                translateY(50px)→0, opacity 0→1, 0.8s cubic-bezier(0.16,1,0.3,1)
                Words: "I" (delay 0.3s), "find" (0.45s), "the" (0.6s), "gaps" (0.75s)

  Line 2:       "others ship past."
  Font:         Instrument Serif, same size, ITALIC
  Weight:       400
  Color:        --text-muted (slightly quieter)
  Animation:    Entire line fades in as one, delay 1.1s, 0.9s duration
                translateY(30px)→0, opacity 0→1
  Note:         ONE TIME ONLY on page load. sessionStorage flag prevents repeat.

Body Text:
  Content:      "1 MVP shipped solo. 1 dormant enterprise channel unlocked.
                 62% noise cut from AI research. All unsolicited. All from zero."
  Font:         Inter, 18px, weight 400
  Color:        --text-muted
  Max-width:    500px
  Animation:    fadeUp, delay 1.4s

CTAs:
  Button 1:     "See the work ↓"
                Background: --accent, Color: --bg
                Font: Inter, 10px, weight 600, letter-spacing 0.15em, uppercase
                Padding: 14px 36px
                Hover: background → --accent2, translateY(-2px)

  Button 2:     "Start a conversation ↗"
                Background: transparent, Color: --text-muted
                Border: 1px solid --border
                Hover: border-color → --accent, color → --accent

  Animation:    fadeUp, delay 1.6s

Vertical Scroll Text (right side, fixed-ish):
  Text:         "KEEP SCROLLING, IT GETS BETTER"
  Font:         Inter, 9px, weight 500, letter-spacing 0.25em, uppercase
  Color:        --text-dim
  Writing-mode: vertical-rl
  Position:     absolute, bottom: 80px, right: 48px
  Animation:    fadeUp, delay 1.8s

REMOVED:
  - Location block (Bengaluru, IN)
  - Portfolio/2025
  - "PRODUCT & STRATEGY" eyebrow
```

### Section 02: RIBBON

```
Border:         1px solid --border top and bottom
Background:     --bg2
Padding:        18px 0
Overflow:       hidden

Track animation: translateX(0) → translateX(-50%), 25s linear infinite

Items (repeating x2 for seamless loop):
  "Zero to One" · "GTM Strategy" · "AI Systems" · "Distribution" · "Unit Economics"

Item font:      DM Mono, italic, 22px  ← DO NOT CHANGE
Item color:     --text-muted
Item hover:     --accent
Dot separator:  "·", DM Mono, 10px, --text-dim
```

### Section 03: WHAT I BUILT

```
Padding:        100px 48px

Section Header:
  Left:
    Eyebrow:    "WHAT I BUILT"
                Inter, 9px, weight 500, letter-spacing 0.2em, uppercase, --text-muted
                Dash animates before text (see Animation System)

    Title:      "Case Index"  with  "— 02" 
                Instrument Serif, clamp(32px, 4vw, 56px)
                "— 02" is italic, color --accent

  Right (where Hover to Read WAS):
    Text:       "— 02"
                Inter, 12px, --text-muted
                REMOVED — count is now in title

  "Hover to Read" → COMPLETELY REMOVED

Table:
  Columns:      [200px]  [1fr]  [160px]
  
  Header row:
    Font:       Inter, 9px, weight 500, letter-spacing 0.15em, uppercase
    Color:      --text-dim
    Border:     bottom 1px --border
    Labels:     "DOMAIN" | "CASE STUDY" | "DEPLOYMENT"

  Card rows (IHCL + Govr):
    Default state:
      Background:   transparent
      Border:       bottom 1px --border
      
    Domain cell:
      Font:         Inter, 10px, weight 500, letter-spacing 0.1em, uppercase
      Color:        --text-muted
      Padding:      28px 0

    Title cell:
      Font:         Instrument Serif, clamp(22px, 2.5vw, 38px), weight 400
      Color:        --text
      Padding:      20px 24px

    Date cell:
      Font:         Inter, 10px, weight 400
      Color:        --text-muted
      Text-align:   right
      Padding:      28px 0

    NO READ BUTTON anywhere on card.

    Hover state (0.4s transition):
      Background:   --text (near white / near black inverted)
      All text:     color → --bg (inverts)
      Cursor:       Square grows to 56×56px, "READ" text appears inside

    Link:         → work-ihcl.html / work-govr.html
```

### Section 04: DIVIDER

```
Margin:         0 48px
Height:         1px
Background:     --border
Animation:      Width 0% → 100% on scroll enter
                Duration: 0.6s cubic-bezier(0.16, 1, 0.3, 1)
                Triggered once via IntersectionObserver
```

### Section 05: WHAT I FOUND

```
Identical layout to WHAT I BUILT above.

Section Header:
  Eyebrow:      "WHAT I FOUND"
  Title:        "Teardown Index — 02"

Table:
  Header:       "SECTOR" | "TEARDOWN" | "VERDICT"
  Cards:        Zomato + Groww
  Links:        → teardown-zomato.html / teardown-groww.html
  Same hover behavior as above (cursor READ, color invert)
```

### Section 06: CONTACT — THE RECKONING

```
Trigger:        IntersectionObserver, threshold: 0.3
                Fires once, never repeats (sessionStorage flag)

STEP 1 — BLEED (0s):
  body background transitions → #000000 over 2s
  All other sections fade to 0.3 opacity over 1.5s

STEP 2 — CONFRONTATION (starts at 0.5s after bleed):
  Line 1:       "You've seen the work."
                Types letter by letter, 0.045s per character
                Font: Inter, 13px, letter-spacing 0.08em, --text-muted

  Pause:        1500ms

  Line 2:       "You know what happens next."
                Types letter by letter, 0.045s per character
                Same style

  Pause:        1000ms

STEP 3 — SLAM (after pause):
  "Building something" slides up hard
    Font: Instrument Serif, clamp(40px, 6vw, 88px), weight 400
    Animation: translateY(40px)→0, opacity 0→1, 0.5s cubic-bezier(0.16,1,0.3,1)

  "worth defending?" fades in softer
    Font: Instrument Serif, same size, ITALIC
    Color: --accent
    Animation: opacity 0→1, 0.6s ease, delay 0.3s after headline

STEP 4 — SOUND (when email appears):
  AudioContext generates short subtle tone:
    Frequency: 440Hz, duration: 0.08s, gain: 0.03 (very quiet)
    Type: sine wave
    Feels like: a soft 'tock'

STEP 5 — EMAIL (appears after sound):
  Text:         "dhanishtalikhar06@gmail.com ↗"
  Font:         Inter, clamp(12px, 1.5vw, 16px), weight 500
                Letter-spacing: 0.15em, uppercase
  Color:        --text
  Animation:    fadeUp 0.5s

  On hover:
    Liquid fill: ::after pseudo, height 100%, background --accent
                 scaleY(0→1) from bottom, 0.4s ease
                 Text color inverts to --bg
  
  On hover (email shakes slightly):
    animation: shake 0.3s ease
    @keyframes shake: translateX(-3px, 3px, -2px, 2px, 0)

  On click:
    Flash: background --text for 0.15s → mailto opens

STEP 6 — AFTERMATH (links stagger in):
  LinkedIn, GitHub, Email links slide up
  Delay: 0.1s, 0.2s, 0.3s stagger
  Animation: translateY(20px)→0, opacity 0→1, 0.5s each

  On hover each link:
    Underline draws left→right (width 0→100%, 0.3s)
    Color → --text

Layout:
  Contact section:
    Min-height:   85vh
    Display:      flex, align-items: center
    Padding:      100px 48px
    Position:     relative

  Left column (tease + headline + email)
  Right column (links — positioned absolute right: 48px)

  "LET'S TALK SCALE" eyebrow:
    Font: Inter, 11px, weight 500, letter-spacing 0.2em, uppercase
    Color: --text-muted
    With "—" prefix that animates in first
```

### Footer Bar

```
Border:         top 1px --border
Padding:        24px 48px
Layout:         flex, space-between

Left:           "© 2026 DHANISHTA — ALL THINKING, SOME SHIPPING."
                Inter, 9px, weight 400, letter-spacing 0.15em, uppercase, --text-dim

Right:          "● OPEN TO ROLES"
                Inter, 9px, weight 500, letter-spacing 0.15em, uppercase
                Color: --green
                Dot has sonar pulse (smaller version)
```

---

## 10. CASE STUDY PAGES — WORK-IHCL.HTML + WORK-GOVR.HTML

### Back Navigation
```
Padding-top:    120px (clears nav)
Padding-left:   48px

"← Back"
Font:           Inter, 10px, weight 500, letter-spacing 0.15em, uppercase
Color:          --text-muted
Hover:          --accent
Arrow animates left 4px on hover
```

### Page Header
```
Padding:        60px 48px 80px
Layout:         grid, [1fr] [auto], gap 40px
Border-bottom:  1px --border

Left:
  Eyebrow:      e.g. "DISTRIBUTION & GTM"
                Inter, 9px, weight 500, letter-spacing 0.2em, uppercase, --text-muted
                Animation: dash draws first (width 0→32px, 0.3s), then text types in

  Title:        e.g. "The IHCL Strategy"
                Instrument Serif, clamp(48px, 7vw, 96px), weight 400
                Line-height: 0.95

  Subtitle:     Italic description
                Lora, 20px, italic, --text-muted, max-width 560px

Right:
  Label:        "DEPLOYMENT"   Inter, 9px, uppercase, --text-dim
  Value:        "Q4 2025"      Instrument Serif, 20px
```

### Stats Bar
```
Layout:         grid, 4 columns equal
Background:     --surface
Border-bottom:  1px --border

Each stat cell:
  Padding:      36px 40px
  Border-right: 1px --border (last has none)

  Label:        Inter, 9px, weight 500, letter-spacing 0.15em, uppercase, --text-muted
  Value:        Instrument Serif, 40px, weight 400, --accent

COUNT-UP ANIMATION:
  Trigger:      IntersectionObserver on stats bar, threshold 0.3
  Duration:     1.2s per number
  Easing:       ease-out (fast start, slow finish)
  Range:        0 → target value
  Applies to:   All numeric values (14, 3, 9, 62, 180, 7, etc.)
  Suffix:       Preserved (days, %, queries, wks)
  Fires:        Once only
```

### Tags Row
```
Padding:        28px 48px
Display:        flex, gap 12px, flex-wrap
Border-bottom:  1px --border

Each tag:
  Font:         Inter, 9px, weight 500, letter-spacing 0.15em, uppercase
  Color:        --text-muted
  Border:       1px --border
  Padding:      7px 16px
  Background:   transparent
  Hover:        border-color → --accent, color → --accent
```

### Content Sections
```
Layout:         grid, [280px] [1fr], gap 80px
Padding:        80px 48px
Border-bottom:  1px --border

Left (label):
  "(01) — SUMMARY" format
  Font:         Inter, 9px, weight 500, letter-spacing 0.2em, uppercase
  Color:        --text-muted
  "—" prefix animates before text on scroll enter

Right (content):
  Summary/problem text:
    Font:         Lora, 19px, weight 400, line-height 1.8
    Color:        --text-muted
    Strong tags:  color → --accent, font-weight 500

  Approach cards (numbered):
    Background:   --surface
    Border:       1px --border
    Border-left:  3px --accent (on hover, default border-left: 3px transparent)
    Padding:      28px 32px
    Gap:          16px between cards
    Layout:       grid [48px] [1fr]

    Number:       Instrument Serif, italic, 28px, --text-dim
    Text:         Lora, 17px, line-height 1.7, --text-muted
    Strong:       --text

  Outcome bullets:
    Each item:    flex, gap 20px
    Bullet:       "●" Inter, 8px, --accent2, margin-top 8px
    Text:         Lora, 18px, line-height 1.6, --text-muted
    Strong:       --accent
    Separator:    1px --border between items
    Padding:      24px 0 each
```

### Next Case Navigation
```
Padding:        80px 48px
Layout:         flex, space-between, align-items center
Border-top:     1px --border

Left:
  "NEXT CASE"     Inter, 9px, uppercase, letter-spacing 0.2em, --text-muted
  Category:       Inter, 10px, uppercase, --text-dim
  Title:          Instrument Serif, clamp(28px, 4vw, 48px)
  Hover:          color → --accent

Right:
  "← ALL WORK"
  Inter, 10px, uppercase, letter-spacing 0.15em
  Border: 1px --border, padding 12px 24px
  Hover: border → --accent, color → --accent
```

---

## 11. TEARDOWN PAGES — TEARDOWN-ZOMATO.HTML + TEARDOWN-GROWW.HTML

### Identical to case study pages with these differences:

```
Back button:    "← Back to Teardowns" → teardowns nav section on homepage
Page eyebrow:   "PRODUCT TEARDOWN"
Disclaimer:     Below tags row:
                "Independent analysis. Not affiliated with [Company]."
                Inter, 9px, italic, --text-dim

Problem cards:
  Border-left:  3px solid --red (#EF4444)
  Has:          problem-num, problem-title, problem-body, problem-signal

  problem-num:  Inter, 9px, uppercase, letter-spacing 0.2em, --text-dim
  problem-title: Instrument Serif, 22px, weight 400, --text
  problem-body: Lora, 17px, --text-muted
  problem-signal: Inter, 10px, italic, --text-dim
                  Border-top: 1px --border, padding-top 16px

Solution cards:
  Border-left:  3px solid --accent2
  solution-metric: Inter, 10px, --green, border-top 1px --border

Core Loop (teardowns only):
  Flow boxes:   Inter, 10px, uppercase, letter-spacing 0.1em
                Background: --surface, border: 1px --border
                Padding: 14px 20px
  Arrows:       "→", Inter, 14px, --text-dim
  Fork warning: Inter, 10px, --red
                Border: 1px dashed --red, padding 8px 16px

Next navigation: "NEXT TEARDOWN" → other teardown page
```

---

## 12. ANIMATION SYSTEM (COMPLETE)

### Hero Headline — Word-by-Word
```
Trigger:        Page load, once only (sessionStorage: 'heroPlayed')
Line 1 words:   "I"(0.3s) "find"(0.45s) "the"(0.6s) "gaps"(0.75s)
                Each: translateY(50px)→0, opacity 0→1
                Duration: 0.8s cubic-bezier(0.16, 1, 0.3, 1)

Line 2:         Entire line, delay 1.1s
                translateY(30px)→0, opacity 0→0.75
                Duration: 0.9s ease
```

### Scroll Reveals (all sections)
```
Class:          .reveal
Default:        opacity 0, translateY(30px)
Triggered:      IntersectionObserver threshold 0.1
Active:         opacity 1, translateY(0), transition 0.8s ease
```

### Section Label Animation
```
Trigger:        IntersectionObserver on label, threshold 0.5, once
Step 1:         "—" dash: width 0→32px, 0.3s ease
Step 2:         Text types in char by char, 0.04s/char, starts after dash
Applies to:     All "(01) — SUMMARY" style labels
                All "WHAT I BUILT" eyebrows
```

### Divider Rule
```
Trigger:        IntersectionObserver, threshold 0.5, once
Animation:      width 0%→100%, 0.6s cubic-bezier(0.16, 1, 0.3, 1)
```

### Stats Count-Up
```
Trigger:        IntersectionObserver on stats bar, threshold 0.3, once
Numbers:        Count from 0 → target over 1200ms
Easing:         easeOutCubic: t => 1 - Math.pow(1-t, 3)
Interval:       16ms (60fps)
Suffix kept:    "days", "%", "wks", "pg" etc.
```

### Card Hover
```
Transition:     background 0.4s ease, color 0.4s ease
Default bg:     transparent
Hover bg:       --text
All text:       inverts to --bg simultaneously
Cursor:         transforms to READ state (see Cursor System)
```

### Contact — The Reckoning
```
Full sequence documented in Section 09 above.
SessionStorage flag: 'reckoning' prevents repeat on re-scroll
```

### Open to Roles — Breathing Glow
```
@keyframes breathe {
  0%, 100% { text-shadow: none; opacity: 1; }
  50%       { text-shadow: 0 0 20px var(--green), 0 0 40px var(--green-glow); opacity: 0.85; }
}
Duration: 3s, ease-in-out, infinite
Applies to: "Open to Roles" text (not the dot — dot has sonar)
```

### Nav Symbol Rotate
```
Trigger:        :hover on nav item
Symbol:         transform: rotate(0deg)→rotate(360deg)
Duration:       0.4s ease
```

### Nav Underline Draw
```
Trigger:        :hover on nav item
::after pseudo: width 0→100%, 0.3s ease
Position:       bottom: -2px, height 1px, background --accent
```

---

## 13. PAGE STRUCTURE MAP

```
index.html
├── Nav (fixed)
├── Hero (100vh)
├── Ribbon (scrolling)
├── Section: WHAT I BUILT
│   ├── Table header
│   ├── Card: IHCL Strategy → work-ihcl.html
│   └── Card: Govr System Build → work-govr.html
├── Divider (animated rule)
├── Section: WHAT I FOUND
│   ├── Table header
│   ├── Card: Zomato Teardown → teardown-zomato.html
│   └── Card: Groww Teardown → teardown-groww.html
├── Contact: The Reckoning
├── Footer bar
├── Clock (fixed bottom-left)
└── Toggle (fixed bottom-right)

work-ihcl.html
├── Nav
├── Back button
├── Page Header
├── Stats Bar (count-up)
├── Tags
├── (01) Summary
├── (02) Problem
├── (03) Approach (numbered cards)
├── (04) Outcome (bullets)
└── Next Case → work-govr.html

work-govr.html
├── [identical structure to IHCL]
└── Next Case → work-ihcl.html

teardown-zomato.html
├── Nav
├── Back button
├── Page Header
├── Stats Bar (count-up)
├── Tags
├── Disclaimer
├── (01) The Product
├── (02) Core Loop (flow diagram)
├── (03) 3 Problems (red-bordered cards)
├── (04) Proposed Solution (accent-bordered cards)
└── Next Teardown → teardown-groww.html

teardown-groww.html
├── [identical structure to Zomato]
└── Next Teardown → teardown-zomato.html
```

---

## 14. REMOVED ELEMENTS (DO NOT ADD BACK)

```
✗  "Hover to Read" text
✗  READ button on cards
✗  "Product & Strategy" below nav name
✗  Bengaluru, IN location
✗  Portfolio / 2025 text
✗  "HOW I WORK" section entirely
✗  teardowns.html as separate page
✗  Circle cursor (replaced by square)
✗  Concentric circle ◎ symbol in nav (replaced by ↗ arrow)
✗  Cormorant Garamond font (replaced by Lora for body)
✗  Playfair Display (replaced by Instrument Serif)
✗  Any READ buttons on work cards
```

---

## 15. GLOBAL RULES

```
cursor:             none on body (custom cursor always active)
overflow-x:         hidden on body
scroll-behavior:    smooth on html
box-sizing:         border-box, universal
font-size base:     18px
line-height base:   1.6
All links:          cursor: none (inherits)
All animations:     respect prefers-reduced-motion
                    @media (prefers-reduced-motion: reduce) { 
                      * { animation: none; transition: none; } 
                    }
```

---

*End of specification. Version 2.0 — April 2026.*
*All decisions locked. Use this as source of truth before every code change.*
