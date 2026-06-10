{block name='salepix-elements-nav-shop-item-basket'}
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
            'slpx-shop-btn-basket',
            'js-slpx-basket-open'
        ]}
        class="{implode(' ', $classArray)}"
        aria-controls="slpx-side-basket"
        aria-expanded="false"
        aria-label="{$WarenkorbArtikelAnzahl} {lang key='basket'}"
    >
        {block name='salepix-elements-nav-shop-item-basket-icon'}
            <div class="d-flex position-relative">
                <img src="{$ShopURL}/{$currentTemplateDir}images/icons/icon-cart.svg"
                     width="24" height="24" alt="" aria-hidden="true"
                     class="bauer-icon">
                {block name='salepix-elements-nav-shop-item-basket-badge'}
                    <span class="position-absolute d-flex justify-content-center slpx-border align-items-center slpx-shop-btn-badge" data-slpx-basket-badge="true">
                        <span class="js-slpx-basket-badge {if $WarenkorbArtikelAnzahl === 0}d-none{/if}">{if $WarenkorbArtikelAnzahl < 99}{$WarenkorbArtikelAnzahl}{else}99+{/if}</span>
                    </span>
                {/block}
            </div>
        {/block}
        {block name='salepix-elements-nav-shop-item-basket-label'}
            <span class="nav-shop-item-label d-none d-lg-block">{lang key='basket'}</span>
        {/block}
    </button>
{/block}
