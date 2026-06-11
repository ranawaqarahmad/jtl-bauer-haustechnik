{* ============================================================
   LOESUNGEN SECTION  ("Fertige Lösungen für Ihre tägliche Arbeit")
   Editable: JTL Admin -> Templates -> bauer_custom -> Settings
   -> "Startseite: Lösungen".  Empty title hides a card.
   Falls back to the original design.
   ============================================================ *}
{$loHeading = $Einstellungen.template.hp_loesungen.heading|default:'Fertige Lösungen für Ihre tägliche Arbeit'}

{$loCards = []}
{$loCards[] = ['title' => $Einstellungen.template.hp_loesungen.l1_title|default:'Elektro-Grundwerkzeugsatz',  'desc' => $Einstellungen.template.hp_loesungen.l1_desc|default:'Alles was Sie für Elektroinstallationen brauchen — sorgfältig zusammengestellt für den täglichen Einsatz.', 'image' => $Einstellungen.template.hp_loesungen.l1_image|default:'image_1.png', 'link' => $Einstellungen.template.hp_loesungen.l1_link|default:'#']}
{$loCards[] = ['title' => $Einstellungen.template.hp_loesungen.l2_title|default:'Lösung zum Metallschneiden', 'desc' => $Einstellungen.template.hp_loesungen.l2_desc|default:'Präzise Schnitte in Stahl, Aluminium und Blechen — die richtigen Werkzeuge für saubere Ergebnisse.', 'image' => $Einstellungen.template.hp_loesungen.l2_image|default:'image_1.png', 'link' => $Einstellungen.template.hp_loesungen.l2_link|default:'#']}
{$loCards[] = ['title' => $Einstellungen.template.hp_loesungen.l3_title|default:'Schnelle Montage',          'desc' => $Einstellungen.template.hp_loesungen.l3_desc|default:'Effiziente Montagewerkzeuge für Installateure — weniger Aufwand, mehr Durchsatz auf der Baustelle.', 'image' => $Einstellungen.template.hp_loesungen.l3_image|default:'image_1.png', 'link' => $Einstellungen.template.hp_loesungen.l3_link|default:'#']}
{$loCards[] = ['title' => $Einstellungen.template.hp_loesungen.l4_title|default:'SHK-Service-Kit',           'desc' => $Einstellungen.template.hp_loesungen.l4_desc|default:'Komplett ausgestattetes Werkzeugset für Sanitär-, Heizungs- und Klimatechnik-Profis im Außeneinsatz.', 'image' => $Einstellungen.template.hp_loesungen.l4_image|default:'image_1.png', 'link' => $Einstellungen.template.hp_loesungen.l4_link|default:'#']}

<section class="bauer-loesungen">
    <div class="bauer-loesungen-inner">

        <h2 class="bauer-loesungen-heading">{$loHeading}</h2>

        <div class="bauer-loesungen-grid">
            {foreach $loCards as $card}
                {if $card.title}
                    <a href="{$card.link}" class="bauer-loesung-card">
                        <div class="bauer-loesung-card-image">
                            <img src="{$ShopURL}/{$currentTemplateDir}images/{$card.image}" alt="{$card.title|escape:'html'}">
                        </div>
                        <div class="bauer-loesung-card-body">
                            <h3 class="bauer-loesung-card-title">{$card.title}</h3>
                            {if $card.desc}<p class="bauer-loesung-card-desc">{$card.desc}</p>{/if}
                            <span class="bauer-loesung-card-link">
                                Entdecken Sie die Lösung
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
