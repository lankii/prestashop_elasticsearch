
<div class="panel panel-default">
  <h3><i class="icon icon-plug"></i> {l s='Connection' mod='elasticsearch'}</h3>
  <div class="form-horizontal form-wrapper">
    <toggle display-name="{l s='Use an ajax proxy' mod='elasticsearch' js=1}" config-key="{Elasticsearch::PROXY}"></toggle>
    <server-list display-name="{l s='Server list' mod='elasticsearch' js=1}" config-key="{Elasticsearch::SERVERS}"></server-list>
    <number-input :display-name="'{l s='Max reconnect attempts' mod='elasticsearch' js=1}'" config-key="{Elasticsearch::CONNECTION_RETRY_MAX}" max-width="100"></number-input>
  </div>
  <div class="panel-footer">
    <button type="submit" class="btn btn-default pull-right ajax-save-btn" :disabled="!canSubmit"
            @click="submitSettings">
      <i class="process-icon-save"></i> {l s='Save and stay' mod='elasticseach'}
    </button>
  </div>
</div>
