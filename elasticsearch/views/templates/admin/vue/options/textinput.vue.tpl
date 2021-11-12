
{capture name="template"}{include file=ElasticSearch::tpl('admin/vue/options/textinput.html.tpl')}{/capture}
<script type="text/javascript">
  (function () {
    window.VueTextInput = {
      delimiters: ['%%', '%%'],
      template: "{$smarty.capture.template|escape:'javascript':'UTF-8'}",
      props: ['displayName', 'configKey', 'description', 'maxWidth'],
      methods: {
        setValue: function (event) {
          this.$store.commit('setConfig', {
            key: this.configKey,
            value: event.target.value
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
