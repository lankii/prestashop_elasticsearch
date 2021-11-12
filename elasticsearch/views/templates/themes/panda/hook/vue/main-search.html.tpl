
<div id="search_block_top" class=" clearfix">
  <form id="es-searchbox" method="get" action="{$link->getModuleLink('elasticsearch', 'search', [], true)|escape:'htmlall':'UTF-8'}">
    <div :class="'searchbox_inner ' + (focused ? 'active' : '')">
      <input type="hidden" name="controller" value="search">
      <input type="hidden" name="orderby" value="position">
      <input type="hidden" name="orderway" value="desc">
      <input class="search_query form-control ac_input"
             type="text"
             id="search_query_top"
             name="search_query"
             placeholder="{l s='Search' mod='elasticsearch'}"
             spellcheck="false"
             required
             aria-label="{l s='Search our site' mod='elasticsearch'}"
             :value="decodeURI(query)"
             @input="queryChangedHandler"
             @keydown.enter="submitHandler"
             @keydown.up="suggestionUpHandler"
             @keydown.down="suggestionDownHandler"
             @focus="focusHandler"
      >
      <div class="hidden"
           id="more_prod_string">
        {l s='More products' mod='elasticsearch'} »
      </div>
      <a title="Search"
         rel="nofollow"
         id="submit_searchbox"
         class="submit_searchbox icon_wrap"
         style="cursor: pointer; margin-left: -10px"
         @click="submitHandler"
      >
        <i class="icon-search-1 icon-0x"></i><span class="icon_text">{l s='Search' mod='elasticsearch'}</span></a>
    </div>
  </form>
  <elasticsearch-autocomplete v-if="{if Configuration::get(Elasticsearch::AUTOCOMPLETE)}true{else}false{/if}"
                              id="elasticsearch-autocomplete"
                              :results="suggestions"
                              :selected="selected"
  ></elasticsearch-autocomplete>

</div>

