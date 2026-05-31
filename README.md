# VTSU Lyndon Alumni Council

Static single-page site for the VTSU Lyndon Alumni Council. Deployed via Cloudflare Pages.

## Quick start

Open `index.html` in a browser, or:

```bash
python -m http.server 8000
# http://localhost:8000
```

## Deploy

Live on **Cloudflare Pages**, git-connected to this repo — every push to `main` auto-deploys (run `push-to-github.bat` for one-click). Build command: *none*; output dir: `/`. Headers come from `_headers`. GitHub Pages stays enabled as a fallback. No build step.

## Documentation

- [`CLAUDE.md`](CLAUDE.md) — condensed project context (auto-loaded by Claude Code)
- [`docs/PROJECT_CONTEXT.md`](docs/PROJECT_CONTEXT.md) — Council background, leadership, history
- [`docs/DONATE_FLOW.md`](docs/DONATE_FLOW.md) — donate URL, copy rules, what NOT to do
- [`docs/SETUP.md`](docs/SETUP.md) — onboarding on a new machine

## Donate

The "Donate to the Association" CTA points to a Blackbaud Renxt donor form earmarked for the Lyndon Alumni Association. **Read `docs/DONATE_FLOW.md` before editing any donate-related copy or links** — there's specific reasoning behind why the Lyndon State College Foundation is *not* named as the processor.

## Source

Upstream mirror: https://github.com/almaster1987/lyndon-alumni
