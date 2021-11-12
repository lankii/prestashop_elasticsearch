
<div class="panel panel-default">
  <h3><i class="icon icon-sort"></i> {l s='Indexing' mod='elasticsearch'}</h3>
  <div class="form-horizontal form-wrapper">
    <index-meta-list config-key="{Elasticsearch::METAS}"></index-meta-list>
  </div>
  <div class="panel-footer">
    <button type="submit"
            class="btn btn-default pull-right ajax-save-btn"
            :disabled="!canSubmit"
            @click="submitSettings">
      <i class="process-icon-save"></i> {l s='Save and stay' mod='elasticseach'}
    </button>
  </div>
</div>
