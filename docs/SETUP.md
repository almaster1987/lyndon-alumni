# Setup — porting to a new machine

This project is intentionally light. There's no build step, no package manager, no framework. To work on it from a fresh machine:

## 1. Get the files

Either clone the upstream mirror:

```bash
git clone https://github.com/almaster1987/lyndon-alumni.git Lyndon
cd Lyndon
```

…or copy the entire `Lyndon/` folder from the source machine. Both work. The folder is self-contained.

## 2. Preview locally

Open `index.html` in any browser. For a real local server (lets relative paths and `file://`-shy APIs behave):

```bash
python -m http.server 8000
# then visit http://localhost:8000
```

Or with Node:

```bash
npx serve .
```

## 3. Edit

`index.html` is a single file with inline CSS + JS. Edits go directly there. No bundler.

If you're editing the donate flow, **read `docs/DONATE_FLOW.md` first.** There are rules.

## 4. Deploy to Netlify

Two options:

- **Drag-and-drop:** open https://app.netlify.com/drop, drag the `Lyndon/` folder. Done.
- **Connected git:** point Netlify at the upstream repo. `netlify.toml` sets `publish = "."` and includes basic security headers. No build command.

Either way, the site goes live in seconds.

## 5. Make the context portable to Claude Code

`CLAUDE.md` at the project root is the key file. Claude Code auto-reads it on a new machine, so the donate-flow rules and project background travel with the folder. If you copy the folder, copy `CLAUDE.md` too — don't gitignore it.

The `docs/` folder is the long-form version of the same context (for humans).

## What lives where

```
Lyndon/
├── index.html              # the site
├── netlify.toml            # publish dir + headers
├── README.md               # entry-point readme
├── CLAUDE.md               # auto-loaded project context for Claude
├── .gitignore
├── docs/
│   ├── PROJECT_CONTEXT.md  # Council, history, owner
│   ├── DONATE_FLOW.md      # donate URL + rules
│   └── SETUP.md            # this file
└── lyndon-alumni-original/ # cloned upstream — read-only reference, gitignored
```

## What you do NOT need

- Node / npm / yarn — none.
- Python — only if you want a local HTTP server, otherwise no.
- Netlify CLI — drag-and-drop works.
- Build tools — there is no build.

## Common gotchas

- **Don't edit `lyndon-alumni-original/`.** It's a read-only reference clone. It's gitignored so it won't ship to deploys.
- **Don't add the Lyndon State College Foundation to the donate card.** See DONATE_FLOW.md.
- **Don't restore the dollar-amount selector** unless the Blackbaud form ever loses its built-in amount picker. (It hasn't, as of April 2026.)
