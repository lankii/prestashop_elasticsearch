
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
    <input type="text"
           :name="configKey"
           :id="configKey"
           :value="value"
           :style="style"
           @keyup="setValue"
    />
  </div>
</div>
