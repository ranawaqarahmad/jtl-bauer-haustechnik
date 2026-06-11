# Bauer Haustechnik — Dev Notes

## Environment

| Item | Value |
|---|---|
| Local URL | http://localhost:8080 |
| Admin URL | http://localhost:8080/admin |
| phpMyAdmin | http://localhost:8081 |
| Active template | **bauer_custom** |
| Parent template | TECHNIK (SALEPIX) |
| Figma | https://www.figma.com/design/gTrQPn5Th5RIxvYzxyO3tm/Bauer-Haustechnik |
| Live server | bauer.devonlineshops.de |

## Docker Commands

```bash
make up          # start containers
make down        # stop containers
make import-db   # import database
make logs        # view logs
```

## Backup

| File | Location |
|---|---|
| Template backup (folder) | `templates/TECHNIKChild_backup_original/` |
| Template backup (zip) | `backups/TECHNIKChild_backup_original.zip` |
| Live config backup | `includes/config.JTL-Shop.ini.php.live-backup` |

## Template File Map

### bauer_custom (our working template)

| Purpose | File |
|---|---|
| Template config | `templates/bauer_custom/template.xml` |
| Bootstrap (PHP class) | `templates/bauer_custom/Bootstrap.php` |
| **Header (storefront v2)** | `templates/bauer_custom/storefront/views/layout/header.tpl` |
| **Top bar** | `templates/bauer_custom/storefront/views/layout/header_top_bar.tpl` |
| **Footer** | `templates/bauer_custom/layout/footer.tpl` |
| Product slider item | `templates/bauer_custom/productlist/item_slider.tpl` |
| **Main CSS (override)** | `templates/bauer_custom/themes/clear/wa.css` |
| SCSS source | `templates/bauer_custom/css/child_custom.scss` |
| Main JS (custom) | `templates/bauer_custom/js/custom.js` |
| JS extras | `templates/bauer_custom/js/custom-JS.js` |

### TECHNIK parent (read-only reference — DO NOT MODIFY)

| Purpose | File |
|---|---|
| Homepage layout | `templates/TECHNIK/layout/index.tpl` |
| Product listing | `templates/TECHNIK/productlist/index.tpl` |
| Product detail | `templates/TECHNIK/productdetails/index.tpl` |
| Parent SCSS entry | `templates/TECHNIK/storefront/src/scss/technik.scss` |
| Parent SCSS variables | `templates/TECHNIK/storefront/src/scss/core/_variables.scss` |
| Compiled parent CSS | `templates/TECHNIK/storefront/dist/css/technik.min.css` |

## CSS / SCSS Architecture

```
TECHNIK/storefront/dist/css/technik.min.css   ← compiled parent (read-only)
bauer_custom/themes/clear/wa.css              ← our override CSS (edit this)
bauer_custom/css/child_custom.scss            ← SCSS source → compiles to wa.css
```

### SCSS Compile Command

```bash
# One-time compile
npx sass templates/bauer_custom/css/child_custom.scss templates/bauer_custom/themes/clear/wa.css --style=expanded

# Watch mode (auto-recompile on save)
npx sass --watch templates/bauer_custom/css/child_custom.scss:templates/bauer_custom/themes/clear/wa.css --style=expanded
```

> Note: We currently edit `wa.css` directly. To switch to SCSS workflow,
> move all CSS from `wa.css` into `child_custom.scss` and use the compile command above.

### CSS Variables (TECHNIK uses CSS custom properties)

TECHNIK resolves SCSS variables to CSS custom properties at runtime:

| SCSS var | CSS var |
|---|---|
| `$slpx-primary` | `--slpx-color-primary` |
| `$slpx-secondary` | `--slpx-color-secondary` |
| `$slpx-success` | `--slpx-color-success` |
| `$slpx-dark` | `--slpx-text-dark` |
| `$slpx-white` | `--slpx-text-white` |

Override these in `wa.css` via `:root { --slpx-color-primary: #yourcolor; }`

### Breakpoints (from TECHNIK `_variables.scss`)

| Name | Min-width |
|---|---|
| xs | 0 |
| xxs | 200px |
| xss | 376px |
| sm | 576px |
| md | 768px |
| **lg** | **1024px** |
| **xl** | **1360px** |
| xxl | 1580px |

### Spacing Scale

Base: `1rem`. Multipliers: 0.25 / 0.5 / 1 / 1.5 / 2 / 2.5 / 3 / 3.5 / 4 / 4.5

## Admin Customizer Settings (template.xml)

These can be changed by the client in JTL Admin → Design → Template:

| Section | Key | Description |
|---|---|---|
| `wa_topbar` | `text1` | Top bar left text |
| `wa_topbar` | `text2` | Top bar right text |
| `wa_header` | `text1` | Header nav text (B2B info line) |
| `wa_footer` | `text1` | Footer text |

Access via Smarty: `{$Einstellungen.template.wa_header.text1}`

## SALEPIX Templater Plugin

The shop uses the **SALEPIX Templater** plugin which provides:
- OPC (One Page Composer) drag-and-drop page builder
- Custom blocks / HTML blocks via Admin
- Logo management
- Slider management
- Custom fonts

OPC content is referenced in templates via:
- `{get_html_block key='footer-contact-technik' assign="footerContact"}`
- `{opcMountPoint id='opc_before_heading' inContainer=false}`

**Do not rebuild OPC blocks in CSS/HTML — manage via Admin → SALEPIX Templater.**

## Cache Clearing

After template changes, clear the Smarty cache:

```bash
# Clear compiled Smarty templates
docker exec jtl_php find /var/www/html/templates_c -mindepth 1 -not -name "*.lockfile" -delete

# Or via JTL Admin → System → Cache → Leeren
```

## Database Template Registration

The active template is stored in `ttemplate` (eTyp='standard') and 
settings in `ttemplateeinstellungen`. Both tables are already populated for `bauer_custom`.

## Design Tokens

See `/design-tokens.json` (to be populated once Figma MCP access is restored).

## Rules

- NEVER modify files in `templates/TECHNIK/` or `templates/NOVA/` or `templates/SALEPIX/`
- ALL changes go into `templates/bauer_custom/` only
- Override TECHNIK templates by creating the same file path inside `bauer_custom/`
- JTL child template system: bauer_custom file takes priority; falls back to TECHNIK


## ============================================================
## SERVER DEPLOYMENT CHECKLIST (SFTP)
## ============================================================

Deploy the whole `bauer_custom` template (homepage + category listing + all
sections) to the live server. Do this carefully — activating a template changes
the live storefront for real customers.

### 0. Pre-flight (do this FIRST)
- [ ] Deploy during low traffic if the shop is live.
- [ ] BACK UP the server before changing anything:
      - Server DB dump (mysqldump of the shop database).
      - Copy of the server's current active `templates/<active>` folder.
      - Note the CURRENT active template name (JTL Admin -> Ansicht -> Templates)
        so you can roll back by re-activating it.
- [ ] Confirm the server already has the PARENT template + plugins (it does, the
      live site uses them): `templates/TECHNIK`, `templates/SALEPIX`,
      `templates/NOVA`, and plugins "SALEPIX Templater" + "SALEPIX TECHNIK Downloader".
      bauer_custom CANNOT work without TECHNIK (its parent).

### 1. Upload via SFTP (.vscode/sftp.json is already configured)
- [ ] Fill in host / username / password (or privateKeyPath) / remotePath in
      `.vscode/sftp.json`. remotePath must end in `/templates/bauer_custom`.
- [ ] Right-click the local `templates/bauer_custom` folder -> "SFTP: Upload Folder".
- [ ] The sftp config only ever touches the `bauer_custom` folder, so server core,
      config and DB are never overwritten.
- [ ] DO NOT upload: `templates_c/`, `.git`, `.DS_Store`, `*.scss` (already ignored).
- [ ] DO upload binaries: everything under `images/`, `fonts/`, `favicon/`.

### 2. Activate the template (server JTL Admin)
- [ ] JTL Admin -> Ansicht (View) -> Templates (or `your-domain/admin/shoptemplate.php`).
- [ ] Select `bauer_custom` -> Activate / Save.
- [ ] If it isn't listed: re-check the upload (template.xml must be present) and
      that TECHNIK exists as parent.

### 3. Clear cache + bust CSS cache (REQUIRED — or you'll see the old design)
- [ ] JTL Admin -> System -> Cache -> "Cache leeren" (clears templates_c + Minify).
- [ ] Bump the CSS cache-buster so browsers fetch the new clear.css:
      Re-save the template settings in admin, OR run on the server DB:
      UPDATE xplugin_salepix_templater_template_setting
      SET value = value + 1
      WHERE `group`='base' AND name='modification_counter';
      (clear.css is served with a 1-YEAR browser cache — without this bump,
       returning visitors keep the old stylesheet.)

### 4. Verify on the live domain (hard-refresh: Cmd/Ctrl+Shift+R)
- [ ] Homepage: hero, category icons, product sliders, pakete, USP sections render.
- [ ] Any category page: full-width banner, dark product cards with green
      "Auf Lager" badge, red "In den Warenkorb" button, USP section at bottom.
- [ ] Add-to-cart works from a category card.
- [ ] Check mobile + desktop widths.

### Notes
- The local-only test data (category "Werkzeuge", products 9001/9002) is NOT
  uploaded and does not exist on the server — the design applies to the real
  Wawi categories automatically.
- Per-category banner image comes from JTL Admin -> Kategorien -> category image;
  falls back to `images/category_banner.jpg` when none is set.
- SALEPIX Templater visual editor is only needed for optional global color/font
  tweaks. The full custom design lives in these template files and renders
  without it. (It 404s on the LOCAL Docker due to an admin URL-rewrite quirk;
  it works on the server.)
- Rollback: re-activate the previous template in admin + clear cache.
