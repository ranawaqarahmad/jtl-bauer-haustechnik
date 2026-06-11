{* ============================================================
   PRODUCT SLIDER SECTION  —  "Schnell verfügbare Werkzeuge"

   Shows real products from the category the client configures in:
     JTL Admin -> Ansicht -> Templates -> bauer_custom -> Settings
     -> "Startseite: Produkte-Slider" -> Kategorie-ID
   The client assigns products to that category in JTL-Wawi.

   If no category is set (or it has no products), the original
   placeholder cards are shown so the design never breaks.
   ============================================================ *}
{$hpHeading      = $Einstellungen.template.hp_products.heading|default:'Schnell verfügbare Werkzeuge'}
{$hpCatId        = $Einstellungen.template.hp_products.category_id|default:''}
{$hpLimit        = $Einstellungen.template.hp_products.limit|default:'8'}
{$hpViewAllText  = $Einstellungen.template.hp_products.viewall_text|default:'Alle ansehen'}
{$hpViewAllLink  = $Einstellungen.template.hp_products.viewall_link|default:'#'}

{$bauerHighlights = []}
{if $hpCatId}
    {get_product_list kKategorie=$hpCatId nLimit=$hpLimit cAssign='bauerHighlights'}
{/if}

<section class="bauer-products" id="schnellfinder">
    <div class="bauer-products-inner">

        <div class="bauer-products-header">
            <h2 class="bauer-products-heading">{$hpHeading}</h2>
            <a href="{$hpViewAllLink}" class="bauer-products-viewall">
                {$hpViewAllText}
                <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                    <path d="M3 8H13M13 8L9 4M13 8L9 12" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </a>
        </div>

        <div class="bauer-product-cards">

            {if $bauerHighlights|@count > 0}
                {* ── Real products from the configured category (same card design) ── *}
                {foreach $bauerHighlights as $Artikel}
                    {include file='productlist/item_box.tpl' tplscope='gallery'}
                {/foreach}
            {else}
                {* ── Fallback placeholder cards (shown until a category is configured) ── *}
                <div class="bauer-product-card">
                    <div class="bauer-product-card-image"></div>
                    <div class="bauer-product-card-body">
                        <span class="bauer-product-badge"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none" aria-hidden="true"><path d="M12.5785 5.69499C13.1275 8.38912 11.7207 11.1008 9.20192 12.2034C6.68319 13.306 3.73648 12.5001 2.12945 10.2691C0.522422 8.03819 0.691428 4.98794 2.53509 2.94817C4.37875 0.908401 7.39645 0.432968 9.77796 1.80707" stroke="#10B981" stroke-width="1.02813" stroke-linecap="round" stroke-linejoin="round"/><path d="M4.62659 6.13949L6.37659 7.88949L12.2099 2.05615" stroke="#10B981" stroke-width="1.02813" stroke-linecap="round" stroke-linejoin="round"/></svg>Auf Lager</span>
                        <a href="#" class="bauer-product-title">Bosch Professional Schlagbohrmaschine GSB 18V</a>
                        <p class="bauer-product-desc">Leistungsstarke Akku-Schlagbohrmaschine für Holz, Metall und Mauerwerk</p>
                        <div class="bauer-product-price-wrap">
                            <span class="bauer-product-price">189,00 €</span>
                            <span class="bauer-product-vat">inkl. MwSt.</span>
                        </div>
                        <a href="#" class="bauer-product-btn">
                            In den Warenkorb
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                <path d="M3 8H13M13 8L9 4M13 8L9 12" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </a>
                    </div>
                </div>

                <div class="bauer-product-card">
                    <div class="bauer-product-card-image"></div>
                    <div class="bauer-product-card-body">
                        <span class="bauer-product-badge"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none" aria-hidden="true"><path d="M12.5785 5.69499C13.1275 8.38912 11.7207 11.1008 9.20192 12.2034C6.68319 13.306 3.73648 12.5001 2.12945 10.2691C0.522422 8.03819 0.691428 4.98794 2.53509 2.94817C4.37875 0.908401 7.39645 0.432968 9.77796 1.80707" stroke="#10B981" stroke-width="1.02813" stroke-linecap="round" stroke-linejoin="round"/><path d="M4.62659 6.13949L6.37659 7.88949L12.2099 2.05615" stroke="#10B981" stroke-width="1.02813" stroke-linecap="round" stroke-linejoin="round"/></svg>Auf Lager</span>
                        <a href="#" class="bauer-product-title">Makita Winkelschleifer 125mm 840W</a>
                        <p class="bauer-product-desc">Robuster Winkelschleifer für Schleifen, Trennen und Entgraten</p>
                        <div class="bauer-product-price-wrap">
                            <span class="bauer-product-price">119,90 €</span>
                            <span class="bauer-product-vat">inkl. MwSt.</span>
                        </div>
                        <a href="#" class="bauer-product-btn">
                            In den Warenkorb
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                <path d="M3 8H13M13 8L9 4M13 8L9 12" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </a>
                    </div>
                </div>

                <div class="bauer-product-card">
                    <div class="bauer-product-card-image"></div>
                    <div class="bauer-product-card-body">
                        <span class="bauer-product-badge"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none" aria-hidden="true"><path d="M12.5785 5.69499C13.1275 8.38912 11.7207 11.1008 9.20192 12.2034C6.68319 13.306 3.73648 12.5001 2.12945 10.2691C0.522422 8.03819 0.691428 4.98794 2.53509 2.94817C4.37875 0.908401 7.39645 0.432968 9.77796 1.80707" stroke="#10B981" stroke-width="1.02813" stroke-linecap="round" stroke-linejoin="round"/><path d="M4.62659 6.13949L6.37659 7.88949L12.2099 2.05615" stroke="#10B981" stroke-width="1.02813" stroke-linecap="round" stroke-linejoin="round"/></svg>Auf Lager</span>
                        <a href="#" class="bauer-product-title">DeWalt Handkreissäge 18V Brushless DCS391</a>
                        <p class="bauer-product-desc">Präzisionssäge für saubere Schnitte in Holz und Verbundwerkstoffen</p>
                        <div class="bauer-product-price-wrap">
                            <span class="bauer-product-price">249,00 €</span>
                            <span class="bauer-product-vat">inkl. MwSt.</span>
                        </div>
                        <a href="#" class="bauer-product-btn">
                            In den Warenkorb
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                <path d="M3 8H13M13 8L9 4M13 8L9 12" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </a>
                    </div>
                </div>

                <div class="bauer-product-card">
                    <div class="bauer-product-card-image"></div>
                    <div class="bauer-product-card-body">
                        <span class="bauer-product-badge"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none" aria-hidden="true"><path d="M12.5785 5.69499C13.1275 8.38912 11.7207 11.1008 9.20192 12.2034C6.68319 13.306 3.73648 12.5001 2.12945 10.2691C0.522422 8.03819 0.691428 4.98794 2.53509 2.94817C4.37875 0.908401 7.39645 0.432968 9.77796 1.80707" stroke="#10B981" stroke-width="1.02813" stroke-linecap="round" stroke-linejoin="round"/><path d="M4.62659 6.13949L6.37659 7.88949L12.2099 2.05615" stroke="#10B981" stroke-width="1.02813" stroke-linecap="round" stroke-linejoin="round"/></svg>Auf Lager</span>
                        <a href="#" class="bauer-product-title">Hilti Akku-Schrauber SFC 22-A Compact</a>
                        <p class="bauer-product-desc">Kompakter Akkuschrauber für präzises Schrauben auf engem Raum</p>
                        <div class="bauer-product-price-wrap">
                            <span class="bauer-product-price">319,00 €</span>
                            <span class="bauer-product-vat">inkl. MwSt.</span>
                        </div>
                        <a href="#" class="bauer-product-btn">
                            In den Warenkorb
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                <path d="M3 8H13M13 8L9 4M13 8L9 12" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </a>
                    </div>
                </div>

                <div class="bauer-product-card">
                    <div class="bauer-product-card-image"></div>
                    <div class="bauer-product-card-body">
                        <span class="bauer-product-badge"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none" aria-hidden="true"><path d="M12.5785 5.69499C13.1275 8.38912 11.7207 11.1008 9.20192 12.2034C6.68319 13.306 3.73648 12.5001 2.12945 10.2691C0.522422 8.03819 0.691428 4.98794 2.53509 2.94817C4.37875 0.908401 7.39645 0.432968 9.77796 1.80707" stroke="#10B981" stroke-width="1.02813" stroke-linecap="round" stroke-linejoin="round"/><path d="M4.62659 6.13949L6.37659 7.88949L12.2099 2.05615" stroke="#10B981" stroke-width="1.02813" stroke-linecap="round" stroke-linejoin="round"/></svg>Auf Lager</span>
                        <a href="#" class="bauer-product-title">Festool Exzenterschleifer ETS EC 150/5</a>
                        <p class="bauer-product-desc">Professioneller Exzenterschleifer mit staubfreiem Arbeiten</p>
                        <div class="bauer-product-price-wrap">
                            <span class="bauer-product-price">289,00 €</span>
                            <span class="bauer-product-vat">inkl. MwSt.</span>
                        </div>
                        <a href="#" class="bauer-product-btn">
                            In den Warenkorb
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                <path d="M3 8H13M13 8L9 4M13 8L9 12" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </a>
                    </div>
                </div>
            {/if}

        </div>

    </div>
</section>
