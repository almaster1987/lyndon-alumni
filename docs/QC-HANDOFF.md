# QC Handoff — 2026-06-04

> **Read this first for the QC turn.** It captures everything changed in the June 3–4 work
> and gives a complete link/asset checklist so the next session can verify every link works,
> then tackle Alex's odds-and-ends fixes.

## Status
- **Live:** https://lyndon-alumni.pages.dev (Cloudflare Pages — every push to `main` auto-deploys)
- **Repo:** https://github.com/almaster1987/lyndon-alumni
- **Last commit this session:** `631d886` (verify `git log` is in sync before QC)
- **Deploy:** `git push` (or `push-to-github.bat`) → Cloudflare. No build step.

---

## ✅ QC RESULTS — 2026-06-04 (this checklist was run)

**Verdict: passed.** 40+ links and all 21 images verified live (HTTP status + rendered DOM); every internal `#anchor` resolves; zero hard 404s; all June 3–4 content confirmed live.

- **A. Donate flow:** Blackbaud URL byte-exact in both spots, no `bbeml`, `formId=fed909dd-…`, returns 200; CTA copy correct ("Donate to the Alumni Association", no "Give Now"); nav/mobile/hero/quick-link all → `#give`. ⚠️ *Couldn't headlessly confirm the rendered "Lyndon Alumni Council Fund" label* — the donor form renders it via JS and the local preview blocks cross-origin navigation. `formId` is unchanged from the one Alex validated last session, so it resolves to the same fund; **left as a 5-sec manual click-test.**
- **B. Internal anchors:** all resolve; **no `#news`**; exactly one `href="#"` (brand logo). ✓
- **C. mailto:** both = `scormier55@comcast.net`. ✓
- **D. External links:** all 200 — vermontstate.edu pages, both vtsuhornets pages, Foundation, 4× Wikipedia, Handshake. `/nominate` 301→ real **"VTSU Alumni Award Nomination"** Formstack form. *Note:* HOF "Submit Nomination" also uses `/nominate` (general alumni-award form, not HOF-specific) — works, minor mismatch.
- **E. Social:** Bluesky 200. LinkedIn `999` + Facebook `400` are anti-bot walls (fine in-browser). ⚠️ **FB group (×3) not auto-confirmable past the login gate — worth one manual check.**
- **F. Placeholders:** IG/YT confirmed gone. ⚠️ **FIXED THIS TURN:** footer "Council Dashboard" link → `fundraising_dashboard.html` (not deployed; Cloudflare served the homepage at 200 for it — soft dead-end). The real dashboard stays gitignored/undeployed (no data exposure). **Link removed from the footer per Alex.**
- **G. Images:** all 21 resolve 200 (8 Vail CDN, 15 carousel, Homecoming, Golf, 3 headshots). Cantore/Gregory headshots are news-site hotlinks (could be referrer-blocked in-browser; both have `onerror` fallbacks).

**Remaining human-only checks:** (1) click the Donate button and confirm the form shows the **Lyndon Alumni Council Fund**; (2) confirm the **Facebook group** loads.

## What changed this session (integrating the June 3 alumni-team meeting + Steve's Homecoming email)
1. **Donate fund link** updated to formId `fed909dd-…` = **Lyndon Alumni Council Fund** (old `0b410455-…` could hit the wrong fund); stripped the `bbeml=` email-tracking token.
2. **Brand → "Lyndon Alumni Council"** (dropped the "VTSU" prefix from the council name); spell out "Vermont State University" in prose. Kept "VTSU Lyndon" only on the Mentor card, the 2023 timeline node, the nav lineage chip, and the university's own VTSU links.
3. **Homecoming dates Sept 25–27, 2026** (banner, quick-link, both event cards). Banner now "Homecoming returns to Lyndon."
4. **Events:** Fall Weekend → **Fall Homecoming**; Spring Homecoming card → **Golf Classic** card at **St. Johnsbury Country Club** (corrected from "Orleans"); Fall Homecoming lineup matches Steve's email.
5. **Photo strip → three side-by-side carousels** (2-up tablet, 1-up phone), captions centered below each photo. Added **8 Vail Museum (Kanell Collection)** historic photos; **About image swapped to the c.1990s aerial**.
6. **Give section** reframed to the single Council fund (removed false athletics/scholarship earmarks). **Get Involved** 6 → 3 cards (Join → emails Steve; Mentor; Connect-on-social). **Council 15 → 20**; removed Cole Alexander. **Removed** the News section + dead newsletter form. **Contact:** mailing address + Steve's email.

---

## LINK & ASSET QC CHECKLIST

### A. Donate flow — HIGH PRIORITY
- [ ] **Donate button** (Give card + footer Resources) → opens Blackbaud and **lands on the "Lyndon Alumni Council Fund"** (NOT the Lyndon annual fund / college fund). URL used (×2):
  `https://host.nxt.blackbaud.com/donor-form/?svcid=renxt&formId=fed909dd-635d-47ad-9868-24becf560417&envid=p-BzoGXjMynEG3LMXBAdBMug&zone=usa`
- [ ] Nav CTA, mobile nav CTA, hero "Donate" button, quick-link donate card all scroll to `#give` (they don't carry the URL — by design).

### B. Internal anchors (should all scroll correctly)
`#about` `#events` `#spotlight` `#give` `#involved` `#contact` `#main` (skip link).
- [ ] Confirm **no `#news`** links remain (News section was removed).

### C. Email / mailto
- [ ] `mailto:scormier55@comcast.net` — used twice (Get Involved "Join the Council" + Contact "Email Us"). Confirm address is correct and opens a compose window.

### D. External resource links (footer + body)
- [ ] `https://vermontstate.edu/alumni/lyndon-alumni/` (×2 — About affiliation, Contact)
- [ ] `https://vermontstate.edu/alumni/lyndon-alumni/manor-vail-society/` (×2 — About bullet, footer)
- [ ] `https://vermontstate.edu/alumni/alumni-benefits/`
- [ ] `https://vermontstate.edu/alumni/vermont-state-alumni-contact-information-form/`
- [ ] `https://vermontstate.edu/nominate` (×2 — spotlight + HOF)  ← confirm this is a real page
- [ ] `https://vtsuhornets.com` and `https://vtsuhornets.com/honors/vermont-state-lyndon-athletic-hall-of-fame`
- [ ] `https://www.lyndonstatecollegefoundation.com` (footer Resources ONLY — keep it out of the donate flow)
- [ ] Wikipedia (spotlight "Read More" + LSC History): Jim_Cantore, Nick_Gregory, André_Bernier, Lyndon_State_College
- [ ] `https://joinhandshake.com` (×3) — generic Handshake landing. **Consider** swapping to Lyndon's Handshake URL if one exists.

### E. Social links
- [ ] `https://www.facebook.com/groups/LyndonAlums/` (×3)
- [ ] `https://www.linkedin.com/school/lyndon-state-college/people` (×2)
- [ ] `https://bsky.app/profile/vermontstateu.bsky.social` (×2) — VTSU-wide Bluesky, not Lyndon-specific.

### F. Dead placeholder links
- [x] **Instagram & YouTube removed** from the Social section + footer (2026-06-04, per Alex). Facebook, LinkedIn, Bluesky, Handshake remain.
- [ ] Brand logo `<a href="#" class="brand">` (top-left) — scrolls to top; fine as-is. This is the only remaining `href="#"`.

### G. Images that could break (all hotlinked; spot-check they render)
- [ ] **Vail Museum CDN** `d8e7jbdw4fu0e.cloudfront.net` (×8: About aerial + 7 carousel) — **confirm usage rights with Michael Thurston / MVS** (Kanell Collection postcards). Each has an `onerror` fallback to a campus photo.
- [ ] **Spotlight headshots** hotlinked from news sites — Jim Cantore (`cdn.prod.website-files.com`), Nick Gregory (`static.fox5ny.com`); these have `onerror` placeholder fallbacks but are the most likely to rot.
- [ ] **Fall Homecoming photo** `dxbhsrqyrr690.cloudfront.net` (lyndonhornets) — has onerror fallback.
- [ ] **Golf card** `commons.wikimedia.org/.../Golf_course.jpg` — generic; onerror → gold gradient.
- [ ] Wikimedia/vermontstate.edu campus images — stable, already in long use.

---

## Pending content (placeholders are live and labeled)
- **Golf Classic:** exact day + tee time + entry fee + **register link** (John Lemieux's form) — card says "Link Coming Soon."
- **Athletic Hall of Fame:** 2024 inductees still listed; Steve to send the **2026 inductee names + photos**.
- **Alumni Spotlight:** still 3 (Cantore '86, Gregory '82, Bernier '81); expand toward 6 — candidates: **Mark Hilton** (distinguished alumni), **Mark Valli** (Carhartt CEO).
- **Newsletter subscribe:** removed; needs a real form routing to **Kate** at the college (first/last name + email).
- **Manor Vail:** decide with Michael whether MVS wants a dedicated **section** vs. the current links.
- **More carousel photos:** Alex wants ~30; currently 15 (5×3) + can scale trivially. Get a batch from **MVS** (more Kanell/Vail Museum entries available at hub.catalogit.app/vail-museum — its `sitemap.xml` lists all entries; pull `og:image`, use `.lg@2x` / `.lg-nt@2x` renditions).

## Flags to confirm with the Council
- [ ] **Golf venue** = St. Johnsbury Country Club (per Steve's email; old site said Orleans).
- [ ] **Vail Museum image rights** (see G above).
- [x] **60K+ alumni** hero stat — confirmed OK by Alex (2026-06-04); keep as-is.
- [ ] Committee roster accuracy (Cole removed; Meaghan was going to QC the full list).

## Odds & ends from Alex (done during QC)
- **Removed** the footer "Council Dashboard" link — it pointed at `fundraising_dashboard.html`, which isn't deployed (Cloudflare served the homepage at 200, a soft dead-end). Done 2026-06-04. The dashboard itself stays in gitignored `fundraising/` and is never deployed.

## Domain
- Alex to buy **`lyndonalumni.com`** (Meaghan gifting if <$50) and point it at Cloudflare (masks the pages.dev URL).
