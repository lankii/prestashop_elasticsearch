
<main v-if="_.indexOf(['list', 'grid'], layoutType) > -1" id="elasticsearch-results" :class="classList">
  <section id="category-info">
    <h1 class="page-heading product-listing">
      <span v-if="!query && fixedFilter && _.includes(['{Elasticsearch::getAlias('manufacturer')|escape:'javascript':'UTF-8'}', '{Elasticsearch::getAlias('supplier')|escape:'javascript':'UTF-8'}'], fixedFilter.aggregationCode)" class="cat-name">
        %% fixedFilter.filterName %%
      </span>
      <span v-else-if="query" class="cat-name">
        {l s='Search:' mod='elasticsearch'} <strong>%% decodeURI(query) %%</strong>
      </span>
    </h1>
  </section>

  <product-section></product-section>
</main>
