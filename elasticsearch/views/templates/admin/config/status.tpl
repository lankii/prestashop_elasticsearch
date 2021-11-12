
<div class="panel">
  <h3 class="page-heading"><i class="icon icon-server"></i> {l s='Elasticsearch status' mod='elasticsearch'}</h3>
  <div v-if="configUpdated" class="alert alert-warning">{l s='The configuration has been updated. A full reindex is recommended.'}</div>
  <div class="alert alert-info"><strong>{l s='Elasticsearch version' mod='elasticsearch'}:</strong> <span>%% elasticsearchVersion %%</span>
  </div>
  <label for="product-progress">{l s='Amount of items indexed' mod='elasticsearch'}: %% productsIndexed %% / %% productsToIndex %%&nbsp;
    <span class="small">(%% totalProducts %% {l s='products' mod='elasticsearch'}
      x %% languages.length %% {l s='languages' mod='elasticsearch'})</span>
  </label>
  <div id="product-progress" class="progress">
    <div class="progress-bar progress-bar-info"
         role="progressbar"
         aria-valuemin="0"
         :aria-valuenow="(productsIndexed / productsToIndex * 100)"
         :aria-valuemax="productsToIndex"
         :style="'width: ' + (productsIndexed / productsToIndex * 100) + '%'">
      <span>%% (productsIndexed / productsToIndex * 100).toFixed(2) %%  %</span>
    </div>
  </div>
  <div class="panel-footer">
    <button v-if="!indexing" class="btn btn-default" @click="startFullIndexing" :disabled="saving">
      <i class="process-icon-refresh"></i>
      {l s='Full (re)index' mod='elasticsearch'}
    </button>
    <button v-if="!indexing" class="btn btn-default" @click="startIndexing" :disabled="saving">
      <i class="process-icon-refresh"></i>
      {l s='Index remaining items' mod='elasticsearch'}
    </button>
    <button v-if="!indexing" class="btn btn-default" @click="eraseIndex" :disabled="saving">
      <i class="process-icon-eraser"></i>
      {l s='Clear index' mod='elasticsearch'}
    </button>
    <button class="btn btn-default"
            v-if="indexing"
            disabled
    >
      <i class="process-icon-loading"></i> {l s='Currently indexing...' mod='elasticsearch'}
    </button>
    <button class="btn btn-danger"
            v-if="indexing"
            @click="cancelIndexing"
            :disabled="cancelingIndexing"
            >
      <i :class="cancelingIndexing ? 'process-icon-loading' : 'process-icon-cancel'"></i>&nbsp;
      <span v-if="!cancelingIndexing">{l s='Cancel' mod='elasticsearch'}</span>
      <span v-else>{l s='Canceling...' mod='elasticsearch'}</span>
    </button>
  </div>
</div>
