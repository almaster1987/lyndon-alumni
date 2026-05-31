# Project context — VTSU Lyndon Alumni Council site

> Auto-loaded by Claude Code. If you're a future Claude session, read this before editing.

## What this is

Static single-page site for the VTSU Lyndon Alumni Council (Lyndon Teachers College → Lyndon State College → NVU Lyndon → VTSU Lyndon, since 1911). Deployed via Cloudflare Pages (git-connected to the repo), **live at https://lyndon-alumni.pages.dev**. Source: `index.html` at root, no build step.

- **Upstream mirror:** https://github.com/almaster1987/lyndon-alumni
- **Owner / contact:** Alex Lataille (Alexander.Lataille@icf.com), member of the Council's Fundraising Committee.
- **Hosting accounts:** this project runs under Alex's *personal* Google identity — GitHub `almaster1987`, Cloudflare + Gmail `alexander.lataille@gmail.com` (NOT the ICF email). Council correspondence (e.g. Michael Thurston / Manor Vail Society, michaelvt2700@gmail.com) also goes via that Gmail.
- **Council president:** Steve Cormier (LSC '82).

## Donate flow — read carefully before touching the Give section

The donate CTA points to this Blackbaud Renxt form:

```
https://host.nxt.blackbaud.com/donor-form/?svcid=renxt&formId=0b410455-55fc-46ec-866d-a3b8598f61bc&envid=p-BzoGXjMynEG3LMXBAdBMug&zone=usa
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
