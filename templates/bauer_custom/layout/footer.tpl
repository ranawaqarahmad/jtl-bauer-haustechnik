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

            {block name='layout-footer-boxes'}
                <div class="position-relative row py-3 py-md-6 footer-boxes{if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG} is-checkout{/if}" id="footer-boxes">

                    {* ── Col 1: Logo + Description + Social icons ── *}
                    {col cols=12 lg=6 xl=3 class="pb-5 bauer-footer-col1"}
                        <div class="card box box-normal mb-0 bauer-footer-col1-inner">
                            <div class="bauer-footer-logo-wrap">
                                <img src="{$ShopURL}/{$currentTemplateDir}images/logo.svg"
                                     alt="Bauer ProTools"
                                     class="bauer-footer-logo-img">
                            </div>
                            <div class="bauer-footer-desc">
                                <p>Alles was du brauchst an einem Ort</p>
                                <p>Ihr Partner für professionelle Werkzeuge</p>
                            </div>
                            <div class="bauer-footer-socials">
                                <div class="slpx-social-icons-box">
                                    <a href="#" class="btn btn-primary is-square" aria-label="Instagram" rel="noopener noreferrer" target="_blank">
                                        <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/></svg>
                                    </a>
                                    <a href="#" class="btn btn-primary is-square" aria-label="Facebook" rel="noopener noreferrer" target="_blank">
                                        <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
                                    </a>
                                    <a href="#" class="btn btn-primary is-square" aria-label="YouTube" rel="noopener noreferrer" target="_blank">
                                        <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M23.495 6.205a3.007 3.007 0 0 0-2.088-2.088c-1.87-.501-9.396-.501-9.396-.501s-7.507-.01-9.396.501A3.007 3.007 0 0 0 .527 6.205a31.247 31.247 0 0 0-.522 5.805 31.247 31.247 0 0 0 .522 5.783 3.007 3.007 0 0 0 2.088 2.088c1.868.502 9.396.502 9.396.502s7.506 0 9.396-.502a3.007 3.007 0 0 0 2.088-2.088 31.247 31.247 0 0 0 .5-5.783 31.247 31.247 0 0 0-.5-5.805zM9.609 15.601V8.408l6.264 3.602z"/></svg>
                                    </a>
                                    <a href="#" class="btn btn-primary is-square" aria-label="TikTok" rel="noopener noreferrer" target="_blank">
                                        <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12.525.02c1.31-.02 2.61-.01 3.91-.02.08 1.53.63 3.09 1.75 4.17 1.12 1.11 2.7 1.62 4.24 1.79v4.03c-1.44-.05-2.89-.35-4.2-.97-.57-.26-1.1-.59-1.62-.93-.01 2.92.01 5.84-.02 8.75-.08 1.4-.54 2.79-1.35 3.94-1.31 1.92-3.58 3.17-5.91 3.21-1.43.08-2.86-.31-4.08-1.03-2.02-1.19-3.44-3.37-3.65-5.71-.02-.5-.03-1-.01-1.49.18-1.9 1.12-3.72 2.58-4.96 1.66-1.44 3.98-2.13 6.15-1.72.02 1.48-.04 2.96-.04 4.44-.99-.32-2.15-.23-3.02.37-.63.41-1.11 1.04-1.36 1.75-.21.51-.15 1.07-.14 1.61.24 1.64 1.82 3.02 3.5 2.87 1.12-.01 2.19-.66 2.77-1.61.19-.33.4-.67.41-1.06.1-1.79.06-3.57.07-5.36.01-4.03-.01-8.05.02-12.07z"/></svg>
                                    </a>
                                </div>
                            </div>
                        </div>
                    {/col}

                    {* ── Nav columns from JTL Admin bottom-position boxes ── *}
                    {getBoxesByPosition position='bottom' assign='footerBoxes'}
                    {if isset($footerBoxes) && count($footerBoxes) > 0}
                        {foreach $footerBoxes as $box}
                            {if $box->isActive() && !empty($box->getRenderedContent())}
                                {col cols=12 lg=6 xl=2 class="pb-5 bauer-footer-navbox"}
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
                                                        linkgroupIdentifier=$box->getLinkGroupTemplate() dropdownSupport=true tplscope='box'
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

                    {* ── Newsletter column ── *}
                    {if $templateConfig.footer.newsletterbox != 'N' && $Einstellungen.newsletter.newsletter_active === 'Y'}
                        {block name='layout-footer-newsletter'}
                            {col cols=12 lg=6 xl=4 class="pb-5 bauer-footer-newsletter"}
                                <div class="card box box-normal mb-0">
                                    {block name='layout-footer-newsletter-heading'}
                                        <div class="productlist-filter-headline d-flex border-box pb-3 mb-0">
                                            {lang key='newsletter' section='newsletter'}
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
            {/block}

        </div>{* .wa-footer-main *}

        {wrapper
            enabled=false
            container=false
            id='copyright'
            class='footer-copyright'
        }
            {block name='layout-footer-copyright'}
                {row class="bauer-copyright-row"}
                    {block name='layout-footer-copyright-copyright'}
                        <div class="col-12 col-md-6 bauer-footer-copyright-left">
                            {if !empty($meta_copyright)}
                                <span itemprop="copyrightHolder">&copy; {$meta_copyright}</span>
                            {else}
                                <span itemprop="copyrightHolder">&copy; {$smarty.now|date_format:'%Y'} Bauer ProTools. Alle Rechte vorbehalten.</span>
                            {/if}
                        </div>
                       
                    {/block}
                {/row}
                {* VAT / shipping footnote — legal requirement *}
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
                        <div class="bauer-footer-vat-notice">
                            * {$footnoteVat}{if isset($footnoteShipping)}{$footnoteShipping}{/if}
                        </div>
                    {/block}
                {/block}
                {block name='layout-footer-copyright-brand'}
                    <div class="col-12" id="system-credits" style="display:none"></div>
                {/block}
            {/block}
        {/wrapper}

        {/wrapper}

    {/if}
{/block}
