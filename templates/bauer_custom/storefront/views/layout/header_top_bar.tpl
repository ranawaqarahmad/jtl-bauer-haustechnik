{block name='layout-header-top-bar'}
    {get_html_block key='header-service-technik' filter=true assign='headerServiceContent'}
    {get_html_block key='header-service-technik-title' filter=true assign='headerServiceTitle'}
    {get_html_block key="header-usp-technik" filter=true assign=sliderTopBar}
    {if ($headerServiceContent && $headerServiceTitle) || (!empty($sliderTopBar) && $templateConfig.header.isShowSliderTopBar === 'Y') || $templateConfig.header.comparelist !== 'N' || $templateConfig.header.isShowNettoPriceSwitch === 'Y'}
    
    <div class="wa-topbar"> 
        {wrapper
            enabled=$templateConfig.base.isBlockLayout === 'Y'
            tag='nav'
            class='navbar d-flex navbar-top'
            keyboard=$templateConfig.base.isKeyboardExtend === 'Y'
            keyboardOptions=[
                'data-focus-manager-item' => 'true',
                'tabindex' => '0'
            ]
        }

            <div class="wa-custom-topbar">
                <div class="wa-custom-topbar-main">
                    <div class="wa-topbar-inner">
                        <div class="wa-topbar-left">
                            <p class="wa-topbar-left-text">
                             {$Einstellungen.template.wa_topbar.text1}
                            </p>
                        </div>
                        <div class="wa-topbar-right">
                            <p class="wa-topbar-right-text">
                                {$Einstellungen.template.wa_topbar.text2}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <nav class="navbar-none navbar p-0 flex-nowrap slpx-gap-2 w-100">
                <div class="d-none d-lg-block slpx-fit-content">
                    {nav class='slpx-gap-3 align-items-center'}
                        {if $headerServiceContent && $headerServiceTitle}
                            <li class="nav-item">
                                <button class="bg-transparent border-0 nav-link d-flex slpx-gap-1 js-slpx-service-open"
                                    data-slpx-offcanvas="true"
                                    data-slpx-offcanvas-options='{json_encode([
                                        'id'        => 'slpx-side-service',
                                        'source'    => '#slpx-service-offcanvas',
                                        'class'     => 'slpx-service-offcanvas',
                                        'position'  => 'right',
                                        'method'    => 'dom',
                                        'type'      => 'offcanvas',
                                        'width'     => 500,
                                        'a11y'      => true,
                                        'debug'     => false])}'
                                    aria-controls="slpx-side-service"
                                    aria-expanded="false"
                                    aria-label="{lang key='shopNavigation'}"
                                >
                                    {$headerServiceTitle}
                                </button>
                            </li>
                        {/if}
                        {if $linkgroups->getLinkGroupByTemplate('Kopf') !== null}
                            {block name='layout-header-top-bar-cms-pages'}
                                {foreach $linkgroups->getLinkGroupByTemplate('Kopf')->getLinks() as $Link}
                                    {navitem active=$Link->getIsActive() href=$Link->getURL() title=$Link->getTitle()}
                                        {$Link->getName()}
                                    {/navitem}
                                {/foreach}
                            {/block}
                        {/if}
                    {/nav}
                </div>

                {if !empty($sliderTopBar) && $templateConfig.header.isShowSliderTopBar === 'Y'}
                    <div class="position-relative text-center flex-grow-1 slpx-navbar-nav ">
                        {slpxSlider
                            key='uspslider'
                            items=[$sliderTopBar]
                            entity='html'
                            class='slpx-slider slpx-slider-usp'
                        }{/slpxSlider}
                    </div>
                {/if}
                <div class="d-none d-lg-block slpx-fit-content ml-auto">
                    {nav class='slpx-gap-3 align-items-center justify-content-end'}
                        {block name='layout-header-top-bar-user-settings'}
                            {if $Einstellungen.vergleichsliste.vergleichsliste_anzeigen === 'Y'}
                                {if $templateConfig.header.comparelist !== 'N'}
                                    {block name='layout-header-nav-icons-include-header-shop-nav-compare'}
                                        <li>
                                            {include file='storefront/views/snippets/compare.tpl' tplscope='topbar'}
                                        </li>
                                    {/block}
                                {/if}
                            {/if}
                        {/block}
                        {block name='layout-header-nav-checkbox-privatkunde'}
                            {if $templateConfig.header.isShowNettoPriceSwitch === 'Y'}
                                <li>
                                    <div class="slpx-switch">
                                        <input type="checkbox" id="slpx-switch-1" {if $slpxNettoPreise == 1}checked{/if} data-slpx-netto-brutto="true">
                                        <label for="slpx-switch-1">
                                            <span>{lang key="businessman" section="custom"}</span>
                                        </label>
                                    </div>
                                </li>
                            {/if}
                        {/block}
                    {/nav}
                </div>
            </nav>
        {/wrapper}
    </div>
    {/if}
{/block}
