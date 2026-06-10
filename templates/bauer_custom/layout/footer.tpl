{block name='layout-footer-content'}
    {if !$bExclusive}
        {wrapper
            enabled=$templateConfig.base.isBlockLayout === 'Y'
            tag='footer'
            id='footer'
            class='footer'
            keyboard=$templateConfig.base.isKeyboardExtend === 'Y'
            keyboardOptions=[
                'data-focus-manager-item' => 'true',
                'tabindex' => '0'
            ]
        }
        <div class="wa-footer-main">
        <div class="container">
            {if $templateConfig.footer.socialiconsbox === 'Y' || $templateConfig.base.button_scroll_top === 'Y'}
                <div class="row align-items-center py-4">
                    {col cols=12 class="d-flex"}
                        {if $templateConfig.footer.socialiconsbox === 'Y'}
                            {include file="storefront/views/social-icons.tpl"}
                        {/if}
                        {if $templateConfig.base.button_scroll_top === 'Y'}
                            <div class="ml-auto">
                                {include file="storefront/views/scroll-up.tpl"}
                            </div>
                        {/if}
                    {/col}
                </div>
            {/if}
            {block name='layout-footer-boxes'}
                <div class="position-relative row py-3 py-md-6 footer-boxes{if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG} is-checkout{/if}" id="footer-boxes">
                    {get_html_block key='footer-logo' assign="footerlogo"}
                    {get_html_block key='footer-contact-technik' assign="footerContact"}

                    {if $footerContact}
                        {col cols=12 lg=6 xl=3 class="pb-5"}
                            <div class="card box box-normal mb-0">
                                <div class="productlist-filter-headline d-flex border-box pb-3 mb-0">
                                    {if $footerlogo}
                                        <div class="footer-logo">{$footerlogo}</div>
                                    {else}
                                        <span>{lang key='contact' section='custom'}</span>
                                    {/if}
                                </div>
                                {if $footerContact}
                                    <div class="footer-contact">
                                        {$footerContact}
                                    </div>
                                {/if}
                            </div>
                        {/col}
                    {/if}

                    {getBoxesByPosition position='bottom' assign='footerBoxes'}
                    {if isset($footerBoxes) && count($footerBoxes) > 0}
                        {foreach $footerBoxes as $box}
                            {if $box->isActive() && !empty($box->getRenderedContent())}
                                {col cols=12 lg=6 xl=3 class="pb-5"}
                                    <div class="card box box-normal mb-0">
                                        {if !empty($box->getTitle())}
                                            <div class="productlist-filter-headline d-flex border-box pb-3 mb-0">
                                                <span>{$box->getTitle()}</span>
                                            </div>
                                        {/if}
                                        <div class="nav-panel box-nav-item">
                                            {if method_exists($box, 'getLinkGroup')}
                                                {nav vertical=true}
                                                    {include file='snippets/linkgroup_recursive.tpl'
                                                        links=$box->getLinkGroup()->getHierarchy()
                                                        linkgroupIdentifier=$box->getLinkGroupTemplate() dropdownSupport=true  tplscope='box'
                                                    }
                                                {/nav}
                                            {elseif method_exists($box, 'getContent')}
                                                {eval var=$box->getContent()}
                                            {/if}
                                        </div>
                                    </div>
                                {/col}
                            {/if}
                        {/foreach}
                    {/if}
                    {if $templateConfig.footer.newsletterbox != 'N' && $Einstellungen.newsletter.newsletter_active === 'Y'}
                        {block name='layout-footer-newsletter'}
                            {col cols=12 lg=6 xl=3 class="pb-5"}
                                <div class="card box box-normal mb-0">
                                    {block name='layout-footer-newsletter-heading'}
                                        <div class="productlist-filter-headline d-flex border-box pb-3 mb-0">
                                            {lang key='newsletter' section='newsletter'} {lang key='newsletterSendSubscribe' section='newsletter'}
                                        </div>
                                    {/block}
                                    {include file="storefront/views/newsletter-form.tpl"}
                                </div>
                            {/col}
                        {/block}
                    {/if}
                    {block name='salepix-footer-variant-icons'}
                        {get_html_block key='footer-shippings-technik' filter=true assign="footershippings"}
                        {get_html_block key='footer-payments-technik' filter=true assign="footerpayments"}
                        {if $footershippings && $footerpayments}
                            {$colMd = 6}
                            {$cJustifyL = 'justify-content-md-start'}
                            {$cJustifyR = 'justify-content-md-end'}
                        {else}
                            {$colMd = 12}
                            {$cJustifyL = ''}
                            {$cJustifyR = ''}
                        {/if}
                        {if $footershippings || $footerpayments}
                            {col cols=12}
                                <div class="row align-items-center">
                                    {if $footershippings}
                                        {col cols=12 md=$colMd class="d-flex flex-wrap slpx-gap-4 mb-5 mb-md-0 justify-content-center {$cJustifyL} payment-shipping-box"}
                                            {block name='salepix-footer-variant-icons-shippings'}
                                                {$footershippings}
                                            {/block}
                                        {/col}
                                    {/if}
                                    {if $footerpayments}
                                        {col cols=12 md=$colMd class="d-flex flex-wrap justify-content-center {$cJustifyR} slpx-gap-4 align-items-center payment-shipping-box"}
                                            {block name='salepix-footer-variant-icons-payments'}
                                                {$footerpayments}
                                            {/block}
                                        {/col}
                                    {/if}
                                </div>
                            {/col}
                        {/if}
                    {/block}
                </div>
                <div class="wa-footer-text-main">
                    <p class="wa-footer-text">
                        {$Einstellungen.template.wa_footer.text1}
                    </p>
                </div>
            {/block}
            {wrapper
                enabled=false
                container=false
                id='copyright'
                class='footer-copyright'
            }
                {block name='layout-footer-copyright'}
                    {row class="pt-3 pb-5 pb-md-3"}
                        {assign var=isBrandFree value=JTL\Shop::isBrandfree()}
                        {block name='layout-footer-copyright-copyright'}
                            <div class="col-12 col-md-4 text-center text-md-left">
                                {if !empty($meta_copyright)}
                                    <span itemprop="copyrightHolder">&copy; {$meta_copyright}</span>
                                {/if}
                                {if $Einstellungen.global.global_zaehler_anzeigen === 'Y'}
                                    {lang key='counter'}: {$Besucherzaehler}
                                {/if}
                                {block name='salepix-footer-variant-footnote'}
                                    {if $NettoPreise == 1}
                                        {lang key='footnoteExclusiveVat' assign='footnoteVat'}
                                    {else}
                                        {lang key='footnoteInclusiveVat' assign='footnoteVat'}
                                    {/if}
                                    {if isset($oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND])}
                                        {if $Einstellungen.global.global_versandhinweis === 'zzgl'}
                                            {lang key='footnoteExclusiveShipping' printf=$oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND]->getURL() assign='footnoteShipping'}
                                        {elseif $Einstellungen.global.global_versandhinweis === 'inkl'}
                                            {lang key='footnoteInclusiveShipping' printf=$oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND]->getURL() assign='footnoteShipping'}
                                        {/if}
                                    {/if}
                                    {block name='footer-vat-notice'}
                                        {if $slpxNettoPreise == 1}
                                            {assign var=footnoteVat value = str_replace("inkl", "exkl", $footnoteVat)}
                                        {/if}
                                        <span class="small">&nbsp;&nbsp;* {$footnoteVat}{if isset($footnoteShipping)}{$footnoteShipping}{/if}</span>
                                    {/block}
                                {/block}
                            </div>
                            <div class="col-12 col-md-4 text-center">
                                {if !empty($Einstellungen.global.global_fusszeilehinweis)}
                                    <span>{$Einstellungen.global.global_fusszeilehinweis}</span>
                                {/if}
                            </div>
                        {/block}
                        {block name='layout-footer-copyright-brand'}
                            <div class="col-12 col-md-4 text-center text-md-right ml-auto" id="system-credits">
                                {if !$isBrandFree}
                                    Powered by {link href="https://jtl-url.de/jtlshop" title="JTL-Shop" target="_blank" rel="noopener nofollow"}JTL-Shop{/link}
                                {/if}
                                {assign var=spcopyright value={isSalepixBrandFree}}
                                {if !$isBrandFree && !$spcopyright} | {/if}
                                {if !$spcopyright}
                                    <a href="https://www.jtl-software.de/extension-store/salepix-gmbh"
                                        target="_blank" rel="noopener">{$activeParentTemplate} JTL-Shop Template</a>
                                {/if}
                            </div>
                        {/block}
                    {/row}
                {/block}
            {/wrapper}
        <div>
        </div>
        {/wrapper}

    {/if}
{/block}
