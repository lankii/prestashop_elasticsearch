
<section id="es-category-results" v-if="!query && fixedFilter && _.indexOf(['{Elasticsearch::getAlias('category')|escape:'javascript':'UTF-8'}', '{Elasticsearch::getAlias('categories')|escape:'javascript':'UTF-8'}'], fixedFilter.aggregationCode) > -1 && _.indexOf(['list', 'grid'], layoutType) > -1" :class="classList">
  <product-section></product-section>
</section>
