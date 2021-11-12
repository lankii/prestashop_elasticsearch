
<div class="form-group">
  <label class="control-label col-lg-3">
    <span :class="description ? 'label-tooltip' : ''"
          :data-toggle="description ? 'tooltip' : ''"
          :data-html="description ? 'true' : ''"
          :title="description"
          :data-original-title="description"
    >
      %% displayName %%
    </span>
  </label>
  <div class="col-lg-9">
    <select class="form-control fixed-width-xxl" @change="setTaxRulesGroupId">
      <option value="0" :selected.once="!selectedTax">{l s='None' mod='elasticsearch'}</option>
      <option v-for="tax in taxes" :value="tax.id_tax_rules_group" :selected.once="tax.id_tax_rules_group == selectedTax">%% tax.name %%</option>
    </select>
  </div>
  <div v-if="help" class="col-lg-9 col-lg-offset-3">
    <div class="help-block" v-html="help"></div>
  </div>
</div>
