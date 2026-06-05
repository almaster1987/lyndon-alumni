# Project context — VTSU Lyndon Alumni Council site

> Auto-loaded by Claude Code. If you're a future Claude session, read this before editing.
>
> **▶ NEXT TURN — expand the Alumni Spotlight to 9 (3×3) via a complex multi-agent analysis.** Full spec + candidate leads + guardrails: gitignored **`fundraising/SPOTLIGHT-PLAN.md`** (read it first). Pin **Jim Cantore '86**; include Carhartt CEO **Mark Valade '78** (verify the Lyndon link from a public source); strongly consider 2026 Distinguished Alumni **Mark Hilton**. The prospect tracker is confidential — names/public-role only, never wealth/ask/status, and feature only genuine public figures.
>
> *(QC completed 2026-06-04 — `docs/QC-HANDOFF.md`. The 06-05 Homecoming/Golf/stat/Subscribe update is pushed & live.)*

## What this is

Static single-page site for the VTSU Lyndon Alumni Council (Lyndon Teachers College → Lyndon State College → NVU Lyndon → VTSU Lyndon, since 1911). Deployed via Cloudflare Pages (git-connected to the repo), **live at https://lyndon-alumni.pages.dev**. Source: `index.html` at root, no build step.

- **Upstream mirror:** https://github.com/almaster1987/lyndon-alumni
- **Owner / contact:** Alex Lataille (Alexander.Lataille@icf.com), member of the Council's Fundraising Committee.
- **Hosting accounts:** this project runs under Alex's *personal* Google identity — GitHub `almaster1987`, Cloudflare + Gmail `alexander.lataille@gmail.com` (NOT the ICF email). Council correspondence (e.g. Michael Thurston / Manor Vail Society, michaelvt2700@gmail.com) also goes via that Gmail.
- **Council president:** Steve Cormier (LSC '82).

## Donate flow — read carefully before touching the Give section

The donate CTA points to this Blackbaud Renxt form:

```
https://host.nxt.blackbaud.com/donor-form/?svcid=renxt&formId=fed909dd-635d-47ad-9868-24becf560417&envid=p-BzoGXjMynEG3LMXBAdBMug&zone=usa
```

Gifts go to the **Lyndon Alumni Association** directly — *not* to VSU/VTSU and *not* to the Lyndon State College Foundation.

### Rules (do not violate without asking)

1. **CTA copy:** "Donate to the Association" or "Donate to the Alumni Association." Never "Give Now," "Give to Lyndon," or anything VSU/VTSU-branded. Reviewer feedback in April 2026 was that "Give Now" looked like donating to the school.
2. **CTA styling:** prominent gold (not standard green). Pulsing in nav, gradient button on the donate card.
3. **No dollar-amount selector** on the donate card — the Blackbaud form collects amount on the next step. A selector here is redundant and was removed.
4. **The Lyndon State College Foundation is NOT the processor.** It's a separate 501(c)(3). Do not name it as the processor anywhere on the site. A plain "see also" link in the footer Resources block is fine — keep it disconnected from the donate flow.
5. **Foundation link** (https://www.lyndonstatecollegefoundation.com) lives in the footer Resources block only.

## Deploy

**Live host: Cloudflare Pages**, git-connected to the upstream repo. Every push to `main` auto-deploys — including via the one-click `push-to-github.bat`. No build step (build command: *none*, output dir: `/`). Security + cache headers come from the `_headers` file — **Cloudflare ignores `netlify.toml`**.

GitHub Pages was the prior host; it was **disabled on 2026-05-31** (Pages source set to *None*), so `lyndon-alumni.pages.dev` is the **sole** live URL — the old `almaster1987.github.io/lyndon-alumni` now 404s. (Source = None also stops pushes from silently re-publishing it.) `netlify.toml` is a dormant alternative config, not the live host.

**Pushing:** Claude cannot `git push` from the sandbox (credential prompt fails) — Alex runs `git push` himself in a Windows PowerShell in the project folder. Commit locally, then hand off the push.

Local preview: open `index.html` in a browser, or `python -m http.server 8000`.

## Folder structure

```
Lyndon/
├── index.html            # the site
├── _headers              # Cloudflare Pages security + cache headers (LIVE config)
├── netlify.toml          # dormant Netlify config — NOT the live host
├── push-to-github.bat    # one-click commit + push (auto-deploys to Cloudflare)
├── README.md             # human-facing readme
├── CLAUDE.md             # this file — Claude Code auto-loads it
├── .gitignore
├── docs/
│   ├── PROJECT_CONTEXT.md   # full project background
│   ├── DONATE_FLOW.md       # donate-specific rules + URL
│   └── SETUP.md             # onboarding on a new machine
├── fundraising/          # Council-internal (gitignored — never deployed)
└── lyndon-alumni-original/  # read-only reference clone (gitignored)
```

`lyndon-alumni-original/` is the cloned upstream repo for reference — **do not edit it**, and do not include it in deploys.

## When Alex asks for a change

- He's writing from inside the Council (Fundraising Committee), not as an outsider asking for background.
- Practical, action-oriented suggestions. He has authority on Council decisions but coordinates with John Kleinhans (Fundraising chair) and Steve Cormier (president).
- After making donate-related edits, double-check the URL hasn't drifted from the one above.

## Recent changes worth remembering

- **2026-04-27:** Rebuilt site from upstream after losing local files. Reworked donate CTA per reviewer feedback (gold pulsing nav button, "Donate to the Association" copy, gold-bordered card, removed amount selector).
- **2026-05-22:** Per Michael Thurston (Manor Vail Society - Lyndon, '74) feedback: split the 1911 timeline entry into two — 1911 "Teacher Training Course" (one-year program at LI campus) and 1920s "Lyndon Normal School" (school-within-a-school at LI after expansion). Exact year of the Normal School name change is TBD — Michael was going to dig for it. **Open ask:** add a Vail Mansion image to the header `.gallery-strip` panorama once Michael forwards photo choices from MVS. Vail Mansion was the campus 1951–mid-1960s and the centerpiece through 1974; significant to alums spanning 1947–1977. Credit any image to "Manor Vail Society - Lyndon."
- **2026-05-31:** Migrated hosting **GitHub Pages → Cloudflare Pages** (`lyndon-alumni.pages.dev`), git-connected to the repo — Cloudflare's GitHub App is scoped to **only** `lyndon-alumni`; pushes to `main` auto-deploy. Added `_headers` (security + cache; Cloudflare ignores `netlify.toml`) and gitignored `Archive/` (it held a copy of prospect data). **Disabled GitHub Pages** (source → None) so there's one canonical URL. Verified the live site matches Alex's reply email to Michael Thurston (timeline split is live; **Vail Mansion image still pending** Michael's MVS photos; the "1920s" Normal School year is still TBD). **Custom domain:** none yet — when Alex buys one, point it at Cloudflare (it'll mask the pages.dev URL). **Content updates were deferred** this session ("hold for today") — pick them up next time.
- **2026-06-04:** Integrated the **June 3 alumni-team meeting** (Steve Cormier + Meaghan Meachem; transcript in gitignored `Meeting Transcripts/`) and pushed **live to main**. Changes: (1) **Donate fund link updated** — formId `fed909dd-…` now points to the **Lyndon Alumni Council Fund** (old `0b410455-…` sometimes defaulted to the wrong fund); stripped the `bbeml=` email-tracking token Alex's link arrived with — never hardcode `bbeml`. (2) Brand is now **"Lyndon Alumni Council"** — dropped the "VTSU" prefix from the council name everywhere; spell out "Vermont State University" in body prose; "VTSU Lyndon" kept only in the Mentor card, the 2023 timeline node, the nav lineage chip, and links to the university's own VTSU properties. (3) Top banner promotes **Fall Homecoming for Alumni & Families** (Spring Homecoming dropped — it's past). (4) Photo strip is now an auto-advancing **carousel** (pauses on hover, respects reduced-motion). (5) Events: "Fall Weekend" → **"Fall Homecoming"**; Spring Homecoming card replaced by a **Golf Classic** card (**St. Johnsbury Country Club** per Steve's June Homecoming announcement email — corrected from the old site's "Orleans Country Club"; register link still "coming soon"; added a generic Wikimedia golf-course photo to the card header with a gradient fallback). **Homecoming dates confirmed Sept 25–27, 2026** (from that email) — banner, quick-link, and both event cards updated; Fall Homecoming activity list rewritten to match the email's official lineup (HOF & Alumni Awards reception, M&W soccer, alumni baseball/softball/basketball, Alumni Rugby match return, "more to come" from the poll). (6) Give section reframed — everything flows to the **one Lyndon Alumni Council Fund**; removed false "Athletics"/dedicated-scholarship earmarks (donating to the Association ≠ athletics, per Meaghan; scholarships flow through the college). (7) Get Involved trimmed **6 → 3** cards (Join → emails Steve `scormier55@comcast.net`; Mentor via Handshake; Connect-on-social). (8) Council size **15 → 20**; removed Cole Alexander from Alumni/Student. (9) Meetings "Zoom" → "virtual." (10) Removed the **News** section (returns with Comms press releases) and the dead **newsletter signup** form. (11) Contact: mailing address **1001 College Road, Lyndonville VT 05851 · Attn: Alumni Council**; Email Us → Steve. **Pending content (placeholders live):** golf register link, exact tee time & entry fee; 2026 Hall of Fame inductee names+photos; expand Alumni Spotlight to 6 (candidates: Mark Hilton, Mark Valade '78/Carhartt CEO — verify Lyndon link); real newsletter-subscribe form (routes to Kate at the college, needs name+email); dedicated **Manor Vail** section (ask Mike Thurston); confirm the 60K alumni stat (Steve→Ernie) and the committee roster. **Domain:** Alex to buy **`lyndonalumni.com`** (Meaghan gifting if <$50 via Venmo) and point it at Cloudflare. Steve OK'd sharing the site with Johnson's president. **Carousel update (same day):** the campus photo strip is now **two side-by-side carousels** with captions centered **below** each photo (JS generalized to init every `.carousel` block; staggered auto-advance; pauses on hover; reduced-motion safe). Added the two **Vail Museum aerial postcards** (campus c. 1976–77 and c. 1990s, David & Beth Kanell Collection) — hotlinked from CatalogIt's CloudFront CDN (`d8e7jbdw4fu0e.cloudfront.net`, pulled from each entry's `og:image`) with an `onerror` fallback to a campus photo, plus a footer credit line. **Confirm usage rights with Michael Thurston / MVS** before relying on these (museum-catalogued postcards). Then expanded the same turn to **three** side-by-side carousels (2-up tablet, 1-up phone) with **15 photos** (5 each): added 6 more Vail Museum/Kanell historic shots (1970 & 1980s–90s aerials, early-'60s LTC postcard, night scene, Manor Vail postcard, 1962 Burke Mtn valley view) and swapped the **About-section image to the c.1990s aerial** (credit → Vail Museum). Removed the dead **Instagram & YouTube** social placeholders (Facebook/LinkedIn/Bluesky/Handshake remain); **60K+ alumni stat confirmed OK by Alex.** For the ~30 photos Alex eventually wants, pull more from the Vail Museum CatalogIt (`hub.catalogit.app/vail-museum`; its `sitemap.xml` lists all entries — use each entry's `og:image`, `.lg@2x`/`.lg-nt@2x` renditions). **Next turn = QC — see `docs/QC-HANDOFF.md`.**
- **2026-06-04 (QC turn):** Ran the full QC checklist (`docs/QC-HANDOFF.md` has the results). Verified 40+ links + all 21 images live (HTTP status + rendered-DOM audit via a local preview), every internal `#anchor` resolves, no `#news`, one intentional `href="#"` (brand). **Site passed.** Only fix: **removed the footer "Council Dashboard" link** — it pointed at `fundraising_dashboard.html`, which isn't deployed, so Cloudflare served the homepage at 200 (soft dead-end); the real dashboard stays gitignored/undeployed (no data exposure). Confirmed `/nominate` 301s to a live "VTSU Alumni Award Nomination" Formstack form. **Two checks need a human** (can't be done headlessly): (a) click Donate and confirm the Blackbaud form shows the **Lyndon Alumni Council Fund** (URL + formId are unchanged/correct, form returns 200 — just the JS-rendered fund label is unverifiable from here); (b) confirm the **Facebook group** loads (FB login-walls bots). Pending-content placeholders from the earlier 06-04 entry are unchanged.
- **2026-06-05:** Content update from two Council docs (`Homecoming lineup 2026.docx`, `Lyndon Golf Tournament 2026.docx` — on Alex's Desktop, not in repo) + a note from the college. (1) **Hero alumni stat 60K+ → "10,000+"** — the college reported **10,344 known alumni**; Alex chose the rounded "10,000+" (supersedes the 06-04 "60K+ confirmed OK"). (2) **Golf Classic card filled in:** **Friday, Sept 25, 2026**, St. Johnsbury CC, 11am reg · **noon shotgun**, **$125/golfer** (pays online "through the college"), sponsor tiers ($2,500 presenting / $750 hole-in-one / $100 hole), longest-drive/closest-pin/putting/50-50. Register button still "Link Coming Soon" (no pay-portal URL yet). (3) **Fall Homecoming card highlights refreshed** to the official lineup (HOF & Alumni Award banquet, "Celebrate Vail"/Class-of-'76 reunion + Q&A w/ Pres. Kollman, alumni games + rugby, M&W soccer, Vail Museum open house, cookout/ice-cream/Octoberfest, "schedule firming up"); stale "Get Notified When Dates Drop" CTA → "Get Homecoming Updates." Alex chose **highlights-only** over a full day-by-day schedule (many lineup items are "tentative"). (4) **Subscribe button added** to the Contact section → VTSU alumni contact-info form (per the college: reuse their form, don't build a custom one routing to Kate). **Deliberately NOT published:** the golf flyer's internal volunteer/sponsor-prospect names (Hannah Manley, Bob McCabe, Skip & Connie Pound, etc.) and the organizer cost basis ($55/golfer, cart costs). Verified via local render: hero stats, golf card, subscribe button (opens new tab), zero broken anchors. **Pushed live to `main` 2026-06-05** (both the QC fix and this content update) and verified the Cloudflare deploy — the live site shows `10,000+`, the Subscribe button, and the golf details, with the "Council Dashboard" link gone. Note from the college: edits to *their* VTSU alumni pages go to "Leo, their website guy" (not our Council site).
- **2026-06-05 (spotlight set-up):** Phased up the next turn — **expand the Alumni Spotlight 3 → 9** via a complex multi-agent analysis. Full spec + candidate leads + guardrails live in gitignored **`fundraising/SPOTLIGHT-PLAN.md`** (kept internal because it references confidential prospect data). Public-facing decisions: **Cantore '86 stays**; include Carhartt CEO **Mark Valade '78** (corrected from the mis-noted "Valli"; **verify his Lyndon attendance from a public source** before publishing it as fact); strongly consider 2026 Distinguished Alumni **Mark Hilton** (per the June 3 transcript — speaking at graduation, at Homecoming). Likely layout = **3 themed triads** (meteorology / business / public-service-arts-athletics), i.e. the "3×3×3." **Guardrail:** feature only genuine public figures; publish names + public role only, never wealth/ask/donor-status; verify every fact publicly; keep `onerror` image fallbacks. Analysis runs next turn (Ultracode → Workflow).
