
{capture name="template"}{include file=ElasticSearch::tpl('admin/vue/options/tax-selector.html.tpl')}{/capture}
<script type="text/javascript">
  (function () {
    window.VueTaxSelector = {
      delimiters: ['%%', '%%'],
      template: "{$smarty.capture.template|escape:'javascript':'UTF-8'}",
      props: ['displayName', 'configKey', 'description', 'help'],
      data: function () {
        return {
          taxes: {TaxRulesGroup::getTaxRulesGroups(true)|json_encode}
        };
      },
      computed: {
        selectedTax: function () {
          return this.$store.state.config[this.configKey];
        }
      },
      methods: {
        setTaxRulesGroupId: function (event) {
          this.$store.commit('setConfig', {
            key: this.configKey,
            value: event.target.value
          });
        }
      },
    };
  }());
</script>
