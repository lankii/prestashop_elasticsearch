
{capture name="template"}{include file=ElasticSearch::tpl('admin/vue/options/switch.html.tpl')}{/capture}
<script type="text/javascript">
  (function () {
    window.VueOptionSwitch = {
      delimiters: ['%%', '%%'],
      template: "{$smarty.capture.template|escape:'javascript':'UTF-8'}",
      props: ['displayName', 'configKey', 'description', 'help'],
      methods: {
        setChecked: function (value) {
          this.$store.commit('setConfig', {
            key: this.configKey,
            value: value
          });
        }
      },
      computed: {
        checked: function checked() {
          return this.$store.state.config[this.configKey];
        }
      }
    };
  }());
</script>
