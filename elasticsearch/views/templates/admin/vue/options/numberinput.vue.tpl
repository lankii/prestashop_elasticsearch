
{capture name="template"}{include file=ElasticSearch::tpl('admin/vue/options/numberinput.html.tpl')}{/capture}
<script type="text/javascript">
  (function () {
    window.VueNumberInput = {
      delimiters: ['%%', '%%'],
      template: "{$smarty.capture.template|escape:'javascript':'UTF-8'}",
      props: ['displayName', 'configKey', 'description', 'maxWidth'],
      methods: {
        setValue: function (event) {
          this.$store.commit('setConfig', {
            key: this.configKey,
            value: parseInt(event.target.value, 10)
          });
        }
      },
      computed: {
        value: function () {
          return this.$store.state.config[this.configKey];
        },
        style: function () {
          return {
            'max-width': this.maxWidth ? this.maxWidth + 'px' : 'auto'
          };
        }
      }
    };
  }());
</script>
