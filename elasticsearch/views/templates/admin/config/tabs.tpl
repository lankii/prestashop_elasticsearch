
<div class="col-md-2">
  <div v-for="tabGroup in tabGroups" class="list-group">
    <a v-for="tab in tabGroup"
       v-bind:href="'#tab-' + tab.key"
       v-bind:class="'list-group-item ' + (tab.key == currentTab ? 'active' : '')"
       v-on:click="setTab(tab.key)"
    >
      <i :class="'icon icon-' + tab.icon"></i> %% tab.name %%
    </a>
  </div>
</div>
