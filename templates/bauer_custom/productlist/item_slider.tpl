{block name='productlist-index-include-price'}
    <div class="position-relative productbox-prices">
        {include file='productdetails/price.tpl' Artikel=$Artikel tplscope=$tplscope}
        {if $templateConfig.productlist.show_stock !== 'N'}
            {include file='productdetails/stock.tpl'}
        {/if}
    </div>
    <div class="wa-product-zum-artikel">
        {link href=$Artikel->cURLFull class="wa-productbox-button"}
            Zum Artikel
        {/link}
    </div>
{/block}