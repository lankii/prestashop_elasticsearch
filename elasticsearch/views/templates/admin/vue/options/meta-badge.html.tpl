
<h4 :class="'badge badge-' + getMetaTypeBadge(meta.meta_type)"
    :title="meta.name[idLang]"
    data-toggle="index-meta-list-tooltip"
    @click="updateAlias"
    style="cursor: pointer"
>
  %% meta.code %% <i v-if="isDuplicate() || !meta.alias" class="icon icon-exclamation-triangle"></i> <span v-if="meta.alias !== meta.code">(%% meta.alias %%)</span>
</h4>
