
<div id="elasticsearch-block-top" class="col-sm-4 col-md-5" role="search" v-cloak>
  <input type="hidden" name="controller" value="search"/>
  <input type="hidden" name="orderby" value="position"/>
  <input type="hidden" name="orderway" value="desc"/>
  <div class="input-group input-group-lg">
    <input class="form-control"
           type="search"
           id="elasticsearch-query-top"
           name="elasticsearch-query"
           placeholder="{l s='Search' mod='elasticsearch'}"
           spellcheck="false"
           required
           aria-label="{l s='Search our site' mod='elasticsearch'}"
           :value="query"
           @input="queryChangedHandler"
           @keydown.enter="submitHandler"
           @keydown.up="suggestionUpHandler"
           @keydown.down="suggestionDownHandler"
           @focus="focusHandler"
    >
    <span class="input-group-btn">
        <button @click="submitHandler" class="btn btn-primary" type="submit" name="submit-search" title="{l s='Search' mod='elasticsearch'}">
          <i class="icon icon-search"></i></button>
      </span>
  </div>
  <elasticsearch-autocomplete v-if="{if Configuration::get(Elasticsearch::AUTOCOMPLETE)}true{else}false{/if}"
                              id="elasticsearch-autocomplete"
                              :results="suggestions"
                              :selected="selected"
  ></elasticsearch-autocomplete>
</div>
