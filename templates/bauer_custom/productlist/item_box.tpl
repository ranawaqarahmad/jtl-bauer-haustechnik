{*
   Bauer custom product card (gallery mode).
   Mirrors the homepage .bauer-product-card design (page/sections/products.tpl)
   but populated with real product data from JTL core ($Artikel).
   Add-to-cart uses JTL's core form mechanism so the basket stays fully functional.
*}
{block name='productlist-item-box'}

    {* Mirror core buyability logic: only directly add simple, in-stock, buyable products.
       Everything else (variations, configurable, not buyable) links to the detail page. *}
    {assign var=bauerBuyable value=false}
    {if $Artikel->inWarenkorbLegbar === 1
        && $Artikel->nIstVater === 0
        && $Artikel->Variationen|@count === 0
        && !$Artikel->bHasKonfig
        && $templateConfig.productlist.buy_productlist === 'Y'}
        {assign var=bauerBuyable value=true}
    {/if}

    {* VAT label follows the gross/net (B2C/B2B) toggle *}
    {if $NettoPreise == 1}
        {assign var=bauerVatLabel value='exkl. MwSt.'}
    {else}
        {assign var=bauerVatLabel value='inkl. MwSt.'}
    {/if}

    <div class="bauer-product-card" itemscope itemtype="https://schema.org/Product">

        {* ── Image ── *}
        <a href="{$Artikel->cURLFull}" class="bauer-product-card-image" aria-label="{$Artikel->cName|escape:'html'}">
            {if isset($Artikel->Bilder[0]) && $Artikel->Bilder[0]->cURLNormal && !strstr($Artikel->Bilder[0]->cURLNormal, 'keinBild')}
                {image
                    src=$Artikel->Bilder[0]->cURLNormal
                    alt=$Artikel->cName|escape:'html'
                    fluid=true
                    lazy=true
                    webp=true
                    class="bauer-product-card-img"
                }
            {/if}
        </a>

        {* ── Body ── *}
        <div class="bauer-product-card-body">

            {* Stock badge — only when in stock *}
            {if isset($Artikel->Lageranzeige) && $Artikel->Lageranzeige->nStatus >= 1}
                <span class="bauer-product-badge">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none" aria-hidden="true">
                        <path d="M12.5785 5.69499C13.1275 8.38912 11.7207 11.1008 9.20192 12.2034C6.68319 13.306 3.73648 12.5001 2.12945 10.2691C0.522422 8.03819 0.691428 4.98794 2.53509 2.94817C4.37875 0.908401 7.39645 0.432968 9.77796 1.80707" stroke="#10B981" stroke-width="1.02813" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M4.62659 6.13949L6.37659 7.88949L12.2099 2.05615" stroke="#10B981" stroke-width="1.02813" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    {lang key='inStock' section='global' default='Auf Lager'}
                </span>
            {/if}

            {* Title *}
            <a href="{$Artikel->cURLFull}" class="bauer-product-title" itemprop="name">
                {$Artikel->cKurzbezeichnung}
            </a>

            {* Short description *}
            {if $Artikel->cKurzBeschreibung}
                <p class="bauer-product-desc">
                    {$Artikel->cKurzBeschreibung|strip_tags|truncate:90:"…":true}
                </p>
            {/if}

            {* Price *}
            {if $Artikel->Preise->fVKNetto != 0 || $Einstellungen.global.global_preis0 !== 'N'}
                <div class="bauer-product-price-wrap">
                    <span class="bauer-product-price js-product-counter-price">{$Artikel->Preise->cVKLocalized[$NettoPreise]}</span>
                    <span class="bauer-product-vat">{$bauerVatLabel}</span>
                </div>
            {/if}

            {* Add-to-cart button (real product) / Details link (variations etc.) *}
            {if $bauerBuyable}
                {form action=$ShopURL class="bauer-product-buyform form-basket js-buy-form" data=["toggle" => "basket-add"]}
                    {input type="hidden" name="a" value=$Artikel->kArtikel}
                    {input type="hidden" name="anzahl" value="1"}
                    {input type="hidden" name="wke" value="1"}
                    {input type="hidden" name="overview" value="1"}
                    <button type="submit" class="bauer-product-btn btn-add-to-cart js-slpx-add-cart-btn">
                        {lang key='addToCart' default='In den Warenkorb'}
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                            <path d="M3 8H13M13 8L9 4M13 8L9 12" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </button>
                {/form}
            {else}
                <a href="{$Artikel->cURLFull}" class="bauer-product-btn">
                    {lang key='details' default='Details ansehen'}
                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                        <path d="M3 8H13M13 8L9 4M13 8L9 12" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </a>
            {/if}

        </div>
    </div>

{/block}
