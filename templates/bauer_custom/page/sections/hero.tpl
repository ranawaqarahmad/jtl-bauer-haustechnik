{* ============================================================
   HERO SECTION   (Figma: Rectangle 4 — 1440×747px)

   Content is editable in:
     JTL Admin -> Ansicht -> Templates -> bauer_custom -> Settings
     -> section "Startseite: Hero"
   Every value falls back to the original Figma copy when the
   setting is empty, so the design never breaks.
   ============================================================ *}
{$heroBadge       = $Einstellungen.template.hero.badge|default:'Schneller Zugriff und schneller Einkauf'}
{$heroHeadline    = $Einstellungen.template.hero.headline|default:'Werkzeuge kaufen ohne'}
{$heroHeadlineRed = $Einstellungen.template.hero.headline_red|default:'Shop-Chaos'}
{$heroSubtext     = $Einstellungen.template.hero.subtext|default:'Werkzeuge kaufen ohne Shop-Chaos'}
{$heroBtn1Text    = $Einstellungen.template.hero.btn1_text|default:'Schnellfinder'}
{$heroBtn1Link    = $Einstellungen.template.hero.btn1_link|default:'#schnellfinder'}
{$heroBtn2Text    = $Einstellungen.template.hero.btn2_text|default:'Wählen Sie System'}
{$heroBtn2Link    = $Einstellungen.template.hero.btn2_link|default:'#systeme'}
{$heroBtn3Text    = $Einstellungen.template.hero.btn3_text|default:'Kategorien durchsuchen'}
{$heroBtn3Link    = $Einstellungen.template.hero.btn3_link|default:'#kategorien'}
{$heroBg          = $Einstellungen.template.hero.bg_image|default:'hero-bg.jpg'}

<section class="bauer-hero" style="background-image: url('{$ShopURL}/{$currentTemplateDir}images/{$heroBg}');">
    <div class="bauer-hero-overlay"></div>
    <div class="bauer-hero-content">

        {if $heroBadge}<span class="bauer-hero-badge">{$heroBadge}</span>{/if}

        <h1 class="bauer-hero-headline">
            {$heroHeadline}
            {if $heroHeadlineRed}<span class="bauer-hero-headline-red">{$heroHeadlineRed}</span>{/if}
        </h1>

        {if $heroSubtext}<p class="bauer-hero-subtext">{$heroSubtext}</p>{/if}

        <div class="bauer-hero-cta">
            {if $heroBtn1Text}
                <a href="{$heroBtn1Link}" class="bauer-hero-btn bauer-hero-btn-primary">
                    {$heroBtn1Text}
                    <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                        <path d="M3.75 9H14.25M14.25 9L9.75 4.5M14.25 9L9.75 13.5"
                              stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </a>
            {/if}
            {if $heroBtn2Text}<a href="{$heroBtn2Link}" class="bauer-hero-btn bauer-hero-btn-dark">{$heroBtn2Text}</a>{/if}
            {if $heroBtn3Text}<a href="{$heroBtn3Link}" class="bauer-hero-btn bauer-hero-btn-dark">{$heroBtn3Text}</a>{/if}
        </div>

    </div>
</section>
