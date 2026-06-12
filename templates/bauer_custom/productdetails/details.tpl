{* ============================================================
   PRODUKTDETAILS (PDP) — Bauer overrides
   Uses the JTL/SALEPIX core PDP and only injects the few
   Bauer-specific elements the design needs (subtitle, delivery
   badge, spec box, B2B button, trust row). Everything else
   (gallery, price, basket, stock, tabs, related) stays core and
   is styled via wa.css. All injected texts are client-editable:
   JTL Admin -> Templates -> bauer_custom -> Settings
   -> "Produktdetails (PDP)".  JTL auto-extends this onto
   TECHNIK/productdetails/details.tpl, so we only override the
   blocks we change.
   ============================================================ *}

{* --- Subtitle + delivery badge directly under the H1 title --- *}
{block name='productdetails-details-info-product-title'}
    {$smarty.block.parent}
    {$bauerSub = $Artikel->cKurzBeschreibung|default:''}
    {if $bauerSub|strip_tags|trim}
        <p class="bauer-pdp-subtitle">{$bauerSub|strip_tags}</p>
    {/if}
    {$bauerDelivery = $Einstellungen.template.pdp.delivery_badge|default:'Lieferung in 1–3 Werktagen'}
    {if $bauerDelivery}
        <span class="bauer-pdp-delivery">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                <path d="M1 3h15v13H1zM16 8h4l3 3v5h-7zM5.5 19a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5ZM18.5 19a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z" stroke="#E2112F" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            {$bauerDelivery}
        </span>
    {/if}
{/block}

{* --- Spec box (free product attributes) before the basket,
       B2B button + trust row after it --- *}
{block name='productdetails-details-include-basket'}
    {if ($Artikel->Attribute|@count > 0) || !empty($Artikel->cArtNr)}
        <div class="bauer-pdp-specbox">
            {foreach $Artikel->Attribute as $attr}
                <div class="bauer-pdp-spec-row">
                    <span class="bauer-pdp-spec-label">{$attr->cName|escape:'html'}:</span>
                    <span class="bauer-pdp-spec-value">{$attr->cWert}</span>
                </div>
            {/foreach}
            {if !empty($Artikel->cArtNr)}
                <div class="bauer-pdp-spec-row">
                    <span class="bauer-pdp-spec-label">Artikelnummer:</span>
                    <span class="bauer-pdp-spec-value">{$Artikel->cArtNr}</span>
                </div>
            {/if}
        </div>
    {/if}

    {$smarty.block.parent}

    {$b2bText = $Einstellungen.template.pdp.b2b_text|default:'B2B Preis anfragen'}
    {if $b2bText}
        <a href="{$Einstellungen.template.pdp.b2b_link|default:'/kontakt'}" class="bauer-pdp-b2b">
            {$b2bText}
            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                <path d="M3 8H13M13 8L9 4M13 8L9 12" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </a>
    {/if}

    {$bt1 = $Einstellungen.template.pdp.trust1|default:'Originalprodukt'}
    {$bt2 = $Einstellungen.template.pdp.trust2|default:'Schneller Versand'}
    {$bt3 = $Einstellungen.template.pdp.trust3|default:'Sichere Zahlung'}
    {if $bt1 || $bt2 || $bt3}
        <div class="bauer-pdp-trust">
            {foreach [$bt1, $bt2, $bt3] as $bt}
                {if $bt}
                    <span class="bauer-pdp-trust-item">
                        <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                            <path d="M11.6673 3.5L5.25065 9.91667L2.33398 7" stroke="#10B981" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                        {$bt}
                    </span>
                {/if}
            {/foreach}
        </div>
    {/if}
{/block}

{* --- Description as stacked sections (Figma) instead of the core tab UI ---
   The core tabs component collapses its panes via JS, which fights any
   CSS-only attempt to hide the tab bar. So we replace the whole tabs block
   with the product description rendered directly. The client writes the
   sections (Beschreibung / Wichtigste Vorteile / Technischer Überblick) as
   headings + text in the normal product description field in Wawi. *}
{block name='productdetails-details-include-tabs'}
    {if $Artikel->cBeschreibung|strip_tags|trim}
        <div class="bauer-pdp-description slpx-wrapper">
            {$Artikel->cBeschreibung}
        </div>
    {/if}
{/block}
