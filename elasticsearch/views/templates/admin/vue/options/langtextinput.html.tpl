
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
  <div class="translatable-field col-lg-4">
    <div :class="languages.length > 1 ? 'col-lg-9' : 'col-lg-12'">
      <input type="text"
             :name="configKey"
             :id="configKey"
             :value="value"
             @keyup="setLangValue(idLang, $event)">
    </div>
    <div v-if="languages.length > 1" class="col-lg-2">
      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
        <span>%% _.find(languages, {ldelim}id_lang: idLang.toString(){rdelim}).iso_code %%</span>
        <i class="icon-caret-down"></i>
      </button>
      <ul class="dropdown-menu">
        <li v-for="language in languages">
          <a @click="updateLanguage(language.id_lang, $event)" class="pointer">%% language.name %%</a>
        </li>
      </ul>
    </div>
  </div>
</div>
