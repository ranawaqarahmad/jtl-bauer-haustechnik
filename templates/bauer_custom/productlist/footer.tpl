{*
   bauer_custom override of productlist/footer.tpl.
   JTL auto-extends this onto TECHNIK/productlist/footer.tpl (block inheritance),
   so we only override the blocks we change — the parent provides pagination,
   category descriptions and scripts untouched.

   We append the homepage USP section ("Warum Bauer ProTools wählen?") to the
   last visible parent block so it renders at the bottom of the listing.
*}
{block name='sp-productlist-footerdesc'}
    {$smarty.block.parent}
    {* ── Bauer: USP section at the bottom of the listing (same as homepage) ── *}
    {include file='page/sections/warum.tpl'}
{/block}
