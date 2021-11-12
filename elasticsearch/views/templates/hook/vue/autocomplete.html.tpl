
<div id="elasticsearch-autocomplete" v-if="results.length">
  <span :class="'elastic-suggestion clearfix ' + ((result._id == selected) ? 'active' : '')"
        v-for="result in results"
        :key="result._id"
        @click="suggestionClicked(result, $event)"
  >
    <a :href="result._source['{Elasticsearch::getAlias('link')|escape:'javascript':'UTF-8'}']"
       v-if="result.highlight"
       v-html="result.highlight['{Elasticsearch::getAlias('name')|escape:'javascript':'UTF-8'}'][0]"
       @click="suggestionClicked(result, $event)"
    ></a>
    <a :href="result._source['{Elasticsearch::getAlias('link')|escape:'javascript':'UTF-8'}']"
       v-else="result.highlight"
       @click="suggestionClicked(result, $event)"
    >%% result._source['{Elasticsearch::getAlias('name')|escape:'javascript':'UTF-8'}'] %%</a>
  </span>
</div>
