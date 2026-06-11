{* ============================================================
   ENERGIESYSTEM SECTION  ("Wählen Sie Ihr Energiesystem")
   Editable: JTL Admin -> Templates -> bauer_custom -> Settings
   -> "Startseite: Energiesystem".  Empty title hides a card.
   Falls back to the original design.
   ============================================================ *}
{$enHeading = $Einstellungen.template.hp_energie.heading|default:'Wählen Sie Ihr Energiesystem'}

{$enCards = []}
{$enCards[] = ['title' => $Einstellungen.template.hp_energie.e1_title|default:'M12',     'sub' => $Einstellungen.template.hp_energie.e1_subtitle|default:'M12 Kompaktsystem',          'link' => $Einstellungen.template.hp_energie.e1_link|default:'#']}
{$enCards[] = ['title' => $Einstellungen.template.hp_energie.e2_title|default:'M18',     'sub' => $Einstellungen.template.hp_energie.e2_subtitle|default:'M18 Allround-System',         'link' => $Einstellungen.template.hp_energie.e2_link|default:'#']}
{$enCards[] = ['title' => $Einstellungen.template.hp_energie.e3_title|default:'MX FUEL', 'sub' => $Einstellungen.template.hp_energie.e3_subtitle|default:'MX Fuel Hochleistungssystem',   'link' => $Einstellungen.template.hp_energie.e3_link|default:'#']}
{$enCards[] = ['title' => $Einstellungen.template.hp_energie.e4_title|default:'BAT',     'sub' => $Einstellungen.template.hp_energie.e4_subtitle|default:'Batterien',                    'link' => $Einstellungen.template.hp_energie.e4_link|default:'#']}
{$enCards[] = ['title' => $Einstellungen.template.hp_energie.e5_title|default:'CHG',     'sub' => $Einstellungen.template.hp_energie.e5_subtitle|default:'Ladegeräte',                   'link' => $Einstellungen.template.hp_energie.e5_link|default:'#']}
{$enCards[] = ['title' => $Einstellungen.template.hp_energie.e6_title|default:'ONE-KEY', 'sub' => $Einstellungen.template.hp_energie.e6_subtitle|default:'ONE-KEY-System',              'link' => $Einstellungen.template.hp_energie.e6_link|default:'#']}

<section class="bauer-energiesystem">
    <div class="bauer-energiesystem-inner">

        <h2 class="bauer-energiesystem-heading">{$enHeading}</h2>

        <div class="bauer-energiesystem-cards">
            {foreach $enCards as $card}
                {if $card.title}
                    <a href="{$card.link}" class="bauer-energie-card">
                        <span class="bauer-energie-card-title">{$card.title}</span>
                        {if $card.sub}<span class="bauer-energie-card-subtitle">{$card.sub}</span>{/if}
                    </a>
                {/if}
            {/foreach}
        </div>

    </div>
</section>
