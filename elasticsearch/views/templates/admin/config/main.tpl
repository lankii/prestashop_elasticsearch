
<div id="es-module-page" class="row" v-cloak>
    {include file=ElasticSearch::tpl('admin/config/status.tpl')}
    {include file=ElasticSearch::tpl('admin/config/tabs.tpl')}
    {foreach $tabGroups as $tabGroup}
        {foreach $tabGroup as $tab}
            <div class="col-md-10" v-show="'{$tab['key']}' === currentTab">
                {include file=ElasticSearch::tpl("admin/config/tabs/{$tab.key}.tpl")}
            </div>
        {/foreach}
    {/foreach}
</div>
{include file=ElasticSearch::tpl('admin/vue/loadcomponents.tpl')}
{include file=ElasticSearch::tpl('admin/config/config.store.vue.tpl')}
{include file=ElasticSearch::tpl('admin/config/config.directives.vue.tpl')}
{include file=ElasticSearch::tpl('admin/config/config.vue.tpl')}
