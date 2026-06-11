{* ============================================================
   CATEGORY ICONS SECTION  (Figma: Frame 21 — 1200×238px)

   Editable in: JTL Admin -> Ansicht -> Templates -> bauer_custom
   -> Settings -> "Startseite: Kategorie-Icons".
   Each icon's label, link and image file can be changed; empty
   label hides that icon. Defaults fall back to the original
   design so nothing changes until edited.
   Icon images live in: templates/bauer_custom/images/icons/
   ============================================================ *}
{$catsHeading = $Einstellungen.template.hp_cats.heading|default:'Direkt zu Ihren Werkzeugen'}

{$catCards = []}
{$catCards[] = ['label' => $Einstellungen.template.hp_cats.cat1_label|default:'Bohren',    'link' => $Einstellungen.template.hp_cats.cat1_link|default:'#', 'icon' => $Einstellungen.template.hp_cats.cat1_icon|default:'Bohren.svg']}
{$catCards[] = ['label' => $Einstellungen.template.hp_cats.cat2_label|default:'Schleifen', 'link' => $Einstellungen.template.hp_cats.cat2_link|default:'#', 'icon' => $Einstellungen.template.hp_cats.cat2_icon|default:'Schleifen.svg']}
{$catCards[] = ['label' => $Einstellungen.template.hp_cats.cat3_label|default:'Schneiden', 'link' => $Einstellungen.template.hp_cats.cat3_link|default:'#', 'icon' => $Einstellungen.template.hp_cats.cat3_icon|default:'Schneiden.svg']}
{$catCards[] = ['label' => $Einstellungen.template.hp_cats.cat4_label|default:'Reinigen',  'link' => $Einstellungen.template.hp_cats.cat4_link|default:'#', 'icon' => $Einstellungen.template.hp_cats.cat4_icon|default:'Reinigen.svg']}
{$catCards[] = ['label' => $Einstellungen.template.hp_cats.cat5_label|default:'Lagern',    'link' => $Einstellungen.template.hp_cats.cat5_link|default:'#', 'icon' => $Einstellungen.template.hp_cats.cat5_icon|default:'Lagern.svg']}
{$catCards[] = ['label' => $Einstellungen.template.hp_cats.cat6_label|default:'Zubehör',   'link' => $Einstellungen.template.hp_cats.cat6_link|default:'#', 'icon' => $Einstellungen.template.hp_cats.cat6_icon|default:'Zubeh%C3%B6r.svg']}

<section class="bauer-categories">
    <div class="bauer-categories-inner">

        <h2 class="bauer-categories-heading">{$catsHeading}</h2>

        <div class="bauer-categories-grid">

            {foreach $catCards as $card}
                {if $card.label}
                    <a href="{$card.link}" class="bauer-cat-card">
                        <img src="{$ShopURL}/{$currentTemplateDir}images/icons/{$card.icon}"
                             width="87" height="87" alt="{$card.label}" class="bauer-cat-icon">
                        <span class="bauer-cat-label">{$card.label}</span>
                    </a>
                {/if}
            {/foreach}

        </div>

    </div>
</section>
