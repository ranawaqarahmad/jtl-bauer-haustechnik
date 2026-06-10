{block name='layout-header-logo'}
    <div class="toggler-logo-wrapper">
        {block name='layout-header-logo-logo'}
            <div id="logo" class="logo-wrapper" itemprop="publisher" itemscope itemtype="https://schema.org/Organization">
                <span itemprop="name" class="d-none">{$meta_publisher}</span>
                <meta itemprop="url" content="{$ShopHomeURL}">
                <meta itemprop="logo" content="{$ShopURL}/{$currentTemplateDir}images/logo.svg">
                {link class="navbar-brand bauer-logo-link" href=$ShopHomeURL}
                    <img src="{$ShopURL}/{$currentTemplateDir}images/logo.svg"
                         alt="{$Einstellungen.global.global_shopname}"
                         class="bauer-logo"
                         width="140" height="37">
                {/link}
            </div>
        {/block}
    </div>
{/block}
