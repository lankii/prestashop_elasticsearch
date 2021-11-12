
<div class="form-group">
  <label class="control-label col-lg-3">
    <span class="label-tooltip"
          data-toggle="tooltip"
          title="{l s='You can drag and drop filters to adjust positions' mod='elasticsearch'}"
    >
      {l s='Searchable fields' mod='elasticsearch'}
    </span>
  </label>
  <div class="col-lg-9">
    <section class="filter_panel">
      <header class="clearfix">
        <span class="badge badge-info">{l s='Total fields:' mod='elasticsearch'} %% _.filter(metas, function (item) { return item.visible; }).length %%</span>
        <span class="badge badge-success">{l s='Searchable fields:' mod='elasticsearch'} %% nbSearchable %%</span>
      </header>
      <section class="filter_list">
        <ul class="list-unstyled sortable">
          <li v-for="(meta, index) in metas"
              v-if="meta.visible"
              :key="meta.code"
              class="filter_list_item"
              draggable="true"
              style="display: table;"
          >
            <span class="switch prestashop-switch col-lg-2 col-md-3 col-sm-4 col-xs-4"
                  @click="toggleMetaSearchable(meta, $event)"
                  style="margin: 0 5px; pointer-events: all"
            >
              <input type="radio"
                     :id="'meta_searchable' + meta.code + '_on'"
                     :name="'meta_searchable_' + meta.code"
                     :value="1"
                     :checked="meta.searchable"
              />
              <label :for="'meta_searchable_' + meta.code + '_on'">
                <p>{l s='Yes' mod='elasticsearch'}</p>
              </label>
              <input
                      type="radio"
                      :id="'meta_searchable' + meta.code + '_off'"
                      :name="'meta_searchable_' + meta.code"
                      :value="0"
                      :checked="!meta.searchable"
              />
              <label :for="'meta_searchable_' + meta.code + '_off'">
                <p>{l s='No' mod='elasticsearch'}</p>
              </label>
                <a class="slide-button btn"></a>
            </span>
            <meta-badge :meta.once="meta" :id-lang.once="idLang" :config-key="configKey" style="max-width: 200px"></meta-badge>
            <div class="col-lg-3 pull-right">
              <label class="control-label col-lg-4" style="margin-right: 5px">{l s='Weight:' mod='elasticsearch'}</label>
              <div class="input-group" style="max-width: 100px">

                <input :value="meta.weight"
                       type="text"
                       class="form-control input-number"
                       @keyup="setWeight(meta.code, $event)">
              </div>
            </div>
          </li>
        </ul>
      </section>
    </section>
  </div>
</div>
