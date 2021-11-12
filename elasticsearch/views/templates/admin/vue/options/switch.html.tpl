
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
    <span class="switch prestashop-switch fixed-width-lg">
      <input
              type="radio"
              :name="configKey"
              :id="configKey + '_on'"
              :value="0"
              :checked="checked"
              @click="setChecked(1)"
      />
      <label :for="configKey + '_on'">
        <p>{l s='Yes' mod='elasticsearch'}</p>
      </label>
      <input
              type="radio"
              :name="configKey"
              :id="configKey + '_off'"
              :value="0"
              :checked="!checked"
              @click="setChecked(0)"
      />
      <label :for="configKey + '_off'">
        <p>{l s='No' mod='elasticsearch'}</p>
      </label>
        <a class="slide-button btn"></a>
    </span>
  </div>
  <div v-if="help" class="col-lg-9 col-lg-offset-3">
    <div class="help-block" v-html="help"></div>
  </div>
</div>
