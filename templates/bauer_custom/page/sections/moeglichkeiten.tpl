{* ============================================================
   MEHR MÖGLICHKEITEN SECTION
   ("Mehr Möglichkeiten zum Einkaufen und Zeitsparen")
   Editable: JTL Admin -> Templates -> bauer_custom -> Settings
   -> "Startseite: Möglichkeiten".  Icons stay fixed (can be made
   editable later). Empty title hides a card. Falls back to original.
   ============================================================ *}
{$mgHeading = $Einstellungen.template.hp_moegl.heading|default:'Mehr Möglichkeiten zum Einkaufen und Zeitsparen'}
{$m1t = $Einstellungen.template.hp_moegl.m1_title|default:'B2B-Preise anfragen'}
{$m1d = $Einstellungen.template.hp_moegl.m1_desc|default:'Profitieren Sie von individuellem Support und Nettopreisen für Ihr Unternehmen.'}
{$m1l = $Einstellungen.template.hp_moegl.m1_link|default:'#'}
{$m2t = $Einstellungen.template.hp_moegl.m2_title|default:'Schnellbestellung nach Artikelnummer'}
{$m2d = $Einstellungen.template.hp_moegl.m2_desc|default:'Sie wissen schon, was Sie brauchen? Bestellen Sie sofort. Mit Artikelnummern.'}
{$m2l = $Einstellungen.template.hp_moegl.m2_link|default:'#'}
{$m3t = $Einstellungen.template.hp_moegl.m3_title|default:'Arbeitskleidung und Bekleidung'}
{$m3d = $Einstellungen.template.hp_moegl.m3_desc|default:'Professionelle Bekleidung für anspruchsvolle Umgebungen.'}
{$m3l = $Einstellungen.template.hp_moegl.m3_link|default:'#'}
{$m4t = $Einstellungen.template.hp_moegl.m4_title|default:'Sicherheitsschuhe'}
{$m4d = $Einstellungen.template.hp_moegl.m4_desc|default:'Zertifiziertes Schuhwerk, das Komfort und maximalen Schutz bietet.'}
{$m4l = $Einstellungen.template.hp_moegl.m4_link|default:'#'}
{$m5t = $Einstellungen.template.hp_moegl.m5_title|default:'Benutzerdefinierte Werkzeugsätze'}
{$m5d = $Einstellungen.template.hp_moegl.m5_desc|default:'Konfigurieren Sie die Pakete genau so, wie Ihr Team sie benötigt.'}
{$m5l = $Einstellungen.template.hp_moegl.m5_link|default:'#'}
{$m6t = $Einstellungen.template.hp_moegl.m6_title|default:'Abholung und Support'}
{$m6d = $Einstellungen.template.hp_moegl.m6_desc|default:'Abholung vor Ort und dedizierter technischer Service.'}
{$m6l = $Einstellungen.template.hp_moegl.m6_link|default:'#'}

<section class="bauer-moegl">
    <div class="bauer-moegl-inner">

        <h2 class="bauer-moegl-heading">{$mgHeading}</h2>

        <div class="bauer-moegl-grid">

            {if $m1t}
            <a href="{$m1l}" class="bauer-moegl-card">
                <div class="bauer-moegl-card-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M6 2H18C19.1038 2 20 2.89617 20 4V20C20 21.1038 19.1038 22 18 22H6C4.89617 22 4 21.1038 4 20V4C4 2.89617 4.89617 2 6 2V2" stroke="#E2112F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
  <path d="M8 6H16M16 14V18M16 10H16.01M12 10H12.01M8 10H8.01M12 14H12.01M8 14H8.01M12 18H12.01M8 18H8.01" stroke="#E2112F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
                </div>
                <div class="bauer-moegl-card-text">
                    <span class="bauer-moegl-card-title">{$m1t}</span>
                    {if $m1d}<p class="bauer-moegl-card-desc">{$m1d}</p>{/if}
                </div>
            </a>
            {/if}

            {if $m2t}
            <a href="{$m2l}" class="bauer-moegl-card">
                <div class="bauer-moegl-card-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M13 13.5L15 11L13 8.5M21 21L16.7 16.7M9 8.5L7 11L9 13.5" stroke="#E2112F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
  <path d="M3 11C3 15.4153 6.58468 19 11 19C15.4153 19 19 15.4153 19 11C19 6.58468 15.4153 3 11 3C6.58468 3 3 6.58468 3 11V11" stroke="#E2112F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
                </div>
                <div class="bauer-moegl-card-text">
                    <span class="bauer-moegl-card-title">{$m2t}</span>
                    {if $m2d}<p class="bauer-moegl-card-desc">{$m2d}</p>{/if}
                </div>
            </a>
            {/if}

            {if $m3t}
            <a href="{$m3l}" class="bauer-moegl-card">
                <div class="bauer-moegl-card-icon">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#E2112F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M20.38 3.46L16 2a4 4 0 01-8 0L3.62 3.46a2 2 0 00-1.34 2.23l.58 3.57a1 1 0 00.99.84H6v10c0 1.1.9 2 2 2h8a2 2 0 002-2V10h2.15a1 1 0 00.99-.84l.58-3.57a2 2 0 00-1.34-2.23z"/>
                    </svg>
                </div>
                <div class="bauer-moegl-card-text">
                    <span class="bauer-moegl-card-title">{$m3t}</span>
                    {if $m3d}<p class="bauer-moegl-card-desc">{$m3d}</p>{/if}
                </div>
            </a>
            {/if}

            {if $m4t}
            <a href="{$m4l}" class="bauer-moegl-card">
                <div class="bauer-moegl-card-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M4 16V13.62C4 11.5 2.97 10.5 3 8C3.03 5.28 4.49 2 7.5 2C9.37 2 10 3.8 10 5.5C10 8.61 8 11.16 8 14.18V16C8 17.1038 7.10383 18 6 18C4.89617 18 4 17.1038 4 16M20 20V17.62C20 15.5 21.03 14.5 21 12C20.97 9.28 19.51 6 16.5 6C14.63 6 14 7.8 14 9.5C14 12.61 16 15.16 16 18.18V20C16 21.1038 16.8962 22 18 22C19.1038 22 20 21.1038 20 20M16 17H20M4 13H8" stroke="#E2112F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
                </div>
                <div class="bauer-moegl-card-text">
                    <span class="bauer-moegl-card-title">{$m4t}</span>
                    {if $m4d}<p class="bauer-moegl-card-desc">{$m4d}</p>{/if}
                </div>
            </a>
            {/if}

            {if $m5t}
            <a href="{$m5l}" class="bauer-moegl-card">
                <div class="bauer-moegl-card-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M16 20V4C16 2.89617 15.1038 2 14 2H10C8.89617 2 8 2.89617 8 4V20" stroke="#E2112F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
  <path d="M4 6H20C21.1038 6 22 6.89617 22 8V18C22 19.1038 21.1038 20 20 20H4C2.89617 20 2 19.1038 2 18V8C2 6.89617 2.89617 6 4 6V6" stroke="#E2112F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
                </div>
                <div class="bauer-moegl-card-text">
                    <span class="bauer-moegl-card-title">{$m5t}</span>
                    {if $m5d}<p class="bauer-moegl-card-desc">{$m5d}</p>{/if}
                </div>
            </a>
            {/if}

            {if $m6t}
            <a href="{$m6l}" class="bauer-moegl-card">
                <div class="bauer-moegl-card-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M14 18V6C14 4.89617 13.1038 4 12 4H4C2.89617 4 2 4.89617 2 6V17C2 17.5519 2.44808 18 3 18H5M15 18H9M19 18H21C21.5519 18 22 17.5519 22 17V13.35C21.9996 13.1231 21.922 12.903 21.78 12.726L18.3 8.376C18.1106 8.13876 17.8236 8.00043 17.52 8H14" stroke="#E2112F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
  <path d="M15 18C15 19.1038 15.8962 20 17 20C18.1038 20 19 19.1038 19 18C19 16.8962 18.1038 16 17 16C15.8962 16 15 16.8962 15 18V18" stroke="#E2112F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
  <path d="M5 18C5 19.1038 5.89617 20 7 20C8.10383 20 9 19.1038 9 18C9 16.8962 8.10383 16 7 16C5.89617 16 5 16.8962 5 18V18" stroke="#E2112F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
                </div>
                <div class="bauer-moegl-card-text">
                    <span class="bauer-moegl-card-title">{$m6t}</span>
                    {if $m6d}<p class="bauer-moegl-card-desc">{$m6d}</p>{/if}
                </div>
            </a>
            {/if}

        </div>

    </div>
</section>
