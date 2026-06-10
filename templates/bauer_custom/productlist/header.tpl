{block name='productlist-header'}
    {block name='productlist-variables'}
        {$showTitle = true}
        {$showImage = true}
        {$navData = null}
        {assign var="isImage" value=false}
        {if $oNavigationsinfo->getCategory() !== null}
            {$navData = $oNavigationsinfo->getCategory()}
        {elseif $oNavigationsinfo->getManufacturer() !== null}
            {$navData = $oNavigationsinfo->getManufacturer()}
        {elseif $oNavigationsinfo->getCharacteristicValue() !== null}
            {$navData = $oNavigationsinfo->getCharacteristicValue()}
        {/if}
        {if $oNavigationsinfo !== null && $oNavigationsinfo->getImageURL() !== null
            && $oNavigationsinfo->getImageURL() !== $smarty.const.BILD_KEIN_KATEGORIEBILD_VORHANDEN
            && $oNavigationsinfo->getImageURL() !== 'gfx/keinBild_kl.gif'
            && !strstr($oNavigationsinfo->getImageURL(), 'keinBild')}
            {$isImage = true}
        {/if}
        {if $oNavigationsinfo->getManufacturer()}
            {$catType = "brand"}
        {else}
            {$catType = "category"}
        {/if}
    {/block}

    {* No-results handling — kept intact *}
    {if $Suchergebnisse->getSearchUnsuccessful() == true}
        {opcMountPoint id='opc_before_no_results'}
        {block name='productlist-header-alert'}
            {alert variant="info" class="mb-3"}{lang key='noResults' section='productOverview'}{/alert}
        {/block}
        {block name='productlist-header-form-search'}
            {card border-variant=0 class="mb-5"}
                {form id="suche2" action=$ShopURL method="get" slide=true}
                    <fieldset>
                        {formgroup label-for="searchkey" label="{lang key='searchText'}"}
                            {input type="text" name="suchausdruck" value="{if $Suchergebnisse->getSearchTerm()}{$Suchergebnisse->getSearchTerm()|escape:'htmlall'}{/if}" id="searchkey"}
                        {/formgroup}
                        {button variant="primary" type="submit" value="1"}{lang key='searchAgain' section='productOverview'}{/button}
                    </fieldset>
                {/form}
            {/card}
        {/block}
    {/if}

    {block name='productlist-header-include-extension'}
        {include file='snippets/extension.tpl'}
    {/block}

    {* ── Category Banner ── *}
    {if isset($oNavigationsinfo)
        && ($oNavigationsinfo->getManufacturer() || $oNavigationsinfo->getCharacteristicValue() || $oNavigationsinfo->getCategory())}

        {* Resolve background image: category image if set, otherwise fallback placeholder *}
        {$bannerBg = "{$ShopURL}/{$currentTemplateDir}images/category_banner.jpg"}
        {if $isImage}
            {$bannerBg = $oNavigationsinfo->getImageURL()}
        {/if}

        <div class="bauer-cat-banner productlist-header productlist-header-{$catType}"
             style="background-image: url('{$bannerBg}');"
             role="region"
             aria-label="{if $oNavigationsinfo->getName()}{$oNavigationsinfo->getName()|escape:'html'}{/if}">

            <div class="bauer-cat-banner-inner">

                {* Top: breadcrumb *}
                <div class="bauer-cat-banner-top">
                    {if !empty($Brotnavi)}
                        <nav class="bauer-cat-banner-breadcrumb" aria-label="Breadcrumb">
                            {foreach $Brotnavi as $oItem}
                                {if !$oItem@first}<span class="bauer-crumb-sep"> / </span>{/if}
                                {if $oItem@last}
                                    <span class="bauer-crumb-active">{$oItem->getName()|escape:'html'}</span>
                                {else}
                                    <a href="{$oItem->getURLFull()}" class="bauer-crumb-link">{$oItem->getName()|escape:'html'}</a>
                                {/if}
                            {/foreach}
                        </nav>
                    {/if}
                </div>

                {* Middle: category title + description *}
                <div class="bauer-cat-banner-middle">
                    {block name='productlist-header-heading'}
                        <div class="bauer-cat-banner-titles">
                            {block name='productlist-header-heading-title'}
                                {if $oNavigationsinfo->getName() && $showTitle}
                                    <h1 class="bauer-cat-banner-title">{$oNavigationsinfo->getName()}</h1>
                                {/if}
                            {/block}
                            {block name='productlist-header-description'}
                                {if $oNavigationsinfo->getCategory() !== null
                                    && $oNavigationsinfo->getCategory()->getDescription()|strlen > 0}
                                    <p class="bauer-cat-banner-subtitle">
                                        {$oNavigationsinfo->getCategory()->getDescription()|strip_tags}
                                    </p>
                                {elseif $oNavigationsinfo->getManufacturer() !== null
                                    && $oNavigationsinfo->getManufacturer()->getDescription()|strlen > 0}
                                    <p class="bauer-cat-banner-subtitle">
                                        {$oNavigationsinfo->getManufacturer()->getDescription()|strip_tags}
                                    </p>
                                {/if}
                            {/block}
                        </div>
                    {/block}
                </div>

                {* Bottom: product count — singular/plural handled *}
                <div class="bauer-cat-banner-bottom">
                    {$bauerCount = $Suchergebnisse->getProductCount()}
                    <span class="bauer-cat-banner-count">
                        {$bauerCount} {if $bauerCount == 1}Produkt gefunden{else}Produkte gefunden{/if}
                    </span>
                </div>

            </div>
        </div>

        {* Subcategory tiles — keep for admin use, hidden by CSS in bauer design *}
        {block name='productlist-header-subcategories'}
            {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'N' && $oUnterKategorien_arr|count > 0}
                {opcMountPoint id='opc_before_subcategories'}
                {assign var=catgrid value=$templateConfig.productlist.catrownumberxs}
                {assign var=catgridsm value=$templateConfig.productlist.catrownumbersm}
                {assign var=catgridmd value=$templateConfig.productlist.catrownumbermd}
                {assign var=catgridlg value=$templateConfig.productlist.catrownumberlg}
                {assign var=catgridxl value=$templateConfig.productlist.catrownumberxl}
                {$width = $Einstellungen.bilder.bilder_kategorien_mini_breite}
                {$height = $Einstellungen.bilder.bilder_kategorien_mini_hoehe}
                {$c = $height / $width * 100}
                <style>.content-cats-small .square::before { padding-bottom: {$c}%; }</style>
                <div class="content-cats-small row row-cols-{$catgrid} row-cols-sm-{$catgridsm} row-cols-md-{$catgridmd} row-cols-lg-{$catgridlg} row-cols-xl-{$catgridxl} mt-3">
                    {foreach $oUnterKategorien_arr as $subCategory}
                        {assign var="showCatDesc" value=false}
                        {if $Einstellungen.navigationsfilter.unterkategorien_beschreibung_anzeigen === 'Y' && !empty($subCategory->getDescription())}
                            {$showCatDesc = true}
                        {/if}
                        <div class="content-cats-small__card d-flex">
                            <div class="content-cats-small__item w-100 position-relative">
                                {$imgSrc = $subCategory->getImage(\JTL\Media\Image::SIZE_SM)}
                                {$noimage = false}
                                {if strstr($subCategory->getImage(\JTL\Media\Image::SIZE_SM),"keinBild.gif")}
                                    {$noimage = true}
                                {/if}
                                {link href=$subCategory->getURL() class="text-decoration-none position-absolute content-cats-small_link"}
                                    <span class="sr-only">{$subCategory->getName()}</span>
                                {/link}
                                {if !$noimage}
                                    <div class="content-cats-small__image">
                                        <div class="square square-image"><div class="inner">
                                            {image fluid=true lazy=true webp=true src=$imgSrc alt="{$subCategory->getName()}"}
                                        </div></div>
                                    </div>
                                {/if}
                                <div class="content-cats-small_titles-folder">
                                    <div class="content-cats-small_title">{$subCategory->getName()}</div>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            {/if}
        {/block}

    {else}
        {* Search results or other listing pages without category context *}
        {opcMountPoint id='opc_before_heading'}
        {block name='productlist-header-heading-search'}
            <h1 class="mb-5">{$Suchergebnisse->getSearchTermWrite()}</h1>
        {/block}
    {/if}

    {block name='productlist-header-include-selection-wizard'}
        {include file='selectionwizard/index.tpl' container=false}
    {/block}

    {if $Suchergebnisse->getProducts()|count < 1 && isset($KategorieInhalt)}
        {if isset($KategorieInhalt->TopArtikel->elemente) && $KategorieInhalt->TopArtikel->elemente|count > 0}
            {block name='productlist-header-include-product-slider-top'}
                {opcMountPoint id='opc_before_category_top'}
                {lang key='topOffer' assign='slidertitle'}
                {slpxSlider key='slidercategory' headline=$slidertitle items=$KategorieInhalt->TopArtikel->elemente entity='product' class='productlist-mode-gallery' id='slider-top-products'}{/slpxSlider}
            {/block}
        {/if}
        {if isset($KategorieInhalt->BestsellerArtikel->elemente) && $KategorieInhalt->BestsellerArtikel->elemente|count > 0}
            {block name='productlist-header-include-product-slider-bestseller'}
                {opcMountPoint id='opc_before_category_bestseller'}
                {lang key='bestsellers' assign='slidertitle'}
                {slpxSlider key='slidercategory' headline=$slidertitle items=$KategorieInhalt->BestsellerArtikel->elemente entity='product' class='productlist-mode-gallery' id='slider-top-products'}{/slpxSlider}
            {/block}
        {/if}
    {/if}
    {if isset($oBestseller_arr) && $oBestseller_arr|count > 0}
        {block name='productlist-index-include-product-slider'}
            {opcMountPoint id='opc_before_bestseller'}
            {lang key='bestseller' section='global' assign='slidertitle'}
            {slpxSlider key='slidercategory' headline=$slidertitle items=$oBestseller_arr entity='product' class='productlist-mode-gallery' id='slider-top-products'}{/slpxSlider}
        {/block}
    {/if}

    {block name='productlist-header-include-productlist-page-nav'}
        {include file='snippets/productlist_page_nav.tpl' navid='header'}
    {/block}

    {block name='productlist-header-include-active-filter'}
        {if $NaviFilter->getFilterCount() > 0}
            {$alertList->displayAlertByKey('noFilterResults')}
        {/if}
    {/block}

{/block}
