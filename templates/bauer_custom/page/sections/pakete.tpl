{* ============================================================
   PAKETE SECTION  ("Sparen Sie mehr mit cleveren Paketen.")
   Editable: JTL Admin -> Templates -> bauer_custom -> Settings
   -> "Startseite: Pakete".  Empty title hides a card.
   Falls back to the original design.
   ============================================================ *}
{$pkHeading     = $Einstellungen.template.hp_pakete.heading|default:'Sparen Sie mehr mit cleveren Paketen.'}
{$pkViewAllText = $Einstellungen.template.hp_pakete.viewall_text|default:'Alle ansehen'}
{$pkViewAllLink = $Einstellungen.template.hp_pakete.viewall_link|default:'#'}

{$pkCards = []}
{$pkCards[] = ['title' => $Einstellungen.template.hp_pakete.p1_title|default:'Starterset mit Akku und Ladegerät',                 'image' => $Einstellungen.template.hp_pakete.p1_image|default:'image_1.png', 'link' => $Einstellungen.template.hp_pakete.p1_link|default:'#']}
{$pkCards[] = ['title' => $Einstellungen.template.hp_pakete.p2_title|default:'Aufbewahrungspaket für einen organisierten Workflow', 'image' => $Einstellungen.template.hp_pakete.p2_image|default:'image_1.png', 'link' => $Einstellungen.template.hp_pakete.p2_link|default:'#']}
{$pkCards[] = ['title' => $Einstellungen.template.hp_pakete.p3_title|default:'Allround-Werkzeugpaket',                              'image' => $Einstellungen.template.hp_pakete.p3_image|default:'image_1.png', 'link' => $Einstellungen.template.hp_pakete.p3_link|default:'#']}
{$pkCards[] = ['title' => $Einstellungen.template.hp_pakete.p4_title|default:'Angebote für Arbeitskleidung für Profis',            'image' => $Einstellungen.template.hp_pakete.p4_image|default:'image_1.png', 'link' => $Einstellungen.template.hp_pakete.p4_link|default:'#']}

<section class="bauer-pakete">
    <div class="bauer-pakete-inner">

        <div class="bauer-pakete-header">
            <h2 class="bauer-pakete-heading">{$pkHeading}</h2>
            <a href="{$pkViewAllLink}" class="bauer-pakete-viewall">
                {$pkViewAllText}
                <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                    <path d="M3 8H13M13 8L9 4M13 8L9 12" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </a>
        </div>

        <div class="bauer-pakete-cards">
            {foreach $pkCards as $card}
                {if $card.title}
                    <a href="{$card.link}" class="bauer-paket-card">
                        <div class="bauer-paket-card-image">
                            <img src="{$ShopURL}/{$currentTemplateDir}images/{$card.image}" alt="{$card.title|escape:'html'}">
                        </div>
                        <div class="bauer-paket-card-body">
                            <span class="bauer-paket-card-title">{$card.title}</span>
                            <span class="bauer-paket-card-link">
                                Details anzeigen
                                <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                    <path d="M3 8H13M13 8L9 4M13 8L9 12" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </span>
                        </div>
                    </a>
                {/if}
            {/foreach}
        </div>

    </div>
</section>
