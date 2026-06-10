{block name='salepix-layout-header'}
    {if $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG }
        {block name='salepix-layout-header-top-bar'}
            {include file='storefront/views/layout/header_top_bar.tpl'}
        {/block}
    {/if}
{/block}
<div class="wa-header-main">
{wrapper 
    enabled=$templateConfig.base.isBlockLayout === 'Y'
    tag='header'
    class='header'
    keyboard=$templateConfig.base.isKeyboardExtend === 'Y'
    keyboardOptions=[
        'data-focus-manager-item' => 'true',
        'tabindex' => '0'
    ]
}
    {block name='layout-header-container-inner'}
        {block name='layout-header-category-nav'}
            <div class="d-flex align-items-center flex-wrap flex-lg-nowrap px-0 pt-2 pb-0 pt-lg-4 pb-lg-3 slpx-row-gap-0 slpx-column-gap-1 slpx-column-gap-md-3 slpx-column-gap-lg-5 header-inner">
                <div class="order-1 flex-grow-1 flex-lg-grow-0 header-logo header-inner-item1">
                    {block name='layout-header-category-nav-logo'}
                        {include file="storefront/views/layout/header_logo.tpl"}
                    {/block}
                </div>
                <div class="order-11 order-lg-2 flex-grow-1 px-3 py-3 px-lg-0 py-lg-0 mt-2 mt-lg-0 slpx-search-form slpx-wrapper-md-fluid header-inner-item8">
                    {if $nSeitenTyp != $smarty.const.PAGE_BESTELLVORGANG}
                        {block name='layout-header-nav-icons-include-header-nav-search'}
                            {include file='storefront/views/layout/header_nav_search.tpl' area='header'}
                        {/block}
                    {/if}
                </div>
                <div class="order-2 d-none d-lg-none header-inner-item2">
                    {include file='storefront/views/snippets/language.tpl' tplscope='header-mobile'}
                </div>
                {if $templateConfig.header.isShowNotification === 'Y'}
                    <div class="order-3 d-flex header-inner-item3">
                        {block name='salepix-layout-header-nav-icons-notice-inner'}
                            {include file='storefront/views/elements/shop-btn-notice.tpl'}
                        {/block}
                    </div>
                {/if}
                <div class="order-4 d-flex header-inner-item4 custom-header-inner-item">
                    <div class="wa-custom-item">
                        <div class="wa-private-b2b">
                            {if $templateConfig.header.isShowNettoPriceSwitch === 'Y'}
                                <div class="wa-pb-row">
                                    <button class="wa-pb-col wa-pb-col-1 private-active" id="wa-pb-private">Private</button>
                                    <button class="wa-pb-col wa-pb-col-2 {if $slpxNettoPreise == 1}b2b-active{/if}" id="wa-pb-b2b">B2B</button>
                                </div>
                            {/if}
                            <div class="wa-konto">
                                <button
                                    {assign var="classArray" value=[
                                        'position-relative',
                                        'd-flex',
                                        'flex-nowrap',
                                        'slpx-gap-1',
                                        'slpx-gap-lg-0',
                                        'flex-lg-column',
                                        'align-items-center',
                                        'justify-content-center',
                                        'justify-content-lg-end',
                                        'p-0',
                                        'text-nowrap',
                                        'slpx-shop-btn',
                                        'slpx-shop-btn-account',
                                        'js-slpx-account-open'
                                    ]}
                                    class="{implode(' ', $classArray)}"
                                    aria-controls="slpx-side-account"
                                    aria-expanded="false"
                                    aria-label="{if empty($smarty.session.Kunde->kKunde)}{lang key='login'}{else}{lang key='myAccount'}{/if}"
                                    >
                                    {block name='salepix-elements-nav-shop-item-account-icon'}
                                        <div class="d-flex position-relative">
                                            <img src="{$ShopURL}/{$currentTemplateDir}images/icons/icon-account.svg"
                                                 width="24" height="24" alt="" aria-hidden="true"
                                                 class="bauer-icon">
                                        </div>
                                    {/block}
                                    {block name='salepix-elements-nav-shop-item-account-label'}
                                        <span class="nav-shop-item-label d-none d-lg-block">{if empty($smarty.session.Kunde->kKunde)}{lang key='login'}{else}{lang key='myAccount'}{/if}</span>
                                    {/block}
                                </button>
                            </div>
                        </div>
                        <div class="wa-warenkorn">
                            {include file='storefront/views/elements/shop-btn-basket.tpl'}
                        </div>
                    </div>
                </div>
                {if !empty($wishlists) && $Einstellungen.global.global_wunschliste_anzeigen === 'Y'}
                    <div class="order-4 d-flex header-inner-item4">
                        {include file='storefront/views/elements/shop-btn-wishlist.tpl'}
                    </div>
                {/if}
                
                <div class="order-4 d-none d-lg-flex header-inner-item5">
                    {include file='storefront/views/elements/shop-btn-account.tpl'}
                </div>
                <div class="order-5 header-inner-item6">
                    {block name='layout-header-nav-icons-include-cart-dropdown-label'}
                        {include file='storefront/views/elements/shop-btn-basket.tpl'}
                    {/block}
                </div>
                <div class="order-6 d-flex d-lg-none pr-0 header-inner-item6">
                    {include file='storefront/views/elements/shop-btn-menu.tpl'}
                </div>
            </div>
        {/block}
    {/block}
{/wrapper}
</div>
{block name='layout-header-include-categories-mega'}
    {block name='layout-header-categories'}
        {if $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}
        <div class="mainnavigation-styling">
            {wrapper
                id='mainNavigation'
                enabled=false
                container=false
                tag='div'
                class="d-none d-lg-block position-relative {if $templateConfig.base.isBlockLayout === 'Y'}slpx-wrapper{/if} slpx-navbar"
                keyboard=$templateConfig.base.isKeyboardExtend === 'Y'
                keyboardOptions=[
                    'role' => 'region',
                    'aria-label' => "{lang key="ariaLabelMainMenu" section="custom"}",
                    'data-focus-manager-item' => 'true',
                    'tabindex' => '0'
                ]
            }
                {container}
                    {navbar class="p-0 flex-nowrap" type="main-nav"}
                        <div class="slpx-fit-content">
                            {get_salepix_is_vertical_nav assign='isVerticalMenu'}
                            {if isset($isVerticalMenu) && $isVerticalMenu}
                                {lang key="morecats" section="custom" assign=morecats}
                                <button class="border-0 bg-transparent slpx-navbar-link position-relative nav-link btn-mobile-menu-open d-none d-lg-flex"
                                    data-slpx-offcanvas-navigation="true"
                                    data-slpx-offcanvas-navigation-options='{json_encode([
                                        'header'   => $morecats,
                                        'id' => 'slpx-side-vertical-navigation',
                                        'a11y' => true,
                                        'event'    => 'click',
                                        'params'   => [
                                            'id'   => 0,
                                            'type' => 'vertical',
                                            'countChild' => $isVerticalMenu
                                        ]
                                    ])}'
                                    aria-controls="slpx-side-vertical-navigation"
                                    aria-expanded="false"
                                    aria-label="{$morecats}"
                                    >
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8 6.40002V8.40002H6V6.40002H8ZM8 16.4V18.4H6V16.4H8ZM16 6.40002V8.40002H18V6.40002H16ZM18 11.4V13.4H16V11.4H18ZM11 11.4V13.4H13V11.4H11ZM8 11.4V13.4H6V11.4H8ZM11 6.40002V8.40002H13V6.40002H11ZM13 16.4V18.4H11V16.4H13ZM16 16.4V18.4H18V16.4H16Z" fill="currentColor"/>
                                    </svg>
                                    <span class="nav-link-name">{$morecats}</span>
                                </button>
                            {/if}
                            {block name='layout-header-logo-navbar-toggle'}
                                {lang key="menuName" assign=menuName}
                                <a class="slpx-navbar-link nav-link btn-mobile-menu-open d-flex d-lg-none"
                                    data-slpx-offcanvas-navigation="true"
                                    data-slpx-offcanvas-navigation-options='{json_encode([
                                        'header'   => {lang key="mainmenu" section="custom"},
                                        'id' => 'slpx-side-navigation',
                                        'a11y' => true,
                                        'params'   => [
                                            'id'   => 0,
                                            'type' => 'mobile',
                                            'countChild' => 10
                                        ]
                                    ])}'
                                    aria-controls="slpx-side-navigation"
                                    aria-expanded="false"
                                    aria-label="{lang key='mainmenu' section='custom'}"
                                    role="button"
                                >
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8 6.40002V8.40002H6V6.40002H8ZM8 16.4V18.4H6V16.4H8ZM16 6.40002V8.40002H18V6.40002H16ZM18 11.4V13.4H16V11.4H18ZM11 11.4V13.4H13V11.4H11ZM8 11.4V13.4H6V11.4H8ZM11 6.40002V8.40002H13V6.40002H11ZM13 16.4V18.4H11V16.4H13ZM16 16.4V18.4H18V16.4H16Z" fill="black"/>
                                    </svg>
                                    <span class="text-nowrap">{$menuName}</span>
                                </a>
                            {/block}
                        </div>
                        <div class="position-relative flex-grow-1 d-none d-lg-block slpx-navbar-nav">
                            {block name='layout-header-categories-include-include-categories-body'}
                                <div class="position-relative slpx-slider-main-navigation" data-slpx-slider-navigation="true">
                                    {navbarnav class="flex-row align-items-center slpx-slider-navigation-main-wrapper" data=["slpx-slider-main-navigation-wrapper"=>"true"]}
                                        {block name='layout-header-categories-include-include-categories-mega'}
                                            {include file="storefront/views/navigation/navbar.tpl"}
                                        {/block}
                                    {/navbarnav}
                                </div>
                            {/block}
                        </div>
                        <div class="slpx-fit-content pl-3 ml-auto">
                            <p class="wa-megamenu-text">
                                {$Einstellungen.template.wa_header.text1}
                            </p>
                            {navbarnav class="flex-row align-items-center slpx-gap-2"}
                                {block name='layout-header-top-bar-user-settings-direct-purchase'}
                                    {if $templateConfig.header.isShowQuickBuyButton === 'Y'}
                                        {include file='storefront/views/elements/shop-btn-quickbuy.tpl'}
                                    {/if}
                                {/block}
                                {block name='layout-header-top-bar-user-settings-currency'}
                                    {include file='storefront/views/snippets/currency.tpl' tplscope='header-desktop'}
                                {/block}
                                {block name='layout-header-top-bar-user-settings-include-language-dropdown'}
                                    {include file='storefront/views/snippets/language.tpl' tplscope='header-desktop'}
                                {/block}
                            {/navbarnav}
                        </div>
                    {/navbar}
                {/container}
            {/wrapper}
        </div>
        {/if}
    {/block}
{/block}
