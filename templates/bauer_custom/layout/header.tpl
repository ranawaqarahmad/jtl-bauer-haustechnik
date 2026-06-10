{block name='layout-header'}
{block name='layout-header-doctype'}<!DOCTYPE html>{/block}
<html {block name='layout-header-html-attributes'}lang="{$meta_language}" itemscope {if $nSeitenTyp === $smarty.const.URLART_ARTIKEL}itemtype="https://schema.org/ItemPage"
      {elseif $nSeitenTyp === $smarty.const.URLART_KATEGORIE}itemtype="https://schema.org/CollectionPage"
      {else}itemtype="https://schema.org/WebPage"{/if}{/block}>

{include file="sp_tpl/layout/header_head.tpl"} {*SALEPIX ADDED*}

{has_boxes position='left' assign='hasLeftPanel'}

{* Header-Variant *}
{*$headervariant = $templateConfig.header.variant}{*SALEPIX ADDED*}

{block name='layout-header-body-tag'}
{strip}
<body class="{$activeParentTemplate|lower}-template page{$nSeitenTyp}{if $templateConfig.base.button_animated === 'Y'} btn-animated{/if}
    {if $templateConfig.base.wish_compare_animation === 'mobile'|| $templateConfig.base.wish_compare_animation === 'both'} wish-compare-animation-mobile{/if}
    {if $templateConfig.base.wish_compare_animation === 'desktop'|| $templateConfig.base.wish_compare_animation === 'both'} wish-compare-animation-desktop{/if}
    {if $isMobile} is-mobile{/if}{if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG} is-checkout{/if}{if $nSeitenTyp === $smarty.const.PAGE_WARENKORB} is-cart{/if}
    {*if $templateConfig.base.container_background === 'Y' && $templateConfig.base.container_percent !== 'Y'} technik-boxed{/if*}"
    data-page="{$nSeitenTyp}"
    {if $templateConfig.base.isKeyboardExtend === 'Y'}
        data-slpx-focus-manager="true"
        data-slpx-focus-manager-options='{json_encode([
            'strictMode' => $templateConfig.base.keyboardMode === 'true',
            'hints'    => [
                'default' => "{lang key='focusManagerHintDefault' section='custom'}",
                'href' => "{lang key='focusManagerHintHref' section='custom'}"
            ]
        ])}'
    {/if}
    {if isset($Link) && !empty($Link->getIdentifier())} id="{$Link->getIdentifier()}"{/if}>
{/strip}
{/block}

{if !$bExclusive}
    {block name="layout-header-skip-to-links"}
        {link href="#main-wrapper" class="btn-skip-to"}
            {lang key='skipToContent'}
        {/link}
        {if $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}
            {link href="#search-header" class="btn-skip-to"}
                {lang key='skipToSearch'}
            {/link}
            {link href="#mainNavigation" class="btn-skip-to"}
                {lang key='skipToNav'}
            {/link}
        {/if}
    {/block}

    {if !$isMobile}
        {include file=$opcDir|cat:'tpl/startmenu.tpl'}
    {/if}

    {if $bAdminWartungsmodus}
        {block name='layout-header-maintenance-alert'}
            {alert show=true variant="warning" id="maintenance-mode" dismissible=true}{lang key='adminMaintenanceMode'}{/alert}
        {/block}
    {/if}
    {if $smarty.const.SAFE_MODE === true}
        {block name='layout-header-safemode-alert'}
            {alert show=true variant="warning" id="safe-mode" dismissible=true}{lang key='safeModeActive'}{/alert}
        {/block}
    {/if}

    {* SALEPIX Header-Text-Slider *}
    {block name='slpx-layout-header-textslider'}
        {if $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}
            {get_html_block key='header-textslider' assign="headertextslider"}
            {if $headertextslider}
                <div class="sp-header-textslider{if $templateConfig.header.isShowTextSliderOnMobile == 'N'} d-none d-lg-block{/if}">
                    <div class="container{if !$bExclusive && $boxesLeftActive} container-variable{/if}">
                        {$sliderOptions = [
                            'parameters' => [
                                'slidesPerView' => 1,
                                'centeredSlides' => false,
                                'spaceBetween' => 0,
                                'edgeSwipeThreshold' => 0,
                                'loop' => true,
                                'speed' => 500
                            ],
                            'modules' => [
                                'navigation' => [
                                    'enabled' => true,
                                    'nextEl' => '.swiper-button-next',
                                    'prevEl' => '.swiper-button-prev'
                                ],
                                'autoplay' => [
                                    'delay' => 5000,
                                    'pauseOnMouseEnter' => true
                                ]
                            ]
                        ]}
                        <div id="swiper-salepix-textslider" class="swiper swiper-salepix_textslider"
                                data-salepix-sliders="true"
                                data-salepix-sliders-options='{json_encode($sliderOptions)}'>
                            <div class="salepix-slider-builder-navigation">
                                <div class="swiper-button-prev is-navigation-item"></div>
                                <div class="swiper-button-next is-navigation-item"></div>
                            </div>
                            <div class="swiper-wrapper swiper-wrapper-html-block">
                                {$headertextslider}
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
        {/if}
    {/block}
    {* /// *}

    {* SALEPIX Header-Banner *}
    {if $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG  && !$isMobile}
        {get_html_block key='header-banner' assign="headerbanner"}
        {if $headerbanner}
            <div class="headerbanner d-none d-xl-block togglebox {if $smarty.cookies.headerbanner|default:false}closed{/if}"
                 data-cookietime="1"
                 data-cookiename="headerbanner">
                <div class="close-global"></div>
                {$headerbanner}
            </div>
        {/if}
    {/if}
    {* /// *}

    {block name='layout-header-header'}
        {* SALEPIX Header-Variant *}
        {if $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}
        <div class="wa-topbar-upper"></div>
        <div class="header-bg">
            {include file="storefront/views/layout/header.tpl"}
        </div>
        {/if}
        {* // *}
    {/block}
{/if}

{block name='layout-header-main-wrapper-starttag'}
{*SALEPIX CHANGED*}
<main id="main-wrapper" class="{if $templateConfig.base.isBlockLayout === 'Y'}slpx-wrapper{/if} {salepix_page_class}__main-wrapper{if $bExclusive} exclusive{/if}{if $hasLeftPanel} aside-active{/if}">
    {if $templateConfig.base.isBlockLayout === 'Y'}
        <div class="container-fluid">
    {/if}
    {*SALEPIX CHANGED*}
    {*{opcMountPoint id='opc_before_main' inContainer=false}*}
    {* BAUER REDESIGN: opc_before_main disabled — new homepage sections added in page/index.tpl *}
    {*{if !$boxesLeftActive}{opcMountPoint id='opc_before_main' inContainer=false}{/if}*}
    {/block}

    {block name='layout-header-fluid-banner'}
        {assign var=isFluidBanner value=$templateConfig.base.banner_full_width === 'Y' && isset($oImageMap)}
        {if $isFluidBanner}
            {block name='layout-header-fluid-banner-include-banner'}
                {wrapper enabled=$templateConfig.base.isBlockLayout === 'Y'}
                    {include file='snippets/banner.tpl' isFluid=true}
                {/wrapper}
            {/block}
        {/if}
        {assign var=isFluidSlider value=$templateConfig.base.slider_full_width === 'Y' && isset($oSlider) && count($oSlider->getSlides()) > 0}
        {if $isFluidSlider}
            {block name='layout-header-fluid-banner-include-slider'}
                {wrapper enabled=$templateConfig.base.isBlockLayout === 'Y'}
                    {include file='snippets/slider.tpl' isFluid=true}
                {/wrapper}
            {/block}
        {/if}
    {/block}

    {block name='layout-header-content-all-starttags'}
        {block name='layout-header-content-wrapper-starttag'}
            {*SALEPIX CHANGED*}
            <div id="content-wrapper" class="{salepix_page_class}__content-wrapper">
        {/block}

        {if $isMobile && $nSeitenTyp === $smarty.const.PAGE_MEINKONTO}
            {block name='layout-header-account-menu'}
                {include file='../SALEPIX/storefront/views/account/my_account-nav.tpl' viewtype=mobile}
            {/block}
        {/if}

        {block name='layout-header-breadcrumb'}
            {include file='layout/breadcrumb.tpl'}
        {/block}
        {block name='layout-header-alert'}
            {if $nSeitenTyp !== $smarty.const.PAGE_ARTIKEL && $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}
                {include file='snippets/alert_list.tpl'}
            {/if}
        {/block}

        {block name='layout-header-content-starttag'}
            <div id="content"
                {if $templateConfig.base.isBlockLayout === 'Y' &&
                    $nSeitenTyp != $smarty.const.PAGE_ARTIKEL &&
                    $nSeitenTyp != $smarty.const.PAGE_BESTELLVORGANG}
                    class="slpx-wrapper"
                {/if}
            >
                {if $nSeitenTyp === $smarty.const.PAGE_ARTIKELLISTE || $nSeitenTyp === $smarty.const.PAGE_STARTSEITE}
                    <div class="container{if $nSeitenTyp === $smarty.const.PAGE_STARTSEITE}-fluid d-flex flex-column slpx-gap-5 slpx-gap-md-7{/if}">
                {/if}
        {/block}

        {if !$bExclusive && $boxes.left !== null && !empty(trim(strip_tags($boxes.left))) && (($templateConfig.base.left_sidebar === 'Y' && $boxesLeftActive) || $smarty.const.PAGE_ARTIKELLISTE === $nSeitenTyp)}
            {block name='layout-header-content-productlist-starttags'}
                {*SALEPIX CHANGED*}
                <div class="row {salepix_page_class}__content-row">
                    <div class="order-lg-1{if $templateConfig.base.container_percent !== 'N'} col col-calc{else} col-lg-9{/if}">
                        {if $boxesLeftActive && $nSeitenTyp !== $smarty.const.PAGE_ARTIKELLISTE && $nSeitenTyp !== $smarty.const.PAGE_ARTIKEL}
                            <div class="row {salepix_page_class}__content-row">
                            {opcMountPoint id='opc_before_main' inContainer=false}
                        {/if}
            {/block}
        {/if}

    {/block}{* /content-all-starttags *}
{/block}
