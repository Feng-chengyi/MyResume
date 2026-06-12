# AGENTS.md

## Project overview

Single-file static resume builder (`index.html`). No build step, no package manager, no bundler. Open the HTML file directly in a browser to run.

## Architecture

- **Single file**: `index.html` contains all HTML, CSS (`<style>`), and JS (`<script>`)
- **External deps** (CDN only): Google Fonts, html2pdf.js, Supabase JS (`cdnjs.cloudflare.com` / `jsdelivr.net`)
- **UI language**: Chinese (zh-CN) — all labels, placeholders, and toasts are in Chinese
- **State**: runtime object `S` holds all resume data; `DEMO` is the default sample
- **Templates**: 6 themes (`classic`, `executive`, `creative`, `academic`, `modern`, `bold`) — switch via `data-t` attribute on `.rc` container
- **Share links**: state is saved to Supabase (PostgreSQL) with a random 8-char short ID; share URL is `#<id>`, opened via `loadHash()`; old base64-encoded links still work for backward compatibility

## Key conventions

- All CSS variables are defined on `:root` and scoped template overrides use `.rc[data-t="..."]` selectors
- Mobile breakpoints: `767px` (stacked layout + bottom tab bar), `1024px` (narrower panel), `374px` (tiny phone), `900px landscape` (hide template switcher)
- PDF export uses `html2pdf.js`; falls back to `window.print()` on failure
- Photo uploads are read as data URLs; 5MB limit enforced client-side

## Gotchas

- No dev server needed — just open `index.html` in a browser. File protocol works.
- `html2pdf.js` is loaded with `defer` and may not be available immediately; the `downloadPDF()` function handles lazy loading.
- The `creative` template uses CSS Grid (`display:grid; grid-template-columns:185px 1fr`) which collapses to block layout on mobile.
- Print styles hide editor/nav and reset paper shadow/radius.
