# Donate flow

How the donate CTA works on this site, and what's off-limits.

## Active form URL

```
https://host.nxt.blackbaud.com/donor-form/?svcid=renxt&formId=0b410455-55fc-46ec-866d-a3b8598f61bc&envid=p-BzoGXjMynEG3LMXBAdBMug&zone=usa
```

This is a Blackbaud Renxt-hosted form. Gifts are earmarked for the **Lyndon Alumni Association**.

## What changed (April 2026)

A reviewer told Alex the prior "Give Now" button was confusing — clicking it implied you were donating to VSU/VTSU rather than to the Council's own fund. Three things were reworked:

1. **Copy.** Every donate-related label now reads "Donate to the Association" or "Donate to the Alumni Association." No "Give Now," no "Give to Lyndon," no VSU/VTSU branding.
2. **URL.** Switched from the prior VSU/TCS-routed form (`svcid=tcs`, formId `6aadac22-…`) to the Renxt form above (`svcid=renxt`, formId `0b410455-…`).
3. **Visual prominence.** Nav CTA is gold with a subtle pulse animation. The donate card on the Give section has a gold border + flag, and the button itself is a gold gradient (not the standard green button).

The dollar-amount selector ($25 / $50 / $100 / etc.) was **removed** — the Blackbaud form already collects the amount on the next step, so the selector was redundant.

## What the Lyndon State College Foundation is (and isn't)

The **Lyndon State College Foundation** (https://www.lyndonstatecollegefoundation.com) is a separate 501(c)(3). It is **not** the processor for the Alumni Association donate flow. Earlier drafts of the site implied otherwise — that was wrong and has been removed.

Where the Foundation appears now:

- Footer Resources block — plain "see also" link, disconnected from the donate flow.
- Nowhere else.

If a future change tries to put the Foundation in the donate card, the contact section, or the tax line: don't.

## Where the donate URL lives in the site

- Nav CTA (`<a class="nav-cta">`)
- Mobile nav CTA
- Hero secondary button
- Quick-links donate card (top of page)
- Donate card on the Give section
- Footer Resources block

Six places. If you change the URL, update all six. Run a grep to catch them all:

```
host.nxt.blackbaud.com
```

## Tax language

Acceptable:

- "Tax-deductible"
- "Secure form"
- "Consult your tax advisor"

Not acceptable:

- "Vermont State University Foundation • Tax-deductible…"
- "Lyndon State College Foundation • 501(c)(3) Tax-deductible…"
- Any phrasing that names a specific 501(c)(3) as the processor.
